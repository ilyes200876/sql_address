<h1 align="center">Le dictionnaire des données</h1>

| Code                        | Libellé                        | Type        | Taille | E/C | Règles de calcul | Règles de gestion                                    |
|-----------------------------|--------------------------------|-------------|--------|-----|-----------------|------------------------------------------------------|
| code_insee                  | Code d'INSEE                   | A           | 5      | E   |                 | 5 caractères chiffres                                |
| nom_commune                 | Nom de la commune              | varchar A   | 50     | E   |                 |                                                      |
| libelle_acheminement        | Libellé d'acheminement         | varchar A   | 50     | E   |                 |                                                      |
| nom_ancienne_commune        | Nom de l'ancienne commune      | varchar A   | 50     | E   |                 | 5                                                    |
| type_position               | Type de position               | varchar A   | 20     | E   |                 | Exemple : entrée, segment…                           |
| title_rep                   | Le titre du rep                | varchar A   | 10     | E   |                 | Exemple : a, bis…                                   |
| numero                      | Numéro d'adresse               | int N       | 5      | E   |                 |                                                      |
| nom_voie                    | Nom de la voie                 | varchar A   | 100    | E   |                 |                                                      |
| code_postal                 | Code postal                    | varchar A   | 5      | E   |                 | 5 caractères                                         |
| code_insee_ancienne_commune | Code INSEE de l'ancienne commune | A         | 5      | E   |                 |                                                      |
| x                           | x                              | float F     | 8.2    | E   |                 |                                                      |
| y                           | y                              | float F     | 10.2   | E   |                 |                                                      |
| lon                         | Longitude                      | float F     | 9.6    | E   |                 | En WGS-84                                           |
| lat                         | Latitude                       | float F     | 9.6    | E   |                 | En WGS-84                                           |
| nom_afnor                   | Nom de l'afnor                 | varchar A   | 100    | E   |                 |                                                      |
| certification_commune       | Est-elle certifiée             | N           | 1      | E   |                 | 1 ou 0                                               |
| cad_parcelle                | Cad parcelle                   | text T      |        | E   |                 | Si elle existe, renvoie un texte                    |
| nom_ld                      | Nom du lieu                    | A           | 100    | E   |                 |                                                      |
| libelle_source_position     | Libellé de la source position  | A           | 10     | E   |                 | Exemple : commune, cadastre, ign, arcep, inconnue...|
| source_nom_voie             | Source nom de la voie          | A           | 10     | E   |                 | Exemple : commune, ign, cadastre, arcep, inconnue...|
