<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
	
	/* ---------------------------- 비밀번호 찾기 ---------------------------- */
	#pw-search {
		display: grid;
		place-items: center;
		min-height: 60vh;
		text-align: center;
	}
	.pw-search-header {
		margin-bottom: 30px;
	}
	.pw-search-footer input {
		width: 30%;
		height: 40px;
		border: 1px solid;
		margin-top: 20px;
		position: relative;
		outline: none;
	}
	.pw-search-footer button {
		height: 40px;
		position: absolute;
		margin-left: -50px;
		margin-top: 20px;
	}
	
	/* 비밀번호 찾기 모달 */
	#searchPwModal .search-pw-modal {
		padding-top: 25px;
	}
	#searchPwModal .description p {
		font-size: 16px;
		line-height: 30px;
	}
	#searchPwModal .search-pw-modal-footer {
		text-align: center;
		margin-top: 20px;
	}
	
</style>

	<div class="wrapper">
		<%@ include file="../include/header.jsp"%>

		<section id="pw-search">
			<div class="container">
				<div class="row">
					<div class="pw-search-header">
						<h4>비밀번호 찾기</h4>
                    </div>
				</div>
				<div class="row">
                    <div class="pw-search-body">
                        	<div class="form-group">
                            	<input type="email" class="form-control form-control-user" id="userEmail" name="userEmail" placeholder="가입하신 이메일을 입력해 주세요.">
                            	<input type="text" class="form-control form-control-user" id="userId" name="userId" placeholder="가입하신 id를 입력해 주세요.">
                            </div>
                            <button type="button" class="btn btn-primary" id="mail-check-btn">이메일인증</button>
                             <div class="mail-check-box">
             				 <input class="form-control mail-check-input" placeholder="인증번호 6자리를 입력하세요." maxlength="6">
            				 </div>
            				 <span id="mail-check-warning" style="font-size: 14px;"></span>
                            <button type="button" class="btn btn-primary" id="mail-check" href="<c:url value='/user/userPwNew' />">인증번호 확인</button>
                            
                    		</div>
				</div>
			</div>
		</section>

		<%@ include file="../include/footer.jsp"%>
	</div>
	
<script>
// 이메일 인증번호 전송
$('#mail-check-btn').click(function() {
	const email = $('#userEmail').val();
	console.log('인증번호 보낼 이메일: ' + email);
	const checkInput = $('.mail-check-input'); // 인증번호 입력 하는 곳
	
	$.ajax({
		type : 'get',
		url : '<c:url value="/user/mailCheck?email=" />' + email,
		success : function(data) {
			console.log('data: ' + data);
			checkInput.attr('disabled', false);
			code = data;
			alert('인증번호 전송되었습니다. 확인 후 입력란에 정확히 입력하세요.');
		}
		
	}); // end ajax (이메일 인증번호 전송)
	
}); // 이메일 인증번호 전송

// 인증번호 비교
// blur()는 focus가 벗어나면 이벤트 발생 
$('.mail-check-input').blur(function() {
	const inputCode = $(this).val();
	const $resultMsg = $('#mail-check-warning');
	
	if(inputCode === code) {
		$resultMsg.html('인증번호가 일치합니다.');
		$resultMsg.css('color', 'green');
		$('#mail-check-btn').attr('disabled', true);
		// disabled를 적용하면 서버로 이동이 안된다. readonly인 읽기전용으로 해야 한다.
		$('#userEmail').attr('readonly', true);
		$('#userId').attr('readonly', true);
		$('#userEmail').attr('onFocus', 'this.initialSelect = this.selectedIndex');
		$('#userId').attr('onChange', 'this.selectedIndex = this.initialSelect');
        location.href = '/user/userPwNew/' + $('#userId').val();
	} else {
		$resultMsg.html('인증번호를 다시 확인해 주세요.');
		$resultMsg.css('color', 'red');
	}
	
}); // 인증번호 비교
</script>
