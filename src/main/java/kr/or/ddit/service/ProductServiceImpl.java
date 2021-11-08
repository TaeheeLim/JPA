package kr.or.ddit.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.dao.ProductDAO;
import kr.or.ddit.mapper.ProductMapper;
import kr.or.ddit.util.FileUpload;
import kr.or.ddit.vo.ProductVO;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductMapper productMapper;
	
	private static final Logger logger = 
			LoggerFactory.getLogger(ProductServiceImpl.class);
	@Override
	public List<ProductVO> selectProducts() {
		return this.productMapper.selectProducts();
	}

//	@Override
//	public ProductVO selectProduct(String productId) {
//		logger.info("서비스에서 id : " + productId);
//		return this.productDAO.selectProduct(productId);
//	}

	@Override
	public int deleteProduct(String productId) {
		return this.productMapper.deleteProduct(productId);
	}

	@Override
	public boolean insertProduct(ProductVO vo, MultipartFile file) {
		boolean result = FileUpload.fileUpload(file);
		if(result) {
			this.productMapper.insertProduct(vo);			
		}
		return result;
	}

	@Override
	public boolean updateProduct(ProductVO vo, MultipartFile file) {
		boolean result = FileUpload.fileUpload(file);
		if(result) {
			this.productMapper.updateProduct(vo);
		}
		return result;
	}

	@Override
	public int updateProductNoFile(ProductVO vo) {
		return this.productMapper.updateProductNoFile(vo);
	}

	@Override
	public boolean addCart(String id, HttpServletRequest request) {
		logger.info("스태틱 id : " + id);
		ProductVO vo = selectProduct(id);
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
				product.setQuantity(1);
				
				ArrayList<ProductVO> list = (ArrayList<ProductVO>) session.getAttribute("cartlist");
				
				if (list == null) {
					list = new ArrayList<ProductVO>();
	
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
	
	@Override
	public ProductVO selectProduct(String productId) {
		return this.productMapper.selectProduct(productId);
	}
	
}
