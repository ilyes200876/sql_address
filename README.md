<h1 align="center">Projet base de donnée ADRESSES</h1>

## Installation du projet :

### Installation de PostgreSQL :
Tout dabord j'ai commencé par installer la dernière version de postgreSQL en utilisant ce lien https://www.postgresql.org/download/  
Ensuite, j'ai testser le bon fonctionnement de PostgreSQL avant installation de DBeaver, en ligne de commande avec psql :
```psql
psql --version
psql -U <USERNAME> -d <DATABASE_NAME>
```
### Installation de DBEAVER :
Pour l'installation du Dbeaver, j'ai utilisé ce lien https://dbeaver.io/download/  
J'ai ensuite utilisé ce lien pour terminer l'installation et pour utiliser dbeaver :  
https://dbeaver.com/docs/dbeaver/Database-driver-PostgreSQL/#postgresql-connection-settings  
### Importation du fichier CVS dans Dbeaver :
- Téléchargement du fichier csv du département 01.
- Étude des données de ce fichier.
- Création de la table brut dans ma base sur dbeaver.
- importtion des données dans ma table brut. 
- Configuration des types de toutes les données.

## Conception :
Dans cette partie, j'ai cherché à amiliorer la table brut. Ce qui m'a permis de créer plusieurs tables.  
J'ai, Donc, utilisé la méthode Merise. 
### Méthode MERISE :
J'ai commencé par la création du dictionnaire de données.
#### Dictionnaire des données :
Dans ce tableau, j'ai définit toute mes données en ajoutant leurs typages, longueurs, libellés et règles de gestion.  
**Le dictionnaire se trouve dans : [Mon dictionnaire de données](Merise/dictionnaire.md)**.

#### Règles de gestion :
Pour les règles de gestion, j'ai déterminé mes différentes tables avec leur données. J'ai aussi Étudié les liens entre ces tables. Ce qui m'a permis de rédiger les règles de gestion.  
 **Les règles de gestion se trouvent dans : [Mes règles de gestion](Merise/règles_de_gestion.md)**.
#### MCD
Afin de faire la conception de mon modèle de conception des données, J'ai utilisé un logiciel appelé looping. J'ai commencé par exploiter mes règles de gestion pour remplir mes tables et ajouter les cardinalités. J'ai aussi manipulé le dictionnaire de données afin d'ajouter le typage de chaque donnée.  
**Le MCD se trouve dans : [Mon MCD](Merise/mcd.png)**.
#### MLD
**Le MLD se trouve dans : [Mon MLD](Merise/mld.png)**.
#### MPD
**Le MPD se trouve dans : [Mon MPD](Merise/mpd.png)**.

## Requêtes SQL :
### Création des tables :
### Remplissage de mes table :
### Affichage :
### Procédure :
### Trigger :