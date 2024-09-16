<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Article News</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<style>
.active {
	border-bottom: 2px solid green;
}

.gd, .gd-1 {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(300px, auto));
	gap: 10px;
	row-gap: 30px;
	border-bottom: 1px solid rgb(227, 220, 220);
}

.ok {
	max-width: 400px;
	position: relative;
}

.del {
	left: -5px;
	position: absolute;
	top: -10px;
	cursor: pointer;
}

.edit {
	left: 30px;
	position: absolute;
	top: -10px;
	cursor: pointer;
}

@media ( max-width : 768px) {
	.okmen a {
		font-size: 17px;
	}
	.okmen {
		/* Stack columns on smaller screens */
		gap: 10px !important;
	}
}

@media ( max-width : 400px) {
	.ij div div {
		font-size: 15px !important;
	}
	.ij h6 {
		font-size: 10px !important;
	}


.okmen a {
	font-size: 12px;
}

.okmen {
	/* Stack columns on smaller screens */
	gap: 15px !important;
}

}

.img {
	width: 50%;
}

.gd div img {
	width: 100%;
	object-fit: cover;
	overflow: hidden;
	height: 400px;
	height: 350px;
}

iframe {
	width: 100%;
	height: 300px;
	overflow: hidden;
}

a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: underline;
	cursor: pointer;
}
</style>
</head>
<body>
	<form action="login" method="post">
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">Login As
							Admin</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="form-floating mb-3">
							<input type="text" name="username" class="form-control"
								id="floatingInput" placeholder="User name"> <label
								for="floatingInput">User Name</label>
						</div>
						<div class="form-floating">
							<input type="password" name="password" class="form-control"
								id="floatingPassword" placeholder="Password"> <label
								for="floatingPassword">Password</label>
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-success">Login</button>
					</div>
				</div>
			</div>
		</div>
	</form>

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
	<%@ page import="java.util.List"%>
	<%@ page import="com.idiot.servlet.FetchNewsByTypeServlet.News"%>
	<div class="container-fluid bg-success p-2 position-sticky top-0 z-3">
		<div class="container d-flex justify-content-between">
			<div class="fs-3 fw-bold text-white">Late.News</div>
			<div class="">
				<%
				String username = (String) session.getAttribute("username");
				if (username != null) {
				%>
				<button data-bs-toggle="modal" class="btn btn-light" type="button"
					data-bs-target="#exampleModal3">Add Article News</button>
				<%
				} else {
				%>
				<div class="btn btn-light" type="button" data-bs-toggle="modal"
					data-bs-target="#exampleModal">Login</div>
				<%
				}
				%>
			</div>
		</div>
	</div>
	<div
		class="container-lg d-flex gap-5 my-3 fs-5 fw-bold align-items-center okmen">
		<p class="mb-0">
			<a href="fetchNews">Home</a>
		</p>
		<p class="mb-0">
			<a href="fetchNewsByType?type=normal">Blog News</a>
		</p>
		<p class="mb-0">
			<a href="fetchNewsByType?type=article" class="active">Article
				News</a>
		</p>
		<p class="mb-0">
			<a href="fetchNewsByType?type=video">Video News</a>
		</p>
	</div>
	<div class="container mt-4">
		<h4 class="pt-2 pb-3">All Article News</h4>
		<div class="gd pb-4 pt-4">
			<%
			List<News> newsList = (List<News>) request.getAttribute("newsList");
			if (newsList != null && !newsList.isEmpty()) {
				for (News news : newsList) {
			%>
			<div class="ok">
				<%
				String ok = (String) session.getAttribute("username");
				if (ok != null) {
				%>
				<form action="deleteNews" method="post" style="display: inline;">
					<input type="hidden" name="id" value="<%=news.getId()%>" /> <input
						type="hidden" name="type" value="<%=news.getType()%>" />
					<button type="submit" class="del">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-archive-fill del"
							viewBox="0 0 16 16">
  <path
								d="M12.643 15C13.979 15 15 13.845 15 12.5V5H1v7.5C1 13.845 2.021 15 3.357 15zM5.5 7h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1 0-1M.8 1a.8.8 0 0 0-.8.8V3a.8.8 0 0 0 .8.8h14.4A.8.8 0 0 0 16 3V1.8a.8.8 0 0 0-.8-.8z" />
</svg>
					</button>
					<%
					}
					%>


					<a href="showDescription?id=<%=news.getId()%>&type=article"
						class="py-2 mb-0" style="color: black;"> <%=news.getTitle()%>
					</a>
					<p class="mb-0"><%=news.getDate()%></p>
					<h6><%=news.getSrc()%></h6>
				</form>
				<%
				if (ok != null) {
				%>
				<form action="fetchArticleNews" method="get"
					style="display: inline;">
					<input type="hidden" name="id" value="<%=news.getId()%>">
					<button type="submit"
						style="border: none; background: none; padding: 0; cursor: pointer;">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-pencil-square"
							viewBox="0 0 16 16">
            <path
								d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
            <path fill-rule="evenodd"
								d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z" />
        </svg>
					</button>
				</form>
				<%
				}
				%>
			</div>
			<%
			}
			} else {
			%>
			<p>No article news available</p>
			<%
			}
			%>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>