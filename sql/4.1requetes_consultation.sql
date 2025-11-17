--4.1--
select * from address
	where id_commune=55
	order by numero;

select a.nom_voie, count(*) as nombre_address from address a
	join commune c on 
		c.id_commune=a.id_commune
	group by a.nom_voie
	order by nombre_address desc;

select c.nom_commune, count(*) as nombre_address from address a
	join commune c on 
		c.id_commune=a.id_ancienne_commune
	group by c.nom_commune
	order by nombre_address desc;

--Lister toutes les adresses d’une commune donnée, triées par voie.--
select * from address a
	where id_commune=72
	order by nom_voie;
	
	
	
	
--Compter le nombre d’adresses par commune (bonus: et par voie).--
select c.nom_commune, a.nom_voie, count(*) as nombre_address from address a
	join commune c on 
		c.id_commune=a.id_ancienne_commune
	group by c.nom_commune, a.nom_voie
	order by nombre_address desc;


--Lister toutes les communes distinctes présentes dans le fichier.--
select distinct nom_commune from commune


--Rechercher toutes les adresses contenant un mot-clé particulier dans le nom de voie (ex: Boulevard, Rue, etc...).--
select * from address address
	where nom_voie like '%Rue%';

--Identifier les adresses où le code postal est vide alors que la commune est renseignée--
select * from address
	where code_postal is null;