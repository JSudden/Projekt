<?php
include("includes/partials/header.php")
?>
<h1> Recent posts</h1>
<?php
$SQL = "SELECT * FROM blogposts";
$blogposts = $mysqli->query($SQL);
while ($blogpost = mysqli_fetch_array($blogposts)) {
   ?>
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
   <!--Går så att du kommer in på postens id genom en länk och kan läsa mer om inlägget -->
   <a href="post.php?ID=<?php echo$blogpost['ID']?>">Read More</a>
    <?php
  }
?>

<?php
include("includes/partials/footer.php")
?>
