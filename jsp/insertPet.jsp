<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
 
<!DOCTYPE html>
<html>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title>펫 등록 - Petopia</title>

  <!-- Bootstrap -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

  <script>
    var escapeHtml = (function (String) {
      var escapeMap = {
        '&': '&amp;',
        "'": '&#x27;',
        '`': '&#x60;',
        '"': '&quot;',
        '<': '&lt;',
        '>': '&gt;'
      };
      var escapeReg = '[';
      var reg;
      for (var p in escapeMap) {
        if (escapeMap.hasOwnProperty(p)) {
          escapeReg += p;
        }
      }
      escapeReg += ']';
      reg = new RegExp(escapeReg, 'g');
      return function escapeHtml (str) {
        str = (str === null || str === undefined) ? '' : '' + str;
        return str.replace(reg, function (match) {
          return escapeMap[match];
        });
      };
    }(String));

    $(function() {
      var API_KEY = 'AIzaSyAUxUNaPOuZkaNc41lipW3Q9Ik5yzQ8AOg';

      var MAX_RESULT_NUM = 10;
      var LINE_COLOR = "rgb(255, 0, 0)";
      var FONT_SIZE = 24;

      var STRATEGIES = {
        LABEL_DETECTION: {
          resultAttrName: 'labelAnnotations',
          outputAttrNames: ['mid', 'locale', 'description', 'score', 'condidence', 'topicality'],
          drawImage: false
        }
      }

      function clearResult() {
        var errorMsg = $('#error-msg');
        if (errorMsg) {
          errorMsg.remove();
        }

        $('#result-table thead').find('tr').remove();
        $('#result-table tbody').find('tr').remove();

        var canvas = $('#canvas')[0];
        var ctx = canvas.getContext('2d');
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        canvas.width = 0;
        canvas.height = 0;
      }

      function showResult(results, attrNames) {
    	var category = $('#category option:selected').val();
    	var description = "";
    	var score = 0.0;
    	var checker = "N";
        results.forEach(function(elem, i){
        	description = elem['description'];
        	score = elem['score'];
        	if(description == category){
        		if(score > 0.9){
        			checker = "Y";
        		}
        	}
        });
        $('#result').append(checker);
        
    	/* var row = '<tr><th>#</th>';
        attrNames.forEach(function(name) {
          row += '<th>' + escapeHtml(name) + '</th>'
        });
        row += '</tr>';
        $('#result-table thead').append(row);

        if (!results) {
          return;
        }

        results.forEach(function(elem, i) {
          row = '<tr><td>' + (i + 1) + '</td>';
          attrNames.forEach(function(name) {
            var attrVal = elem[name];
            if ((typeof attrVal) === 'object') {
              row += '<td>' + escapeHtml(JSON.stringify(attrVal)) + '</td>'
            } else {
              row += '<td>' + escapeHtml(attrVal) + '</td>'
            }
          });
          row += '</tr>'
          $('#result-table tbody').append(row);
        }); */
      }

      function drawImageWithDetectedArea(canvas, results) {
        if (!results) {
          return;
        }

        var img = new Image();
        img.src = $('#img').attr('src');

        canvas.width = img.width;
        canvas.height = img.height;
        var ctx = canvas.getContext('2d');
        ctx.drawImage(img, 0, 0);

        results.forEach(function(elem, index) {
          var vertices = elem.boundingPoly.vertices;

          ctx.beginPath();
          ctx.moveTo(vertices[0].x, vertices[0].y)
          for (var i = 1; i < vertices.length; i++) {
            ctx.lineTo(vertices[i].x, vertices[i].y);
          }
          ctx.closePath();
          ctx.strokeStyle = LINE_COLOR;
          ctx.stroke();

          ctx.fillStyle = LINE_COLOR;
          ctx.font = FONT_SIZE
          ctx.fillText(index + 1, vertices[vertices.length-1].x, vertices[vertices.length-1].y);
        })
      }

      $('#input-img').change(function() {
        clearResult();

        var file = $(this).prop('files')[0];
        var imgElem = $('#img');
        if (file) {
          var reader = new FileReader();
          reader.onload = function() {
            imgElem.attr('src', reader.result);
          };
          reader.readAsDataURL(file);
        } else {
          imgElem.attr('src', '');
        }
      });

      $('#submit-btn').click(function() {
        clearResult();

        //var apiType = $('#api-type').val();
        var apiType = 'LABEL_DETECTION'
        var imgDataUrl = $('#img').attr('src');
        var encodedImg = imgDataUrl.substring(imgDataUrl.indexOf(',') + 1)
        var params = {
          requests: [
            {
              image: { content: encodedImg },
              features: [
                { type: apiType, maxResults: MAX_RESULT_NUM }
              ]
            }
          ]
        };

        var strategy = STRATEGIES[apiType];
        $.ajax({
          type: 'POST',
          url: 'https://vision.googleapis.com/v1/images:annotate?key=' + API_KEY,
          contentType: 'application/json',
          data: JSON.stringify(params),
          success: function(res) {
            console.log(res);

            var apiResponse = res.responses[0]; //[0]에 들어있는 것도 array임.
            if (apiResponse.error) {
              $('#result').append('<div id="error-msg" class="alert alert-danger">API 호출 에러</div>');
              return;
            }

            var results = apiResponse[strategy.resultAttrName]; //strategy.resultAttrName : labelAnnotations : Array[10]
            showResult(results, strategy.outputAttrNames);

            if (strategy.drawImage) {
              var canvas = $('#canvas')[0];
              drawImageWithDetectedArea(canvas, results);
            }
          }
        });
        return false;
      });
    });
    
    $(document).ready(function(){
    	
    	$('#category').change(function(){
    		var html = "";
    		var category = $('#category option:selected').val();
    		if(category == 'cat'){
    			html += '고양이 백신 1<input type="checkbox" id="vaccine1" name="pet.vaccine1">'
    				 + '고양이 백신 2<input type="checkbox" id="vaccine2" name="pet.vaccine2">'
					 + '고양이 백신 3<input type="checkbox" id="vaccine3" name="pet.vaccine3">'
					 + '고양이 백신 4<input type="checkbox" id="vaccine4" name="pet.vaccine4">'
    		} else if(category == 'dog'){
    			html += '개 백신 1<input type="checkbox" id="vaccine1" name="pet.vaccine1">'
    				 + '개 백신 2<input type="checkbox" id="vaccine2" name="pet.vaccine2">'
					 + '개 백신 3<input type="checkbox" id="vaccine3" name="pet.vaccine3">'
					 + '개 백신 4<input type="checkbox" id="vaccine4" name="pet.vaccine4">'
    		}
    		
    		$('#vaccine').html(html);
    	})
    })
  </script>
