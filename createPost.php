<?php
include("includes/partials/header.php");
?>

<h1>Gör ett inlägg</h1>
<!-- formulär för vad ditt inlägg ska innehålla --> 
<form action="createPost.php" enctype="multipart/form-data" method="post">
 <input type="file" name="fileToUpload" id="fileToUpload">
  <input type="text" name="titel" placeholder="Titel..."/>
  <textarea type="text" name="content" placeholder="Content..."></textarea>
  <input type="submit" name="send" value="Send"/>
</form>

<?php

if(!isset($_SESSION["loggedIn"]) || $_SESSION["loggedIn"] == 0) {
  header("location:index.php");
}

//Om formuläret är skickat
if(!empty($_POST["send"])) {
  $titel = $_POST['titel'];
  $content = $_POST['content'];  
  if(strlen($titel) == 0 || strlen($content) == 0) {
    
     echo "you need to enter info here";
    
  } else {
    //time gör så att filnamnen som sparas får olika idn så man kan ladda upp samma fil fler än en gång med samma namn.
    $timestamp = time();
    $fileName = "uploads/" . $timestamp . basename($_FILES["fileToUpload"]["name"]);
    move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $fileName);
    $mysqli->query("INSERT INTO blogposts (title,content) VALUES ('$titel','$content')");
    $id = $mysqli->insert_id;
    $mysqli->query("INSERT INTO path(postId,path) VALUES ('$id','$fileName')");
    header("location:index.php");
  }
 
 
  
}

?>

<?php
include("includes/partials/footer.php")
?>
