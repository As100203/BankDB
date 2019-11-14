<?php
session_start();
?>

<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="style.css"
</head>
<body>
   				
   <header>
   	<nav>
   		<div class="main-wrapper">
   			<ul>
   				<li><a href = "index.php">DBreality</a></li>
   			</ul>
   		<div class="nav-login">
            <?php
               if(isset($_SESSION['u_id'])){
                 echo '<form action ="./includes/logout.inc.php" method="POST">
            <button type="submit" name="submit">Logout</button>';
                  
            
                  

               }else{
                  echo '<form action="./includes/login.inc.php" method="POST">
               <input type= "text" name = "uid" placeholder="Username">
               <input type = "password" name = "pwd" placeholder="password">
               <button type="submit" name="submit">LOGIN</button>
            </form>
            <a href="signup.php">signup</a>';



               }
            ?>



   			
   			
   		</div>
   		</div>
   	</nav>
   </header>