<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!--
> Muaz Khan     - github.com/muaz-khan 
> MIT License   - www.webrtc-experiment.com/licence
> Documentation - www.RTCMultiConnection.org
-->
<!DOCTYPE html>
<html lang="en">

<head>
    <title>RTCMultiConnection All-in-One Test ® Muaz Khan</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <link rel="author" type="text/html" href="https://plus.google.com/+MuazKhan">
    <meta name="author" content="Muaz Khan">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet" href="css/webrtcstyle.css">

    <style>
    audio,
    video {
        -moz-transition: all 1s ease;
        -ms-transition: all 1s ease;
        -o-transition: all 1s ease;
        -webkit-transition: all 1s ease;
        transition: all 1s ease;
        vertical-align: top;
    }
    
    input {
        border: 1px solid #d9d9d9;
        border-radius: 1px;
        font-size: 2em;
        margin: .2em;
        width: 20%;
    }
    
    select {
        border: 1px solid #d9d9d9;
        border-radius: 1px;
        height: 50px;
        margin-left: 1em;
        margin-right: -12px;
        padding: 1.1em;
        vertical-align: 6px;
    }
    
    .setup {
        border-bottom-left-radius: 0;
        border-top-left-radius: 0;
        font-size: 102%;
        height: 47px;
        margin-left: -9px;
        margin-top: 8px;
        position: absolute;
    }
    
    p {
        padding: 1em;
    }
    
    #chat-output div,
    #file-progress div {
        border: 1px solid black;
        border-bottom: 0;
        padding: .1em .4em;
    }
    
    #chat-output,
    #file-progress {
        margin: 0 0 0 .4em;
        max-height: 12em;
        overflow: auto;
    }
    
    .data-box input {
        border: 1px solid black;
        font-family: inherit;
        font-size: 1em;
        margin: .1em .3em;
        outline: none;
        padding: .1em .2em;
        width: 97%;
    }
    </style>
    <script>
    document.createElement('article');
    document.createElement('footer');
    </script>

    <!-- webrtc library used for streaming -->
    <script src="js/videochat/firebase.js"></script>
    <script src="js/videochat/getMediaElement.min.js"></script>
    <script src="js/videochat/RTCMultiConnection.js"></script>
</head>

