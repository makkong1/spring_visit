<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script src="/vs/resources/js/httpRequest.js"></script>
		
		<script>
			function send(f){
				
				//유효성체크 해야함
				
				let url = "modify_fin.do";
				let param = "idx="+f.idx.value+"&name="+f.name.value+
				            "&content="+f.content.value+"&pwd="+f.pwd.value;
				
				sendRequest(url, param, resultFn, "post");
				
			}
			
			function resultFn(){
				if( xhr.readyState == 4 && xhr.status == 200 ){
					
					let data = xhr.responseText;
					let json = (new Function('return '+data))();
					
					if( json[0].result == 'fail' ){
						alert("수정실패");
					}else{
						alert("수정성공");
						location.href="list.do";
					}
					
				}
			}
			
		</script>
	</head>
	
	<body>
		<form>
			<input type="hidden" name="idx" value="${ vo.idx }">
			
			<table border="1" align="center">
				<caption>::: 글 수정하기 :::</caption>
				
				<tr>
					<th>작성자</th>
					<td><input name="name" value="${vo.name}"></td>
				</tr>
				
				<tr>
					<th>내용</th>
					<td>
						<pre><textarea name="content" rows="5" cols="50">${vo.content}</textarea></pre>
					</td>
				</tr>
				
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="pwd">
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="수정하기" 
						       onclick="send(this.form);">
						       
						<input type="button" value="목록보기"
						       onclick="history.go(-1);">       
					</td>
				</tr>
				
			</table>
		</form>
	</body>
</html>




















