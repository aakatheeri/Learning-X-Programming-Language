package dvm;

import java.awt.Toolkit;
import javax.swing.ImageIcon;
import javax.swing.JLabel;

// This class is used to represent a selectable "optional extra" as an icon (graphical element) with name and price
public final class Option extends JLabel {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 
	 */
	
	private String optionName; // Option Name to be used when showing order text
	private double optionPrice; // Option Price to be used on the relevant button
	
	public Option (String optionName, double optionPrice, String icon){
		super(new ImageIcon(Toolkit.getDefaultToolkit().getImage(Option.class.getResource(icon)))); // initiate the parent JLabel class with the icon passed as a parameter
		this.optionName = optionName; // setting the name of the option
		this.optionPrice = optionPrice; // setting the price of the option
		this.setToolTipText(this.optionName); // a user friendly tool tip to show the name of the option as the option will be displayed as an icon only
	}
	
	// following is a set of getters and setters for the Option variables 
	public String getOptionName() {
		return optionName;
	}
	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}
	public double getOptionPrice() {
		return optionPrice;
	}
	public void setOptionPrice(double optionPrice) {
		this.optionPrice = optionPrice;
	}
	
	// the toString method is used to return a textual form of the option
	public String toString(){
		if (this.optionName !=null && !this.optionName.equals("")){
			return this.optionName;
		}
		
		return "";
	}
}