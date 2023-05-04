    <%--jsp 작성을 위해 아래 3줄은 기입.--%>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%--JSTL : 통화 날짜를 표현하게 해주는 문법--%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <style>
        #item_img{
                width: 60px;
                height: 70px;
        }
        #item_modal_img{
            width: 200px;
            height: 250px;
        }
    </style>
    <script>
        <%--   search 기능     --%>
        let item_search = {
            init : function () {
                $('#search_btn').click(function (){
                    item_search.send();
                });
            },
            send : function () {
                $('#search_form').attr({
                    action: '/item/search', // marker 컨트롤러에서 처리.
                    method: 'get'
                });
                $('#search_form').submit();
            }
        };
        // 실행
        $(function (){
            item_search.init();
        });

    </script>
    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">Item Tables</h1>
        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">상품 전체현황 조회</h6>
                <%-- search : form 수기 추가 --%>
                <form id="search_form" class="form-inline well">
                    <div class="form-group col-sm-6">
                        <label class="control-label col-sm-2" for="name">Name:</label>
                            <div>
                                <input type="text" name="name"   class="form-control col-sm-6" id="name" placeholder="Enter name" value="${ic.name}">
                            </div>
                    </div>
<%--                    <div class="form-group col-sm-6">--%>
<%--                        <label class="control-label col-sm-2" for="price">Price:</label>--%>
<%--                        <select class="form-control col-sm-6"  id="price" name="price">--%>
<%--                            <option value=0>전체</option>--%>
<%--                            <option value=10000  <c:if test="${ic.price}">selected</c:if>>10000원 상품보기</option>--%>
<%--                            <option value=20000  <c:if test="${ic.price}">selected</c:if>>20000원 상품보기</option>--%>
<%--                        </select>--%>
<%--                    </div>--%>
                    <div class="form-group">
                            <button id="search_btn" type="button" class="btn btn-info">검색하기</button>
                    </div>
                </form> <%--form 수기 추가 끝. --%>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                        <tr>
                            <th>imgname</th>
                            <th>id</th>
                            <th>name</th>
                            <th>price</th>
                            <th>rdate</th>

                        </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <th>imgname</th>
                            <th>id</th>
                            <th>name</th>
                            <th>price</th>
                            <th>rdate</th>
                        </tr>
                        </tfoot>
                        <tbody>
                        <%-- tbody 안에 : 컨트롤러에서 itemlist 라는 이름으로 정보 for로 가져오기  --%>
                        <c:forEach var="obj" items="${itemlist}">
                            <tr>
                                <td>
                                    <a href="#" data-toggle="modal" data-target="#target${obj.id} ">
                                    <img src="/uimg/${obj.imgname}" id="item_img">
                                    </a>
                                </td>
                                <td><a href="/item/detail?id=${obj.id}"> ${obj.id} </a></td>
                                <td>${obj.name}</td>
                                <td><fmt:formatNumber value="${obj.price}" type="number" pattern="###,###원" /></td>
                                <td><fmt:formatDate pattern="yyyy-MM-dd" value="${obj.rdate}" /></td>
                            </tr>
                            <!-- /.container-fluid -->
                            <!-- 이미지 클릭 시 Modal 호출  id는, target+제품의 id로 설정! -->
                            <div id="target${obj.id}" class="modal fade" role="dialog">
                                <div class="modal-dialog">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title">상품 상세이미지</h4>
                                        </div>
                                        <%--   모달 호출된 뒤 보여지는 내용! 1. 상품id 2. 큰 이미지--%>
                                        <div class="modal-body">
                                            <p> ${obj.id} </p>
                                            <img src="/uimg/${obj.imgname}" id="item_modal_img"><br><br>
                                            <a href="/item/detail?id=${obj.id}" class="btn btn-info">자세히보기</a>
                                        </div>
                                        <div class="modal-footer">
                                            <a href= "#" class="btn btn-default" data-dismiss="modal">창닫기</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>

