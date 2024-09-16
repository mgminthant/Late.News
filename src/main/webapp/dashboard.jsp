<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<style>
a {
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
	cursor: pointer;
}

#customers {
	font-family: Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

#customers td, #customers th {
	border: 1px solid #ddd;
	padding: 8px;
}

#customers tr:nth-child(even) {
	background-color: #f2f2f2;
}

#customers tr:hover {
	background-color: #ddd;
}

#customers th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #04AA6D;
	color: white;
}
</style>
</head>
<body>
	<%@ page import="java.util.List"%>
	<%@ page import="com.idiot.servlet.GoDashboard.Email"%>
	<%@ page import="com.idiot.servlet.GoDashboard"%>
	<form action="register" method="post">
		<div class="modal fade" id="exampleModal3" tabindex="-1"
			aria-labelledby="exampleModalLabel3" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel3">Add Article</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="floatingInput"
								placeholder="name@example.com" name="art_title"> <label
								for="floatingInput">Title</label>
						</div>
						<div class="form-floating mb-3	">
							<textarea class="form-control" placeholder="Leave a comment here"
								id="floatingTextarea2" style="height: 100px" name="art_desc"></textarea>
							<label for="floatingTextarea2">Description</label>
						</div>
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="floatingInput"
								placeholder="name@example.com" name="author"> <label
								for="floatingInput">Author</label>
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-success">Add</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- add article -->
	<form action="addnormal" method="post" enctype="multipart/form-data">
		<div class="modal fade" id="exampleModal4" tabindex="-1"
			aria-labelledby="exampleModalLabel3" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel3">Add News</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="floatingInput"
								placeholder="name@example.com" name="normal_title"> <label
								for="floatingInput">Title</label>
						</div>
						<div class="form-floating mb-3	">
							<textarea class="form-control" placeholder="Leave a comment here"
								id="floatingTextarea2" style="height: 100px" name="normal_desc"></textarea>
							<label for="floatingTextarea2">Description</label>
						</div>
						<input type="file" class="form-control mb-3" name="bookImage" />
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-success">Add</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<form action="addvideo" method="post">
		<div class="modal fade" id="exampleModal5" tabindex="-1"
			aria-labelledby="exampleModalLabel3" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel3">Add Video
							News</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="floatingInput"
								placeholder="name@example.com" name="eb_title"> <label
								for="floatingInput">Title</label>
						</div>
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="floatingInput"
								placeholder="name@example.com" name="eb_code"> <label
								for="floatingInput">Embended Code</label>
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-success">Add</button>
					</div>
				</div>
			</div>
		</div>
	</form>
<body>
	<div class="container-fluid bg-success p-2 position-sticky top-0 z-3">
		<div
			class="container d-flex justify-content-between align-items-center">
			<div class="fs-3 fw-bold text-white">Late.News</div>
			<a href="fetchNews" class="text-white">Home</a>
		</div>
	</div>
	<div class="container-lg">
		<!-- Dashboard stats -->
		<div class="d-flex gap-2 align-items-center my-5 pt-2">
			<h3 class="mb-0">Dashboard</h3>
		</div>
		<div class="row">
			<div class="col-lg-3 col-sm-4 col-11 mx-auto px-0 text-center">
				<div class="py-5 rounded bg-success"
					style="width: 97%; height: 97%;">
					<p class="my-2">Total Blog News</p>
					<b><%=request.getAttribute("totalBlogNewsCount")%></b>
				</div>
			</div>
			<div
				class="col-lg-3 col-sm-4 col-11 mx-auto px-0 text-center text-white">
				<div class="py-5 rounded bg-secondary"
					style="width: 97%; height: 97%;">
					<p class="my-2">Total Article News</p>
					<b><%=request.getAttribute("totalArticleNewsCount")%></b>
				</div>
			</div>
			<div class="col-lg-3 col-sm-4 col-11 mx-auto px-0 text-center">
				<div class="py-5 rounded bg-success"
					style="width: 97%; height: 97%;">
					<p class="my-2">Total Video News</p>
					<b><%=request.getAttribute("totalVideoNewsCount")%></b>
				</div>
			</div>
			<div
				class="col-lg-3 col-sm-4 col-11 mx-auto px-0 text-center text-white">
				<div class="py-5 rounded bg-secondary"
					style="width: 97%; height: 97%;">
					<p class="my-2">Total Subscribed Emails</p>
					<b><%=request.getAttribute("totalSubscribedEmailsCount")%></b>
				</div>
			</div>
		</div>

		<!-- Email List Table -->
		<div class="container-lg mt-5">
			<table class="table table-bordered table-striped" id="customers">
				<thead>
					<tr>
						<th>Email</th>
						<th>Subscribe Date</th>
						<th>Delete Email</th>
					</tr>
				</thead>
				<tbody>
					<%
					List<GoDashboard.Email> emailList = (List<GoDashboard.Email>) request.getAttribute("emailList");
					for (GoDashboard.Email email : emailList) {
					%>
					<tr>

						<td><%=email.getEmail()%></td>
						<td><%=email.getSubscribeDate()%></td>
						<td>
							<form action="DeleteEmail" method="POST">
								<input type="hidden" name="id" value="<%=email.getId()%>">
								<button type="submit" style="border: none; background: none;">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" class="bi bi-trash3-fill"
										viewBox="0 0 16 16">
  <path
											d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5m-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5M4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06m6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528M8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5" />
</svg>
									</svg>
								</button>
							</form>
						</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>