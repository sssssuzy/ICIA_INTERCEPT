<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!-- 회원가입 form -->
	<div id="divLogin">
        <div class="panel panel-primary" style="width:400px;margin:0px auto;">
            <div class="panel-heading"><h3 class="panel-title">회원가입</h3></div>
            <div class="panel-body">
                <form id="login-form" name="frm">
                    <div style="margin-bottom:10px">
                        <input type="text" name="uid" class="form-control" name="userName" placeholder="아이디 "/>
                    </div>
                    <div style="margin-bottom:10px">
                        <input type="password" name="upw" class="form-control" name="userName" placeholder="비밀번호 "/>
                    </div>
                    <div style="margin-bottom:10px">
                        <input type="text" name="uname" class="form-control" name="userName" placeholder="성명"/>
                    </div>
                    <div>
                        <button type="submit" class="form-control btn btn-primary">회원가입</button>
                     </div>
                </form>
            </div>
        </div>
    </div>
<script>
	$(frm).on("submit",function(e){
		e.preventDefault();
		var uid=$(frm.uid).val();
		var upw=$(frm.upw).val();
		var uname=$(frm.uname).val();
		if(uid==""||upw==""||uname==""){
			alert("필수 입력란 확인하세요");
			return;
		}
		if(!confirm("회원가입을 하실래요?")) return;
		frm.action="insert";
		frm.method="post";
		frm.submit();
	});
</script>