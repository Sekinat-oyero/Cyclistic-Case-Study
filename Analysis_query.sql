## 1 Checking for total number of rides for each rider type

SELECT
   COUNT(ride_id) AS total_number_of_riders,
    member_casual
  FROM
    `sandbox-project-011.cyclistic.total_tripdata`
  WHERE
  member_casual IS NOT NULL
  GROUP BY
    member_casual
;


## 2 Checking for total number of rides for each rider type per quater

SELECT
  (SELECT
    COUNT(ride_id)
  FROM
    `sandbox-project-011.cyclistic.Q2_trips` ) AS Q2_2022_total_trips,
  (SELECT
    COUNT(ride_id)
  FROM
    `sandbox-project-011.cyclistic.Q3_2022_trips` ) AS Q3_2022_total_trips,
  (SELECT
    COUNT(ride_id)
  FROM
    `sandbox-project-011.cyclistic.Q1_2023_trips` ) AS Q1_2023_total_trips
;


## 3 Checking for total number of rides for each MONTH

SELECT
  Month_year,
  COUNT(CASE WHEN member_casual = 'member' then ride_id END) AS no_member_riders,
  COUNT(CASE WHEN member_casual = 'casual' then ride_id END) AS no_casual_riders,
  FROM
  `sandbox-project-011.cyclistic.total_tripdata`
  GROUP BY
  Month_year
  ORDER BY 
  PARSE_DATE('%b-%Y', Month_year)
;

## 4 Checking for total number of rides for each rideable type

SELECT
  member_casual,
  rideable_type, 
  COUNT(ride_id) AS total_number_of_riders,
 FROM
  `sandbox-project-011.cyclistic.total_tripdata`
 WHERE
  rideable_type IS NOT NULL
 GROUP BY
  rideable_type,
  member_casual
 ORDER BY 
  total_number_of_riders DESC
;

----5-- Average ride length for total amd each member type

SELECT

  (SELECT  
  AVG(ride_leng)
  FROM `sandbox-project-011.cyclistic.total_tripdata`)  AS ride_leng_total,

  (SELECT  
  AVG(ride_leng) 
  FROM `sandbox-project-011.cyclistic.total_tripdata`
  WHERE member_casual= "member" ) AS ride_leng_member,

  (SELECT  
  AVG(ride_leng)
  FROM `sandbox-project-011.cyclistic.total_tripdata`
  WHERE member_casual= "casual" ) AS ride_leng_casual
;

-----6-- Checking for ride frequency,average,and max ride length for member ridertype per month

SELECT
  Month_year,
  COUNT(ride_id) AS no_of_rides,
  AVG(ride_leng) AS average_ride_length,
  MAX(ride_leng) AS maximum_ride_length
 FROM
  (SELECT 
    *
   FROM 
    `sandbox-project-011.cyclistic.total_tripdata`
   WHERE
    member_casual = "member"
  )
 GROUP BY
  Month_year
 ORDER BY 
  PARSE_DATE('%b-%Y', Month_year)
;

----7-- Checking for ride frequency,average,and max ride length for casual ridertype per month
SELECT
  Month_year,
  COUNT(ride_id) AS no_of_rides,
  AVG(ride_leng) AS average_ride_length,
  MAX(ride_leng) AS maximum_ride_length
 FROM
  (SELECT 
    *
   FROM 
    `sandbox-project-011.cyclistic.total_tripdata`
   WHERE
    member_casual = "casual"
  )
 GROUP BY
  Month_year
 ORDER BY 
  PARSE_DATE('%b-%Y', Month_year)
;

--8--- Checking for ride frequency, average and max ride length for member ridertype per week

SELECT
  day_of_week,
  COUNT(ride_id) AS no_of_rides,
  AVG(ride_leng) AS Average_ride_length, 
  MAX(ride_leng) AS maximum_ride_length
 FROM
  (SELECT 
    *
   FROM 
    `sandbox-project-011.cyclistic.total_tripdata`
   WHERE
    member_casual = "member"
  )
 GROUP BY
  day_of_week
 ORDER BY 
  day_of_week DESC
;

--9--- Checking for ride frequency, average and max ride length for member ridertype per week

SELECT
  day_of_week,
  COUNT(ride_id) AS no_of_rides,
  AVG(ride_leng) AS Average_ride_length, 
  MAX(ride_leng) AS maximum_ride_length
 FROM
  (SELECT 
    *
   FROM 
    `sandbox-project-011.cyclistic.total_tripdata`
   WHERE
    member_casual = "casual"
  )
 GROUP BY
  day_of_week
 ORDER BY 
  no_of_rides DESC
;

--10--- Most busy days for member ridertype per week

WITH period AS 
(
SELECT
member_casual,
 start_time_period, 
 COUNT(ride_id) AS no_of_rides
 FROM 
   `sandbox-project-011.cyclistic.total_tripdata`
 GROUP BY
  start_time_period, member_casual
) 

SELECT * FROM period
PIVOT(SUM(no_of_rides) FOR member_casual IN ('member', 'casual'))
;


-- Popular Stations
WITH stations AS 
 (
SELECT 
  start_station_name, 
  end_station_name,
  member_casual,
  COUNT(*) AS station_count
FROM
 `sandbox-project-011.cyclistic.total_tripdata`
WHERE 
  start_station_name IS NOT NULL 
  AND end_station_name IS NOT NULL
  --AND member_casual = 'member'
 -- AND member_casual = 'casual'
GROUP BY 
  start_station_name, 
  end_station_name,
  member_casual
ORDER BY 
  station_count DESC
  )
 SELECT * FROM stations
 PIVOT(SUM(station_count) FOR member_casual IN ('member', 'casual'))
 ORDER BY casual DESC
;
