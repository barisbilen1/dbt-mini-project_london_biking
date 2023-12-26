with
    cycle_hires as (

        select
            rental_id,  -- unique identifier for each ride
            duration as ride_duration
            bike_id,
            start_station_name as start_station,
            end_station_name as end_station
            date as rental_date
        from {{ source("london_biking", "cycle_hires_raw") }}

    )

select * from cycle_hires
