--4.5--
--Créer une procédure stockée pour insérer ou mettre à jour une adresse selon qu’elle existe déjà.--

create procedure create_or_update_address(
	p_numero integer, 
	p_nom_voie varchar(100), 
	p_code_postal varchar(5), 
	p_code_insee_ancienne_commune varchar(5),
	p_x integer,
	p_y integer,
	p_lon numeric, 
	p_lat numeric, 
	p_nom_afnor varchar(100), 
	p_certification_commune integer, 
	p_nom_ld varchar(100),
	p_id_source_position integer, 
	p_id_position integer, 
	p_id_ancienne_commune integer, 
	p_id_commune integer, 
	p_id_rep integer)
language plpgsql
as $$
begin
		update address
		set 
			code_insee_ancienne_commune = p_code_insee_ancienne_commune,
        	x = p_x,
        	y = p_y,
        	lon = p_lon,
        	lat = p_lat,
        	nom_afnor = p_nom_afnor,
        	certification_commune = p_certification_commune,
        	nom_ld = p_nom_ld,
        	id_source_position = p_id_source_position,
        	id_position = p_id_position,
        	id_ancienne_commune = p_id_ancienne_commune,
        	id_commune = p_id_commune,
        	id_rep = p_id_rep
        where numero = p_numero
			and nom_voie = p_nom_voie
			and code_postal = p_code_postal;
			
		IF NOT FOUND THEN
      INSERT INTO address(
            numero, nom_voie, code_postal, code_insee_ancienne_commune,
            x, y, lon, lat, nom_afnor, certification_commune, nom_ld,
            id_source_position, id_position, id_ancienne_commune,
            id_commune, id_rep
       ) VALUES (
            p_numero, p_nom_voie, p_code_postal, p_code_insee_ancienne_commune,
            p_x, p_y, p_lon, p_lat, p_nom_afnor, p_certification_commune, p_nom_ld,
            p_id_source_position, p_id_position, p_id_ancienne_commune,
            p_id_commune, p_id_rep
        );
   END IF;
		
end;
$$;

call create_or_update_address(
    20, 
    'Avenue mars toyotass'::varchar, 
    '01100'::varchar, 
    '1111'::varchar, 
    903660, 
    1111111, 
    1.11111, 
    46.353, 
    'AVENUE MARS TOYOTA'::varchar, 
    0, 
    'le village'::varchar, 
    3, 
    3, 
    25, 
    218, 
    75
);
	
	

-- Créer un trigger qui vérifie, avant insertion, que les coordonnées GPS sont valides (lat entre -90 et 90, lon entre -180 et 180) et que le code postal est bien au format 5 chiffres--



UPDATE address
SET code_postal = '0' || code_postal
WHERE LENGTH(code_postal) = 4;


DROP TRIGGER IF EXISTS verification_lon_lat ON address;


DROP FUNCTION IF EXISTS verif_lon_lat() cascade;

create function verif_lon_lat()
returns trigger as $$
begin
	if new.lat < -90 or new.lat > 90 then
		RAISE EXCEPTION 'La latitude doit être entre -90 et 90, % n''est pas valide.', new.lat;
	end if;

	if new.lon < -180 or new.lon > 180 then
		RAISE EXCEPTION 'La longitude doit être entre -180 et 180, % n''est pas valide.', new.lon;
	end if;
	
	if new.code_postal !~ '^[0-9]{5}$' then
		RAISE EXCEPTION 'Le code postal doit être un nombreà 5 chifres, % ne correspond pas  un code postal.', new.code_postal;
	end if;
	return new;
end;
$$ language plpgsql;

create trigger verefication_lon_lat
before insert or update on address
for each row
execute function verif_lon_lat();

-- Ajouter automatiquement une date de création / mise à jour à chaque modification via trigger.--

ALTER TABLE address
ADD COLUMN created_at TIMESTAMP DEFAULT now(),
ADD COLUMN updated_at TIMESTAMP DEFAULT now();

DROP FUNCTION IF EXISTS verif_lon_lat() CASCADE;

create function verif_lon_lat()
returns trigger as $$
begin
	if new.lat < -90 or new.lat > 90 then
		RAISE EXCEPTION 'La latitude doit être entre -90 et 90, % n''est pas valide.', new.lat;
	end if;

	if new.lon < -180 or new.lon > 180 then
		RAISE EXCEPTION 'La longitude doit être entre -180 et 180, % n''est pas valide.', new.lon;
	end if;
	
	if new.code_postal !~ '^[0-9]{5}$' then
		RAISE EXCEPTION 'Le code postal doit être un nombreà 5 chifres, % ne correspond pas  un code postal.', new.code_postal;
	end if;

	if TG_OP ='insert' then
		new.created_at = now();
		new.updated_at = now();
	elsif TG_OP ='update' then
		new.updated_at = now();
	end if;
	return new;
end;
$$ language plpgsql;

create trigger verefication_lon_lat
before insert or update on address
for each row
execute function verif_lon_lat();