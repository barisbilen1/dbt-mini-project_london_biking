with
    ride_duration as (

        select
            start_station,
            end_station,
            avg(ride_duration) as average_ride_duration
        from {{ ref("stg_cycle_hires") }}
        group by start_station, end_station
        order by count(*) desc, average_ride_duration desc

    )

select * from ride_duration
