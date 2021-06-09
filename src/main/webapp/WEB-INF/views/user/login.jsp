<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!-- 로그인 form -->
	<div id="divLogin">
        <div class="panel panel-primary" style="width:400px;margin:0px auto;">
            <div class="panel-heading"><h3 class="panel-title">로그인</h3></div>
            <div class="panel-body">
                <form id="login-form" name="frm">
                    <div style="margin-bottom:10px">
                        <input type="text" name="uid" class="form-control" name="userName" placeholder="아이디 입력"/>
                    </div>
                    <div style="margin-bottom:10px">
                        <input type="password" name="upw" class="form-control" name="userName" placeholder="비밀번호 입력"/>
                    </div>
                    <div style="margin-bottom:10px">
                    	<input type="checkbox" name="chkLogin">로그인 상태유지
                    	<span style="float:right"><a href="insert">회원가입</a></span>
                    </div>
                    <div>
                        <button type="submit" class="form-control btn btn-primary">로그인</button>
                     </div>
                </form>
            </div>
        </div>
    </div>
<script>
	$(frm).on("submit",function(e){
		e.preventDefault();
		var chkLogin=$(frm.chkLogin).is(":checked")?"true":"false"
		var uid=$(frm.uid).val();
		var upw=$(frm.upw).val();
		if(uid==""||upw==""){
			alert("아이디와 비밀번호를 입력하세요");
			return;
		}		
		$.ajax({
			type:"post",
			url:"login",
			data:{"uid":uid,"chkLogin":chkLogin,"upw":upw},
			success:function(data){
				console.log(data);
				if(data.result==0){
					alert("아이디가 존재하지 않습니다");
				}else if(data.result==1){
					alert("성공");
					location.href=data.path;
				}else{
					alert("비밀번호가 일치하지 않습니다.")
				}
			}
		});
	});
</script>