<?php
include_once 'header.php';
?>

   <section class="main-container">
      <div class="main-wrapper">
         <h2>HOME</h2>
         <?php
         if(isset($_SESSION['u_id'])){
            $d = $_SESSION['u_name'];
            echo "<h4> you are logged in</h4>";
            echo "username is : $d";

         }
         else{
            echo " <h2>NET BANKING</h2><br>Time is money and we at DBReality value your time. 
Change the way you bank.<br>";

         echo "<br>Now with Net Banking you can enjoy a convenient way to bank from the comfort of your home or office. Explore a one-stop solution for all your banking needs 24x7 with DBRealitys Net Banking services.";
         }
         ?>
      </div>
   </section>
  </body>
</html>