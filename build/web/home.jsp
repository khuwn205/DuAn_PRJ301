<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lost & Found - Trang chủ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; }
        .hero-section {
            background: linear-gradient(135deg, #0d6efd, #0dcaf0);
            color: white;
            padding: 60px 0;
            margin-bottom: 40px;
        }
        .item-card { transition: transform 0.2s; }
        .item-card:hover { transform: translateY(-5px); box-shadow: 0 4px 15px rgba(0,0,0,0.1); }
        .badge-lost { background-color: #dc3545; }
        .badge-found { background-color: #198754; }
    </style>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
        <div class="container">
            <a class="navbar-brand" href="home"><i class="bi bi-search"></i> FPT University</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item"><a class="nav-link active" href="home">Trang chủ</a></li>
                    <li class="nav-item"><a class="nav-link" href="items?type=lost">Đồ thất lạc</a></li>
                    <li class="nav-item"><a class="nav-link" href="items?type=found">Đồ nhặt được</a></li>
                </ul>
                <ul class="navbar-nav">
                    <c:choose>
                        <c:when test="${not empty sessionScope.USER}">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">
                                    Xin chào, ${sessionScope.USER.username}
                                </a>
                                <ul class="dropdown-menu dropdown-menu-end">
                                    <li><a class="dropdown-item" href="profile">Hồ sơ cá nhân</a></li>
                                    <li><a class="dropdown-item" href="my-items">Bài đăng của tôi</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item text-danger" href="logout">Đăng xuất</a></li>
                                </ul>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="nav-item"><a class="nav-link" href="login">Đăng nhập</a></li>
                            <li class="nav-item"><a class="btn btn-outline-light ms-2" href="register">Logout</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </nav>

    <section class="hero-section text-center">
        <div class="container">
            <h1 class="display-5 fw-bold">Hệ Thống Tìm Đồ Thất Lạc Trong Trường Học</h1>
            <p class="lead mb-4">Bạn đánh rơi đồ hay nhặt được của rơi? Hãy đăng tin để mọi người cùng giúp đỡ!</p>
            <div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
                <a href="create-item?type=lost" class="btn btn-danger btn-lg px-4 gap-3">Báo Mất Đồ</a>
                <a href="create-item?type=found" class="btn btn-success btn-lg px-4">Báo Nhặt Được Đồ</a>
            </div>
        </div>
    </section>

    <div class="container">
        
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h3 class="text-danger"><i class="bi bi-exclamation-circle"></i> Vừa báo mất</h3>
            <a href="items?type=lost" class="text-decoration-none">Xem tất cả ></a>
        </div>
        <div class="row row-cols-1 row-cols-md-3 g-4 mb-5">
            <c:forEach var="item" items="${requestScope.recentLostItems}">
                <div class="col">
                    <div class="card h-100 item-card">
                        <img src="${not empty item.image_url ? item.image_url : 'assets/images/default.jpg'}" class="card-img-top" alt="${item.title}" style="height: 200px; object-fit: cover;">
                        <div class="card-body">
                            <span class="badge badge-lost mb-2">Đồ thất lạc</span>
                            <h5 class="card-title text-truncate">${item.title}</h5>
                            <p class="card-text text-muted text-truncate">${item.description}</p>
                            <ul class="list-unstyled mb-0 small">
                                <li><i class="bi bi-geo-alt"></i> ${item.location.name}</li> <li><i class="bi bi-clock"></i> <fmt:formatDate value="${item.date_incident}" pattern="dd/MM/yyyy HH:mm" /></li>
                            </ul>
                        </div>
                        <div class="card-footer bg-white border-top-0">
                            <a href="item-detail?id=${item.item_id}" class="btn btn-outline-danger w-100">Xem chi tiết</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <c:if test="${empty requestScope.recentLostItems}">
                <div class="col-12 text-center text-muted">
                    <p>Hiện tại chưa có tin báo mất đồ nào mới.</p>
                </div>
            </c:if>
        </div>

        <div class="d-flex justify-content-between align-items-center mb-3">
            <h3 class="text-success"><i class="bi bi-check-circle"></i> Vừa nhặt được</h3>
            <a href="items?type=found" class="text-decoration-none">Xem tất cả ></a>
        </div>
        <div class="row row-cols-1 row-cols-md-3 g-4 mb-5">
            <c:forEach var="item" items="${requestScope.recentFoundItems}">
                <div class="col">
                    <div class="card h-100 item-card">
                        <img src="${not empty item.image_url ? item.image_url : 'assets/images/default.jpg'}" class="card-img-top" alt="${item.title}" style="height: 200px; object-fit: cover;">
                        <div class="card-body">
                            <span class="badge badge-found mb-2">Nhặt được đồ</span>
                            <h5 class="card-title text-truncate">${item.title}</h5>
                            <p class="card-text text-muted text-truncate">${item.description}</p>
                            <ul class="list-unstyled mb-0 small">
                                <li><i class="bi bi-geo-alt"></i> ${item.location.name}</li>
                                <li><i class="bi bi-clock"></i> <fmt:formatDate value="${item.date_incident}" pattern="dd/MM/yyyy HH:mm" /></li>
                            </ul>
                        </div>
                        <div class="card-footer bg-white border-top-0">
                            <a href="item-detail?id=${item.item_id}" class="btn btn-outline-success w-100">Xác nhận của tôi</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
             <c:if test="${empty requestScope.recentFoundItems}">
                <div class="col-12 text-center text-muted">
                    <p>Hiện tại chưa có tin nhặt được đồ nào mới.</p>
                </div>
            </c:if>
        </div>
    </div>

    <footer class="bg-dark text-light py-4 text-center mt-auto">
        <div class="container">
            <p class="mb-0">&copy; 2026 Group 8 – SE2022 – PRJ301<br>
                            FPT University. All rights reserved</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>