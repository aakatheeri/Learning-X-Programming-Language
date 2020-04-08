package Exercises;

import java.awt.Color;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;

import javax.swing.*;

public class Checkboxes_assignment implements ItemListener {
	
	JCheckBox firstItem, secondItem, thirdItem, forthItem, fifthItem, sixthItem;
	int numberOfHoppies = 0;
	JLabel label;
	public JPanel createMainPanel() {
		
		// Create total panel
		JPanel totalPanel = new JPanel();
		totalPanel.setLayout(null);
		totalPanel.setSize(400,400);
		totalPanel.setLocation(0,0);
		
		firstItem = createCheckBox("CIT 225", false, 100, 20, 10, 10);
		secondItem = createCheckBox("CIT 255", false, 100, 20, 10, 40);
		thirdItem = createCheckBox("CIT 215", false, 100, 20, 10, 70);
		forthItem = createCheckBox("CIT 235", false, 150, 20, 150, 10);
		fifthItem = createCheckBox("CIT 360", false, 100, 20, 150, 40);
		sixthItem = createCheckBox("CIT 210", false, 100, 20, 150, 70);
		
		totalPanel.add(firstItem);
		totalPanel.add(secondItem);
		totalPanel.add(thirdItem);
		totalPanel.add(forthItem);
		totalPanel.add(fifthItem);
		totalPanel.add(sixthItem);
		
		// Create text display
		label = new JLabel("Your subjects are " + numberOfHoppies);
		label.setForeground(Color.GRAY);
		label.setSize(400, 50);
		label.setLocation(18, 90);
		totalPanel.add(label);
		
		totalPanel.setOpaque(true);
		return totalPanel;
	}
	
	public JCheckBox createCheckBox(String title, boolean isSelected, int width, int height, int xPoint, int yPoint) {
		JCheckBox checkItem = new JCheckBox(title);
		checkItem.setSelected(isSelected);
		checkItem.setSize(width, height);
		checkItem.setLocation(xPoint, yPoint);
		checkItem.addItemListener((ItemListener) this);
		
		return checkItem;
	}
	
	public void itemStateChanged(ItemEvent e) {
		
		Object source = e.getItemSelectable();
		
		if (source == firstItem) {
			if(firstItem.isSelected() == true) {
				numberOfHoppies+=1;
				label.setText("Your subjects are " + numberOfHoppies);
			} else {
				numberOfHoppies-=1;
				label.setText("Your subjects are " + numberOfHoppies);
			}
		} else if (source == secondItem) {
			if(secondItem.isSelected() == true) {
				numberOfHoppies+=1;
				label.setText("Your subjects are " + numberOfHoppies);
			} else {
				numberOfHoppies-=1;
				label.setText("Your subjects are " + numberOfHoppies);
			}
		} else if (source == thirdItem) {
			if(thirdItem.isSelected() == true) {
				numberOfHoppies+=1;
				label.setText("Your subjects are " + numberOfHoppies);
			} else {
				numberOfHoppies-=1;
				label.setText("Your subjects are " + numberOfHoppies);
			}
		} else if (source == forthItem) {
			if(forthItem.isSelected() == true) {
				numberOfHoppies+=1;
				label.setText("Your subjects are " + numberOfHoppies);
			} else {
				numberOfHoppies-=1;
				label.setText("Your subjects are " + numberOfHoppies);
			}
		} else if (source == fifthItem) {
			if(fifthItem.isSelected() == true) {
				numberOfHoppies+=1;
				label.setText("Your subjects are " + numberOfHoppies);
			} else {
				numberOfHoppies-=1;
				label.setText("Your subjects are " + numberOfHoppies);
			}
		} else if (source == sixthItem) {
			if(sixthItem.isSelected() == true) {
				numberOfHoppies+=1;
				label.setText("Your subjects are " + numberOfHoppies);
			} else {
				numberOfHoppies-=1;
				label.setText("Your subjects are " + numberOfHoppies);
			}
		}
		
	}
	
	private static void createGUIComponents() {
		
		JFrame.setDefaultLookAndFeelDecorated(true);
		JFrame frame = new JFrame("++ Choose your subjects ++");
		
		Checkboxes_assignment chAs = new Checkboxes_assignment();
		frame.setContentPane(chAs.createMainPanel());
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setSize(400, 160);
		frame.setVisible(true);
	}
	
	public static void main(String[] args) {

		// Using Swing Uility invokeLayer class to run GUI program
		SwingUtilities.invokeLater(new Runnable() {
			public void run() {
				createGUIComponents();
			}
		});
				
	}
}
