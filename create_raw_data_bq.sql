SELECT
  rental_id,
  duration, -- in seconds
  bike_id,
  start_station_name,
  end_station_name,
  EXTRACT(DATE FROM start_date AT TIME ZONE "UTC") AS date
FROM
  `bigquery-public-data`.`london_bicycles`.cycle_hire
WHERE
  start_date > "2023-01-01 12:00:00 UTC"
ORDER BY
  date ASC; 