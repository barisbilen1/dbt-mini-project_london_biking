with
    ride_duration as (

        select
            start_station,
            end_station,
            avg(ride_duration) / 60 as average_ride_duration
        from {{ ref("stg_cycle_hires") }}
        where ride_duration < 864000 --> exclude the rentals with duration over 10 days, possibly indicating a long term lease or data error
        group by start_station, end_station
        order by average_ride_duration desc

    )

select * from ride_duration
