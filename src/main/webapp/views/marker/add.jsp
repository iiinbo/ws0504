    <%--jsp 작성을 위해 아래 3줄은 기입.--%>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%--JSTL : 통화 날짜를 표현하게 해주는 문법--%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <script>
        let marker_add = {
            init:function (){
                $('#register_btn').click( function (){ // 클릭되면
                    marker_add.send(); //send.
                });
            },
            send:function (){ // form의 정보를, 어디로 보낼까

                $('#register_form').attr({
                    method:'post', // 방식
                    action:'/marker/addimpl', // 처리할 컨트롤러 경로
                    enctype : 'multipart/form-data' // form 정보 : text파일 전송 말고, +file도 전송.
                });
                $('#register_form').submit(); // 입력한  name, price, img 모두 전송.
            }
        };

        //실행
        $(function (){
            marker_add.init();
        });
    </script>


    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">marker ADD</h1>

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">맛집 등록</h6>
            </div>
            <%-- 실제 만들어지는 영역 --%>
            <div class="card-body">
                <div id="container">
                    <%-- form id : 주의 --%>
                    <form id="register_form" class="form-horizontal well">
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="title">title:</label>
                            <div class="col-sm-10">
                                <input type="text" name="title" class="form-control" id="title" placeholder="Enter title">
                            </div>
                        </div>
<%--                        <div class="form-group">--%>
<%--                            <label class="control-label col-sm-2" for="id">ID는 자동생성이라 작성 안함:</label>--%>
<%--                            <div class="col-sm-10">--%>
<%--                                <input type="text" name="id" class="form-control" id="id" placeholder="Enter id">--%>
<%--                            </div>--%>
<%--                        </div>--%>

                            <div class="form-group">
                                <label class="control-label col-sm-2" for="target">target:</label>
                                <div class="col-sm-10">
                                    <input type="text" name="target" class="form-control" id="target" placeholder="Enter target">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="lat">lat:</label>
                                <div class="col-sm-10">
                                    <input type="text" name="lat" class="form-control" id="lat" placeholder="Enter lat">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="lng">lng:</label>
                                <div class="col-sm-10">
                                    <input type="text" name="lng" class="form-control" id="lng" placeholder="Enter lng">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="loc">loc:</label>
                                <div class="col-sm-10">
                                    <input type="text" name="loc" class="form-control" id="loc" placeholder="Enter loc">
                                </div>
                            </div>
                            <%--      DTO에서 정한 이름과, input에서 사용하는 name 속성값 이름을 꼭 똑같이 해야함. . type : file --%>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="send_img">send_img:</label>
                                <div class="col-sm-10">
                                    <input type="file" name="send_img" class="form-control" id="send_img" placeholder="Enter send_img">
                                </div>
                            </div>

                           <br>

                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button id="register_btn" type="button" class="btn btn-info">등록하기</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
