package dvm;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Component;
import java.awt.Container;
import java.awt.Cursor;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.GridLayout;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.text.DecimalFormat;

import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.border.Border;
import javax.swing.border.TitledBorder;

// a class that represent the vending machine. It inherits JFrame to be displayed as a window and implements listeners to respond to events
public class DrinksVendingMachine extends JFrame implements ActionListener , MouseListener{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4;
	
	// frame dimensions
	private static final int WIDTH = 735;
	private static final int HEIGHT = 700;
	
	
	// labels to be updated
	private JLabel selectedDrinkValueLabel = new JLabel("-");  // a label to present a textual form of the selected drink (with or without optional extra)
	private JLabel totalPriceValueLabel = new JLabel("0.00");  // a label to present the total price of the selected drink (with or without optional extra)
	private JLabel moneyInsertedValueLabel = new JLabel("0.00"); // a label to present the total of coins inserted

	private Drink selectedDrink = null; // a status variable to keep a cloned copy of the selected drink (with or without optional extra)
	private double moneyInserted = 0.00d; // a numeric variable to keep the total of coins inserted
	
	private JButton cancelButton; // the Cancel button (to reset the machine)
	private JButton doneButton; // the Done button (to complete a transaction)
	
	// an array of available drinks (of type Drink that inherits JButton)
	private Drink [] drinks = new Drink [] {
		new Drink("Coffee Black", 3, "resources/blackcoffee.png", true),
		new Drink("Coffee White", 5, "resources/whtieCoffee.png", true),
		new Drink("Tea Black", 3, "resources/blacktea.png", true),
		new Drink("Tea White", 6, "resources/whitetea.png", true),
		new Drink("Hot Chocolate", 5, "resources/hotechocolate.png", true),
		new Drink("Orange Juice", 6, "resources/orangeJuice.png", false),
		new Drink("Tomato Soup", 8, "resources/tomatoSoup.png", false),
	};
	
	// a constructor to initiate the Vending Machine
	public DrinksVendingMachine(){
		this.setTitle("Drink Vending Machine"); // setting the JFrame (window) title
		
		// next is a standard snippet to display the frame in the screen's center
		Toolkit myTK = Toolkit.getDefaultToolkit();
		Dimension myD = myTK.getScreenSize();
		setBounds((myD.width - DrinksVendingMachine.WIDTH)/2, (myD.height - DrinksVendingMachine.HEIGHT)/2, DrinksVendingMachine.WIDTH, DrinksVendingMachine.HEIGHT);
		
		// next is a standard snippet to respond to window closing event by exiting the application
		addWindowListener(new WindowAdapter(){
				public void windowClosing(WindowEvent e) {
					System.exit(0);
				} // END windowClosing(WindowEvent e)
			}// END WindowAdapter()
		); // END addWindowListener()
		
		this.initialize(); // a call to the inner method "initialize" to prepare graphical elements
		
		this.setResizable(false); // setting the window not to be resizable
	}
	
