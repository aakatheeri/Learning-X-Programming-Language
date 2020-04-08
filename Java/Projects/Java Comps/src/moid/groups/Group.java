package moid.groups;
import java.util.Random;
import moid.members.Membership;

public class Group {

	private Random randomClass = new Random();
	public int numberOfMembers = 0;
	
	private int id = this.randomClass.nextInt(100);
	public String groupName;
	public Membership[] members = new Membership[0];
	
	// This is a constructor
	public Group(String groupName) {
		this.groupName = groupName;
	}
	
	public void addNewMember(Membership newMember) {
		
		this.numberOfMembers = this.numberOfMembers+1;
		this.setMembersAgain(newMember);
	}
	
	private void setMembersAgain(Membership newMember) {

		if (this.numberOfMembers == 1) {
			this.members = new Membership[this.numberOfMembers];
			this.members[this.numberOfMembers-1] = newMember;
		} else {
			Membership[] currentMembers = new Membership[this.numberOfMembers-1];
			currentMembers = this.members;
			this.members = new Membership[this.numberOfMembers];
			for (int i = 0; i < this.numberOfMembers-1; i++) {
				this.members[i] = currentMembers[i];
			}
			
			this.members[this.numberOfMembers-1] = newMember;
		}
		
	}
	
	public int getNumberOfMembers() {
		return this.members.length;
	}
	
	public void reset () {
		this.groupName = null;
	}
	
	public void print() {
		System.out.println("This is a "+this.groupName+" group (ID => "+this.id+")");
	}
	
	public void printMembers () {
		for (int i = 0; i < this.members.length; i++) {
			System.out.println("#"+this.members[i].getId()+" => "+this.members[i].firstname+" "+this.members[i].lastname+" ("+this.members[i].age+" years old)");
			
		}
	}
	
	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

}
