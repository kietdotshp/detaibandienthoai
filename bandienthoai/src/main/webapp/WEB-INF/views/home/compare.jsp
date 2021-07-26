<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="cart" value="${sessionScope['scopedTarget.cartService']}" />
<style>
table {
  border: 1px solid #ccc;
  border-collapse: collapse;
  margin: 0;
  padding: 0;
  width: 100%;
  table-layout: fixed;
}

table caption {
  font-size: 1.5em;
  margin: .5em 0 .75em;
}

table tr {
  background-color: #f8f8f8;
  border: 1px solid #ddd;
  padding: .35em;
}

table th,
table td {
  padding: .625em;
  text-align: center;
}

table th {
  font-size: .85em;
  letter-spacing: .1em;
  text-transform: uppercase;
}

@media screen and (max-width: 600px) {
  table {
    border: 0;
  }

  table caption {
    font-size: 1.3em;
  }
  
  table thead {
    border: none;
    clip: rect(0 0 0 0);
    height: 1px;
    margin: -1px;
    overflow: hidden;
    padding: 0;
    position: absolute;
    width: 1px;
  }
  
  table tr {
    border-bottom: 3px solid #ddd;
    display: block;
    margin-bottom: .625em;
  }
  
  table td {
    border-bottom: 1px solid #ddd;
    display: block;
    font-size: .8em;
    text-align: right;
  }
  
  table td::before {
    /*
    * aria-label has no advantage, it won't be read inside a table
    content: attr(aria-label);
    */
    content: attr(data-label);
    float: left;
    font-weight: bold;
    text-transform: uppercase;
  }
  
  table td:last-child {
    border-bottom: 0;
  }
}
select {
  -webkit-appearance: none;
  -moz-appearance: none;
  -ms-appearance: none;
  appearance: none;
  outline: 0;
  box-shadow: none;
  border: 0 !important;
  background-image: none;
}
/* Remove IE arrow */
select::-ms-expand {
  display: none;
}
/* Custom Select */
.select {
  position: relative;
  display: flex;
  width: 20em;
  height: 3em;
  line-height: 3;
  overflow: hidden;
  border-radius: .25em;
}
select {
  flex: 1;
  padding: 0 .5em;
  cursor: pointer;
}
/* Arrow */
.select::after {
  position: absolute;
  top: 0;
  right: 0;
  padding: 0 1em;
  cursor: pointer;
  pointer-events: none;
  -webkit-transition: .25s all ease;
  -o-transition: .25s all ease;
  transition: .25s all ease;
}
/* Transition */
.select:hover::after {
  color: #f39c12;
}
.column {
  float: left;
  width: 50%;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}
</style>
		
	<form action="/home/comparesubmit" method="post">
	<div>
		<h1 style="width: 100%; height: 100px; text-align: center">SO
			SÁNH 2 SẢN PHẨM</h1>
	</div>

	<div style="width: 100%; margin-bottom: 150px;margin-left: 200px">
		  <div class="column">
		  		<div style="margin-bottom: 20px"><h4>Chọn sản phẩm so sánh</h4></div>
				<div class="select">
					<select name="slct1" id="slct1">
						<option selected disabled>Chọn 1 sản phẩm</option>
						<c:forEach var="p1" items="${list}" >
						<option value="${p1.id}"">${p1.name}</option>
						</c:forEach>
					</select>
				</div>
			</div>
		  <div class="column">
		  <div style="margin-bottom: 20px"><h4>Chọn sản phẩm so sánh</h4></div>
				<div class="select">
					<select name="slct2" id="slct2">
						<option selected disabled>Chọn 1 sản phẩm</option>
						<c:forEach var="p2" items="${list}" >
						<option value="${p2.id}">${p2.name}</option>
						</c:forEach>
					</select>
				</div>
			</div>
		</div>
		<div style="width: 100%; height: 100px">
		<button style="width: 100%; height: 50px; border: 2px solid green;border-radius: 25px;" ><b>SO SÁNH</b></button>
		</div>
		</form>
<div>
<c:if test="${kq == true }">
<h2 style="width: 100%; text-align: center">KẾT QUẢ SO SÁNH</h2>
 <table>
    <thead>
      <tr>
        <th scope="col">TIÊU CHÍ SO SÁNH</th>
        <th scope="col">SẢN PHẨM 1</th>
        <th scope="col">SẢN PHẨM 2</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td data-label="Account">Tên sản phẩm</td>
        <td data-label="Due Date"><c:out value="${pro1.name }"></c:out></td>
        <td data-label="Due Date"><c:out value="${pro2.name }"></c:out></td>
      </tr>
      <tr>
        <td data-label="Account">Hình ảnh</td>
        <td data-label="Due Date"> <img src="/static/images/products/${pro1.image}"
							title="${pro1.name}" style="width:200px;height:200px;"></td>
        <td data-label="Due Date"><img src="/static/images/products/${pro2.image}"
							title="${pro2.name}" style="width:200px;height:200px;"></td>
      </tr>
      <tr>
        <td data-label="Account">Mô tả</td>
        <td data-label="Due Date">${pro1.description }</td>
        <td data-label="Due Date">${pro2.description }</td>
      </tr>
       <tr>
        <td data-label="Account">Giá bán</td>
        <td data-label="Due Date"><fmt:formatNumber pattern="#,##0" value="${pro1.unitPrice}" /></td>
        <td data-label="Due Date"><fmt:formatNumber pattern="#,##0" value="${pro2.unitPrice}" /></td>
      </tr>
       <tr>
        <td data-label="Account">Số tiền được giảm</td>
        <td data-label="Due Date"><fmt:formatNumber pattern="#,##0" value="${pro1.discount*pro1.unitPrice}" /></td>
        <td data-label="Due Date"><fmt:formatNumber pattern="#,##0" value="${pro2.discount*pro2.unitPrice}" /></td>
      </tr>
      <tr>
        <td data-label="Account">Tình trạng</td>
        <td data-label="Due Date"><span
								style="background-color: #99FF99; border-radius: 4px; padding: 3px; color: black; font-weight: bold;">${pro1.available?'Còn hàng':'Hết hàng'}</span></td>
        <td data-label="Due Date"><span
								style="background-color: #99FF99; border-radius: 4px; padding: 3px; color: black; font-weight: bold;">${pro2.available?'Còn hàng':'Hết hàng'}</span></td>
      </tr>
    </tbody>
  </table>
</c:if>
</div>
<div style="margin-top:200px"></div>

