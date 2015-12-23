<?php
// Connection parameters for SQL engines (file modified according to parameters specified in OE)

// openElement - set parameters //////////////////////////////////

$oeDBConnectionOnline = array( // online connection
/*__CONNECTION_ONLINE_START*/
     'engine'	=> 'SQLite',
     'dbname'	=> 'Data/SQLite_DB/oedb.db',

/*__CONNECTION_ONLINE_END*/
	);

$oeDBConnectionLocalAMP = array( // local connection with ?AMP (easyPHP etc)
/*__CONNECTION_LOCAL_START*/
     'engine'	=> 'SQLite',
     'dbname'	=> 'Data/SQLite_DB/oedb.db',

/*__CONNECTION_LOCAL_END*/
	);

$oeLoginSQLite_LocalWebServer = array( // OE-integrated local previsualisation server
		"engine"	=> "SQLite",
		"dbname"	=> "Data/Local_previs_DB/oedb.db",
	);
	
// Apply parameters if available /////////////////////////////////

/*
// Chosen engine /////////////////////////////////
//$oeSQLEngine = "MySQL"; // "MySQL", "SQLite"
//$oeSQLEngine_Local = "MySQL"; // local "AMP" connection for testing purposes
if (!isset($oeDBConnectionLocalAMP["not_set"])) { // OE saved parameters
	$oeSQLEngine_Local = $oeDBConnectionLocalAMP["engine"]; }
if (!isset($oeDBConnectionOnline["not_set"])) {
	$oeSQLEngine = $oeDBConnectionOnline["engine"]; }*/
	
