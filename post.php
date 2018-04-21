<?php
include("includes/partials/header.php");
?>
<?php
//om du har kommenterat sätt in variablerna i comments table
if(isset($_POST['commented'])){
    $Name = $_POST['name'];
    $Content = $_POST['comment'];
    $blogpost_Id = $_POST['blogpost'];  
    $SQl2 = $mysqli->query("INSERT INTO comments (Name,Content,blogpost_Id) VALUES ('$Name','$Content','$blogpost_Id')");

    $userid = intval($Name);
    $SQL3 = "SELECT * FROM users WHERE id = $userid";
    $userrow = $mysqli->query($SQL3);
    print_r($mysqli->error);
    $user = mysqli_fetch_assoc($userrow);
    $username = $user["username"];
}

$id = $_GET['ID'];
//hämtar id ifrån blogpost som är samma som postens id för att kunna skriva ut rätt titel och kommentarar som stämmer överäns med posten.
$SQL = "SELECT * FROM blogposts WHERE ID = $id";

$blogposts = $mysqli->query($SQL);
while ($blogpost = mysqli_fetch_array($blogposts)) {
    ?>
   <h2>Title</h2>
   <?php
    echo $blogpost['Title'];
    ?>
    <h2> Content </h2>
    <?php
   echo $blogpost['Content'];
   ?>
    <?php
        $id = $blogpost["ID"];
        //hämtar pathen som stämmer överns med post id
        $SQL = "SELECT * FROM path WHERE postId = $id";
        $paths = $mysqli->query($SQL);
        while ($path = mysqli_fetch_array($paths)) {
            ?>
            <img src="<?php echo $path["path"] ?>" />
            <?php 
         }
        ?>
   <h1> kommentarer: </h1>
   <?php
   //skriver ut kommentarer där blogpost id är samma som id som posten
    $SQL = "SELECT * FROM comments WHERE blogpost_Id = $_GET[ID]";
    $comments = $mysqli->query($SQL);
    //loopar igenom och skriver ut comments ifrån databasen
    while ($comment = mysqli_fetch_array($comments)) {
       
        ?>
        <h4> Content </h4>
        <?php 
        echo $comment['Content'];
        ?>
        <p>Skriven av:
        <?php
            $SQL4 = "SELECT * FROM users WHERE id = $comment[Name]";
            $userRow = $mysqli->query($SQL4);
            $userName = mysqli_fetch_assoc($userRow);
            $userPrint = $userName['username'];
            echo $userPrint;
        ?>
        </p>
      
        <?php
    }
   ?>
   <!--Formulär där du skriver in dina kommentarer och postar den. -->
   <form action="post.php?ID=<?php echo $_GET['ID'] ?>" method="post">
   <input type="hidden" name="blogpost" value="<?php echo $blogpost['ID'] ?>"/>
    <input type="hidden" name="name" value="<?php echo $_SESSION['id']; ?>" placeholder="Name..."/>
  <textarea type="text" name="comment" placeholder="Comment..."></textarea>
  <input type="submit" name="commented" value="Send"/>
</form>
<?php
}
  
?>

<?php
include("includes/partials/footer.php")
?>