	private void initialize(){
		Font customFont = new Font("Serif", Font.BOLD, 18); // font object to be used for labels
		Border blackline = BorderFactory.createLineBorder(Color.black); // border to be used for panels
		
		// This retrieves the content pane to which we will add all graphical elements
		Container contentPane = getContentPane(); // Get the pane.
		contentPane.setLayout(new BorderLayout()); // This sets the layout to the BorderLayout.
		
		JPanel buttonsPanel = new JPanel(); // the panel where all buttons (drinks) will be displayed
		buttonsPanel.setLayout(new GridLayout(7,1)); // buttons will be displayed as a vertical list, hence their panel's layout will a grid of 7 rows and 1 column
		
		// next lines create and sets a titled border for drinks list
		TitledBorder bottonsPanelTitle = BorderFactory.createTitledBorder(blackline, "Drinks");
		bottonsPanelTitle.setTitleJustification(TitledBorder.CENTER);
		bottonsPanelTitle.setTitleFont(customFont);
		bottonsPanelTitle.setTitleColor(Color.RED);
		buttonsPanel.setBorder(bottonsPanelTitle);
		
		// the next loop iterates through the drinks (buttons) to add each to the drinks panel and assign the current object as an event listener. When a button
		// is clicked (a drink is chosen), the actionPerformed method will be called to process the event
		for (int i=0; i<this.drinks.length; i++){
			this.drinks[i].addActionListener(this);
			buttonsPanel.add(this.drinks[i]);
		}
		
		// adding the drinks panel to the West area of the main frame.
		contentPane.add(buttonsPanel, BorderLayout.WEST);
		
		// a main area panel to hold options, coins, and labels with the layout as border layout
		JPanel mainAreaPanel = new JPanel();
		mainAreaPanel.setLayout(new BorderLayout());
		
		// a panel to hold options and coins nested panels. Then later is added to the north of the main area panel 
		// the layout is FlowLayout to display both options' panel and coins' panel adjacently
		JPanel optionsCoinsPanel = new JPanel();
		optionsCoinsPanel.setLayout(new FlowLayout());
		
		// a panel to hold options as adjacent labels (flowlayout as the second line below shows)
		JPanel optionsPanel = new JPanel();
		optionsPanel.setLayout(new FlowLayout());
		optionsPanel.setPreferredSize(new Dimension(275, 140)); // preferred size to accommodate the two options
		TitledBorder optionsPanellTitle = BorderFactory.createTitledBorder(blackline, "Optional Extra");  // the line and the next 4 lines create and set a titled border for options panel
		optionsPanellTitle.setTitleJustification(TitledBorder.CENTER);
		optionsPanellTitle.setTitleFont(customFont);
		optionsPanellTitle.setTitleColor(Color.RED);
		optionsPanel.setBorder(optionsPanellTitle);
		Options.SUGER.addMouseListener(this); // this line and the next one set the current object to listen to mouse events on options (to control mouse cursor and respond to clicking on options)
		Options.EXTRA_STRONG.addMouseListener(this);
		optionsPanel.add(Options.SUGER); // this line and the next one add the options (labels) to the options panel where they are displayed adjacently
		optionsPanel.add(Options.EXTRA_STRONG);
		
		// adding options panel to the optionsocinspanel that is meant to hold options and coins nested panels
		optionsCoinsPanel.add(optionsPanel);
		
		// a panel to hold coins as adjacent labels (flowlayout as the second line below shows)
		JPanel coinsPanel = new JPanel();
		coinsPanel.setLayout(new FlowLayout());
		coinsPanel.setPreferredSize(new Dimension(270, 140)); // preferred size to accommodate the three UAE standard coins
		TitledBorder coinsPanelTitle = BorderFactory.createTitledBorder(blackline, "Insert Coins"); // this line and the next 4 lines create and set a titled border for coins panel
		coinsPanelTitle.setTitleJustification(TitledBorder.CENTER);
		coinsPanelTitle.setTitleFont(customFont);
		coinsPanelTitle.setTitleColor(Color.RED);
		coinsPanel.setBorder(coinsPanelTitle);

		Coins.QUARTER.addMouseListener(this);// this line and the next one set the current object to listen to mouse events on coins (to control mouse cursor and respond to clicking on coins)
		Coins.HALF.addMouseListener(this);
		Coins.ONE_DIRHAM.addMouseListener(this);
		coinsPanel.add(Coins.QUARTER); // this line and the next two add the coins (labels) to the coins panel where they are displayed adjacently
		coinsPanel.add(Coins.HALF);
		coinsPanel.add(Coins.ONE_DIRHAM);
		
		// adding coins panel to the optionsocinspanel that is meant to hold options and coins nested panels
		optionsCoinsPanel.add(coinsPanel);
		
		// adding optionsocinspanel to the north of the main area panel (so far we have drinks to the west, optionsocinspanel (with nested options and coins panels) to the north of the main area panel)
		mainAreaPanel.add(optionsCoinsPanel, BorderLayout.NORTH);
		
		// a panel to hold labels panel and a space filler panel 
		// the layout is FlowLayout border layout (space filler to the north to serve as a separator from options/coins panel and the actual label panel)
		JPanel labelsContainerPanel = new JPanel();
		labelsContainerPanel.setLayout(new BorderLayout());
		TitledBorder labelsContainerPanelTitle = BorderFactory.createTitledBorder(blackline, "Machine Status Information"); // this line and the next 4 lines create and set a titled border for label container panel
		labelsContainerPanelTitle.setTitleFont(customFont);
		labelsContainerPanelTitle.setTitleColor(Color.RED);
		labelsContainerPanelTitle.setTitleJustification(TitledBorder.LEFT);
		labelsContainerPanel.setBorder(labelsContainerPanelTitle);

		// the extra space filler panel, added to the north of label container panel with a height of 60 (which represents the actual space that separates labels from options/conins panel)
		JPanel spaceFillerPanel = new JPanel();
		spaceFillerPanel.setPreferredSize(new Dimension(500, 60));
		labelsContainerPanel.add(spaceFillerPanel, BorderLayout.NORTH);

		// the actual label panel, layout is a gird of 3 lines and two columns
		JPanel labelsPanel = new JPanel();
		labelsPanel.setLayout(new GridLayout(3, 2));
		
		// initiating and adding labels to labels' panel 
		JLabel selectedDrinkLabel = new JLabel("        Selected Drink:");
		selectedDrinkLabel.setFont(customFont);
		selectedDrinkLabel.setVerticalAlignment(JLabel.TOP);
		this.selectedDrinkValueLabel = new JLabel("-");
		this.selectedDrinkValueLabel.setFont(customFont);
		this.selectedDrinkValueLabel.setVerticalAlignment(JLabel.TOP);
		JLabel totalPriceLabel = new JLabel("        Total Price:");
		totalPriceLabel.setFont(customFont);
		totalPriceLabel.setVerticalAlignment(JLabel.TOP);
		this.totalPriceValueLabel = new JLabel("0.00");
		this.totalPriceValueLabel.setFont(customFont);
		this.totalPriceValueLabel.setVerticalAlignment(JLabel.TOP);
		JLabel moneyInsertedLabel = new JLabel("        Money Inserted:");
		moneyInsertedLabel.setFont(customFont);
		moneyInsertedLabel.setVerticalAlignment(JLabel.TOP);
		this.moneyInsertedValueLabel = new JLabel("0.00");
		this.moneyInsertedValueLabel.setFont(customFont);
		this.moneyInsertedValueLabel.setVerticalAlignment(JLabel.TOP);
		
		labelsPanel.add(selectedDrinkLabel);
		labelsPanel.add(selectedDrinkValueLabel);
		labelsPanel.add(totalPriceLabel);
		labelsPanel.add(totalPriceValueLabel);
		labelsPanel.add(moneyInsertedLabel);
		labelsPanel.add(moneyInsertedValueLabel);
		
		// adding labels' panel to labels container panel in the center location
		labelsContainerPanel.add(labelsPanel, BorderLayout.CENTER);

		// adding labels container panel to labels main area panel in the center location
		mainAreaPanel.add(labelsContainerPanel, BorderLayout.CENTER);

		// adding labels main area panel to the frame
		contentPane.add(mainAreaPanel, BorderLayout.CENTER);
		
		// initiating cancel/done buttons with the current object as their event listener. 
		this.doneButton = new JButton("Done");
		this.doneButton.addActionListener(this);
		this.doneButton.setEnabled(false); // done button is initially disabled
		this.doneButton.setPreferredSize(new Dimension(120, 40));
		this.cancelButton = new JButton("Cancel");
		this.cancelButton.addActionListener(this);
		this.cancelButton.setPreferredSize(new Dimension(120, 40));
		
		// creating a panel to hold done/cancel buttons adjacently (Flowlayout) and aligned to the center
		JPanel doneCanclePanel = new JPanel();
		doneCanclePanel.setPreferredSize(new Dimension(600, 110));
		doneCanclePanel.setLayout(new FlowLayout(FlowLayout.CENTER, 30, 35));
		
		// adding done/cancel buttons to the panel
		doneCanclePanel.add(this.doneButton);
		doneCanclePanel.add(this.cancelButton);

		// adding done/cancel panel to the bottom of the frame
		contentPane.add(doneCanclePanel, BorderLayout.SOUTH);

	}
	
