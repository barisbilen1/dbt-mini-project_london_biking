with
    cycle_hires as (

        select
            start_station_name,
            end_station_name,
            avg(duration) as average_ride_duration
        from {{ ref("stg_cycle_hires") }}
        group by start_station_name, end_station_name
        order by count(*) desc, average_ride_duration desc

    )

select * from cycle_hires
