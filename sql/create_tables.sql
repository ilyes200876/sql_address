--3.1. création des tables issues du mpd.

-- création de la table Positions :

create table Positions (
	id_position serial primary key,
	type_position varchar(10)
);


-- création de la table Ancienne_commune :

create table Ancienne_commune (
	id_ancienne_commune serial primary key,
	nom_ancienne_commune varchar(50)
);

-- création de la table Source_position :

create table if not exists Source_position (
	id_source_position serial primary key,
	libelle_source_position varchar(10) not null
);



-- création de la table Rep :

create table rep (
	id_rep serial primary key,
	title_rep varchar(6)
);


-- création de la table Departement :

create table departement (
	id_departement serial primary key,
	lebelle_departement varchar(50)
);


-- Supression de la tble Département :

drop table if exists departement cascade;

-- Création de la table Commune :

create table Commune (
	id_commune serial primary key,
	code_insee integer not null,
	nom_commune varchar(50) not null,
	libelle_acheminement varchar(50) not null,
	id_departement integer not null,
	constraint fk_departement foreign key (id_departement) references departement(id_departement) 
);


-- Création de la table Address :

create table address (
	id_address serial primary key,
	numero integer not null,
	nom_voie varchar(100) not null,
	code_postal integer not null not null,
	code_insee_ancienne_commune integer,
	x DECIMAL(8,2) not null,
	y DECIMAL(10,2) not null,
	lon DECIMAL(9,6) not null,
	lat DECIMAL(9,6) not null,
	nom_afnor varchar(100) not null,
	is_certified BOOLEAN not null,
	nom_ld varchar(20),
	id_source_position integer not null,
	id_position integer not null,
	id_ancienne_commune integer not null,
	id_commune integer not null,
	id_rep integer not null,
	constraint fk_source_position foreign key (id_source_position) references source_position(id_source_position),
	constraint fk_positions foreign key (id_position) references positions(id_position),
	constraint fk_ancienne_commune foreign key (id_ancienne_commune) references ancienne_commune(id_ancienne_commune),
	constraint fk_commune foreign key (id_commune) references Commune(id_commune),
	constraint fk_rep foreign key (id_rep) references rep(id_rep)
	
);


-- Création de la table Cad :

create table Cad (
	id_cad serial primary key,
	cad_parcelle varchar(120) not null,
	id_address integer not null,
	constraint fk_address foreign key (id_address) references address(id_address)
);
