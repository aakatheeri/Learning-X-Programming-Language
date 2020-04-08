package Exercises;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.*;

public class Menu_assignment implements ActionListener {
	
	JLabel countryDisplay;
	public JPanel createMainPanel() {
		
		// Create total panel
		JPanel totalPanel = new JPanel();
		totalPanel.setLayout(null);
		totalPanel.setSize(200,200);
		totalPanel.setLocation(0,0);
		
		// Create countries names in String class array
		String[] itemStr = {"Select your country","UAE", "KSA", "Bahrain", "Kuwait", "Oman", "Yemen", "Iraq", "Iran", "Jordan", "Palestine", "Syria", "Turkia", "Egypt", "Sudan", "Libya", "Morroco", "Tunsia", "Algeria", "Somalia"};
		
		// Create Menu of countries items
		JComboBox countries = new JComboBox(itemStr);
		countries.setLocation(10, 10);
		countries.setSize(380, 30);
		countries.setSelectedIndex(0);
		countries.addActionListener(this);
		totalPanel.add(countries);
		
		// Create label to display country chosen
		countryDisplay = new JLabel();
		countryDisplay.setSize(390, 30);
		countryDisplay.setLocation(10, 100 - 60);
		countryDisplay.setHorizontalAlignment(SwingConstants.CENTER);
		totalPanel.add(countryDisplay);
		
		totalPanel.setOpaque(true);
		return totalPanel;
	}
	
	public void actionPerformed(ActionEvent e) {
		
		JComboBox cb = (JComboBox)e.getSource();
		String countryName = (String)cb.getSelectedItem();
		
		if (!countryName.equals("Select your country")) {
			countryDisplay.setText(countryName);
		} else {
			countryDisplay.setText("");
		}
		
	}
	
	private static void createGUIComponents() {
		
		JFrame.setDefaultLookAndFeelDecorated(true);
		JFrame frame = new JFrame("++ Choose your country ++");
		
		Menu_assignment meneAs = new Menu_assignment();
		frame.setContentPane(meneAs.createMainPanel());
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setSize(400, 100);
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
