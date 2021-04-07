with source as (

    select * from {{ source('stg', 'immats_03_21') }}

),

renamed as (

    select
        index,
        date,
        genre_moto,
        marque,
        modele,
        carrosserie,
        cylindree,
        code_departement,
        departement,
        date_arrete,
        volume,
        jo

    from source

)

select * from renamed