package kr.or.ddit.mapper;

import java.util.List;
import kr.or.ddit.vo.ProductVO;

public interface ProductMapper {
	//Mapper XML의 id

	//전체 상품 조회
	public List<ProductVO> selectProducts();
	
	//특정 상품 조회
	public ProductVO selectProduct(String productId);
	
	//상품 삭제
	public int deleteProduct(String productId);
	
	//상품 등록
	public int insertProduct(ProductVO vo);
	
	//상품 정보 갱신
	public int updateProduct(ProductVO vo);
	
	//상품 정보 갱신
	public int updateProductNoFile(ProductVO vo);
	
}
