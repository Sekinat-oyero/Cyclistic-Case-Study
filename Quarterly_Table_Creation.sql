# Creating quarterly tables for analysis 
-- Quarter 2 2022
SELECT 
  *
FROM
  `sandbox-project-011.cyclistic.may2022_tripdata`
UNION ALL
SELECT
  *
FROM
  `sandbox-project-011.cyclistic.june2022_tripdata`
UNION ALL
SELECT
  *
FROM
  `sandbox-project-011.cyclistic.july2022_tripdata`
UNION ALL
SELECT
  *
FROM
  `sandbox-project-011.cyclistic.august2022_tripdata`
;

-- Quarter 3 2022
SELECT 
  *
FROM
  `sandbox-project-011.cyclistic.september2022_tripdata`
UNION ALL
SELECT
  *
FROM
  `sandbox-project-011.cyclistic.october2022_tripdata`
UNION ALL
SELECT
  *
FROM
  `sandbox-project-011.cyclistic.november2022_tripdata`
UNION ALL
SELECT
  *
FROM
  `sandbox-project-011.cyclistic.december2022_tripdata`
;

-- Quarter 1 2023

SELECT 
  *
FROM
  `sandbox-project-011.cyclistic.january2023_tripdata`
UNION ALL
SELECT
  *
FROM
  `sandbox-project-011.cyclistic.february2023_tripdata`
UNION ALL
SELECT
  *
FROM
  `sandbox-project-011.cyclistic.march2023_tripdata`
UNION ALL
SELECT
  *
FROM
  `sandbox-project-011.cyclistic.april2023_tripdata`
;
 --- creating the quarter column
ALTER TABLE cyclistic.Q2_trips
ADD COLUMN Quarter STRING(2)
;

ALTER TABLE cyclistic.Q2_trips
ALTER COLUMN Quarter SET DATA TYPE STRING(7)
;

UPDATE cyclistic.Q2_trips
SET Quarter = "Q2_2022"
WHERE Quarter = "Q2"
;

ALTER TABLE cyclistic.Q3_2022_trips
ADD COLUMN Quarter STRING(7) 
;

UPDATE cyclistic.Q3_2022_trips
SET Quarter = "Q3_2022"
WHERE Quarter IS NULL
;

ALTER TABLE cyclistic.Q1_2023_trips
ADD COLUMN Quarter STRING(7) 
;

UPDATE cyclistic.Q1_2023_trips
SET Quarter = "Q1_2023"
WHERE Quarter IS NULL
;

