package entities;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;


public class Cart {
	private TreeMap<SanPham, Integer> listProduct;
	private long cartID;
	public Cart() {
		listProduct = new TreeMap<SanPham, Integer>();
		cartID = System.currentTimeMillis();
	}
	public Cart(TreeMap<SanPham, Integer> listProduct, long cartID) {
		this.listProduct = listProduct;
		this.cartID = cartID;
	}
	public TreeMap<SanPham, Integer> getListProduct() {
		return listProduct;
	}
	public void setListProduct(TreeMap<SanPham, Integer> listProduct) {
		this.listProduct = listProduct;
	}
	public long getCartID() {
		return cartID;
	}
	
	
	public void setCartID(long cartID) {
		this.cartID = cartID;
	}
	
	public void insertToCart(SanPham sp, int quantity)
	{
		totalPrice += sp.getGiaBan();
		boolean check = listProduct.containsKey(sp);
		if(check){
			int old_quantity = listProduct.get(sp);
			quantity += old_quantity;
			listProduct.put(sp, quantity);
		}else{
			listProduct.put(sp, quantity);
		} 
	}
	
	public void updateToCart(SanPham sp, int quantity){
		boolean check = listProduct.containsKey(sp);
		if(check == true){
			if(quantity <= 0){
				listProduct.remove(sp);
			}else{
				listProduct.remove(sp);
				listProduct.put(sp, quantity);
			}
		}
	}
	
	public void removeToCart(SanPham sp, int quantity){
		boolean check = listProduct.containsKey(sp);
		if(check == true)
		{

			totalPrice -= sp.getGiaBan();
			int old_quantity = listProduct.get(sp);
			quantity = old_quantity - quantity;
			if(quantity <= 0)
			{
				listProduct.remove(sp);
			}else{
				listProduct.remove(sp);
				listProduct.put(sp, quantity);
			}
		}
	}
	
	public void removeCart(SanPham sp, int quantity){
		boolean check = listProduct.containsKey(sp);
		if(check == true){
			listProduct.remove(sp);
		}
	}
	public int totalPrice = 0;
	public int countItem(){
		int count = 0;
		for(Map.Entry<SanPham, Integer> list: listProduct.entrySet()){
			count += list.getValue();
			
		}
		return count;
	}
	
	public double total(){
		double count = 0;
		for(Map.Entry<SanPham, Integer> list:listProduct.entrySet()){
			count += list.getValue() * list.getKey().getGiaBan();
			totalPrice += totalPrice + list.getValue() * list.getKey().getGiaBan();
		}
		return count;
	}
}
