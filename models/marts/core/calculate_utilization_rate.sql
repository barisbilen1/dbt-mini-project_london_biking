
with
    bike_usage as (

        select
            bike_id,
            sum(ride_duration) / 60 as ride_duration_daily_sum,  -- convert seconds to minutes
            rental_date
        from {{ ref("stg_cycle_hires") }}
        where ride_duration < 864000 --> exclude the rentals with duration over 10 days, possibly indicating a long term lease or data error
        group by rental_date, bike_id

    ),

    bike_usage_rates as (

        select
            rental_date,
            avg(ride_duration_daily_sum / 1440) as daily_utilization_rate --> /1440 to get the % usage in 24 hours
        from bike_usage
        group by rental_date
        order by rental_date desc

    )

select * from bike_usage_rates
