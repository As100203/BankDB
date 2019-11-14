<?php
session_start();


	if(isset($_POST['submit'])){
		include 'dbh.inc.php';

		$uid = mysqli_real_escape_string($conn,$_POST['uid']);
		$pwd = mysqli_real_escape_string($conn,$_POST['pwd']);


		// error handlers
		if(empty($uid) || empty($pwd)){
			header("Location: ../index.php?login=empty");
				exit();
			}

		else{
			$sql = "Select * from customer where login_id='$uid'";
			$result = mysqli_query($conn,$sql);
			$resultCheck = mysqli_num_rows($result);
			if($resultCheck<1){
				header("Location: ../index.php?login=error");
				exit();
			} else{
				if($row = mysqli_fetch_assoc($result)){
					//dehashing the password
					$hashedPwdCheck = password_verify($pwd,$row['acc_pwd']);
					if($hashedPwdCheck == false){
						header("Location: ../index.php?login=errorr");
					exit(); 
					}
					elseif($hashedPwdCheck == true){
						//login the user here;
						$_SESSION['u_id'] = $row['cust_id'];
						$_SESSION['u_name'] = $row['cust_Name'];
						$_SESSION['u_phNo'] = $row['ph_No'];
						$_SESSION['u_ifsc'] = $row['ifsc_Code'];
						$_SESSION['u_loginid'] = $row['login_id'];

						header("Location: ../user.html?login=success1");
						exit();
					}
				}
			}
		}
	}

	else{
		header("Location: ../index.php?login=error1");
		exit();
	}_
	?>