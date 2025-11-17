-4.4--
--Nombre moyen d’adresses par commune et par voie.--
select nom_voie,nom_commune, AVG( nombre_address) as  nombre_moyen_address from(
	select c.nom_commune, a.nom_voie, count(*) as nombre_address from address a
	join commune c on
		c.id_commune=a.id_commune
		group by a.nom_voie, c.nom_commune	
	)
	group by nom_commune, nom_voie
	order by nom_commune, nom_voie;


--Top 10 des communes avec le plus d’adresses.--	
select c.nom_commune, count(*) from address a
	join commune c on 
		c.id_commune=a.id_commune
	group by c.nom_commune 
	order by count(*) desc
	limit 10;


--Vérifier la complétude des champs essentiels (numéro, voie, code postal, commune).--
select * from address 
	where numero is null;

select * from address 
	where nom_voie='';

select * from address 
	where code_postal is null;


