package kr.or.ddit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.ProductVO;

public interface ProductService {
	
	public List<ProductVO> selectProducts();
	
	public ProductVO selectProduct(String productId);
	
	public int deleteProduct(String productId);
	
	public boolean insertProduct(ProductVO vo, MultipartFile uploadFile);
	
	public boolean updateProduct(ProductVO vo, MultipartFile filename);
	
	public int updateProductNoFile(ProductVO vo);
	
	public boolean addCart(String id, HttpServletRequest request);
}
