<?php
include("includes/partials/header.php")
?>
<?php
   
if(!empty($_POST)) //Om förmuläret är skickat
{
    //variabler
    $ConfirmPassword = $_POST["ConfirmPassword"];
    $password = $_POST["password"];
    $username = $_POST["username"];
    $hashPass = password_hash($password,PASSWORD_BCRYPT);
    
    if($password != $ConfirmPassword)
	{
	    die("match the password noob");
    }
    //Sätter in användarnamn och lösenord i users table och krypterar lösenordet med BCRYPT.
    $SQl2 = $mysqli->query("INSERT INTO users (username,password) VALUES ('$username','$hashPass')");
    header("location:login.php");
}
?>
<!--Registrerings formulär -->
<h1> Hej gör en användare</h1>
        <form method="post" action="register.php"> <h1>Register</h1>
    <div>
        <label for="username"><h2>Username:</h1></label>
        <input type="text" name="username" id="username"/>
    </div>
    <div>
        <label for="password"><h2>Password:</h1> </label>
        <input type="password" name="password" id="password"/>    
    </div>
    <div>
		<label for="ConfirmPassword"><h2>Confirm Password:</h2></label>
		<input type="password" name="ConfirmPassword" id="ConfirmPassword">
	</div>
    <div class="inputContainer">
        <button name="register" type="sumbit" id="sumbit">Register</Register
     </div>
    </form>
<?php
include("includes/partials/footer.php")
?>