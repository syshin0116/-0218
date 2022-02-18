<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function() { 
	$('#b1').click(function() {
		$.ajax({
			url: "https://api.rss2json.com/v1/api.json?rss_url=https%3A%2F%2Fwww.chosun.com%2Farc%2Foutboundfeeds%2Frss%2F%3FoutputType%3Dxml&api_key=4gnwdol91ds3amnxlnhdmb3vb6vrphpyrj1zl1y3",
			//url: "https://www.chosun.com/arc/outboundfeeds/rss/?outputType=xml",
			//url:"//rss.hankooki.com/daily/dh_it_tech.xml",
			data: {
				url: "https://www.chosun.com/arc/outboundfeeds/rss/?outputType=xml",
				api_key : "4gnwdol91ds3amnxlnhdmb3vb6vrphpyrj1zl1y3",
				count: 20
			},
			success: function(result) {
				alert('신문사 연결 성공')

				list = result.items
				
				$(list).each(function(index, news){
					//console.log(index + "   "+ news.author)
					img = news.thumbnail
					console.log(img)
					title = news.title
					link = news.link
					//title을 클릭했을 때, link로 연결
					pubDate = news.pubDate
					//날짜를 title옆에 보이도록 해주세요
					str='<a href = "'+news.link+'">'+news.title+'</a>'+pubDate+'<br>'
					$('#d1').append('<img src = "'+img+'" width=300 height=200>'+'<br>'+str+'<br>')
				})
			},
			error: function() {
				alert('ajax 실패.@@')
			}
		})//ajax
	})//b1
})//$
</script>
</head>
<body>
	
	<button id="b1">조선일보 (스포츠기사 받아오기)</button>
	<hr color = red>
	<div id="d1"></div>

</body>
</html>