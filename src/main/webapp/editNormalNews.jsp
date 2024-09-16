<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Video News</title>
</head>
<body class="model-open" style="overflow: hidden; padding-right: 0px;">
	<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
	<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous" />
<style>
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
	text-decoration: none
}

a:hover {
	text-decoration: underline;
	cursor: pointer;
}
</style>
</head>
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
					<h5 class="modal-title" id="exampleModalLabel3">Add Normal
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
<body class="modal-open" style="overflow: hidden; padding-right: 0px;">
	<div class="w-100 bg-success p-2 position-sticky top-0 z-3">
		<div class="container d-flex justify-content-between">
			<div class="fs-3 fw-bold text-white">BBC News Myanmar</div>
			<div class="">
				<%
				String username = (String) session.getAttribute("username");
				if (username != null) {
				%>
				<div class="dropdown">
					<img style="width: 50px; height: 50px;"
						class="rounded-circle dropdown-toggle img-fluid" type="button"
						data-bs-toggle="dropdown" aria-expanded="false"
						src="./asset/img/admin.jpg" />
					<ul class="dropdown-menu px-2">
						<li><h5 class="dropdown-item">Myat Min Thant</h5></li>
						<select id="newsTypeSelect" class="form-select"
							aria-label="Default select example">
							<option selected>Add News</option>
							<option value="1">Add Article</option>
							<option value="2">Add Normal News</option>
							<option value="3">Add Video News</option>
						</select>
						<li><a class="dropdown-item" href="#">Dashboard</a></li>
						<form action="<%=request.getContextPath()%>/LogoutServlet"
							method="post">
							<button type="submit" class="dropdown-item">Logout</button>
						</form>
					</ul>
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
		class="container d-flex gap-5 my-3 fs-5 fw-bold align-items-center">
		<p class="mb-0">Home</p>
		<p class="mb-0">Video</p>
		<p class="mb-0">Country</p>
		<p class="mb-0">Business</p>
		<p class="mb-0">Dello</p>
	</div>
	<%@ page import="java.util.List"%>
	<%@ page import="com.idiot.servlet.FetchNewsServlet.News"%>
	<div class="container pt-3">
		<!-- Section for Normal News -->
		<div class="gd pb-4">
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
					<div class="edit">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-pencil-square edit"
							viewBox="0 0 16 16">
  <path
								d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
  <path fill-rule="evenodd"
								d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z" />
</svg>
					</div>
					<%
					}
					%>
					<div>
						<img class="border" src="<%=news.getSrc()%>" alt="" /> <a
							href="showDescription?id=<%=news.getId()%>&type=normal"
							class="py-2 mb-0" style="color: black;"> <%=news.getTitle()%>
						</a>
						<p class="mb-0"><%=news.getDate()%></p>
				</form>
			</div>
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
		<h4>Article</h4>
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
					<button type="submit">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-archive-fill del"
							viewBox="0 0 16 16">
  <path
								d="M12.643 15C13.979 15 15 13.845 15 12.5V5H1v7.5C1 13.845 2.021 15 3.357 15zM5.5 7h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1 0-1M.8 1a.8.8 0 0 0-.8.8V3a.8.8 0 0 0 .8.8h14.4A.8.8 0 0 0 16 3V1.8a.8.8 0 0 0-.8-.8z" />
</svg>
					</button>
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-pencil-square edit"
						viewBox="0 0 16 16">
  <path
							d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
  <path fill-rule="evenodd"
							d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z" />
