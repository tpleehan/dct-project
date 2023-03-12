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
	.searchId {
		display: inline-block;
	}
	.searchId > .form-control {
		width: 150px;
		text-align: center;
	}
	
	
</style>

	<div class="wrapper">
		<%@ include file="../include/header.jsp"%>

		<section id="id-search">
			<div class="container">
				<div class="row">
					<div class="id-search-header">
						<h4>아이디 찾기</h4>
                    </div>
				</div>
				<div class="row">
                    <div class="id-search-footer">
                    	<h4> 찾은 아이디 </h4>
	                    <div class="searchId">
							<span class="form-control">${user.userId}</span>
	                    </div>	
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

	
