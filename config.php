<?php
$db_host = getenv('DB_HOST') !== false ? getenv('DB_HOST') : 'db';   // <-- mặc định 'db'
$db_user = getenv('DB_USER') !== false ? getenv('DB_USER') : 'root';
$db_pass = getenv('DB_PASS') !== false ? getenv('DB_PASS') : '';
$db_name = getenv('DB_NAME') !== false ? getenv('DB_NAME') : 'webbh01';
$db_port = getenv('DB_PORT') !== false ? intval(getenv('DB_PORT')) : 3306;

define("DB_HOST", $db_host);
define("DB_USER", $db_user);
define("DB_PASS", $db_pass);
define("DB_NAME", $db_name);
define("DB_PORT", $db_port);
?>