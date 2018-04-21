<?php
include("includes/partials/header.php")
?>
<?php
if(isset($_POST["logout"])) //Om förmuläret är skickat
{
    if($_SESSION["loggedIn"] = 1)
    {   
        //har utloggningen lyckats så blir du tillbaka skickad till index.php
        session_destroy();
        header("location:index.php");
    }

}
?>
<!--Förmulär för att logga ut -->
<h1>Vill du logga ut?</h1>

    <form method="post" action="logout.php">
     <button name="logout" type="sumbit" id="sumbit"> Logga ut</button>
    </form>
<?php
include("includes/partials/footer.php")
?>
