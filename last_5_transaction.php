
<html>
<head>
<title>The Bank of Gotham City</title>

</head>
<body>
    

<div id="templatemo_main">
    <div id="sidecon">
       <h2> Transactions made</h2>
        	  <table border="1">
        	    <tr>
        	      <td height="27"><strong>Transaction_id</strong></td>
                  <td><strong>Transaction_Date</strong></td>
				  <td><strong>Senders_Account_No</strong></td>
				  
                
				  
                  <td><strong>Receivers_acc_no1</strong></td>
        	      <td><strong>Amount</strong></td>
         	    </tr>
<?php

  session_start();
  $req_acc = $_SESSION['u_phNo'];
  $u_name = $_SESSION['u_name'];
  echo"<h1>USERNAME:  ".$u_name;

$con=mysqli_connect("localhost","root","","bank");

#$query="SELECT * FROM (SELECT * FROM transaction ORDER BY transac_id DESC LIMIT 1)sub ORDER BY transac_id ASC";
$query="SELECT * FROM transaction where senders_acc_no='$req_acc' or receivers_acc_no='$req_acc';";
$result=mysqli_query($con,$query);
while($res = mysqli_fetch_array($result))
{	
	
	$Transaction_id=$res['transac_id'];
	$Transaction_Date=$res['transac_Date'];
	$Account_No=$res['senders_acc_no'];
	$Received_id=$res['receivers_acc_no'];
    $Amount=$res['Amount'];	
	echo "<tr>
        	     <td>$Transaction_id</td>
        	     <td>$Transaction_Date</td>
				 <td>$Account_No</td>
        	      <td>$Received_id</td>
                  <td>$Amount</td>
    </tr>";
}
?>
      	    </table>
        	  <p><input type="button" value="Print Transaction detail" onClick="window.print()"></p>
    
    
</div>
    </div>
</body>
</html>
