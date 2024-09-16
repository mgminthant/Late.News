<!DOCTYPE html>
<html>
<head>
<style>
	
	a:hover{
		text-decoration:underline !important;
	}
	
</style>
<title><%=request.getAttribute("title")%></title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous" />
</head>
<body>
	<div class="w-100 bg-success p-2 position-sticky top-0">
		<div class="container d-flex justify-content-between align-items-center">
			<div class="fs-3 fw-bold text-white">Late.News</div>
			<a href="fetchNews" class="text-white text-decoration-none">Home</a>
		</div>
	</div>
	<div class="container mt-3">
		<div class="row">
			<div class="col-7 mx-auto">
				<div class="row">
					<div class="col-10 mx-auto">
						<img src="<%=request.getAttribute("src")%>" alt=""
							class="img-fluid" />

					</div>
				</div>
				<h5 class="text-center my-4"><%=request.getAttribute("title")%></h5>
				<p>
					<%=request.getAttribute("date")%></p>
				<p style="line-height: 40px;font-size: 20px;"><%=request.getAttribute("description")%></p>
			</div>
		</div>
	</div>
</body>
</html>
