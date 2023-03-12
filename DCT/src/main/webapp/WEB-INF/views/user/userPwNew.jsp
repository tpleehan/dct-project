<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
	
	/* ---------------------------- 아이디 찾기 ---------------------------- */
	#id-search {
		display: grid;
		place-items: center;
		min-height: 60vh;
		text-align: center;
	}
	.id-search-header {
		margin-bottom: 30px;
	}
	.id-search-footer input {
		width: 30%;
		height: 40px;
		border: 1px solid;
		margin-top: 20px;
		position: relative;
		outline: none;
	}
	.id-search-footer button {
		height: 40px;
		position: absolute;
		margin-left: -50px;
		margin-top: 20px;
	}
	
	/* 아이디 찾기 모달 */
	#searchIdModal .search-id-modal {
		padding-top: 25px;
	}
	#searchIdModal .description p {
		font-size: 16px;
		line-height: 30px;
	}
	#searchIdModal .search-id-modal-footer {
		text-align: center;
		margin-top: 20px;
	}
	
</style>

	<div class="wrapper">
		<%@ include file="../include/header.jsp"%>

		<section id="id-search">
			<div class="container">
				<div class="row">
					<div class="pw-search-header">
						<h4>비밀번호 찾기</h4>
                    </div>
				</div>
				<div class="row">
                    <div class="pw-search-footer">
                    	<form action="<c:url value='/user/pwNew' />" method="post" id="searchPwForm">
                    		<div class="pw-modify-footer">
                    			<input type="hidden" name="userId" id="userId" class="userId" value="${userInfo.userId}">
	                        	<p class="user_info_p">변경할 비밀번호</p>
	                             <input type="password" id="userPw" type="text" name="userPw" minlength="2" style="font-weight:bold;  border-style:solid  border-width 5px">
	                        	<p class="user_info_p">변경할 비밀번호 확인</p>
	                             <input type="password" id="userPwChk" type="text" name="userPwChk" minlength="2" style="font-weight:bold;  border-style:solid  border-width 5px">
	                            <button type="button" class="btn btn-primary btn-user btn-block" id="updateBtn">변경</button>
                        	</div>
                        </form>
                    </div>
				</div>
			</div>
		</section>

		<%@ include file="../include/footer.jsp"%>
		
<script>

$(function() {
	const regex = /^[A-Za-z0-9+]{4,12}$/;
	
	$('#updateBtn').click(function() {
		console.log('${userInfo.userId}');
		// 비밀번호 검증
		if($('#userPw').val() === '') {
			alert('비밀번호는 필수 입력 입니다.');
			$('#userPw').focus();
			return;
		} else if(!regex.test($('#userPw').val())) {
			alert('비밀번호는 8~16자로 작성해 주세요.');
			$('#userPw').focus();
			return;
		} else if($('#userPw').val() !== $('#userPwChk').val()) {
			alert('비밀번호가 일치하지 않습니다. 비밀번호 확인란을 다시 작성해 주세요.');
			$('#userPwChk').focus();
			return;
		} else {
			
			const check = confirm('수정할까요?');
			if(check) {
				alert('수정이 완료되었습니다.');
				$('#searchPwForm').submit();
			} else {
				return;
			}
		}
	}); // 수정 버튼 이벤트
});
		
</script>

	
