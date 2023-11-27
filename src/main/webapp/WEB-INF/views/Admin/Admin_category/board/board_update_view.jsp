<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<title>Home</title>
</head>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet"> 
<script src="https://code.jquery.com/jquery-3.5.1.min.js">
</script> <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> 
<!-- 로컬 파일 summernote css/js --> 
<!-- <script src="../4.surmmernote/lib/summernote-bs4.js"></script> -->
 <!-- <link rel="stylesheet" href="../4.surmmernote/lib/summernote-bs4.css"> --> 
 <!-- CDN 파일 summernote css/js --> 
 <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
 <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script> 
 <!-- CDN 한글화 --> <script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
<style type="text/css">
.Goods_main_border {
	width: 200px;
	height: 300px;
	border: 5px solid black;
	margin: 25px 25px 25px 25px;
	padding: 0;
}
.Goods_absolute{
position: absolute;
top: 25%;
left: 25%;
}

.first_shot{
width:35%;
height:500px;
margin-left: 350px;
}
#foo{
width:400px;
height:600px;
}
.iconright{
padding-left: 150px;
}
dt{
margin-top: 5px;
}
section{
float: left;
}
</style>
	<jsp:include page="../../Admin_include/admin_header.jsp"></jsp:include>
	<h4>상품 정보 변경</h4>
	<hr style="color: red;">
	<a href="admin_category_goods"><button style="float: right;">홈</button></a>
<body>
<c:forEach var="goods" items="${glist}">
<form action="goods_update" method="post" enctype="multipart/form-data">
<div class="first_shot">
<img id="foo" id="goods_firstshot" name="goods_firstshot_s" src="resources/image/upload/${goods.goods_firstshot}">
</div>
<input type="hidden" name="goods_code"value="${goods.goods_code}">
<c:choose>
<c:when test="${goods.goods_class == 'e'}">
<input type="hidden"  name="goods_class" value="english">
</c:when>
<c:when test="${goods.goods_class == 'k'}">
<input type="hidden" name="goods_class" value="korea">
</c:when>
<c:when test="${goods.goods_class == 'm'}">
<input type="hidden" name="goods_class"  value="math">
</c:when>
<c:when test="${goods.goods_class == 's'}">
<input type="hidden" name="goods_class"  value="science">
</c:when>
<c:when test="${goods.goods_class == 'c'}">
<input type="hidden" name="goods_class"  value="chairmanship">
</c:when>
<c:when test="${goods.goods_class == 'p'}">
<input type="hidden" name="goods_class"  value="programming">
</c:when>
</c:choose>
<section> <!-- 상품 정보 설정 -->
<div  class="goods_right" style="height: 650px; width:300px;">
<dl style="margin-top: 120px;">
<dt>제목 : <input type="text" id="goods_title" name="goods_title" value="${goods.goods_title}"></dt>
<dt>썸네일 등록  <input type="file" id="goods_firstshot" name="goods_firstshot" multiple></dt>
<dt><input type="hidden" id="fileCheck" name="fileCheck" value="0">
<input type="hidden" id="goods_ori_firstshot" name="goods_ori_firstshot" value="${goods.goods_firstshot}">
</dt>
<dt>가격설정 : <input type="text" id="goods_price" name="goods_price" value="${goods.goods_price}"></dt>
<dt><select name="goods_inven">
<option value="n" selected>재고수량</option>
<option value="1" >1</option>
<option value="2" >2</option>
<option value="3" >3</option>
<option value="4" >4</option>
<option value="5" >5</option>
</select>
<input type="text" id="goods_inven2"name="goods_inven2" placeholder="직접입력" value="${goods.goods_inven}">
</dt>
<dt><input type="submit" value="수정하기"></dt>
</dl>
</div>
</section>
<hr>
<section> <!--  상품 상세정보 -->
<div class="container" style="margin-left: 30%">
 <textarea name="goods_contents"id="summernote">Hello Summernote</textarea>
</div>
</section>

<section>

</section>
</form>
</c:forEach>
</body>
<script type="text/javascript">
$('#goods_firstshot').on('change', function(){
	console.dir(this);
	console.dir(this.value);
	if($(this).val()==''){
		console.log("empty");
		$('#fileCheck').val(0); //첨부 안됨
	}else{
		console.log("not empty");
		$('#fileCheck').val(1); //첨부됨
	}
	console.log($('#fileCheck').val()); //1
});
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#foo').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}
$("#goods_firstshot").change(function() {
    readURL(this);
});
$(document).ready(function() {

	var toolbar = [
		    // 글꼴 설정
		    ['fontname', ['fontname']],
		    // 글자 크기 설정
		    ['fontsize', ['fontsize']],
		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    // 글자색
		    ['color', ['forecolor','color']],
		    // 표만들기
		    ['table', ['table']],
		    // 글머리 기호, 번호매기기, 문단정렬
		    ['para', ['ul', 'ol', 'paragraph']],
		    // 줄간격
		    ['height', ['height']],
		    // 그림첨부, 링크만들기, 동영상첨부
		    ['insert',['picture','link','video']],
		    // 코드보기, 확대해서보기, 도움말
		    ['view', ['codeview','fullscreen', 'help']]
		  ];

	var setting = {
			width : 875,
            height : 300,
            minHeight : 300,
            maxHeight : 500,
            lang : 'ko-KR',
            toolbar : toolbar,
            callbacks : { //여기 부분이 이미지를 첨부하는 부분
            onImageUpload : function(files, editor,
            welEditable) {
            for (var i = files.length - 1; i >= 0; i--) {
            uploadSummernoteImageFile(files[i],
            this);
            		}
            	}
            }
         };

        $('#summernote').summernote(setting);
        });
</script>
</body>
</html>
