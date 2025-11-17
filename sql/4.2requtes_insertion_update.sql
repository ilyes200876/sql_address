--4.2--
--Ajouter une nouvelle adresse complète dans les tables finales.--
insert into address (numero, nom_voie, code_postal, code_insee_ancienne_commune, x, y, lon, lat, nom_afnor, certification_commune, nom_ld,
					id_source_position, id_position, id_ancienne_commune, id_commune, id_rep)
values (20,'Rue du canal', '01100', 01165, 903670, 6576860, 5.26512, 46.3530, 'RUE DU CANAL', 0, 'Le Village', 3, 3, 25, 218, 75);


select * from address
	where numero=20
	and nom_voie='Rue du canal';   --id=262769--


--Mettre à jour le nom d’une voie pour une adresse spécifique.
update address
	set nom_voie='Avenue mars toyota'
	where id_address=262769;

select * from address 
	where id_address=262769;

select count(*) from address	
	where code_insee_ancienne_commune='';


