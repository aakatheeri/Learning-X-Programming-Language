package Exercises;

import java.awt.Font;

import javax.swing.*;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;

public class JList_assignment implements ListSelectionListener {

	JList hobbiesList;
	
	int appWidth = 350;
	int appHeight = 180;
	JLabel numberOfHobbies;
	
	public JPanel createMainPanel() {
		
		// Create total panel
		JPanel totalPanel = new JPanel();
		totalPanel.setLayout(null);
		totalPanel.setSize(this.appWidth, this.appHeight);
		totalPanel.setLocation(0, 0);
		
		// Create title label
		JLabel title = new JLabel("Choose your hobbies");
		title.setFont(new Font("Heltavita", Font.BOLD, 14));
		title.setSize(190, 30);
		title.setLocation(10, 5);
		totalPanel.add(title);
		
		// Create a list of hobbies
		String hobbies[] = {"Football", "Swimming", "Running", "Photography", "Reading", "Writing"};
		hobbiesList = new JList(hobbies);
		hobbiesList.setSize(this.appWidth/2, this.appHeight - 70);
		hobbiesList.setLocation(10, 35);
		hobbiesList.addListSelectionListener(this);
		totalPanel.add(hobbiesList);
		
		numberOfHobbies = new JLabel("0");
		numberOfHobbies.setFont(new Font("Heltavita", Font.BOLD, 16));
		numberOfHobbies.setSize(30, 30);
		numberOfHobbies.setLocation(this.appWidth-80, this.appHeight/2 - 20);
		totalPanel.add(numberOfHobbies);
		
		
		return totalPanel;
	}
	
	public void valueChanged(ListSelectionEvent e) {
		
		//System.out.println(hobbiesList.getSelectedIndices().length);
		numberOfHobbies.setText(new Integer(hobbiesList.getSelectedIndices().length).toString());
		
	}
	
	private static void createGUIComponents() {
		
		JFrame.setDefaultLookAndFeelDecorated(true);
		JFrame frame = new JFrame("++ Choose your hobbies ++");
		
		JList_assignment rAs = new JList_assignment();
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
