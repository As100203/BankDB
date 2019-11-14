<?php 
 	session_start();
 	if(isset($_POST['CHG_PWD'])){

 		include_once './includes/dbh.inc.php';

 		$login_id = $_SESSION['u_loginid'];
 		$cur_pwd = $_POST['cur_pwd'];
 		$new_pwd = $_POST['new_pwd'];
 		$sql = "Select * from customer where login_id='$login_id'";
			$result = mysqli_query($conn,$sql);
			$resultCheck = mysqli_num_rows($result);
			if($resultCheck>0){

				$row = mysqli_fetch_assoc($result);
				$hashedPwdCheck = password_verify($cur_pwd,$row['acc_pwd']);
					if($hashedPwdCheck == false){
						echo"wrong input";
					}
					else {
						$sql1 = "update customer set acc_pwd ='$new_pwd' where login_id ='$login_id'";
						mysqli_query($conn,$sql1);
						echo"successfull";
					}
				}

 	}
 	else{
 		echo ("bad input");
 	}