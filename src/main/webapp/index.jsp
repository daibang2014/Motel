<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.MotelRoom" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>HOME</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <style>
            .container{
                padding-top: 100px;
            }
            .room-cards-container {
                display: flex;
                flex-wrap: wrap;
                width: 100%;
            }
            .room-card {
                flex: 1 1 25%; /* Adjust this value as needed to fit more or fewer cards per row */
                box-sizing: border-box;
                padding: 10px; /* Adjust padding as needed */
                height: 500px; /* Set a fixed height for all cards */
            }
            .room-card img {
                width: 100%;
                height: 200px;
                object-fit: cover;
                border-radius: 5px;
            }
            .room-image {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }
            .room-card {
                border: none;
                margin-bottom: 20px;
            }
            .room-card img {
                width: 100%;
                height: 200px;
                object-fit: cover;
                border-radius: 5px;
            }
            .room-card .room-details {
                padding: 10px;
                background-color: #f8f9fa;
                border: 1px solid #ddd;
                border-top: none;
                border-radius: 0 0 5px 5px;
            }
            .room-card .room-details h5 {
                font-weight: bold;
                font-size: 18px;
                margin-bottom: 5px;
            }
            .room-card .room-details p {
                margin-bottom: 5px;
            }
            .room-card .room-details .price {
                font-weight: bold;
                color: #dc3545;
            }
        </style>
    </head>
    <body>
        <!-- header section start -->
        <jsp:include page="header.jsp" />
        <!-- Carousel Start -->
        <div class="container-fluid p-0 mb-5 wow fadeIn" data-wow-delay="0.1s">
            <div id="header-carousel" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="w-100" src="images/img1.jpg" alt="Image">
                        <div class="carousel-caption">
                            <div class="container">
                                <div class="row justify-content-start">
                                    <div class="col-lg-7">
                                        <h1 class="display-2 mb-5 animated slideInDown">As Your Own Home</h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="w-100" src="images/img2.jpg" alt="Image">
                        <div class="carousel-caption">
                            <div class="container">
                                <div class="row justify-content-start">
                                    <div class="col-lg-7">
                                        <h1 class="display-2 mb-5 animated slideInDown">Easy Choice, Easy Life</h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#header-carousel"
                        data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#header-carousel"
                        data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
        <!-- Carousel End -->
        <div class="container mt-5">
            <div class="row g-0 gx-5 align-items-end">
                <div class="col-lg-6">
                    <div class="section-header text-start mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                        <h1 class="display-5 mb-3">New Rooms</h1>
                    </div>
                </div>
            </div>

            <div class="row">
                <c:choose>
                    <c:when test="${not empty rooms}">
                        <c:forEach var="room" items="${rooms}">
                            <div class="col-lg-4 col-md-6 mb-4 room-cards-container" >
                                <div class="room-card" style="width: auto; height: 500px;">
                                    <c:choose>
                                        <c:when test="${not empty room.image}">
                                            <img src="${pageContext.getRequest().getContextPath()}/images/${room.getImage()}" alt="Room Image"  class="room-image" >
                                        </c:when>
                                        <c:otherwise>
                                            <img src="images/default-room.jpg" alt="Default Room Image">
                                        </c:otherwise>
                                    </c:choose>
                                    <div class="room-details">
                                        <h5>${room.description}</h5>
                                        <p>${room.length * room.width} m²</p>
                                        <p class="price">${room.roomPrice} triệu/tháng</p>
                                        <p>${room.detailAddress}, ${room.ward}, ${room.district}, ${room.city}, ${room.province}</p>
                                        <a href="room-details?roomId=${room.motelRoomId}" class="btn btn-primary">View Details</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <p class="col-12">No rooms available.</p>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="col-12 text-center wow fadeInUp" data-wow-delay="0.1s">
                <a class="btn btn-primary rounded-pill py-3 px-5" href="motel-rooms?action=list">Load More</a>
            </div>
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>