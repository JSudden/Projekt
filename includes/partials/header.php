<?php
  require_once("includes/db.php");
 session_start();
?>
<!doctype html>

<html lang="en">
<head>
  <meta charset="utf-8">

  <title>yo</title>
  <meta name="description" content="yo">
  <meta name="author" content="Jesper Sundin">
  <link rel="stylesheet" href="style.css">


  <!--[if lt IE 9]>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.js"></script>
  <![endif]-->
</head>

<body>
<main>
<ul>
<li><a href="index.php">Blog</a></li>

<?php
if(isset($_SESSION["loggedIn"]) && $_SESSION["loggedIn"] == 1) {
  ?>
  <li><a href="createPost.php"> Create Post</a></li>
  <li ><a href="adminDashboard.php"> Admin Dashboard</a></li>
  <li ><a href="logout.php">Sign out</a></li>
<?php
} else {
?>
  <li ><a href="login.php">Logga in</a></li>
  <li ><a href="register.php">Register</a></li>
  <?php
}
?>
</ul>
 