<body>
    <article>

        <!-- just copy this <section> and next script -->
        <section class="experiment">

            <section>
                <input type="text" id="session-name">
                <button id="setup-new-session" class="setup">New Session</button>
            </section>

            <!-- list of all available broadcasting rooms -->
            <table style="width: 100%;" id="rooms-list"></table>

            <!-- local/remote videos container -->
            <div id="videos-container"></div>
        </section>

        

        <script>
        // Muaz Khan     - www.MuazKhan.com
        // MIT License   - www.WebRTC-Experiment.com/licence
        // Documentation - www.RTCMultiConnection.org

        var connection = new RTCMultiConnection();

        connection.session = {
            audio: true,
            video: true
        };

        var roomsList = document.getElementById('rooms-list'),
            sessions = {};
        connection.onNewSession = function(session) {
            if (sessions[session.sessionid]) return;
            sessions[session.sessionid] = session;

            var tr = document.createElement('tr');
            tr.innerHTML = '<td><strong>' + session.extra['session-name'] + '</strong> is an active session.</td>' +
                '<td><button class="join">Join</button></td>';
            roomsList.insertBefore(tr, roomsList.firstChild);

            tr.querySelector('.join').setAttribute('data-sessionid', session.sessionid);
            tr.querySelector('.join').onclick = function() {
                this.disabled = true;

                session = sessions[this.getAttribute('data-sessionid')];
                if (!session) alert('No room to join.');

                connection.join(session);
            };
        };

        var videosContainer = document.getElementById('videos-container') || document.body;
        connection.onstream = function(e) {
            var buttons = ['mute-audio', 'mute-video', 'record-audio', 'record-video', 'full-screen', 'volume-slider', 'stop'];

            if (connection.session.audio && !connection.session.video) {
                buttons = ['mute-audio', 'full-screen', 'stop'];
            }

            var mediaElement = getMediaElement(e.mediaElement, {
                width: (videosContainer.clientWidth / 2) - 50,
                title: e.userid,
                buttons: buttons,
                onMuted: function(type) {
                    connection.streams[e.streamid].mute({
                        audio: type == 'audio',
                        video: type == 'video'
                    });
                },
                onUnMuted: function(type) {
                    connection.streams[e.streamid].unmute({
                        audio: type == 'audio',
                        video: type == 'video'
                    });
                },
                onRecordingStarted: function(type) {
                    // www.RTCMultiConnection.org/docs/startRecording/
                    connection.streams[e.streamid].startRecording({
                        audio: type == 'audio',
                        video: type == 'video'
                    });
                },
                onRecordingStopped: function(type) {
                    // www.RTCMultiConnection.org/docs/stopRecording/
                    connection.streams[e.streamid].stopRecording(function(blob) {
                        if (blob.audio) connection.saveToDisk(blob.audio);
                        else if (blob.video) connection.saveToDisk(blob.video);
                        else connection.saveToDisk(blob);
                    }, type);
                },
                onStopped: function() {
                    connection.peers[e.userid].drop();
                }
            });

            videosContainer.insertBefore(mediaElement, videosContainer.firstChild);

            if (e.type == 'local') {
                mediaElement.media.muted = true;
                mediaElement.media.volume = 0;
            }
        };

        connection.onstreamended = function(e) {
            if (e.mediaElement.parentNode && e.mediaElement.parentNode.parentNode && e.mediaElement.parentNode.parentNode.parentNode) {
                e.mediaElement.parentNode.parentNode.parentNode.removeChild(e.mediaElement.parentNode.parentNode);
            }
        };

        var setupNewSession = document.getElementById('setup-new-session');

        setupNewSession.onclick = function() {
            setupNewSession.disabled = true;

            var direction = 'one-to-one';
            var _session = 'audio+video';
            var splittedSession = _session.split('+');

            var session = {};
            for (var i = 0; i < splittedSession.length; i++) {
                session[splittedSession[i]] = true;
            }

            var maxParticipantsAllowed = 1;

            if (direction == 'one-to-one') maxParticipantsAllowed = 1;

            var sessionName = document.getElementById('session-name').value;
            connection.extra = {
                'session-name': sessionName || 'Anonymous'
            };

            connection.session = session;
            connection.maxParticipantsAllowed = maxParticipantsAllowed;

            /* if (!!document.querySelector('#fakeDataChannels').checked) {
                // http://www.rtcmulticonnection.org/docs/fakeDataChannels/
                connection.fakeDataChannels = true;
            } */

            connection.sessionid = sessionName || 'Anonymous';
            connection.open();
        };

        connection.onmessage = function(e) {
            appendDIV(e.data);

            console.debug(e.userid, 'posted', e.data);
            console.log('latency:', e.latency, 'ms');
        };

        connection.onclose = function(e) {
            appendDIV('Data connection is closed between you and ' + e.userid);
        };

        connection.onleave = function(e) {
            appendDIV(e.userid + ' left the session.');
        };

        // on data connection gets open
        connection.onopen = function() {
            //if (document.getElementById('chat-input')) document.getElementById('chat-input').disabled = false;
            //if (document.getElementById('file')) document.getElementById('file').disabled = false;
            if (document.getElementById('open-new-session')) document.getElementById('open-new-session').disabled = true;
        };

        var progressHelper = {};

        connection.autoSaveToDisk = false;

        connection.onFileProgress = function(chunk) {
            var helper = progressHelper[chunk.uuid];
            helper.progress.value = chunk.currentPosition || chunk.maxChunks || helper.progress.max;
            updateLabel(helper.progress, helper.label);
        };
        connection.onFileStart = function(file) {
            var div = document.createElement('div');
            div.title = file.name;
            div.innerHTML = '<label>0%</label> <progress></progress>';
            appendDIV(div, fileProgress);
            progressHelper[file.uuid] = {
                div: div,
                progress: div.querySelector('progress'),
                label: div.querySelector('label')
            };
            progressHelper[file.uuid].progress.max = file.maxChunks;
        };

        connection.onFileEnd = function(file) {
            progressHelper[file.uuid].div.innerHTML = '<a href="' + file.url + '" target="_blank" download="' + file.name + '">' + file.name + '</a>';
        };

        function updateLabel(progress, label) {
            if (progress.position == -1) return;
            var position = +progress.position.toFixed(2).split('.')[1] || 100;
            label.innerHTML = position + '%';
        }

        function appendDIV(div, parent) {
            if (typeof div === 'string') {
                var content = div;
                div = document.createElement('div');
                div.innerHTML = content;
            }

            if (!parent) chatOutput.insertBefore(div, chatOutput.firstChild);
            else fileProgress.insertBefore(div, fileProgress.firstChild);

            div.tabIndex = 0;
            div.focus();
        }

        var chatOutput = document.getElementById('chat-output'),
            fileProgress = document.getElementById('file-progress');

        connection.connect();
        </script>

 
    </article>

    <a href="https://github.com/muaz-khan/RTCMultiConnection" class="fork-left"></a>

    <footer>
        <a href="https://www.webrtc-experiment.com/" target="_blank">WebRTC Experiments!</a> and
        <a href="http://www.RTCMultiConnection.org/" target="_blank">RTCMultiConnection.js</a> ©
        <a href="mailto:muazkh@gmail.com" target="_blank">Muaz Khan</a>:
        <a href="https://twitter.com/WebRTCWeb" target="_blank">@WebRTCWeb</a>
    </footer>

    <!-- commits.js is useless for you! -->
    <script>
        window.useThisGithubPath = 'muaz-khan/RTCMultiConnection';
    </script>
    <script src="https://cdn.webrtc-experiment.com/commits.js" async>
    </script>
</body>

</html>