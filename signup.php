<?php
include_once 'header.php';
?>

   <section class="main-container">
      <div class="main-wrapper">
         <h2>signup</h2>
         <form class="signup-form" action="includes\signup.inc.php" method ="POST">
         	<input type="text" name="name" placeholder="NAME"><br>
   			<input type="text" name="address" placeholder="ADDRESS"><br>
   			<input type="text" name="ph_no" placeholder="PHONE NUMBER"><br>
   			<input type="text" name="ifsc" placeholder="IFSC CODE"><br>
   			<input type="text" name="login_id" placeholder="LOGIN ID"><br>
   			<input type="password" name="pwd" placeholder="PASSWORD"><br>
   			<button type="submit" name ="submit">Sign up</button>
         </form>
      </div>
   </section>
 
</body>
</html>