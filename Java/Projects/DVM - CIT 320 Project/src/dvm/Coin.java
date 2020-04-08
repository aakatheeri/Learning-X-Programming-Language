package dvm;

import java.awt.Toolkit;
import javax.swing.ImageIcon;
import javax.swing.JLabel;

// This class is used to represent a coin as an icon (graphical element) and as a value
public class Coin extends JLabel{
	/**
	 * 
	 */
	private static final long serialVersionUID = 3L;
	
	private double value; // the value of the coin
	
	// a constructor to initiate the Coin object
	public Coin(double value, String name, String icon){
		super(new ImageIcon(Toolkit.getDefaultToolkit().getImage(Coin.class.getResource(icon)))); // initiate the parent JLabel class with the icon passed as a parameter 
		this.value = value; // setting the value of the coin
		this.setToolTipText(name); // a user friendly tool tip to show the value of the coin as no text will be displayed since the coin icon is representative enough 
	}
	
	// setters and getters
	public double getValue() {
		return value;
	}

	public void setValue(double value) {
		this.value = value;
	}
}
