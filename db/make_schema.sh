perl -MDBIx::Class::Schema::Loader=make_schema_at,dump_to_dir:lib -e \
         'make_schema_at("Cameras::Schema", { debug => 1 }, 
         ["dbi:SQLite:dbname=db/alex.db";"user","pass" ])'


perl -MDBIx::Class::Schema::Loader=make_schema_at,dump_to_dir:./lib -e \
             'make_schema_at("Cameras::Schema", { debug => 1, use_namespaces => 1}, 
             ["dbi:SQLite:db/alex.db", "", "" 
             ])'

