<?php
require "config.php";

function db_connect() {

  try {
    $connectionString = 'mysql:host=' . DBHOST . ';dbname=' . DBNAME;
    $user = DBUSER;
    $pass = DBPASS;

    // MAKE CONNECTION AND SET UP ERROR HANDLING
    $pdo = new PDO($connectionString, $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    return $pdo;
  }

  catch (PDOException $e)
  {
    die($e->getMessage());
  }

}
