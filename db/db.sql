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
page text
);

create table studies_details (
study_id integer references studies(id),
details_id integer references study_details(id),
primary key (study_id, details_id)
);

create table studies_species (
study_id integer references studies(id),
species_id integer references species_details(id),
primary key (study_id, species_id)
);

create table studies_placement (
study_id integer references studies(id),
placement_id integer references placement(id),
primary key (study_id, placement_id)
);

create table studies_field (
study_id integer references studies(id),
field_id integer references field_details(id),
primary key (study_id, field_id)
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

create table study_details (
id integer primary key,
study_s text,
study_e text,
season text,
country text,
region text,
locat text,
locat_e text);

create table species(
id integer primary key,
sp_m text,
sp_o text,
sp_b text);

create table results (
id integer primary key,
study_id integer references studies(id),
tot_n text,
tr_n text,
targ_no text,
tot_no text,
tot_im text,
mis text,
ph_rate);

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
primary key (label));