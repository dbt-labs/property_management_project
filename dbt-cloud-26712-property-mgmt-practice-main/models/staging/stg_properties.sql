with source as (
    select * from {{ source('property_management', 'properties') }}
),

staged as (
    select
        -- ids
        id as property_id,

        -- descriptions
        name,
        address,
        city,
        state,
        zip_code,
        type,
        year_built,

        -- timestamps
        created_at,
        uploaded_at

    from source
)

select * from staged