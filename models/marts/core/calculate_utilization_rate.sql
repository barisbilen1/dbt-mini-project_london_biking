--1-her bike in gunluk surus suresini bul.
--2-bir gunun yuzde kacinda kullaniliyormus onu bul.
--3- sort et, ya da overal bike uti. rate i hesapla.

with bike_usage as (

    select bike_id,
    sum(ride_duration) / 60 as ride_duration_daily_sum, -- convert seconds to minutes
    rental_date
    from {{ ref("stg_cycle_hires") }}
    group by rental_date, bike_id

),

bike_usage_rates as (

    select bike_id,
    rental_date,
    ride_duration_daily_sum/ 1440 as daily_utilization_rate

)

select * from bike_usage_rates 