package org.csu.mypetstore.web.servlets;

import org.csu.mypetstore.domain.Account;
import org.csu.mypetstore.domain.Cart;
import org.csu.mypetstore.domain.Item;
import org.csu.mypetstore.service.CatalogService;
import org.csu.mypetstore.service.LogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class AddItemToCartServlet extends HttpServlet {
    //Servlet的功能即负责中转
    //1.处理完请求后的跳转页面
    private static final String VIEW_CART = "/WEB-INF/jsp/cart/Cart.jsp";

    //2.定义处理该请求所需要的数据
    private String workingItemId;
    private Cart cart;             //购物车

    //3.是否需要调用业务逻辑层
    private CatalogService catalogService;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        workingItemId = request.getParameter("workingItemId");

        Account account;


        //从对话中，获取购物车
        HttpSession session = request.getSession();
        cart = (Cart)session.getAttribute("cart");
        account = (Account)session.getAttribute("account");

        if(cart == null) {
            //第一次使用购物车
            cart = new Cart();
        }
            if (account != null){//用户已经登录
                cart.setLogin(true);
                cart.setUsername(account.getUsername());
                cart.updateFromDB();
            }


            if(cart.containsItemId(workingItemId)){

                //已有该物品，数量加一——数量加一
                cart.incrementQuantityByItemId(workingItemId);


            }else{//没有该物品

                catalogService = new CatalogService();
                boolean isInStock = catalogService.isItemInStock(workingItemId);//是否有库存
                Item item = catalogService.getItem(workingItemId);//根据workingItemId获取Item
                if (item != null) {
                    cart.addItem(item, isInStock);
                    session.setAttribute("cart", cart);
                } else {
                    // 可以在这里添加日志或者错误处理逻辑，提醒找不到相应的商品。
                    System.out.println("Item with ID " + workingItemId + " not found.");
                }


            }

        request.getRequestDispatcher(VIEW_CART).forward(request, response);
    }
}
