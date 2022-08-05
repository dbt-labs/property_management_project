with source as (
    select * from {{ source('property_management', 'units') }}
),

staged as (
    select
        -- ids
        id as unit_id,
        property_id,

        -- descriptions
        name,
        rent,
        bedrooms,
        bathrooms,
        square_feet,
        status,
        address_1,
        address_2,
        city,
        state,
        zip_code,

        -- timestamps
        created_at,
        uploaded_at
    
    from source
)

select * from staged