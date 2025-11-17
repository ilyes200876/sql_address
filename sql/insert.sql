-- Insertions des données depuis la table Brute vers mes propres tables :
insert into rep (title_rep)
	select rep from brut
		group by rep;

insert into source_position (libelle_source_position)
	select source_position from brut
		group by source_position;

insert into positions (type_position)
	select type_position from brut
		group by type_position;

insert into ancienne_commune (nom_ancienne_commune)
	select nom_ancienne_commune from brut
		group by nom_ancienne_commune;

insert into commune (code_insee, nom_commune, libelle_acheminement)
	select code_insee, nom_commune, libelle_acheminement from brut
		group by code_insee, brut.nom_commune, brut.libelle_acheminement  ;

insert into address (numero, nom_voie,code_postal, code_insee_ancienne_commune, x, y, lon, lat,nom_afnor, 
                    certification_commune, nom_ld, id_source_position, id_position, id_ancienne_commune, id_commune, id_rep)
	select b.numero, b.nom_voie, b.code_postal, b.code_insee_ancienne_commune, b.x, b.y, b.lon, b.lat, b.nom_afnor, 
                    b.certification_commune, b.nom_ld, sp.id_source_position, p.id_position, ac.id_ancienne_commune, c.id_commune, r.id_rep from brut b
    left join source_position sp on
    	sp.libelle_source_position=b.source_position 
    left join positions p on 
    	p.type_position=b.type_position
	left join ancienne_commune ac on 
    	ac.nom_ancienne_commune=b.nom_ancienne_commune 
    left join commune c on
    	c.code_insee=b.code_insee
    	and c.nom_commune=b.nom_commune
    	and c.libelle_acheminement=b.libelle_acheminement
    left join rep r on 	
    	r.title_rep=b.rep;
    	
    	
    	
    	
insert into cad (cad_parcelle,id_address)
    select b.cad_parcelles, a.id_address from brut b
	left join address a on 
		a.numero=b.numero 
		and a.nom_voie=b.nom_voie;

-- Changement des différents typages, nom des colonnes ...
ALTER TABLE rep 
ALTER COLUMN title_rep TYPE VARCHAR(10);

alter table positions 
alter column type_position type varchar(20);

alter table commune
	drop column id_departement;


alter table commune
	alter column code_insee type varchar(5);

alter table address
	alter column code_insee_ancienne_commune type varchar(5),
	alter column certification_commune type integer USING certification_commune::integer,
	alter column nom_ld type varchar(100);

ALTER TABLE address
RENAME COLUMN is_certified TO certification_commune;

alter table address
	alter column code_postal type varchar(5);