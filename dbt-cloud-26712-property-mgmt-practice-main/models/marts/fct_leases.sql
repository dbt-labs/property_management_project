with leases as (
    select * from {{ ref('stg_leases') }}
),

units as (
    select * from {{ ref('stg_units') }}
),

applications as (
    select * from {{ ref('stg_rental_applications') }}
),

joined as (
    select 
        leases.lease_id,
        leases.is_completed,
        leases.start_date,
        leases.end_date,
        units.rent,
        units.address_1,
        units.address_2,
        units.city,
        units.state,
        units.zip_code,
        units.bedrooms,
        units.bathrooms,
        units.square_feet,
        applications.status as application_status,
        applications.deleted_at
    from leases
    left join units on leases.unit_id = units.unit_id 
    left join applications on leases.rental_application_id = applications.rental_application_id
    order by 1
)

select * from joined