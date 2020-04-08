import moid.members.Membership;
import moid.groups.Group;

public class CompVer02 {

	public static void main(String[] args) {
		
		
		/* Use classes in package to create members and groups
		 * Members have first, last names, and age 
		 * Groups have group name, member names, average age, number of members
		 * put out member names and group names
		 * 
		 *   Then: create your family persons in members and groups */
		
		// Declare and print my name
		Membership ahmed = new Membership("Ahmed", "Alkatheeri", 24);
		ahmed.print(true);
		
		// Declare and print Sultan Al Buraike
		Membership sultan = new Membership("Sultan", "Alburaike", 21);
		sultan.print(true);
		
		split();
		
		// Declare Mandi, Khamis members
		Membership mandi = new Membership("Mandi", "AlTamimi", 22);
		Membership khamis = new Membership("Khamis", "Alhafiti", 23);
		
		// Create new group for ZU Students
		Group zuStudents = new Group("ZU Students");
		
		// Add members to ZU Students group
		zuStudents.addNewMember(ahmed);
		zuStudents.addNewMember(mandi);
		zuStudents.addNewMember(sultan);
		zuStudents.addNewMember(khamis);
		
		// Print group name and its members
		zuStudents.print();
		split();
		zuStudents.printMembers();
		
		split();
		
		// Print number of members in ZU Student group
		System.out.println("There are "+zuStudents.getNumberOfMembers()+" members in "+zuStudents.groupName+" group.");
		
	}
	
	public static void split() {
		System.out.println("");
	}
	
	public static void split(String symbol) {
		System.out.println(symbol);
	}

}
