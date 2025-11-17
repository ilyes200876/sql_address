--4.3--
--Identifier doublons exacts (mêmes numéro + nom de voie + code postal + commune).--
select    COUNT(*) as nbr_doublon, numero, nom_voie, code_postal from address a
	join commune c on 
		c.id_commune=a.id_commune
	GROUP BY a.numero, a.nom_voie, a.code_postal, c.id_commune
	HAVING   COUNT(*) > 1; --9277 doublon en total--

	
--Identifier les adresses incohérentes sans coordonnées GPS--
select * from address 
	where lon is null 
	or lat is null;


--Lister les codes postaux avec plus de 10 000 adresses pour détecter les anomalies volumétriques.--
select count(code_postal),code_postal from address
	group by code_postal	
	having count(code_postal) >10000
	order by count(code_postal);



