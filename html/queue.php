<?php
	//Connect to db
	$dbcnx = mysql_connect("localhost", "root", "password") or die("Could not connect to the database server.");
	mysql_select_db("coffeedatabase", $dbcnx) or die("Can not select database");

	//Select all not finished orders
	$query = "SELECT Email, Name FROM coffeequeue NATURAL JOIN beantypes WHERE Finished='0' ORDER BY StartTime, CoffeeID";
	$query = stripslashes($query);
	$result = mysql_query($query) or die(mysql_error());
	$number_cols = mysql_num_fields($result);
?>

<head>
	<title>Coffee Queue</title>
	<link type="text/css" href="./coffee.css" rel="stylesheet"></link>
	<link type="text/css" href="./bootstrap-3.3.6-dist/css/bootstrap.css" rel="stylesheet"></link>
	<script type="text/javascript" src="./bootstrap-3.3.6-dist/js/bootstrap.js"></script>
</head>

<body>
	<div class="container-fluid">
		<div class="row header">
			<div class="col-xs-12">
				<a href="./index.php">
					<h3>Automatic Coffee Ordering</h3><br />
				</a>
			</div>
		</div>	

		<div class="row">
			<div class="col-md-2 sidebar">
				<ul class="nav nav-pills nav-stacked">
					<li><a href=".index.php"><i class="glyphicon glyphicon-chevron-right"></i> Order Coffee</a></li>
					<li><a href=".queue.php"><i class="glyphicon glyphicon-chevron-right"></i> View Queue</a></li>
				</ul>
			</div>
			<div class="col-md-6 body">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>Order</th>
							<th>Requestor Email</th>
							<th>Bean</th>
						</tr>
					</thead>
					<tbody>

<?php
	$i = 1;
	while ($row = mysql_fetch_row($result))
	{
		if (isset($_COOKIE['coffee_email']) && $row[0] == $_COOKIE['coffee_email'])
		{
			echo "<tr class=\"info\">";
		}
		else
		{
			echo "<tr>";
		}	
		echo "<td>$i</td>";
		for ($j=0;$j<$number_cols;$j++)
		{
			echo "<td>$row[$j]</td>";
		}
		echo "</tr>";
		$i++;
	}
?>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row footer">footer TODO
		</div>
	</div>
</body>