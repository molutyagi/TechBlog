<%-- 
    Document   : navmodals
    Created on : 16-Jan-2024, 12:40:26?pm
    Author     : imrya
--%>

<%@page import="com.tech.blog.entities.User"%>
<%
//    User user = null;
    user = (User) session.getAttribute("currentUser");
%>
<!--profile modal-->

<!-- Modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header primary-background text-white text-center">
                <h5 class="modal-title" id="exampleModalLabel"> TechBlog </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container text-center">
                    <img src="static/imgs/<%= user.getProfile()%>" class="img-fluid" style="border-radius:50%;max-width: 150px;;" >
                    <br>
                    <h5 class="modal-title mt-3" id="exampleModalLabel"> <%= user.getName()%> </h5>
                    <!--//details-->

                    <div id="profile-details">
                        <table class="table">

                            <tbody>
                                <tr>
                                    <th scope="row"> ID :</th>
                                    <td> <%= user.getId()%></td>

                                </tr>
                                <tr>
                                    <th scope="row"> Email : </th>
                                    <td><%= user.getEmail()%></td>

                                </tr>
                                <tr>
                                    <th scope="row">Gender :</th>
                                    <td><%= user.getGender()%></td>

                                </tr>
                                <tr>
                                    <th scope="row">Status :</th>
                                    <td><%= user.getAbout()%></td>

                                </tr>
                                <tr>
                                    <th scope="row">Registered on :</th>
                                    <td><%= user.getDateTime().toString()%></td>

                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <!--profile edit-->

                    <div id="profile-edit" style="display: none;">
                        <h3 class="mt-2">Please Edit Carefully</h3>
                        <form action="EditServlet" method="post" enctype="multipart/form-data">
                            <table class="table">
                                <tr>
                                    <td>ID :</td>
                                    <td><%= user.getId()%></td>
                                </tr>
                                <tr>
                                    <td>Email :</td>
                                    <td> <input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>" > </td>
                                </tr>
                                <tr>
                                    <td>Name :</td>
                                    <td> <input type="text" class="form-control" name="user_name" value="<%= user.getName()%>" > </td>
                                </tr>
                                <tr>
                                    <td>Password :</td>
                                    <td> <input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>" > </td>
                                </tr>
                                <tr>
                                    <td>Gender :</td>
                                    <td> <%= user.getGender().toUpperCase()%> </td>
                                </tr>
                                <tr>
                                    <td>About  :</td>
                                    <td>
                                        <textarea rows="3" class="form-control" name="user_about" ><%= user.getAbout()%>
                                        </textarea>

                                    </td>
                                </tr>
                                <tr>
                                    <td>New Profile:</td>
                                    <td>
                                        <input type="file" name="image" class="form-control" >
                                    </td>
                                </tr>

                            </table>

                            <div class="container">
                                <button type="submit" class="btn btn-outline-primary">Save</button>
                            </div>

                        </form>    

                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button  id="edit-profile-button" data-target="#profile-modal" type="button" class="btn btn-primary">EDIT</button>
            </div>
        </div>
    </div>
</div>


<!--end of profile modal-->