	// the following method resets the machine
	private void reset(){
		this.moneyInserted = 0.00d; // setting inserted money to zero
		this.selectedDrink = null; // setting inserted money to none
		this.selectedDrinkValueLabel.setText("-"); // showing no textual represenation of a selected drink
		this.totalPriceValueLabel.setText("0.00"); // setting total price of selected drinks to zero
		this.moneyInsertedValueLabel.setText("0.00"); // setting textual represenation of inserted money to zero
		this.doneButton.setEnabled(false); // disabling the done button
	}
	
	//@Override
	public void actionPerformed(ActionEvent event) {
		if (event.getSource() instanceof JButton){ // if the event is coming from a button
			if (event.getSource().equals(this.cancelButton)){ // if the cancel button is clicked
				
				double change = this.moneyInserted; // keep a copy of the change
				
				this.reset(); // reset the machine
				
				if (change > 0){ // if the a change is to be returned
					DecimalFormat decimalFormat = new DecimalFormat("#.##");
					
					String message = "You have purchased no items \n" +
							"Returned Change: " + decimalFormat.format(change) + "  AED";

					// showing a message with full amount returned
					JOptionPane.showMessageDialog(this, message , "Receipt", JOptionPane.INFORMATION_MESSAGE);
				}
			}else if (event.getSource().equals(this.doneButton)){  // if the done button is clicked
				if (this.selectedDrink == null){  // if no drink is selected
					 // a message to tell the user to select a drink before proceeding with the transaction
					JOptionPane.showMessageDialog(this, "No drink is selected. Please, select a drink first" , "Error", JOptionPane.ERROR_MESSAGE); 
				}else if ((this.selectedDrink.getDrinkPrice() - this.moneyInserted) > 0){  // if there is no enough money inserted
					 // a message to tell the user to insert enough coins before proceeding with the transaction
					JOptionPane.showMessageDialog(this, "Please, insert enough coins" , "Error", JOptionPane.ERROR_MESSAGE);
				}else { // done botton is clicked, a drink is selected, enough money is there, finalizing transactino
					double change = this.moneyInserted - this.selectedDrink.getDrinkPrice(); // calculating change
					DecimalFormat decimalFormat = new DecimalFormat("#.##");

					// preparing a message with transaction information
					String message = "You have purchased " + this.selectedDrink.toString() + "\n" +
							"Price: " +  this.selectedDrink.getDrinkPrice() + "  AED\n" +
							"Returned Change: " + decimalFormat.format(change) + "  AED";
					
					this.reset(); // reseting the machine
					
					// showing a message with transaction information
					JOptionPane.showMessageDialog(this, message , "Receipt", JOptionPane.INFORMATION_MESSAGE);
				}
			}else if (event.getSource() instanceof Drink){ // if the drink button is clicked
				this.selectedDrink = ((Drink)event.getSource()).clone(); // preparing a local copy of the selected drink
				this.selectedDrinkValueLabel.setText("<html>" + this.selectedDrink.toString() + "<html>"); // updating the textual represenation of the selected drink 
				DecimalFormat decimalFormat = new DecimalFormat("#.##");
				this.totalPriceValueLabel.setText(decimalFormat.format(this.selectedDrink.getDrinkPrice()) + "  AED"); // updating the textual represenation of the price

				// enable done button if there is enough money to finalize the transaction
				if (this.moneyInserted - this.selectedDrink.getDrinkPrice() >= 0){
					this.doneButton.setEnabled(true);
				}else{
					this.doneButton.setEnabled(false);
				}
			}else{
				// do nothing, just kept as an alternative path for completion purpose
			}
		}
	}

