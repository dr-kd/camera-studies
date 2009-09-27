create table studies (
id integer primary key,
citat text ,
auth_c text ,
year integer,
auth_all text,
abst text,
link text,
title text,
journ text,
publ text,
vol text,
issu text,
page text,
userid text, -- who dealt with this one
done text -- is is complete
);

create table studies_details (
study_id integer references studies(id),
details_id integer references study_details(id),
primary key (study_id, details_id)
);

create table studies_placement (
study_id integer references studies(id),
placement_id integer references placement(id),
primary key (study_id, placement_id)
);

create table studies_design (
study_id integer references studies(id),
design_id integer references design(id),
primary key (study_id, design_id)
);

create table studies_camera (
study_id integer references studies(id),
camera_id integer references camera(id),
primary key (study_id, camera_id)
);

create table studies_analy (
study_id integer references studies(id),
analy_id integer references analy(id),
primary key (study_id, analy_id)
);

create table study_dates (
id integer primary key,
study_start text,
study_end text
);

create table studies_dates (
dates_id integer references studies_dates(id),
study_id integer references studies(id),
primary key (study_id, dates_id)
);

create table study_country (
id integer primary key,
country text
);

create table studies_countries (
countries_id integer references study_country(id),
study_id integer references studies(id),
primary key (countries_id, study_id)
);

create table study_region (
id integer primary key,
region text
);

create table studies_region (
region_id integer references study_region(id),
study_id integer references studies(id),
primary key (study_id, region_id)
);

create table study_details (
id integer primary key,
region text,
locat text,
locat_e text);

create table species_main (
id integer primary key,
species_name
);

create table studies_speciesmain (
study_id integer references studies(id),
speciesmain_id integer references species_main(id),
primary key (study_id, speciesmain_id)
);

create table species_other (
id integer primary key,
species_name
);

create table studies_speciesother (
study_id integer references studies(id),
speciesother_id integer references species_other(id),
primary key (study_id, speciesother_id)
);

create table species_bycatch (
id integer primary key,
species_name
);

create table studies_speciesbycatch (
study_id integer references studies(id),
speciesbycatch_id integer references species_bycatch(id),
primary key (study_id, speciesbycatch_id)
);

create table results (
id integer primary key,
study_id integer references studies(id),
tot_n text,
tr_n text,
targ_no text,
tot_no text,
tot_im text,
mis text,
ph_rate
);

create table placement(
id integer primary key,
placem text,
spaci text,
layout text,
mount text,
lure text
);

create table field_details(
id integer primary key,
study_id integer references studies(id),
camst_ma text,
camst_mi text,
camst text,
nig_st text,
sites text,
areakm text,
no_seas text);

create table extra (
id integer primary key,
study_id integer references studies(id),
peerr text,
email text,
address text,
quotes text,
notes text,
term text);

create table design (
id integer primary key,
study_t text,
objecti text
);

create table camera(
id integer primary key,
cam_b text,
dig text,
pa_ac text,
ir_wh text,
pair text
);

create table analy (
id integer primary key,
analy_t text,
analy_n text
);

create table labels (
label text,
label_text text,
primary key (label)
);