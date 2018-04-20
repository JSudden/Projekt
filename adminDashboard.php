<?php
include("includes/partials/header.php")
?>
<h1>Admin Dashboard</h1>
<?php

if(!isset($_SESSION["loggedIn"]) || $_SESSION["loggedIn"] == 0) {
  header("location:index.php");
}
if(isset($_GET['ID'])){
    $delete = $mysqli->query("DELETE FROM blogposts WHERE ID = $_GET[ID]");
}
$SQL = "SELECT * FROM blogposts";

$blogposts = $mysqli->query($SQL);
//söker igenom blogposts och skriver ut blogpostens titel och content
while ($blogpost = mysqli_fetch_array($blogposts)) {
   ?>
   <div id="post-<?php echo $blogpost['ID']; ?>">
   <h2> Title:
   <?php
   echo $blogpost['Title'];
   
   ?>
   </h1>
   <h3> Content:
   
   <?php
    echo $blogpost['Content'];
   ?>

   </h2>
  <!--Skapar en länk som gör att du kan ta bort posten ifrån databasen -->
   <a href="#" class="delete" data-id="<?php echo $blogpost['ID']?>">Delete</a>
   <!--Skapar en länk som gör det möjligt att editera posten-->
   <a href="edit.php?ID=<?php echo $blogpost['ID']?>">Edit</a>
   </div>
    <?php
       
  }
?>
<?php
include("includes/partials/footer.php")
?>
