<?php
require 'database/database.php';

$pdo = db_connect();
$allComments= [];
$allPosts = [];

if($_SERVER["REQUEST_METHOD"] == "POST")
{
      $pattern = "#^(.+)@([^\.].*)\.([a-z]{2,})$#";
      $formatted = preg_match($pattern, $_POST['email']);

      if ($formatted && isset($_POST['comment']) && isset($_POST['fullname']) && $_POST['comment'] != "" && $_POST['fullname'] != "" ) {
        $sql = 'INSERT INTO comments (date,name,email,comment,whichPost) VALUES (:date,:name,:email,:comment,:whichPost)';

        $statement = $pdo->prepare($sql);

        $statement->bindValue(':date', date('M d'));
        $statement->bindValue(':name', $_POST['fullname']);
        $statement->bindValue(':email', $_POST['email']);
        $statement->bindValue(':comment', $_POST['comment']);
        $statement->bindValue(':whichPost', $_POST['whichPost']);
        $statement->execute();

        $pdo = null;
      }else{
        $isValid = false;
        echo json_encode($isValid);
      }
}


if($_SERVER["REQUEST_METHOD"] == "GET"){

  if (isset($_GET['ps'])) {
    $query = "SELECT * FROM postsids";
    $results = $pdo->query($query);

    while ($row = $results -> fetch()){
      array_push($allPosts,$row);
    }

    echo json_encode($allPosts);
  }

  if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $query = "SELECT * FROM comments WHERE whichPost=$id ORDER BY id DESC";
    $results = $pdo->query($query);

    while ($row = $results -> fetch()){
      array_push($allComments,$row);
    }

    echo json_encode($allComments);
  }

}




 ?>
