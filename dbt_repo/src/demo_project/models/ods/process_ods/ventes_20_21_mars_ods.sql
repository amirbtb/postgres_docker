with source as (

    select * from {{ source('stg', 'ventes_20_21_mars') }}

),

renamed as (

    select
        index,
        annee,
        mois,
        famille_de_vente,
        famille_article,
        gamme,
        cylindree,
        modele,
        couleur,
        sum_qte_vhl_fact_,
        millesime,
        famille_client

    from source

)

select * from renamed