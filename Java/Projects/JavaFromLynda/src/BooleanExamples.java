
public class BooleanExamples {

	public static void main(String[] args) {
		
		Boolean b = true;
		Boolean b2 = false;
		String s = "TrUe";
		
		// Using equals method of Boolean class
		if(b.equals(b2)) {
			System.out.println("Value of (b) is equal to (b2)!");
		} else {
			System.out.println("Value of (b) is not equal to (b2)!");
		}
		
		// Using booleanValue
		System.out.println("What value of (b) Boolean class? " + b.booleanValue());
		
		// Using hashcode method of Boolean class
		System.out.println("What does Boolean.hashcode mean? "+ b2.hashCode());
		
		// Using toString method of Boolean class
		System.out.println("What does Boolean.toString mean? "+ b.toString());
		
		// Using valueOf method of Boolean class
		System.out.println("What does Boolean.valueOf mean? "+ b.valueOf(s));
		
		// Using compareTo method of Boolean class
		System.out.println("What does Boolean.compareTo mean? "+ b.compareTo(b2));
	}
	
}