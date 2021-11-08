package kr.or.ddit.vo;

import java.io.Serializable;


public class ProductVO implements Serializable{
   /**
	 * 
	 */
   private static final long serialVersionUID = 1L;
   
   private String productId;
   private String pname;
   private int unitPrice;
   private String description;
   private String category;
   private String manufacturer;
   private int unitsInStock;
   private String condition;
   private String filename;
   //수량.. 테이블에는 해당 칼럼이 없음
   private int quantity;
   
   public String getProductId() {
      return productId;
   }
   public void setProductId(String productId) {
      this.productId = productId;
   }
   public String getPname() {
      return pname;
   }
   public void setPname(String pname) {
      this.pname = pname;
   }
   public int getUnitPrice() {
      return unitPrice;
   }
   public void setUnitPrice(int unitPrice) {
      this.unitPrice = unitPrice;
   }
   public String getDescription() {
      return description;
   }
   public void setDescription(String description) {
      this.description = description;
   }
   public String getCategory() {
      return category;
   }
   public void setCategory(String category) {
      this.category = category;
   }
   public String getManufacturer() {
      return manufacturer;
   }
   public void setManufacturer(String manufacturer) {
      this.manufacturer = manufacturer;
   }
   public int getUnitsInStock() {
      return unitsInStock;
   }
   public void setUnitsInStock(int unitsInStock) {
      this.unitsInStock = unitsInStock;
   }
   public String getCondition() {
      return condition;
   }
   public void setCondition(String condition) {
      this.condition = condition;
   }
   public String getFilename() {
      return filename;
   }
   public void setFilename(String filename) {
      this.filename = filename;
   }
   public int getQuantity() {
      return quantity;
   }
   public void setQuantity(int quantity) {
      this.quantity = quantity;
   }
   @Override
   public String toString() {
      return "ProductVO [productId=" + productId + ", pname=" + pname + ", unitPrice=" + unitPrice + ", description="
            + description + ", category=" + category + ", manufacturer=" + manufacturer + ", unitsInStock="
            + unitsInStock + ", condition=" + condition + ", filename=" + filename + ", quantity=" + quantity + "]";
   }
   
   
   
}