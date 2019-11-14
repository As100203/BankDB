<?php 

	if (isset($_POST['submit'])){
		echo"yo";
	include_once 'C:\xampp1\htdocs\login_form\includes\dbh.inc.php';

	$name = mysqli_real_escape_string($conn,$_POST['name']);
	$address =mysqli_real_escape_string($conn , $_POST['address']);
	$ph_no = mysqli_real_escape_string($conn , $_POST['ph_no']);
	$ifsc = mysqli_real_escape_string($conn , $_POST['ifsc']);
	$login_id =mysqli_real_escape_string($conn , $_POST['login_id']);
	$pwd = mysqli_real_escape_string($conn , $_POST['pwd']);
	

	if(empty($name)|| empty($address)||empty($ph_no)||empty($ifsc)|| empty($login_id)||empty($pwd)){

		header("Location:../index.php?signup=empty");
	}

	 else{
	 	if(!preg_match("/^[a-z A-Z]*$/",$name)){
			header("Location: ../signup.php?signup=invalidname");
			exit();
			}    

	 
	
	else{
		$sql = "SELECT * from customer where login_id='$login_id'  ";
		$result = mysqli_query($conn,$sql);
		$resultCheck = mysqli_num_rows($result);
		if($resultCheck>0){
			header("Location: ../index.php?signup=usertaken");

		}
		else{
		$sql = "SELECT * from customer where ph_No='$ph_no'  ";
		$result = mysqli_query($conn,$sql);
		$resultCheck = mysqli_num_rows($result);
		if($resultCheck>0){
			header("Location: ../index.php?signup=phonenumber taken");

		}
		

		else{
			//hashing the password
			$hashedPwd= password_hash($pwd,PASSWORD_DEFAULT);
			//insert the user into the database
			$sql = "Insert into customer (cust_Name,address,ph_No,ifsc_Code,login_id,acc_pwd,last_Login)
 				 values ('$name','$address',$ph_no,'$ifsc','$login_id','$hashedPwd',NOW());";
  			 mysqli_query($conn,$sql);
  			 header ( "Location: ../index.php?signup = successful");
  			 exit();
		}
	}
	}

}




  
   

}

else {
	header("Location: ../index.php?signup=error");
}
?>