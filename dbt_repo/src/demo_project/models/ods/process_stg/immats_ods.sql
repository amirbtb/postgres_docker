with source as (

    select * from {{ source('stg', 'immats_2021_02') }}

),

renamed as (

    select
        index,
        date_1,
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
