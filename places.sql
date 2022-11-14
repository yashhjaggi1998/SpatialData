DROP TABLE IF EXISTS places;

CREATE TABLE places(id varchar(4) PRIMARY KEY, placeName VARCHAR(40), placeCategory VARCHAR(15), locationCoords geography(POINT) );

--SRID=4326: uses latitude & longitude reference system for spatial data
INSERT INTO places (id, placeName, placeCategory, locationCoords) VALUES ('L1', 'Home', '', 'SRID=4326;POINT(-118.2796102908302 34.033380379197176)');
INSERT INTO places (id, placeName, placeCategory, locationCoords) VALUES ('L2', 'Starbucks', 'Eatries', 'SRID=4326;POINT(-118.2821677202928 34.021697586300895)');
INSERT INTO places (id, placeName, placeCategory, locationCoords) VALUES ('L3', 'Sunlife Organics', 'Eatries', 'SRID=4326;POINT(-118.28538588336585 34.02454183401242)');
INSERT INTO places (id, placeName, placeCategory, locationCoords) VALUES ('L4', 'Kobunga', 'Eatries', 'SRID=4326;POINT(-118.2856017216613 34.02463544537857)');
INSERT INTO places (id, placeName, placeCategory, locationCoords) VALUES ('L5', 'Wilson Dental', 'Libraries', 'SRID=4326;POINT(-118.2860022058789 34.02381734421054)');
INSERT INTO places (id, placeName, placeCategory, locationCoords) VALUES ('L6', 'Leavey', 'Libraries', 'SRID=4326;POINT(-118.28283313381495 34.021887472789864)');
INSERT INTO places (id, placeName, placeCategory, locationCoords) VALUES ('L7', 'Doheny Memorial', 'Libraries', 'SRID=4326;POINT(-118.28369260141545 34.020261683532226)');
INSERT INTO places (id, placeName, placeCategory, locationCoords) VALUES ('L8', 'SCA Fountain', 'Waterworks', 'SRID=4326;POINT(-118.28642169973253 34.02346352285591)');
INSERT INTO places (id, placeName, placeCategory, locationCoords) VALUES ('L9', 'Patsy and Forrest Shumway Fountain', 'Waterworks', 'SRID=4326;POINT(-118.28531671038935 34.02019870511084)');
INSERT INTO places (id, placeName, placeCategory, locationCoords) VALUES ('L10', 'Prentiss Memorial Fountain', 'Waterworks', 'SRID=4326;POINT(-118.28468059391433 34.02049872505261)');
INSERT INTO places (id, placeName, placeCategory, locationCoords) VALUES ('L11', 'Pardee Way', 'Entrances', 'SRID=4326;POINT(-118.28334530327362 34.01839608586059)');
INSERT INTO places (id, placeName, placeCategory, locationCoords) VALUES ('L12', 'Downey Way', 'Entrances', 'SRID=4326;POINT(-118.2912511595049 34.02197736620561)');
INSERT INTO places (id, placeName, placeCategory, locationCoords) VALUES ('L13', 'McCarthy Way', 'Entrances', 'SRID=4326;POINT(-118.28139927230421 34.020622875042)');

SELECT ST_AsText(
    ST_ConvexHull(
        ST_Collect(P.locationCoords::geometry
            )))
FROM places As P;

SELECT *
FROM places
WHERE placeName <> 'Home'
ORDER BY locationCoords <-> 'SRID=4326;POINT(-118.2796102908302 34.033380379197176)'::geometry
LIMIT 4;