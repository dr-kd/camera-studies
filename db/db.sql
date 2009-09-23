create table studies (
id integer primary key,
CITAT text ,
AUTH_C text ,
YEAR integer,
AUTH_ALL text,
ABST text,
LINK text,
TITLE text,
JOURN text,
PUBL text,
VOL text,
ISSU text,
PAGE text
);

create table studies_details (
study_id integer REFERENCES studies(id),
details_id integer REFERENCES study_details(id),
primary key (study_id, details_id)
);

create table studies_species (
study_id integer REFERENCES studies(id),
species_id integer REFERENCES species_details(id),
primary key (study_id, species_id)
);

create table studies_placement (
study_id integer REFERENCES studies(id),
placement_id integer REFERENCES placement(id),
primary key (study_id, placement_id)
);

create table studies_field (
study_id integer REFERENCES studies(id),
field_id integer REFERENCES field_details(id),
primary key (study_id, field_id)
);

create table studies_design (
study_id integer REFERENCES studies(id),
design_id integer REFERENCES design(id),
primary key (study_id, design_id)
);

create table studies_camera (
study_id integer REFERENCES studies(id),
camera_id integer REFERENCES camera(id),
primary key (study_id, camera_id)
);

create table studies_analy (
study_id integer REFERENCES studies(id),
analy_id integer REFERENCES analy(id),
primary key (study_id, analy_id)
);

create table study_details (
id integer primary key,
STUDY_S text,
STUDY_E text,
SEASON text,
COUNTRY text,
REGION text,
LOCAT text,
LOCAT_E text);

create table species(
id integer primary key,
SP_M text,
SP_O text,
SP_B text);

create table results (
id integer primary key,
study_id integer references studies(id),
TOT_N text,
TR_N text,
TARG_NO text,
TOT_NO text,
TOT_IM text,
MIS text,
PH_RATE);

create table placement(
id integer primary key,
PLACEM text,
SPACI text,
LAYOUT text,
MOUNT text,
LURE text
);

create table field_details(
id integer primary key,
CAMST_MA text,
CAMST_MI text,
CAMST text,
NIG_ST text,
SITES text,
AREAKM text,
NO_SEAS text);

create table extra (
id integer primary key,
study_id integer references studies(id),
PEERR text,
EMAIL text,
ADDRESS text,
QUOTES text,
NOTES text,
TERM text);

create table design (
id integer primary key,
STUDY_T text,
OBJECTI text
);

create table camera(
id integer primary key,
CAM_B text,
DIG text,
PA_AC text,
IR_WH text,
PAIR text
);

create table analy (
id integer primary key,
ANALY_T text,
ANALY_N text
);

create table labels (
label text,
label_text text,
primary key (label));