</svg>
					<%
					}
					%>


					<a href="showDescription?id=<%=news.getId()%>&type=article"
						class="py-2 mb-0" style="color: black;"> <%=news.getTitle()%>
					</a>
					<p class="mb-0"><%=news.getDate()%></p>
					<h6><%=news.getSrc()%></h6>
				</form>
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
			<h4>ဘီဘီစီမြန်မာပိုင်းရဲ့ သတင်းတွေကို တယ်လီဂရမ်မှာလည်း
				ဝင်ကြည့်နိုင်ပါပြီ။</h4>
			<p class="my-4">မြန်မာနဲ့နိုင်ငံတကာ ထိပ်တန်းသတင်းတွေကို
				ဘီဘီစီမြန်မာပိုင်းရဲ့ တယ်လီဂရမ်ချန်နယ်ကနေ တင်ဆက်ပေးနေပါတယ်။</p>
			<div class="btn btn-light">
				ဘီဘီစီရဲ့ တယ်လီဂရမ်ချန်နယ်ကို ဝင်ကြည့်ရန်နှိပ်ပါ။ &nbsp;&nbsp;
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					fill="currentColor" class="bi bi-arrow-right-circle"
					viewBox="0 0 16 16">
            <path fill-rule="evenodd"
						d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8m15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0M4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5z" />
          </svg>
			</div>
		</div>
	</div>
	<div class="container mt-4">
		<h4 class="">Video News</h4>
		<div class="gd pb-4 pt-5">
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
				<!-- Other input fields -->
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
					<div name="yt_link">
						<%=news.getDescription()%>
					</div>
					<h6 class="py-2 mb-0" style="color: black;" name="title">
						<%=news.getTitle()%>
					</h6>
					<p class="mb-0"><%=news.getDate()%></p>
				</form>
				<%
				}
				%>
				<%
				String okt = (String) session.getAttribute("username");
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

					<%
					String okq = (String) session.getAttribute("username");
					if (okq != null) {
					%>
				</form>
				<%
				}
				%>
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
		<h4 class="my-3">ဘီဘီစီမြန်မာ သတင်းများကို ဆိုရှယ်မီဒီယာမှာ
			ရယူနိုင်ပါပြီ။</h4>
		<div class="gd-1 py-4">
			<div class="d-flex flex-column">
				<img
					src="https://upload.wikimedia.org/wikipedia/commons/b/b9/2023_Facebook_icon.svg"
					alt="" style="border-left: 1px solid rgb(215, 211, 211)"
					class="img align-self-center px-2 py-4" />
				<h6>Facebook</h6>
			</div>
			<div class="d-flex flex-column">
				<img
					src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/YouTube_full-color_icon_%282017%29.svg/640px-YouTube_full-color_icon_%282017%29.svg.png"
					alt="" style="border-left: 1px solid rgb(215, 211, 211)"
					class="img align-self-center px-2 py-4" />
				<h6>You Tube</h6>
			</div>
			<div class="d-flex flex-column">
				<img
					src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/58/Instagram-Icon.png/640px-Instagram-Icon.png"
					alt="" style="border-left: 1px solid rgb(215, 211, 211)"
					class="img align-self-center px-2 py-4" />
				<h6>Instagram</h6>
			</div>
			<div class="d-flex flex-column">
				<img
					src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/2d/Twitter_X.png/640px-Twitter_X.png"
					alt="" style="border-left: 1px solid rgb(215, 211, 211)"
					class="img align-self-center px-2 py-4" />
				<h6>X(twitter)</h6>
			</div>
		</div>
	</div>
	<div class="w-100 bg-success p-2 text-white">
		<div
			class="container d-flex justify-content-between align-items-center">
			<div class="fs-3 fw-bold text-white">BBC News Myanmar</div>
			<h6>© 2024 BBC.</h6>
		</div>
	</div>

	<!-- login modal  -->
	<form>
		<button type="submit">Update</button>
	</form>
	<form action="updateNormalNews" method="post"
		enctype="multipart/form-data">
		<div class="modal fade show d-block"
			style="background-color: rgba(32, 31, 32, 0.2)" id="exampleModal"
			tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">Update
							Normal News</h1>
						<a href="fetchNews" type="button" class="btn-close"
							aria-label="Close"> </a>
					</div>
					<div class="modal-body">
						<input type="hidden" name="id"
							value="<%=request.getAttribute("id")%>"> <input
							type="text" id="title" name="title" class="form-control mt-3"
							value="<%=request.getAttribute("title")%>">
						<textarea class="form-control mt-3" id="yt_link"
							name="description" id="exampleFormControlTextarea1" rows="4">
							  <%=request.getAttribute("description")%>
							  </textarea>
						<input class="form-control mt-3" name="src"
							value="<%=request.getAttribute("src")%>" type="file" />
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-success">Update</button>
					</div>
				</div>
			</div>
		</div>
	</form>
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


</body>
</html>