<?php
require_once ("includes/partials/header.php");
if( isset($_SESSION["loggedIn"]))
{
if($_SESSION["loggedIn"] == 1)
{
    header("location:index.php");
}
}
?>
<?php
if(!empty($_POST)) //Om förmuläret är skickat
{
    //variabler som samlar data ifrån formuläret
    $password = $_POST["password"];
    $username = $_POST["username"];
    
   // $username = "admin";
   // $password = "secret";
   //Söker igenom users table efter ett användarnamn som stämmer överäns med det inskrivna i formuläret.
   $query = "SELECT * FROM users WHERE username = '$username'";
   $result = $mysqli->query($query);
   $row = mysqli_fetch_assoc($result);
  
   $validPass = password_verify($password,$row["password"]);
   if($row) {
        //är inloggningen lyckad blir du skickad till index.php
    if (password_verify($password,$row["password"])){
        $_SESSION["loggedIn"] = 1;
        $_SESSION["id"] = $row["id"];
         header("location:index.php");
    } else {
        echo("Användare eller lösenord finns ej");//är den inte lyckad skrivs det ut ett error meddelande.
    }
}

   

    //sammanställ data
 //   if($password == $_POST["password"] && $username == $_POST["userName"])
   // {
     //   $_SESSION["loggedIn"] = 1;
       // header("location:index.php");
    //}
    

}
?>
<!--Inloggnings formulär-->
<h1>Logga in</h1>
<form method="post">
<div class="loginInputContainer ">
	<label for="userName" >Username: </label>
		<input type="text" name="username" id="userName"/>	
		</div>
            
			<div class="loginInputContainer">
			<label for="password" > Password </label>
			<input type="password" name="password" id="password"/>
			</div>
            <div class="loginInputContainer">
				
				 <button type="sumbit" id="sumbit"> Submit</button>
				 </div>
			 </div>
 </form>            
<?php
include("includes/partials/footer.php")
?>
