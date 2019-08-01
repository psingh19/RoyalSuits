<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);

require 'templates/header.html';

$pageId = $_GET['id'];

if ($pageId == "collection") {
  require 'templates/collection.html';
}elseif ($pageId == "home") {
  require 'templates/home.html';
}elseif ($pageId == "blog") {
  require 'templates/blog.html';
}elseif ($pageId == "documentation") {
  require 'templates/documentation.html';
}else{
  require 'templates/home.html';
}

require 'templates/footer.html';

 ?>
