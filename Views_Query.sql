---- All trips for the 12 months as total_tripdata
CREATE VIEW cyclistic.total_tripdata AS 
SELECT 
  ride_id,
  rideable_type,
  started_at,
  end_station_name,
  start_station_name,
  FORMAT_DATE('%b-%Y', date(started_at)) AS Month_year, 
  member_casual,
  TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS ride_leng,
  day_of_week,
  start_time_period,
  end_time_period, 
  Quarter
FROM
  `sandbox-project-011.cyclistic.Q2_trips`
UNION ALL
SELECT
  ride_id,
  rideable_type,
  started_at,
  end_station_name,
  start_station_name,
  FORMAT_DATE('%b-%Y', date(started_at)) AS Month_year, 
  member_casual,
  TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS ride_leng,
  day_of_week,
  start_time_period,
  end_time_period, 
  Quarter
FROM
  `sandbox-project-011.cyclistic.Q3_2022_trips`
UNION ALL
SELECT
  ride_id,
  rideable_type,
  started_at,
  end_station_name,
  start_station_name,
  FORMAT_DATE('%b-%Y', date(started_at)) AS Month_year, 
  member_casual,
  TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS ride_leng,
  day_of_week,
  start_time_period,
  end_time_period, 
  Quarter
FROM
  `sandbox-project-011.cyclistic.Q1_2023_trips`
; 

---- location data view
CREATE VIEW cyclistic.location_data AS
SELECT 
  ride_id,
  start_lat,
  start_lng,
  end_lat,
  end_lng
FROM
  `sandbox-project-011.cyclistic.Q2_trips`
UNION ALL
SELECT
  ride_id,
  start_lat,
  start_lng,
  end_lat,
  end_lng
FROM
  `sandbox-project-011.cyclistic.Q3_2022_trips`
UNION ALL
SELECT
  ride_id,
  start_lat,
  start_lng,
  end_lat,
  end_lng
FROM
  `sandbox-project-011.cyclistic.Q1_2023_trips`
; 
