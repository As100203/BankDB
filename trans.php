<?php 
	session_start();
 	if(isset($_POST['TRANSFER'])){
 		include_once './includes/dbh.inc.php';

 			$login_id = $_SESSION['u_loginid'];
 			
			$senders_name = $_SESSION['u_name'] ;
			$senders_acc_no =$_SESSION['u_phNo'] ;
			$amount = $_POST['amount'];
			$recv_acc = $_POST['recv_acc'];
			$ifsc= $_POST['ifsc'];
			$receivers_name = $_POST['name'];
			$pwd = $_POST['pwd'];
			$uniq_id = uniqid();
			$test =0;
		

			$sql = "Select * from customer where login_id='$login_id'";
			$result = mysqli_query($conn,$sql);
			$resultCheck = mysqli_num_rows($result);
			if($resultCheck>0){
				$row = mysqli_fetch_assoc($result);
				$hashedPwdCheck = password_verify($pwd,$row['acc_pwd']);
					if($hashedPwdCheck == false){
						echo"wrong input";}
									# code for checking if entered amount is less than senders balance	$sql1 = "select "

					else {
							//Call stored procedure and insert query execution
							$sql0 = "CALL transfer_funds('$senders_acc_no','$recv_acc',$amount,'$uniq_id')";
							#mysqli_query($conn,$sql0);
							if(mysqli_query($conn, $sql0)){
							echo "Procedure test_proc records added/updated successfully.";
							} else{
echo "ERROR";
echo $uniq_id;
echo $senders_acc_no;
echo $recv_acc;
echo $amount;
}

/*$select = $mysqli->query('SELECT @output_sum, @output_product, @output_average');
$result = $select->fetch_assoc();
$procOutput_sum     = $result['@output_sum'];
$procOutput_product = $result['@output_product'];
$procOutput_average = $result['@output_average'];*/


					}
			











 		}
 	}

    else{
    	echo"gadha";
    }
