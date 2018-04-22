<?php
include("includes/partials/header.php");
?>
<?php
 $SQL = "SELECT * FROM blogposts  WHERE ID = $_GET[ID]";
$blogposts = $mysqli->query($SQL);
while($blogpost = mysqli_fetch_array($blogposts)){
?>
<h1>Edit</h1>
<form action="edit.php?ID=<?php echo $_GET['ID']?>" enctype="multipart/form-data" method="post">
  <input type="file" name="fileToUpload" id="fileToUpload">
    <input type="text" name="titel" value="<?php echo $blogpost['Title']; ?>" />
      <textarea type="text" name="content" ><?php echo $blogpost['Content'] ?></textarea>
        <input type="submit" name="send" value="Send"/>
</form>
<?php
}
?>
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
    $mysqli->query("UPDATE blogposts SET Title = '$titel', Content = '$content' WHERE ID = $_GET[ID] ");
    header("location:index.php");
  }
 
 
  
}

?>

<?php
include("includes/partials/footer.php")
?>
