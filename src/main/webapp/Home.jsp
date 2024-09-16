
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>Home</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<style>
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

.img {
	width: 100%;
}

.gd-1 a {
	width: 25%;
}

.gd div img {
	width: 100%;
	object-fit: cover;
	overflow: hidden;
	height: 200px;
}

iframe {
	width: 100%;
	height: 200px;
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
<!-- login modal  -->
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
						<input type="text" name="username" class="form-control" required
							id="floatingInput" placeholder="User name"> <label
							for="floatingInput">User Name</label>
					</div>
					<div class="form-floating">
						<input type="password" name="password" class="form-control"
							required id="floatingPassword" placeholder="Password"> <label
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
<!-- add article modal -->
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
<!-- add blog news -->
<form action="addnormal" method="post" enctype="multipart/form-data">
	<div class="modal fade" id="exampleModal4" tabindex="-1"
		aria-labelledby="exampleModalLabel3" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel3">Add Blog News</h5>
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

<!-- add video news -->
<form action="addvideo" method="post">
	<div class="modal fade" id="exampleModal5" tabindex="-1"
		aria-labelledby="exampleModalLabel3" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel3">Add Video News</h5>
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
<body class="">
	<div class="container-fluid bg-success p-2 position-sticky top-0 z-3">
		<div class="container d-flex justify-content-between">
			<div class="fs-3 fw-bold text-white donone">Late.News</div>
			<div class="">
				<%
				String username = (String) session.getAttribute("username");
				if (username != null) {
				%>
				<div class="d-flex align-items-center gap-2">
					<div class="d-flex align-items-center gap-2">
						<select id="newsTypeSelect" class="form-select"
							aria-label="Default select example">
							<option selected>Add News</option>
							<option value="1">Add Article</option>
							<option value="2">Add Blog News</option>
							<option value="3">Add Video News</option>
						</select> <a href="GoDashboard">
							<button class="btn btn-light">Dashboard</button>
						</a>
					</div>

					<div class="dropdown">
						<img style="width: 50px; height: 50px;"
							class="rounded-circle dropdown-toggle img-fluid" type="button"
							data-bs-toggle="dropdown" aria-expanded="false"
							src="./asset/img/admin.jpg" />
						<ul class="dropdown-menu px-2">
							<li><h6 class="dropdown-item">MyatMinThant(Leader)</h6></li>
							<form action="LogoutServlet" method="post">
								<button type="submit" class="dropdown-item">Logout</button>
							</form>
						</ul>
					</div>
				</div>
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
		class="container-lg okmen d-flex gap-5 my-3 fs-5 fw-bold align-items-center">
		<p class="mb-0 active">
			<a href="fetchNews">Home</a>
		</p>
		<p class="mb-0">
			<a href="fetchNewsByType?type=normal">Blog News</a>
		</p>
		<p class="mb-0">
			<a href="fetchNewsByType?type=article">Article News</a>
		</p>
		<p class="mb-0">
			<a href="fetchNewsByType?type=video">Video News</a>
		</p>
	</div>
	<%@ page import="java.util.List"%>
	<%@ page import="com.idiot.servlet.FetchNewsServlet.News"%>
	<div class="container pt-2">
		<h4>Blog News</h4>
		<!-- Section for Normal News -->
		<div class="gd pb-4 pt-5">
			<%
			List<News> normalNewsList = (List<News>) request.getAttribute("normalNewsList");
			if (normalNewsList != null && !normalNewsList.isEmpty()) {
				for (News news : normalNewsList) {
			%>
			<div class="ok">
				<%
				String ok = (String) session.getAttribute("username");
				if (ok != null) {
				%>
				<form action="deleteNews" method="post" style="display: inline;">
					<input type="hidden" name="id" value="<%=news.getId()%>" /> <input
						type="hidden" name="type" value="<%=news.getType()%>" />
					<button type="submit" class="del"
						style="border: none; outline: none; background: none;">
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
					<img class="border" src="<%=news.getSrc()%>" alt="" /> <a
						href="showDescription?id=<%=news.getId()%>&type=normal"
						class="py-2 mb-0" style="color: black;"> <%=news.getTitle()%>
					</a>
					<p class="mb-0"><%=news.getDate()%></p>
				</form>
				<%
				if (ok != null) {
				%>
				<form action="fetchNormalNews" method="get" style="display: inline;">
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
			<p>No normal news available</p>
			<%
			}
			%>
		</div>
	</div>
	<div class="container mt-4">
		<h4>Article News</h4>
		<div class="gd pb-4 pt-4">
			<%
			List<News> articleNewsList = (List<News>) request.getAttribute("articleNewsList");
			if (articleNewsList != null && !articleNewsList.isEmpty()) {
				for (News news : articleNewsList) {
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
	<div class="container bg-success-subtle py-5 my-5">
		<div class="py-4">
			<h4>Late.Newsရဲ့ သတင်းတွေကို တယ်လီဂရမ်မှာလည်း
				ဝင်ကြည့်နိုင်ပါပြီ။</h4>
			<p class="my-4">မြန်မာနဲ့နိုင်ငံတကာ ထိပ်တန်းသတင်းတွေကို
				Late.Newsရဲ့ တယ်လီဂရမ်ချန်နယ်ကနေ တင်ဆက်ပေးနေပါတယ်။</p>
			<a href="https://telegram.org/" target="_blank">
				<div class="btn btn-light">
					Late.Newရဲ့ တယ်လီဂရမ်ချန်နယ်ကို ဝင်ကြည့်ရန်နှိပ်ပါ။ &nbsp;&nbsp;
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-arrow-right-circle"
						viewBox="0 0 16 16">
            <path fill-rule="evenodd"
							d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8m15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0M4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5z" />
          </svg>
				</div>
			</a>
		</div>
	</div>
	<div class="container mt-4">
		<h4>Video News</h4>
		<div class="gd pb-4 pt-4">
			<%
			List<News> videoNewsList = (List<News>) request.getAttribute("videoNewsList");
			if (videoNewsList != null && !videoNewsList.isEmpty()) {
				for (News news : videoNewsList) {
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
					<div class="yt_link">
						<%=news.getDescription()%>
					</div>
					<p class="mb-0"><%=news.getDate()%></p>
				</form>
				<%
				if (ok != null) {
				%>
				<form action="fetchVideoNews" method="get" style="display: inline;">
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
			<p>No video news available</p>
			<%
			}
			%>
		</div>
	</div>
	<div class="my-5 container">
		<h4 class="my-3">Late.News သတင်းများကို ဆိုရှယ်မီဒီယာမှာ
			ရယူနိုင်ပါပြီ။</h4>
		<div class="gd-1 py-4">
			<div class="d-flex flex-column align-items-center">
				<a href="https://www.facebook.com/"
					class="align-self-center px-2 py-4"> <img
					src="https://upload.wikimedia.org/wikipedia/commons/b/b9/2023_Facebook_icon.svg"
					alt="" style="border-left: 1px solid rgb(215, 211, 211)"
					class="img-fluid" />
				</a>
				<h6>Facebook</h6>
			</div>
			<div class="d-flex flex-column align-items-center">
				<a href="https://www.youtube.com/" target="_blank"> <img
					src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/YouTube_full-color_icon_%282017%29.svg/640px-YouTube_full-color_icon_%282017%29.svg.png"
					alt="" style="border-left: 1px solid rgb(215, 211, 211)"
					class="img align-self-center px-2 py-4 img-fluid" />
				</a>
				<h6>You Tube</h6>
			</div>
			<div class="d-flex flex-column align-items-center">
				<a href="https://www.instagram.com" target="_blank"
					class="align-self-center px-2 py-4"> <img
					src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/58/Instagram-Icon.png/640px-Instagram-Icon.png"
					alt="" style="border-left: 1px solid rgb(215, 211, 211)"
					class=" img-fluid" />
				</a>
				<h6>Instagram</h6>
			</div>
			<div class="d-flex flex-column align-items-center">
				<a href="https://twitter.com/" target="_blank"
					class="align-self-center px-2 py-4 "> <img
					src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/2d/Twitter_X.png/640px-Twitter_X.png"
					alt="" style="border-left: 1px solid rgb(215, 211, 211)"
					class="img-fluid" />
				</a>
				<h6>X(twitter)</h6>
			</div>
		</div>
	</div>
	<div class="container pt-5">
		<div class="row pt-4">
			<div class="col-12 col-lg-5">
				<h6>SUBSCRIBE</h6>
				<p class="">Subscribe us and you won't miss the new info</p>
				<form class="row gap-2 pb-5" method="post" action="SubscribeEmail">
					<input type="text" placeholder="E-mail" name="email"
						class="col-8 border-success px-3 py-2 border rounded-pill" />
					<button type="submit" name="email"
						class="border border-0 col-2 rounded-pill btn btn-success"
						type="submit">SEND</button>
				</form>
			</div>
			<div class="col-lg-5 col-12 ps-0 text-center mx-auto">
				<h6 class="">STAY IN TOUCH</h6>
				<p>Questions? Please write us at: gkteam@gmail.com</p>
			</div>
		</div>
	</div>
	<div class="container-fluid bg-success p-2 mt-3 mb-1 ij">
		<div
			class="container d-flex justify-content-between align-items-center">
			<div class="fs-3 fw-bold text-white">Late.News</div>
			<h6 class="text-white m-0">
				Design and Develop by <u>Gk Team</u>
			</h6>
		</div>
	</div>
</body>
<script>
	document.getElementById('newsTypeSelect').addEventListener(
			'change',
			function() {
				if (this.value === '1') {
					var myModal = new bootstrap.Modal(document
							.getElementById('exampleModal3'));
					myModal.show();
				} else if (this.value === '2') {
					var myModal = new bootstrap.Modal(document
							.getElementById('exampleModal4'));
					myModal.show();
				} else if (this.value === '3') {
					var myModal = new bootstrap.Modal(document
							.getElementById('exampleModal5'));
					myModal.show();
				}
			});
</script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>

</html>

