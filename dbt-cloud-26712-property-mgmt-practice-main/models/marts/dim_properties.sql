with properties as (
    select * from {{ ref('stg_properties') }}
),

units as (
    select * from {{ ref('stg_units') }}
),

property_units as (
    select
        property_id,
        count(*) as total_units,
        sum(rent) as total_rent,
        sum(square_feet) as total_square_feet,
        sum(case when status = 'occupied' then 1 else 0 end) as occupied_units,
        sum(case when status = 'rented' then 1 else 0 end) as rented_units,
        sum(case when status = 'construction' then 1 else 0 end) as construction_units,
        sum(case when status = 'vacant' then 1 else 0 end) as vacant_units
    from units
    group by 1
),

final as (
    select
        properties.property_id,
        properties.name,
        properties.address,
        properties.city,
        properties.state,
        properties.zip_code,
        properties.type,
        properties.year_built,
        property_units.total_units,
        property_units.total_rent,
        property_units.total_square_feet,
        property_units.occupied_units,
        property_units.rented_units,
        property_units.construction_units,
        property_units.vacant_units
    from properties
    left join property_units on properties.property_id = property_units.property_id
)

select * from final