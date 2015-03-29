<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML>
<html>
<head>
<title>Voice.com</title>
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
<%-- <script type="text/javascript" src="js/vision.js"></script> --%>

<script type="text/javascript">
	var txt;

	$(document).ready(function() {
		txt = "${fileTxt}";
		if (txt != "") {
			$("#renderTxt").append(txt);
			//alert(document.getElementById("renderTxt").innerHTML);
		} 

	});
	/* function speak() {
		key = "878f97919c1e4270a30df915983505fd";
		hl = "en-in";
		src = "hello world";
		c = "WAV";
		requrl = "https://api.voicerss.org/?key=" + key + "&src=" + src
				+ "&hl=" + hl + "&c=" + c;
		$.get(requrl, function(data) {
			$(".result").html(data);
			alert("Load was performed.");
		});
	} */

	function play() {
		key = "878f97919c1e4270a30df915983505fd";
		hl = "en-us";
		_text = document.getElementById("renderTxt").innerHTML;
		result = _text.replace(/(<P[\s\S]+?>|<\/>P)/g, "");
		var $temp = $("<div>").html(_text);
		$temp.find("p").each(function() {
			$(this).replaceWith(this.childNodes);
		});
		src = "";
		src += $temp.html();
		if (document.getElementById("audioPlayer") != null) {
			if (document.getElementById("audioPlayer")
					.canPlayType('audio/mpeg') != "")
				_codec = "mp3";
			else
				_codec = "wav";

			requrl = "https://api.voicerss.org/?key=" + key + "&src=" + src
					+ "&hl=" + hl + "&c=" + _codec;

			document.getElementById("audioPlayer").src = requrl + "&rnd="
					+ Math.random();
		}

	}

	function CheckFileName() {
		var fileName = document.getElementById("uploadFile").value;
		if (fileName == "") {
			alert("Browse to upload a valid File with txt extension");
			document.getElementById('submit').disabled = 'disabled';
		} else if (fileName.split(".")[1].toUpperCase() == "TXT") {
			document.getElementById('submit').disabled = false;
		} else {
			alert("File with " + fileName.split(".")[1]
					+ " is invalid. Upload a validfile with txt extensions");
			document.getElementById('submit').disabled = 'disabled';

		}
	}

	function nosubmit(action) {
		document.forms['noform'].action = action;
		document.forms['noform'].submit();
	}

	/* function loadText() {
		file = document.getElementById("uploadFile").value;
		$.getJSON('chooseFile', {
			inpFile : file
		}, function(jsonResponse) {
			json = $.parseJSON(jsonResponse.fileTxt);
			$(json).each(function(i, val) {
				alert(val.fileTxt);
			});
		});
	} */
</script>


</head>
<body>
	<form id="noform"></form>
	<div id="bg">
		<img src="images/vision_bg.jpg" alt="">
	</div>
	<div class="navbar-wrapper ">
		<div class="container">

			<div class="navbar navbar-inverse navbar-fixed-top" id="top-nav">
				<div class="container">
					<div class="navbar-header">
						<!-- Logo Starts -->
						<a href="#" class="navbar-brand" onclick="nosubmit('gohome')">VISION.com</a>
						<!-- #Logo Ends -->


					</div>


					<!-- Nav Starts -->
					<div class="navbar-collapse  collapse">
						<ul class="nav navbar-nav navbar-right">
							<li class="active"><a href="#"
								onclick="nosubmit('loadVisual')">Visually Impaired
									Candidates</a>
							</li>
							<li><a href="#" onclick="nosubmit('loadDyslexic')">Dyslexic
									Candidates</a>
							</li>
							<!-- <li><a href="#contactus">Contact Us</a></li> -->
						</ul>
					</div>
					<!-- #Nav Ends -->

				</div>
			</div>

		</div>
	</div>

	<!-- Navbar ends -->

	<div class="container overlay">

		<div style="padding: 60px">
			<div id="about" class="spacer">
				<div class="row" align="center" style="height: 5%">
					<div class="col-lg-12">
						<h1>VISUALLY IMPAIRED CANDIDATES</h1>
						<br>
					</div>
				</div>
				<div class="row" align="center" style="height: 40%;">

					<div class="col-lg-8">
						<form action="chooseFile" method="post"
							enctype="multipart/form-data">
							<div class="input-group">
								<input type="file" class="form-control"
									placeholder=" Select a file to upload ...." name="inpFile"
									id="uploadFile" onchange="CheckFileName()"> <span
									class="input-group-btn">
									<button type="submit" class="btn btn-search" id="submit"
										disabled="disabled">Upload</button> </span>
							</div>
						</form>
					</div>
				</div>
				<div class="row" align="center" style="height: 40%;">
					<div class="col-lg-8">
						<div class="textContainer" style="height: 300px;" id="renderTxt"></div>
					</div>
					<div class="col-lg-4 col-lg-4">
						<div class="textContainer" style="height: 300px;">
							<h3>Instructions</h3>
							<hr>
							<ul>
								<li>Use hand gestures to pause/play the audio. Close your
									palm to form a fist to trigger Pause/Play.</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="row" align="center" style="height: 40%;">
					<div class="col-lg-12">
						<input type="button" onclick="play()" class="textContainer"
							value="Play"><a><span
							class="glyphicon glyphicon-play"></span> </a>&nbsp;&nbsp;
						<!-- <div class="textContainer" style="text-align: center">
							<a id="link" href="">start gesture scrolling</a>
						</div> -->
					</div>
				</div>
				<div class="row" align="center" style="height: 5%">
					<div class="col-lg-12">
						<div class="copyright" style="width: 100%; text-align: center;">Copyright&copy;Abhi@HackPSU</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div style="display: none">
		<audio id="audioPlayer" autoplay="autoplay" loop="loop"></audio>
	</div>
	<!-- <form action="chooseFile" method="post" enctype="multipart/form-data">
			<label>Choose a text file : </label><input type="file" name="inpFile"
				id="uploadFile" onchange="CheckFileName()"><br> <input
				type="submit" value="Upload" id="submit" disabled="disabled">
		</form>
		<div id="renderTxt"></div>


		<input type="button" value="Play" onclick="play()" />
		<div style="display: none">
			<audio id="audioPlayer" src="" autoplay="autoplay"></audio>
		</div> -->
