package com.devpro.services;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.entities.Category;
import com.devpro.entities.Product;
import com.devpro.entities.ProductImages;
import com.devpro.model.ProductSearch;
import com.devpro.repositories.CategoryRepo;
import com.devpro.repositories.ProductRepo;
import com.github.slugify.Slugify;

@Service // -> Bean
public class ProductService {
	
	@PersistenceContext protected EntityManager entityManager;
	@Autowired
	private ProductRepo productRepo;
	
	private boolean isEmptyUploadFile(MultipartFile[] images) {
		if(images == null || images.length <= 0) return true; 
		if(images.length == 1 && images[0].getOriginalFilename().isEmpty()) return true;
		return false;
	}
	
	/**
	 * Lưu sản phẩm và ảnh sản phẩm.
	 * 
	 * @param productImages
	 * @param product
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	public void save(MultipartFile[] productImages, Product product) throws IllegalStateException, IOException {
		
		if(product.getId() != null) { // chỉnh sửa
			// lấy dữ liệu cũ của sản phẩm
			Product productInDb = productRepo.findById(product.getId()).get();
			
			if(!isEmptyUploadFile(productImages)) { // nếu admin sửa ảnh sản phẩm
				// lấy danh sách ảnh cũ của sản phẩm
				List<ProductImages> oldProductImages = productInDb.getProductImages();
				
				// xoá ảnh cũ trên vật lí(host)
				for(ProductImages _images : oldProductImages) {
					new File("/Users/duongv/Documents/eclipse-workspace/com.devpro.shop11/upload/" + _images.getPath()).delete();
				}
				
				// xoá ảnh trên database
				product.removeProductImages();
				
			} else { // ảnh phải giữ nguyên
				product.setProductImages(productInDb.getProductImages());
			}
			
		}
		
		if(!isEmptyUploadFile(productImages)) { // có upload ảnh lên.
			for(MultipartFile productImage : productImages) {
				
				// lưu vật lí
				productImage.transferTo(new File("/Users/duongv/Documents/eclipse-workspace/com.devpro.shop11/upload/" + productImage.getOriginalFilename()));
				
				ProductImages _productImages = new ProductImages();
				_productImages.setPath(productImage.getOriginalFilename());
				_productImages.setTitle(productImage.getOriginalFilename());
				product.addProductImages(_productImages);
			}
		}
		
		Slugify slg = new Slugify();
		String seo = slg.slugify(product.getTitle() + "-" + System.currentTimeMillis());
		product.setSeo(seo);
		productRepo.save(product);
	}
	
	/**
	 * Tìm kiếm sản phẩm.
	 * 
	 * @param productSearch
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Product> search(final ProductSearch productSearch) {
//		String jpql = "Select caijcungduoc from Product caijcungduoc";
//		Query query = entityManager.createQuery(jpql, Product.class);

		String sql = "select * from tbl_products where 1=1";

		if(productSearch != null && productSearch.getCategoryId() != null) {
			sql = sql + " and category_id=" + productSearch.getCategoryId();
		} 
		if(productSearch != null && productSearch.getId() != null) {
			sql = sql + " and id=" + productSearch.getId();
		}

		// tìm kiếm theo seo của category
		if(productSearch != null && productSearch.getSeoCategoty() != null) {
			sql = sql + " and category_id in (select id from tbl_category where status = 0 and seo='"+productSearch.getSeoCategoty()+"')";
		}
		if(productSearch != null && productSearch.getValue() != null) {
			sql = sql + " order by price " + productSearch.getValue();
		}
		
		if(productSearch != null && productSearch.getKeyword() != null) {
			sql = sql + " and upper(title) like '%" + productSearch.getKeyword().toUpperCase() + "%'";
		}
		if(productSearch != null && productSearch.getPriceBegin() != null && productSearch.getPriceEnd() != null) {
			sql = sql + " and price >= " + productSearch.getPriceBegin() + " and price < " + productSearch.getPriceEnd();
		}
		if(productSearch != null && productSearch.getPriceBegin() != null && productSearch.getPriceEnd() == null)  {
			sql = sql + " and price >= " + productSearch.getPriceBegin();
		}
		if(productSearch != null && productSearch.getTag() != null)  {
			sql = sql + " and upper(title) like '%" + productSearch.getTag().toUpperCase() + "%'";
		}
		
		Query query = entityManager.createNativeQuery(sql, Product.class);
		
		if(productSearch.getCurrentPage() != null && productSearch.getCurrentPage() > 0) {
			query.setFirstResult((productSearch.getCurrentPage()-1) * ProductSearch.SIZE_ITEMS_ON_PAGE);
			query.setMaxResults(ProductSearch.SIZE_ITEMS_ON_PAGE);
		}
		
		return query.getResultList();
	}
	
	public Product searchProductBySeo(final ProductSearch productSearch) {
		String sql = "select * from tbl_products where 1=1";

		// tìm kiếm theo seo của product
		if(productSearch != null && productSearch.getSeoProduct() != null) {
			sql = sql + " and seo='"+productSearch.getSeoProduct()+"'";
		}
		Query query = entityManager.createNativeQuery(sql, Product.class);
		return (Product) query.getSingleResult();
	}
	
	public String getNameOfProduct(final ProductSearch productSearch) {
		String sql = "select title from tbl_products where 1=1";
		if(productSearch != null && productSearch.getId() != null) {
			sql = sql + " and id=" + productSearch.getId();
		}
		Query query = entityManager.createNativeQuery(sql, Product.class);
		return (String) query.getSingleResult();
	}
	
	@SuppressWarnings("unchecked")
	public List<Product> hotProduct() {
		String sql = "select * from tbl_products where 1=1 and ishot = 1";
		Query query = entityManager.createNativeQuery(sql, Product.class);
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Product> saleProduct() {
		String sql = "select * from tbl_products where 1=1 and issale = 1";
		Query query = entityManager.createNativeQuery(sql, Product.class);
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Product> newProduct() {
		String sql = "select * from tbl_products where 1=1 and isnew = 1";
		Query query = entityManager.createNativeQuery(sql, Product.class);
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Product> myOrder(final ProductSearch productSearch) {
		String sql = "select * from tbl_saleorder where 1=1 and user_id = " + productSearch.getUserId();
		Query query = entityManager.createNativeQuery(sql, Product.class);
		return query.getResultList();
	}
	
	
}
