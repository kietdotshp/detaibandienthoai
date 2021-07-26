package com.happyshop.dao;

import java.util.List;

import com.happyshop.entity.Order;
import com.happyshop.entity.OrderDetail;
import com.happyshop.entity.Product;
import com.happyshop.entity.User;

public interface OrderDAO {
	Order findById(Integer id);

	List<Order> findAll();

	Order create(Order entity);

	void update(Order entity);

	Order delete(Integer id);

	void create(Order order, List<OrderDetail> details);

	List<Order> findByUser(User user);

	List<Product> findItemsByUser(User user);
}
