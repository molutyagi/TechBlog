
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User"%>


<nav class="navbar navbar-expand-lg navbar-dark bg-dark primary-background">
    <a class="navbar-brand" href="index"> <span class="fa fa-asterisk"></span>   Tech Blog</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#"> <span class="	fa fa-bell-o"></span> Home <span class="sr-only">(current)</span></a>
            </li>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="	fa fa-check-square-o"></span> Categories
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <!--categories-->
                    <% PostDao d = new PostDao(ConnectionProvider.getConnection());
                        ArrayList<Category> list1 = d.getAllCategories();
                        for (Category cc : list1) {

                    %>
                    <a class="dropdown-item" href="#"><%= cc.getName()%></a>

                    <%                                        }

                    %>

                </div>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="#"> <span class="	fa fa-address-card-o"></span> Contact</a>
            </li>


            <%                User user = null;
                user = (User) session.getAttribute("currentUser");
                if (user == null) {
            %>

            <li class="nav-item">
                <a class="nav-link" href="login"> <span class="fa fa-user-circle "></span> Login</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="register"> <span class="fa fa-user-plus "></span> Sign up</a>
            </li>

            <%
            } else {
            %>

            <ul class="navbar-nav mr-right">
                <li class="nav-item">
                    <a class="nav-link" href="profile"> <span class="fa fa-user-circle "></span> <%= user.getName()%> </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="logoutservlet"> <span class="fa fa-user-plus "></span> Logout</a>
                </li>
            </ul>
            <%
                }

            %>

        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>
