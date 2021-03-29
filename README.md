# postgres_docker
Local setup of Postgres on Docker Compose

### Run Metabase Configurator
1. Run `docker exec dbt python metabase_setup.py`

### Run dbt
1. Run `docker exec dbt bash run_dbt.sh`

**DOCKER EXEC à EXECUTER SUR UN TERMINAL HORS ATTACH SHELL**

### Run dbt-docs website
1. Run `docker exec -d dbt bash serve_dbt_docs.sh`
You can then access the docs website on http://localhost:4444

## codegen dbt
toutes ces commandes sont a lancer depuis la baleine postgres dbt attach shell.
une fois dans le contenaire, `cd demo_project`

### generate source yml pour stg (script1)
`dbt run-operation generate_source --args 'schema_name: stg'`

### generate script sql d'une table (script2) 
`dbt run-operation generate_base_model --args '{"source_name": "stg", "table_name": "immats_2021_02"}'`

**script2 puis dbt run puis script3**

### generate yml d'une table (script3)
`dbt run-operation generate_model_yaml --args '{"model_name": "immats_2021_02"}'`

## Etapes quand on a une nouvelle soucre
*prérequis : avoir développer et lancer un flux "EL"*
1. run (script 1) et copier coller les lignes de la nouvelle soucre dans stg.yml
2. run (script 2) avec comme valeur pour table_name le nom de la nouvelle table. puis copier coller le contenu dans un fichier models/ods/nom_du_dossier/nom_de_la_table_ods.sql
3. créer la nouvelle table en lançant `dbt run` 
4. run (script 3) puis copier coller le contenu dans model/ods/nom_du_dossier/nom_du_dossier.yml
5. pour créer la vue suivre ce shema en remplacant le nom de la table `select * from {{ ref('immats_vrp_ods') }}`