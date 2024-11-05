<%@ include file="../common/IncludeTop.jsp"%>

<div id="BackLink">
	<a href="main">Return to Main Menu</a>
</div>

<div id="Catalog">

<div id="Cart">

<script>

	function updateCart(index,listPrice,total,originquantity){
		console.log("quantity"+index)
		var id = "quantity"+index
		var quantity = document.getElementById("quantity"+index).value;
		$('#totalPrice'+index).text("$"+listPrice*quantity);
		$('#SubTotal').text("Sub Total:"+(total+listPrice))
		console.log(originquantity)
		$.ajax({
			type     :"GET",
			url      :"updateCartQuantities?quantity="+quantity+"&cartItem="+document.getElementById("quantity"+index).getAttribute('name'),
			success  :function (data){
				console.log(data);
				// if(data.msg == 'Exist'){
				// 	$('#usernameTips').attr("class",'errorTips').text("Invalid");
				// }else if(data.msg == 'Not Exist'){
				// 	$('#usernameTips').attr("class",'okTips').text("Available");
				// }

			}
		})
	}
</script>

	<h2>Shopping Cart</h2>
	<form action="updateCartQuantities" method="post">
		<table>
			<tr>
				<th><b>Item ID</b></th>
				<th><b>Product ID</b></th>
				<th><b>Description</b></th>
				<th><b>In Stock?</b></th>
				<th><b>Quantity</b></th>
				<th><b>List Price</b></th>
				<th><b>Total Cost</b></th>
				<th>&nbsp;</th>
			</tr>

			<c:if test="${sessionScope.cart.numberOfItems == 0}">
				<tr>
					<td colspan="8"><b>Your cart is empty.</b></td>
				</tr>
			</c:if>

			<c:forEach var="cartItem" items="${sessionScope.cart.cartItems}" varStatus="status">
				<tr>
					<td>
						<a href="viewItem?itemId=${cartItem.item.itemId}">${cartItem.item.itemId}</a>
					</td>
					<td>
						${cartItem.item.product.productId}
					</td>
					<td>
						${cartItem.item.attribute1} ${cartItem.item.attribute2}
					    ${cartItem.item.attribute3} ${cartItem.item.attribute4}
					    ${cartItem.item.attribute5} ${cartItem.item.product.name}
					</td>
					<td>
						${cartItem.inStock}
					</td>
					<td>
						<input type="text"  id="quantity${status.index}" onblur="updateCart(${status.index},${cartItem.item.listPrice},${sessionScope.cart.subTotal},this.value)"name="${cartItem.item.itemId}" value="${cartItem.quantity}">
					</td>
					<td>
						<!--format标签显示单价-->
						<fmt:formatNumber value="${cartItem.item.listPrice}"
						pattern="$#,##0.00" />
					</td>
					<td>
						<!--format标签显示总价-->
<%--						<fmt:formatNumber value="${cartItem.total}"--%>
<%--						pattern="$#,##0.00" />--%>
						<span id="totalPrice${status.index}">$${cartItem.total}</span>
					</td>
					<td>
						<a class="Button" href="removeItemFromCart?workingItemId=${cartItem.item.itemId}">Remove</a>
					</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="7">
<%--					Sub Total: <fmt:formatNumber value="${sessionScope.cart.subTotal}" pattern="$#,##0.00" />--%>
					<span id="SubTotal">Sub Total: ${sessionScope.cart.subTotal}</span>
<%--					<input type="submit" value="Update Cart"/>--%>
				</td>
				<td>&nbsp;</td>
			</tr>
		</table>
	</form>

	<c:if test="${sessionScope.cart.numberOfItems > 0}">
		<a class="Button" href="newOrderForm?itemId=${cartItem.item.itemId}">Proceed to Checkout</a>
    </c:if>
</div>

<div id="Separator">&nbsp;</div>
</div>

<%@ include file="../common/IncludeBottom.jsp"%>