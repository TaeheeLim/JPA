package kr.or.ddit.util;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import kr.or.ddit.service.ProductService;
import kr.or.ddit.vo.ProductVO;

public class AddCart {
	@Autowired
	private static ProductService productService;
	static Logger logger = LoggerFactory.getLogger(AddCart.class);
	
	public static boolean addCart(String id, HttpServletRequest request){
		logger.info("스태틱 id : " + id);
		ProductVO vo = productService.selectProduct(id);
		logger.info(vo.toString());
		HttpSession session = request.getSession();
		try {
			if(vo != null) {
				ProductVO product = new ProductVO();
				product.setProductId(vo.getProductId());
				product.setPname(vo.getPname());
				product.setUnitPrice(vo.getUnitPrice());
				product.setDescription(vo.getDescription());
				product.setCategory(vo.getCategory());
				product.setManufacturer(vo.getManufacturer());
				product.setUnitsInStock(vo.getUnitsInStock());
				product.setCondition(vo.getCondition());
				product.setFilename(vo.getFilename());
				
				ArrayList<ProductVO> list = (ArrayList<ProductVO>) session.getAttribute("cartlist");
				
				if (list == null) {
					list = new ArrayList<ProductVO>();
	
					product.setQuantity(1);
					list.add(product);
					session.setAttribute("cartlist", list);
				} else {
					ProductVO goodsQnt = new ProductVO();
					boolean chk = false;
					for (int i = 0; i < list.size(); i++) {
						goodsQnt = list.get(i);
						if (goodsQnt.getProductId().equals(id)) {
							int orderQuantity = goodsQnt.getQuantity() + 1;
							goodsQnt.setQuantity(orderQuantity);
	
							chk = true;
						}
					}
	
					if (chk == false) {
						list.add(product);
					}
				}
			}
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return true;
}
}
