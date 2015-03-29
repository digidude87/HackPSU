<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML>
<html>
<head>
<title>Voice</title>
<meta name="description"
	content="meSpeak.js (modulary enhanced speak.js) is a 100% client-side JavaScript text-to-speech library based on the speak.js project." />
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript" src="mespeak.js"></script>
<script src="js/bootstrap.min.js"></script>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/vision.css" rel="stylesheet">
<link href="css/formstyle.css" rel="stylesheet">

<script>
	function nosubmit() {
		document.forms['noform'].action = 'gohome';
		document.forms['noform'].submit();
	}
</script>

</head>
<body>
	<form id="noform"></form>
	<div id="bg">
		<img src="images/coming_soon.jpg" alt="">
	</div>
	<div class="navbar-wrapper ">
		<div class="container">

			<div class="navbar navbar-inverse navbar-fixed-top" id="top-nav">
				<div class="container">
					<div class="navbar-header">
						<!-- Logo Starts -->
						<a href="#" class="navbar-brand" onclick="nosubmit()">VISION.com</a>
						<!-- #Logo Ends -->


					</div>


					<!-- Nav Starts -->
					<div class="navbar-collapse  collapse">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="#" onclick="nosubmit('loadVisual')">Visually
									Impaired Candidates</a></li>
							<li><a href="#" onclick="nosubmit('loadDyslexic')">Dyslexic
									Candidates</a></li>
							<!-- <li><a href="#playlist">Contact Us</a>
							</li> -->
						</ul>
					</div>
					<!-- #Nav Ends -->

				</div>
			</div>

		</div>
	</div>

	<!-- Navbar ends -->

	<div class="row" align="center" style="height: 5%">
		<div class="col-lg-12">
			<div class="copyright" style="width: 100%; text-align: center;">Copyright&copy;Abhi@HackPSU</div>
		</div>
	</div>
	</div>
</body>
</html>