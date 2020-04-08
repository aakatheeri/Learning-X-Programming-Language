package Exercises;

import java.awt.Color;
import java.awt.Font;
import java.awt.event.*;
import javax.swing.*;

public class Radio_assignment implements ActionListener {
	
	JLabel label;
	int appWidth = 300;
	int appHeight = 350;
	
	JRadioButton oneButton, twoButton, threeButton, fourButton, fiveButton, sixButton, sevenButton, eightButton, nineButton, tenButton;
	
	public JRadioButton createButton(String title, boolean status, int width, int height, int xPoint, int yPoint) {
		
		JRadioButton button = new JRadioButton(title, status);
		button.setSize(width, height);
		button.setLocation(xPoint, yPoint);
		button.addActionListener(this);
		return button;
	}
	
	public JPanel createMainPanel() {
		
		// Create total panel
		JPanel totalPanel = new JPanel();
		totalPanel.setLayout(null);
		totalPanel.setSize(this.appWidth, this.appHeight);
		totalPanel.setLocation(0, 0);
		
		// Create radio buttons of numbers
		oneButton = createButton("1", false, 50, 30, 10, 10);
		twoButton = createButton("2", false, 50, 30, 10, 40);
		threeButton = createButton("3", false, 50, 30, 10, 70);
		fourButton = createButton("4", false, 50, 30, 10, 100);
		fiveButton = createButton("5", false, 50, 30, 10, 130);
		sixButton = createButton("6", false, 50, 30, 10, 160);
		sevenButton = createButton("7", false, 50, 30, 10, 190);
		eightButton = createButton("8", false, 50, 30, 10, 220);
		nineButton = createButton("9", false, 50, 30, 10, 250);
		tenButton = createButton("10", false, 50, 30, 10, 280);
		
		ButtonGroup buttonGroup = new ButtonGroup();
		buttonGroup.add(oneButton);
		buttonGroup.add(twoButton);
		buttonGroup.add(threeButton);
		buttonGroup.add(fourButton);
		buttonGroup.add(fiveButton);
		buttonGroup.add(sixButton);
		buttonGroup.add(sevenButton);
		buttonGroup.add(eightButton);
		buttonGroup.add(nineButton);
		buttonGroup.add(tenButton);
		
		// Add radio buttons to total panel
		totalPanel.add(oneButton);
		totalPanel.add(twoButton);
		totalPanel.add(threeButton);
		totalPanel.add(fourButton);
		totalPanel.add(fiveButton);
		totalPanel.add(sixButton);
		totalPanel.add(sevenButton);
		totalPanel.add(eightButton);
		totalPanel.add(nineButton);
		totalPanel.add(tenButton);
		
		// Create and add label to total panel
		label = new JLabel();
		label.setFont(new Font("Heltavita", Font.BOLD, 20));
		label.setSize(200, 30);
		label.setLocation(this.appWidth/2 + 10, this.appHeight/2 - 30);
		totalPanel.add(label);
		return totalPanel;
	}
	
	public void actionPerformed(ActionEvent e) {
		label.setText(e.getActionCommand());
	}
	
	private static void createGUIComponents() {
		
		JFrame.setDefaultLookAndFeelDecorated(true);
		JFrame frame = new JFrame("++ Choose your favorite number ++");
		
		Radio_assignment rAs = new Radio_assignment();
		frame.setContentPane(rAs.createMainPanel());
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setSize(rAs.appWidth, rAs.appHeight);
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
