import java.util.*;

public class Main {

	Scanner sc = new Scanner(System.in);
	
	Vector<Headset> dataHS = new Vector<Headset>();
	Vector<Collection> colle = new Vector<Collection>();
	String username;
	
	void printMenu() {
		System.out.println("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
		System.out.println("BakHeadSet");
		System.out.println("================");
		System.out.println("Hello, " + username + "\n\nMenu:");
		System.out.println("1. Add Headset");
		System.out.println("2. Update Headset");
		System.out.println("3. Buy Headset");
		System.out.println("4. View Collection");
		System.out.println("5. Exit");
		System.out.print(">> "); 
	}

	
	public Main() {
		// TODO Auto-generated constructor stub
		
		System.out.println("BakHeadset");
		System.out.println("==================");
		do {
			System.out.print("\nInput customer name [5..20]: ");
			username = sc.nextLine();
		} while (username.length() < 5 || username.length() > 20);
		
		System.out.println("Welcome, " + username + "\n\nPress enter to continue to main menu.");
		sc.nextLine();
		
		//main menu
		int choose=0;
		
		do {
			printMenu();
			choose = sc.nextInt();
			sc.nextLine();
			
			switch (choose) {
			case 1: 
				add();
				break;
			case 2:
				update();
				break;
			case 3:
				buy();
				break;
			case 4:
				collection();
				break;
			}
			
		} while (choose != 5);
		
		System.out.println("Close Program.");
		System.exit(0);
	}

	
	void collection() {
		// TODO Auto-generated method stub
		System.out.println("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
		System.out.println("View Collection\n=========================\n");
		
		if (dataHS.isEmpty()) {
			System.out.println("No headset added yet!");
		}
		else if (colle.isEmpty()) {
			System.out.println("Your collection(s) are empty.");
		}
		else {
			int i = 0;
			int a = 1;
			while (i != colle.size()) {
				System.out.println(a + ". " + colle.get(i).getName() + " | " + colle.get(i).getType());
				a++;
				i++;
			}
		}
		System.out.println("Press enter to continue..");
		sc.nextLine();
	}


	void buy() {
		// TODO Auto-generated method stub
		System.out.println("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
		System.out.println("Buy headset\n================\n");
		if (dataHS.isEmpty()) {
			System.out.println("No headset added yet!");
			System.out.println("Press enter to continue..");
			sc.nextLine();
		}
		else {
			int i = 0;
			int a = 1;
			while (i != dataHS.size()) {
				System.out.println(a + ". " + dataHS.get(i).getName() + " | " + dataHS.get(i).getType());
				a++;
				i++;
			}
			
			System.out.println("\n\n");
			
			int selectbuy = 0;
			do {
				System.out.print("Select headset: ");
				selectbuy = sc.nextInt();
				sc.nextLine();
			} while (selectbuy < 1 || selectbuy > dataHS.size());
			
			int qty;
			do {
				System.out.println("Input quantity [min. 1]: ");
				qty = sc.nextInt();
				sc.nextLine();
			} while (qty < 1);
			
			Random rand = new Random();
			
			int disc = (rand.nextInt(36));
			
			if (disc > 25) disc -= 10;
			else if (disc < 10) disc += 10;
			
			int checkdisc = (100-disc) / 100;
			if (checkdisc < 1) checkdisc = 1;
			
			int price = (qty*(dataHS.get(selectbuy-1).getPrice())) * checkdisc;
			
			System.out.println("You got " + disc + "% discount! ");
			System.out.println("Total Price: " + price);
			
			colle.add(new Collection(dataHS.get(selectbuy-1).getName(), dataHS.get(selectbuy-1).getType(), disc, price));
			
			System.out.println("This headset has been added to your collection!!");
			System.out.println("Press enter to continue...");
			sc.nextLine();
		}
	}


	void update() {
		// TODO Auto-generated method stub
		System.out.println("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
		System.out.println("Update\n================\n");
		if (dataHS.isEmpty()) {
			System.out.println("No headset added yet!");
			System.out.println("Press enter to continue..");
			sc.nextLine();
		}
		else {
			int i = 0;
			int a = 1;
			while (i != dataHS.size()) {
				System.out.println(a + ". " + dataHS.get(i).getName() + " | " + dataHS.get(i).getType());
				a++;
				i++;
			}
			System.out.println("\n\n");
			int selectupdate = 0;
			do {
				System.out.print("Select headset [1-" + dataHS.size() + "]: ");
				selectupdate = sc.nextInt();
				sc.nextLine();
			} while (selectupdate < 1 || selectupdate > dataHS.size());
			
			String newName;
			int flag;
			do {
				System.out.print("Input new name [5...15 | unique]: ");
				newName = sc.nextLine();
				
				flag = 0;
				int j = 0;
				if (!dataHS.isEmpty()) {
					while (j != dataHS.size()) {
						if ((dataHS.get(j).getName()).equals(newName)) {
							flag++;
							System.out.println("'" + newName + "' is already added. Input another name.");
							break;
						}
						j++;
					}
				}
			} while (newName.length() < 5 || newName.length() > 15 || flag != 0);
			
			String newType;
			int newPrice = 0;
			
			do {
				System.out.print("Input Headset type [Headphone | IEM | OnEar]: ");
				newType = sc.nextLine();
			} while (!newType.equalsIgnoreCase("Headphone") && !newType.equalsIgnoreCase("IEM") && !newType.equalsIgnoreCase("OnEar"));
			
			if (newType.equalsIgnoreCase("Headphone")) newPrice = 20000;
			else if (newType.equalsIgnoreCase("iem")) newPrice = 25000;
			else if (newType.equalsIgnoreCase("onear")) newPrice = 30000;
		
			//update keun
			dataHS.set(selectupdate-1, new Headset(newName, newType, newPrice));
			System.out.println("Headset has been updated.\nPress enter to continue");
			sc.nextLine();
		}
	}

//	
//	//cek egen
//	void view() {
//		// TODO Auto-generated method stub
//		if (dataHS.isEmpty()) {
//			System.out.println("No headset added yet!");
//			System.out.println("Press enter to continue..");
//			sc.nextLine();
//		}
//		else {
//			int i = 0;
//			while (i != dataHS.size()) {
//				System.out.print(++i + ". " + dataHS.get(i).getName() + " | " + dataHS.get(i).getType());
//				i++;
//			}
//		}
//	}


	void add() {
		// TODO Auto-generated method stub
		System.out.println("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
		String name;
		String type;
		int price = 0;
		int flag; 
		
		do {
			System.out.print("Input headset name [5..15 | unique]: ");
			name = sc.nextLine();
			
			flag = 0;
			int i = 0;
			if (!dataHS.isEmpty()) {
				while (i != dataHS.size()) {
					if ((dataHS.get(i).getName()).equals(name)) {
						flag++;
						System.out.println("'" + name + "' is already added. Input another name.");
						break;
					}
					i++;
				}
			}
			
		} while (name.length() < 5 || name.length() > 15 || flag != 0);
		
		do {
			System.out.print("Input Headset type[Headphone | IEM | OnEar]: ");
			type = sc.nextLine();
		} while (!type.equalsIgnoreCase("Headphone") && !type.equalsIgnoreCase("IEM") && !type.equalsIgnoreCase("OnEar"));
		
		if (type.equalsIgnoreCase("Headphone")) price = 20000;
		else if (type.equalsIgnoreCase("iem")) price = 25000;
		else if (type.equalsIgnoreCase("onear")) price = 30000;
	
		dataHS.add(new Headset(name, type, price));
		System.out.println("Headset successfully added.\n\nPress enter to continue");
		sc.nextLine();
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new Main();
	}

}