</head>
<body>
  <div class="container">
    <h1>펫 등록</h1>
    <div>
      <form>
      	
      	<div class="form-group">
      		<label for="name">펫 이름 <input type="text" id="name" name="pet.name"/></label><br/>
      		<label for="category">종류 
      			<select id="category" name="pet.category">
      				<option value="needSelect">선택</option>
      				<option value="cat">고양이</option>
      				<option value="dog">개</option>
      				<option value="etc">기타(품종에 종류도 입력해 주세요)</option>
      			</select>
    		</label><br/>
    		<label for="species">품종 <input type="text" id="species" name="pet.species"/></label><br/>
    		<label for="ageClass">나이 구분 
    			<input type="radio" name="pet.ageClass" value="0">6개월 미만
    			<input type="radio" name="pet.ageClass" value="0">6개월 이상 ~ 1년 미만
    			<input type="radio" name="pet.ageClass" value="0">1년 이상(아래에 나이를 입력해 주세요)
    		</label><br/>
    		<label for="age">
    			나이 <input type="text" id="age" name="pet.age">
    		</label><br/>
    		<label for="sex">성별
    			<input type="radio" name="pet.sex" value="M">수컷
    			<input type="radio" name="pet.sex" value="F">암컷
    		</label><br/>
    		<label for="neutralization">중성화 여부
    			<input type="radio" name="pet.neutralization" value="Y">예
    			<input type="radio" name="pet.neutralization" value="N">아니오
    		</label><br/>
    		<label for="petSize">펫의 크기 
    		<select id="petSize" name="petSize">
    			<option value="s">소형</option>
    			<option value="m">중형</option>
    			<option value="l">대형</option>
    		</select></label>
    		<!-- vaccine 정보가 들어감 -->
   			<label id="vaccine" for="vaccine">
    				백신(동물 종류를 선택해 주세요)
   			</label><br/>
    		<label for="petComment">
    			펫에 대한 코멘트 <input type="text" id="petComment" name="pet.petComment" height="5">
    		</label><br/>
    		
    		
      	</div>
      
        <div class="form-group">
          <p><label for="input-img">펫 사진 업로드</label>:펫 혼자 찍힌, 동물로서의 특징이 잘 드러난 사진을 골라 주세요.</p>
          
          <input type="file" id="input-img" name="input-img" class="form-control" accept="image/*" multiple="false" />
        </div>
        <div class="form-group">
          <img id="img" src="" class="img-responsive"></img>
        </div>
        <button id="submit-btn" class="btn btn-primary">판정</button>
      </form>
    </div>
    <hr>
    <div id="result">
      <h2>결과</h2>
      <table id="result-table" class="table table-striped">
        <thead></thead>
        <tbody></tbody>
      </table>
      <canvas id="canvas" width="0" height="0"></canvas>
    </div>
  </div>
</body>
</html>