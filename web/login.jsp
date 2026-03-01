<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập - Campus L&F</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body { 
            background-color: #f0f2f5; 
            display: flex; 
            align-items: center; 
            justify-content: center; 
            min-height: 100vh;
            margin: 0;
        }
        .login-card {
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            overflow: hidden;
        }
        .login-header {
            background: linear-gradient(135deg, #212529, #343a40);
            color: white;
            padding: 30px 20px;
            text-align: center;
        }
        .login-body {
            padding: 40px 30px;
        }
        .form-floating:focus-within label {
            color: #0d6efd;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-sm-10 col-md-8 col-lg-5">
                <div class="login-card">
                    <div class="login-header">
                        <h2 class="fw-bold mb-2"><i class="bi bi-search"></i> Quản Lý Thất Lạc Đồ Trong Trường Học</h2>
                        <p class="mb-0 text-light opacity-75">FPT University</p>
                    </div>

                    <div class="login-body">
                        <h4 class="text-center mb-4 fw-bold text-dark">Đăng Nhập</h4>

                        <c:if test="${not empty requestScope.error}">
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                <i class="bi bi-exclamation-circle-fill"></i> ${requestScope.error}
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </c:if>

                        <c:if test="${not empty requestScope.successMessage}">
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                <i class="bi bi-check-circle-fill"></i> ${requestScope.successMessage}
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </c:if>

                        <form action="login" method="POST">
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="username" name="username" placeholder="Tên đăng nhập" required value="${param.username}">
                                <label for="username"><i class="bi bi-person"></i> Email</label>
                            </div>

                            <div class="form-floating mb-3">
                                <input type="password" class="form-control" id="password" name="password" placeholder="Mật khẩu" required>
                                <label for="password"><i class="bi bi-lock"></i> Mật khẩu</label>
                            </div>

                            <div class="d-flex justify-content-between align-items-center mb-4">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="remember" name="remember">
                                    <label class="form-check-label small text-muted" for="remember">
                                        Nhớ mật khẩu
                                    </label>
                                </div>
                            </div>

                            <div class="d-grid gap-2 mb-3">
                                <button type="submit" class="btn btn-primary btn-lg fw-bold">Đăng Nhập</button>
                            </div>
                        </form>

                        <div class="text-center mt-4">
                            <span class="text-muted small">Chưa có tài khoản?</span> 
                            <a href="register" class="text-decoration-none fw-bold">Đăng ký ngay</a>
                        </div>
                        <div class="text-center mt-3">
                            <a href="home" class="text-muted small text-decoration-none"><i class="bi bi-arrow-left"></i> Quay lại Trang chủ</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>