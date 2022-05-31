
public class Collection {

	private String name;
	private String type;
	private int price;
	private int qty;
	
	public Collection(String name, String type, int price, int qty) {
		super();
		this.name = name;
		this.type = type;
		this.price = price;
		this.qty = qty;
	}

	
	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public int getQty() {
		return qty;
	}


	public void setQty(int qty) {
		this.qty = qty;
	}


	public Collection() {
		// TODO Auto-generated constructor stub
	}

}
