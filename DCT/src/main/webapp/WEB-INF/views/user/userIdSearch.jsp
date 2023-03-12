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
		width: 40%;
		height: 40px;
		border: 1px solid;
		margin-top: 20px;
		position: relative;
		outline: none;
		display: inline;
	}
	
	.id-search-footer button {
		height: 40px;
		position: absolute;
		margin-left: -50px;
		margin-top: 20px;
		display:inline;
		width: 10%;
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
					<div class="id-search-header">
						<h3>아이디 찾기</h3>
                    </div>
				</div>
				<div class="row">
                    <div class="id-search-footer">
                    	<form action="<c:url value='/user/searchId' />" method="post" id="searchIdForm">
                        	<div class="form-group">
                            	<input type="email" class="form-control form-control-user" id="userEmail"  name="userEmail" placeholder="가입하신 이메일을 입력해 주세요.">
                           		<button type="submit" class="btn btn-primary btn-user btn-block" id="searchIdForm" style="background: black; color: white;" >찾기</button>
                            </div>
                        </form>
                    </div>
				</div>
			</div>
		</section>

		<%@ include file="../include/footer.jsp"%>

	
<script>
var msg = "${msg}";

if (msg != "") {
	alert(msg);
}
</script>
	
