
<!DOCTYPE html>
<html>
<head>
<title>NextRTC sample one</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<body>
	<div class="jumbotron">
		<video id="local" autoplay></video>
		<video id="remote" autoplay></video>
		
		Conversation id:<!-- <input id="convId" type="text"/> -->
		<input id="convId" type="hidden" value="<%= request.getParameter("convId") %>"/>
		<button onclick="createConversation()">Create</button>
		<button	onclick="joinConversation()">Join</button>
		<button onclick="closeConversation()">Close</button>
	</div>
	<script src="js/nextRTC/adapter.js"></script>
	<script src="js/nextRTC/nextRTC.js"></script>
	<script src="js/jquery-2.2.2.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script>
		var createConversation = function(){
			var convId = $('#convId').val();
			console.log(nextRTC);
			nextRTC.create(convId);
			
			
			console.log(nextRTC);
		};

		var joinConversation = function(){
			var convId = $('#convId').val();
			nextRTC.join(convId);
		};
		
		function closeConversation(){
			console.log(nextRTC.signaling);
			//nextRTC.signaling.close();
			var video1 = document.getElementById("local");
			video1.pause();
		}
		
		//wsURL : 'wss://examples.nextrtc.org/videochat/signaling',
		//wsURL : 'wss://203.233.196.64:8443/videochat/signaling',
		var nextRTC = null;
		NextRTC.onReady = function() {
			nextRTC = new NextRTC({
				wsURL : 'wss://examples.nextrtc.org/videochat/signaling',
				mediaConfig : {
					video : true,
					audio : true,
				},
				peerConfig : {
					'iceServers' : [ {
						url : "stun:stun.l.google.com:19302"
					} ]
				},
			});
			nextRTC.on('created', function(nextRTC, event) {
				console.log(JSON.stringify(event));
				//alert('Room with id ' + event.content + ' has been created, share it with your friend to start videochat');
			});

			nextRTC.on('joined', function(nextRTC, event) {
				console.log(JSON.stringify(event));
				console.log('Member with id ' + event.from + ' joined conversation');
			});

			nextRTC.on('localStream', function(nextRTC, stream) {
				attachMediaStream($('#local')[0], stream.stream);
			});

			nextRTC.on('remoteStream', function(nextRTC, stream) {
				attachMediaStream($('#remote')[0], stream.stream);
			});

			nextRTC.on('left', function(nextRTC, event) {
				console.log(JSON.stringify(event));
				alert(event.from + " left!");
			});
			
			
		};
		
		
	</script>

</body>
</html>
