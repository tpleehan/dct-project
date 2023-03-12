<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../include/header.jsp"%>

<style>

/* ---------------------- 글쓰기 ---------------------- */
/* 타이틀 */
section.community-header {
	color: aliceblue;
	font-size: 30px;
	background-color: rgb(61, 58, 58);
	padding: 1em 0;
}
/* ---------- */
.write-body .t-control .t-title {
	padding: 14px 8px;
}

.community-write .write-bottom {
	text-align: center;
}

.community-write .write-body textarea {
	resize: none;
}

.community-write .write-button {
	text-align: right;
	margin-bottom: 30px;
}

</style>

<div id="wrapper">

	<section class="community-header">
		<div class="container">
			<div class="row">
				<div class=" col-md-12">
					<h2>자유게시판</h2>
				</div>
			</div>
		</div>
	</section>

	<section class="community-write">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="write-body">
						<form action="<c:url value='/board/registForm' />" name="registForm" method="post">
							<table class="table">
								<tbody class="t-control">
									<tr>
										<td class="t-title">글쓴이</td>
										<td><input type="text" class="form-control" readonly name="userName" value="${login.userName}"></td>
										<td><input type="hidden" class="form-control" name="userNo" value="${login.userNo}" ></td>
									</tr>
									<tr>
										<td class="t-title">제목</td>
										<td><input type="text" class="form-control" name="communityTitle"
											placeholder="제목을 입력해주세요."></td>
									</tr>
									<tr>
										<td class="t-title">내용</td>
										<td><textarea class="form-control" rows="20" name="communityContent"></textarea></td>
									</tr>
								</tbody>
							</table>
							<div class="write-button">
								<button type="button" class="btn" onclick="location.href='<c:url value="/board/freeBoardList" />'">목록</button>
								<button type="submit" class="btn btn-primary">등록</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<%@ include file="../include/footer.jsp"%>

</div>

