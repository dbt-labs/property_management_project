with source as (
    select * from {{ source('property_management', 'rental_applications') }}
),

staged as (
    select
        -- ids
        id as rental_application_id,
        contact_info_id,

        -- descriptions
        status,
        
        -- timestamps
        created_at,
        deleted_at,
        uploaded_at
    
    from source
)

select * from staged