</body>
<script>
	javascript: (function() {
		function getScripts(urls, callback) {
			var numDone = 0;
			function getScript(url, callback) {
				var script = document.createElement('script'), head = document
						.getElementsByTagName('head')[0], done = false;
				script.src = url;
				script.onload = script.onreadystatechange = function() {
					if (!done
							&& (!this.readyState || this.readyState == 'loaded' || this.readyState == 'complete')) {
						done = true;
						callback();
						script.onload = script.onreadystatechange = null;
						head.removeChild(script);
					}
				};
				head.appendChild(script);
			}
			function getScriptCallback() {
				if (urls.length > 0)
					getScript(urls.shift(), getScriptCallback);
				else
					callback();
			}
			getScript(urls.shift(), getScriptCallback);
		}
		getScripts(
				[
						'//mtschirs.github.io/js-objectdetect/examples/js/compatibility.js',
						'//mtschirs.github.io/js-objectdetect/js/objectdetect.js',
						'//mtschirs.github.io/js-objectdetect/js/objectdetect.handfist.js',
						'//mtschirs.github.io/js-objectdetect/examples/js/jquery.js' ],
				function() {
					var canvas = $(
							'<canvas style="position: fixed; z-index: 1001;top: 60px; right: 10px; opacity: 0.9">')
							.get(0), context = canvas.getContext('2d'), video = document
							.createElement('video'), fist_pos_old, detector;
					document.getElementsByTagName('body')[0]
							.appendChild(canvas);
					try {
						compatibility.getUserMedia({
							video : true
						}, function(stream) {
							try {
								video.src = compatibility.URL
										.createObjectURL(stream);
							} catch (error) {
								video.src = stream;
							}
							compatibility.requestAnimationFrame(play);
						}, function(error) {
							alert("WebRTC not available");
						});
					} catch (error) {
						alert(error);
					}
					function play() {
						compatibility.requestAnimationFrame(play);
						if (video.paused)
							video.play();
						if (video.readyState === video.HAVE_ENOUGH_DATA
								&& video.videoWidth > 0) {/*
						 * Prepare the detector
						 * once the video
						 * dimensions are known:
						 */
							if (!detector) {
								var width = ~~(80 * video.videoWidth / video.videoHeight);
								var height = 80;
								detector = new objectdetect.detector(width,
										height, 1.1, objectdetect.handfist);
							} /* Draw video overlay: */
							canvas.width = ~~(100 * video.videoWidth / video.videoHeight);
							canvas.height = 100;
							context.drawImage(video, 0, 0, canvas.clientWidth,
									canvas.clientHeight);
							var coords = detector.detect(video, 1);
							if (coords[0]) {
								var coord = coords[0];/*
								 * Rescale coordinates from
								 * detector to video
								 * coordinate space:
								 */
								coord[0] *= video.videoWidth
										/ detector.canvas.width;
								coord[1] *= video.videoHeight
										/ detector.canvas.height;
								coord[2] *= video.videoWidth
										/ detector.canvas.width;
								coord[3] *= video.videoHeight
										/ detector.canvas.height;
								var coord = coords[0];
								for ( var i = coords.length - 1; i >= 0; --i)
									if (coords[i][4] > coord[4])
										coord = coords[i];

								context.beginPath();
								context.lineWidth = '2';
								context.fillStyle = 'rgba(0, 255, 255, 0.5)';
								context.fillRect(coord[0] / video.videoWidth
										* canvas.clientWidth, coord[1]
										/ video.videoHeight
										* canvas.clientHeight,
										coord[2] / video.videoWidth
												* canvas.clientWidth, coord[3]
												/ video.videoHeight
												* canvas.clientHeight);
								context.stroke();
								if (document.getElementById("audioPlayer").paused == false) {
									document.getElementById("audioPlayer")
											.pause();
								} else {
									document.getElementById("audioPlayer")
											.play();
								}
							} else
								fist_pos_old = null;
						}
					}
				});
	})();
</script>
</html>