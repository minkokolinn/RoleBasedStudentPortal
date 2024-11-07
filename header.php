<?php
session_start();
include('connect.php');
if (isset($_SESSION['authorid']) && isset($_SESSION['authortype'])) {
	$authorid = $_SESSION['authorid'];
	$authortype = $_SESSION['authortype'];
} else {
	echo "<script>window.alert('Access Denied! Login first')</script>";
	echo "<script>location='index.php'</script>";
}
?>
<!DOCTYPE html>
<html lang="zxx">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="description" content="Orbitor,business,company,agency,modern,bootstrap4,tech,software">
	<meta name="author" content="themefisher.com">

	<title>Novena- Health & Care Medical template</title>

	<!-- Favicon -->
	<link rel="shortcut icon" type="image/x-icon" href="/images/favicon.ico" />

	<!-- bootstrap.min css -->
	<link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css">
	<!-- Icon Font Css -->
	<link rel="stylesheet" href="plugins/icofont/icofont.min.css">
	<!-- Slick Slider  CSS -->
	<link rel="stylesheet" href="plugins/slick-carousel/slick/slick.css">
	<link rel="stylesheet" href="plugins/slick-carousel/slick/slick-theme.css">

	<!-- Main Stylesheet -->
	<link rel="stylesheet" href="css/style.css">

	<!-- Data table -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
	<link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap4.min.css">
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap4.min.js"></script>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
</head>

<body id="top">

	<header>
		<nav class="navbar navbar-expand-lg navigation" id="navbar">
			<div class="container">
				<a class="navbar-brand" href="index.html">
					<!-- <img src="images/logo.png" alt="" class="img-fluid"> -->
					<h2>Derbyshire Uni</h2>
				</a>

				<button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarmain" aria-controls="navbarmain" aria-expanded="false" aria-label="Toggle navigation">
					<span class="icofont-navigation-menu"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarmain">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item active">
							<a class="nav-link" href="UserDashboard.php">Dashboard</a>
						</li>

						<?php
						if ($authortype == "qam") {
							echo "<li class='nav-item'><a class='nav-link' href='addcat.php'>Category</a></li>";
							echo "
							<li class='nav-item dropdown'>
							<a class='nav-link dropdown-toggle' href='' id='dropdown03' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>Download <i class='icofont-thin-down'></i></a>
							<ul class='dropdown-menu' aria-labelledby='dropdown03'>
								<li><a class='dropdown-item' href='CSV.php'>Download Idea CSV</a></li>
								<li><a class='dropdown-item' href='zipdownload.php'>Download Documents Zip</a></li>
							</ul>
						</li>
							";
						}
						?>

						<li class="nav-item"><a class="nav-link" href="ideaShowcase.php">Ideas</a></li>
						<li class="nav-item"><a class="nav-link" href="UserIdeaForm.php">Upload Idea</a></li>

						<li class="nav-item"><a class="nav-link" href="logout.php">Logout</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>