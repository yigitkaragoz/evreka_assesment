
WITH DistanceWithDiffs AS (
    SELECT 
        route_id,
        recorded_at,
        distance,
        LAG(distance) OVER (PARTITION BY route_id ORDER BY recorded_at) AS prev_distance,
        EXTRACT(EPOCH FROM (recorded_at - LAG(recorded_at) OVER (PARTITION BY route_id ORDER BY recorded_at))) AS time_diff
    FROM navigation_records
),
ResetsIdentified AS (
    SELECT
        route_id,
        recorded_at,
        distance,
        time_diff,
        CASE 
            WHEN distance < prev_distance THEN 1
            ELSE 0
        END AS reset_flag
    FROM DistanceWithDiffs
),
CumulativeSegments AS (
    SELECT
        route_id,
        MAX(distance) AS segment_distance,
        SUM(time_diff) AS segment_duration,
        SUM(reset_flag) OVER (PARTITION BY route_id ORDER BY recorded_at ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS segment_id
    FROM ResetsIdentified
    GROUP BY route_id, recorded_at, distance, time_diff, reset_flag
)
SELECT
    route_id,
    MAX(segment_distance) AS total_distance,
    SUM(segment_duration) AS total_duration
FROM CumulativeSegments
GROUP BY route_id;
