package kr.or.ddit.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.ProductVO;

@Repository
public class ProductDAO {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private static final Logger logger = 
			LoggerFactory.getLogger(ProductDAO.class);
	
	//전체 상품 조회
	public List<ProductVO> selectProducts() {
		List<ProductVO> list = this.sqlSessionTemplate.selectList("shop.selectProducts");
		return list;
	}
	//특정 상품 조회
	public ProductVO selectProduct(String productId) {
		logger.info("DAO에서 아이디 : " + productId);
		ProductVO vo = this.sqlSessionTemplate.selectOne("shop.selectProduct",productId);
		return vo;
	}
	//상품 삭제
	public int deleteProduct(String productId) {
		int result = this.sqlSessionTemplate.delete("shop.deleteProduct", productId);
		return result;
	}
	//상품 등록
	public int insertProduct(ProductVO vo) {
		int result = this.sqlSessionTemplate.insert("shop.insertProduct",vo);
		return result;
	}
	//상품 정보 갱신
	public int updateProduct(ProductVO vo) {
		int result = this.sqlSessionTemplate.update("shop.updateProduct",vo);
		return result;
	}
	//상품 정보 갱신
	public int updateProductNoFile(ProductVO vo) {
		int result = this.sqlSessionTemplate.update("shop.updateProductNoFile",vo);
		return result;
	}
}
