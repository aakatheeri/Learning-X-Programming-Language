package dvm;

import java.awt.Dimension;
import java.awt.Toolkit;
import java.util.Vector;

import javax.swing.Icon;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.SwingConstants;

// This class is used to represent a Drink
// The class extends JButton so that it can give more event-driven rendering flexibility

public class Drink extends JButton{
	private static final long serialVersionUID = 2L;
	private String drinkName; // Drink Name to be placed on the relevant button
	private double drinkPrice; // Drink Price to be used
	private Vector<Option> options = null; // Drink Option to be used - if applicable
	private boolean optionnable; // a flag to mark a drink that can take an Optional Extra

	/* A constructors to initiate the Drink object */
	public Drink(String drinkName, double drinkPrice, String icon, boolean optionnable){
		super(new ImageIcon(Toolkit.getDefaultToolkit().getImage(Drink.class.getResource(icon)))); // initiate the parent JButton class with the icon passed as a parameter
		this.setText(drinkName); // setting the text to appear on the button to the drink name
		this.setVerticalTextPosition(SwingConstants.BOTTOM); // button text to be vertically aligned to the buttons' bottom area
		this.setHorizontalTextPosition(SwingConstants.CENTER); // button content to be center aligned
		this.drinkName = drinkName; // setting the drink name
		this.drinkPrice = drinkPrice; // setting the drink price
		this.optionnable = optionnable; // setting the drink's optionnable flag
		this.setPreferredSize(new Dimension(160, 100)); // setting the button's preferred size
	}

	/* A constructor to initiate the Drink object */
	public Drink(String drinkName, double drinkPrice, Icon icon, boolean optionnable){
		super(icon); // initiate the parent JButton class with the icon passed as a parameter
		this.setText(drinkName); // setting the text to appear on the drink button to the drink name
		this.setVerticalTextPosition(SwingConstants.BOTTOM);
		this.setHorizontalTextPosition(SwingConstants.CENTER);
		this.drinkName = drinkName; // setting the drink name
		this.drinkPrice = drinkPrice; // setting the drink price
		this.optionnable = optionnable; // setting the drink's optionnable flag
		this.setPreferredSize(new Dimension(160, 100)); // setting the drink button's preferred size
	}

	/* A constructor to initiate the Drink object with options */
	public Drink(String drinkName, double drinkPrice, Icon icon, Vector<Option> options){
		super(icon); // initiate the parent JButton class with the icon passed as a parameter
		this.drinkName = drinkName; // setting the drink name
		this.drinkPrice = drinkPrice; // setting the drink price
		this.options = options; // setting the drink options (a vector of type Option)
		this.optionnable = true; // setting the drink's optionnable flag to true (marked as passing options would imply)
		this.setPreferredSize(new Dimension(160, 100)); // setting the drink button's preferred size
	}

	/* following is a set of getters and setters for the Drink variables */
	public String getDrinkName() {
		return drinkName;
	}
	public void setDrinkName(String drinkName) {
		this.drinkName = drinkName;
	}
	public void setDrinkPrice(double drinkPrice) {
		this.drinkPrice = drinkPrice;
	}
	public Vector<Option> getOptions() {
		return this.options;
	}

	public void setOptions( Vector<Option> options) {
		this.options = options;
	}
	
	public void addOption(Option option){
		if (this.options == null){
			this.options = new Vector<Option>();
		}
		
		if (!this.options.contains(option)){
			this.options.add(option);
		}
	}

	public boolean isOptionnable() {
		return optionnable;
	}

	public void setOptionnable(boolean optionnable) {
		this.optionnable = optionnable;
	}

	// returns a calculated price based on the drink's price and the chosen options' prices
	public double getDrinkPrice() {
		if (this.optionnable && this.options != null){
			double price = this.drinkPrice;
			
			for (int i=0; i<this.options.size(); i++){
				price += this.options.get(i).getOptionPrice();
			}
			
			return  price;
		}
		
		return  this.drinkPrice;
	}

	
	// the toString method is used to return a textual form of the option
	public String toString(){
		String toStringValue = this.drinkName;
		
		if (this.optionnable && this.options != null){			
			if (this.options.size() > 0){
				toStringValue += "( ";
				for (int i=0; i<this.options.size(); i++){
					toStringValue += this.options.get(i);
					
					if (i < this.options.size() -1){
						toStringValue += " - ";
					}
				}
				toStringValue += " )";
				
				return toStringValue;
			}
			
			return  toStringValue;
		}
		
		return toStringValue;
	}
	
	// the clone method is used to clone the whole object. This is very important as it will be used to 
	// keep the status of the user selection without affecting the standard available drinks list
	public Drink clone(){
		if (this.optionnable){
			if (this.options != null){
				Vector<Option> clonedOptions = null;
				clonedOptions = new Vector<Option>();
				clonedOptions = (Vector<Option>)this.options.clone();
				return new Drink(this.drinkName, this.drinkPrice, this.getIcon(), clonedOptions);
			}else{
				return new Drink(this.drinkName, this.drinkPrice, this.getIcon(), true);
			}
		}else{
			return new Drink(this.drinkName, this.drinkPrice, this.getIcon(), false);
		}
	}
}
