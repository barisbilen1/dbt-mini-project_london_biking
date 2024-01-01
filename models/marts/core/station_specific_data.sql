with
    stations as (

        select start_station,
        count(*) as rental_count

        from {{ ref("stg_cycle_hires") }}
        group by start_station
        having rental_count > 900

    )


select * from stations