	//@Override
	public void mouseClicked(MouseEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	//@Override
	public void mouseEntered(MouseEvent event) {
		((Component)event.getSource()).setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));		
	}

	//@Override
	public void mouseExited(MouseEvent event) {
		((Component)event.getSource()).setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
	}

	//@Override
	public void mousePressed(MouseEvent arg0) {
		// TODO Auto-generated method stub
	}

	//@Override
	public void mouseReleased(MouseEvent event) {
		if (event.getSource() instanceof Option){ // if the mouse was clicked and released over an option (label)
			if (this.selectedDrink == null){ // if no drink is selected show an error message
				JOptionPane.showMessageDialog(this, "No drink is selected. Please, select a drink first" , "Error", JOptionPane.ERROR_MESSAGE);
			}else if (!this.selectedDrink.isOptionnable()){ // if the selected drink is not subject for an optional extra show an error message
				JOptionPane.showMessageDialog(this, this.selectedDrink.toString() + " can not take an extra option" , "Error", JOptionPane.ERROR_MESSAGE);
			}else{ // a drink is selected and can take an option
				Option option = (Option)event.getSource();
				this.selectedDrink.addOption(option); // update the selected drink's option
				
				this.selectedDrinkValueLabel.setText("<html>" + this.selectedDrink.toString() + "</html>"); // update the label that describes the selected drink
				
				DecimalFormat decimalFormat = new DecimalFormat("#.##");
				this.totalPriceValueLabel.setText(decimalFormat.format(this.selectedDrink.getDrinkPrice()) + "  AED"); // update the label that describes the selected drink's price
				
				// enable done button if there is enough money to finalize the transaction
				if (this.moneyInserted - this.selectedDrink.getDrinkPrice() >= 0){
					this.doneButton.setEnabled(true);
				}else{
					this.doneButton.setEnabled(false);
				}
			}
			
		}else if (event.getSource() instanceof Coin){  // if the mouse was clicked and released over a coin (label)
			Coin coin = (Coin)event.getSource();
			this.moneyInserted += coin.getValue(); // adding the coin's value to the total money inserted
			
			DecimalFormat decimalFormat = new DecimalFormat("#.##");
			this.moneyInsertedValueLabel.setText(decimalFormat.format(this.moneyInserted) + "  AED"); // update the label that describes the amount of money inserted
			
			// enable done button if there is enough money to finalize the transaction
			if (this.selectedDrink != null && (this.moneyInserted - this.selectedDrink.getDrinkPrice() >= 0)){
				this.doneButton.setEnabled(true);
			}else{
				this.doneButton.setEnabled(false);
			}
		}else{
			// do nothing, just kept as an alternative path for completion purpose
		}
	}

	// a main method to run the application
	public static void main(String [] args){
		// creating an instance of the vending machine and making it visible
		new DrinksVendingMachine().setVisible(true);
	}
}