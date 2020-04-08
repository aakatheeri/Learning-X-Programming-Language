import java.awt.Color;
import java.awt.Font;
import java.awt.event.*;
import java.util.Arrays;

import javax.swing.*;

public class Practice_320_1 implements ActionListener {
	
	String [][] students = new String[2][3];
	String firstName[] = new String[students.length], lastName[] = new String[students.length], postCode[] = new String[students.length];
	int appWidth = 480, appHeight = 200;
	JButton sortButton, exportButton;
	JLabel sortResultMessage = new JLabel(""), exportResultMessage = new JLabel("");
	
	public JPanel mainPanel() {
		
		// Set up the total panel
		JPanel totalPanel = new JPanel();
		totalPanel.setLayout(null);
		totalPanel.setSize(this.appWidth,this.appHeight);
		totalPanel.setLocation(10,10);
		totalPanel.setOpaque(true);
		
		// Create two buttons
		sortButton = new JButton("Sort");
		sortButton.setSize(100, 40);
		sortButton.setLocation((this.appWidth/2) - 100 - sortButton.getWidth()/2, (this.appHeight/2) - 75);
		sortButton.addActionListener(this);
		totalPanel.add(sortButton);
		
		exportButton = new JButton("Export");
		exportButton.setSize(100, 40);
		exportButton.setLocation((this.appWidth/2) - 100 - exportButton.getWidth()/2, (this.appHeight/2) - 10);
		exportButton.addActionListener(this);
		totalPanel.add(exportButton);
		
		// Create message complete
		sortResultMessage.setSize(150,30);
		sortResultMessage.setForeground(new Color(89, 122, 32));
		sortResultMessage.setLocation(sortButton.getX()+120, sortButton.getY()+3);
		exportResultMessage.setSize(150,30);
		exportResultMessage.setForeground(new Color(89, 122, 32));
		exportResultMessage.setLocation(exportButton.getX()+120, exportButton.getY()+3);
		totalPanel.add(sortResultMessage);
		totalPanel.add(exportResultMessage);
		
		
		
		String separation = "	";
		
		//takeInputFromUser(students, separation);
		
		return totalPanel;
	}
	
	public void takeInputFromUser(String[][] array, String separation) {

		
		// Set titles of table
		array[0][0] = "First Name";
		array[0][1] = "Last Name";
		array[0][2] = "Post Code";
		
		System.out.println(array[0][0] + separation + array[0][1] + separation + array[0][2]);
		for(int i = 1; i < array.length; i++) {
			for(int j = 0; j < array[i].length; j++) {
				
				// Set up input from user to put student names
				firstName[i] = JOptionPane.showInputDialog("Enter First Name: ");
				
				// Set up input from user to put student names
				lastName[i] = JOptionPane.showInputDialog("Enter Last Name: ");
				
				// Set up input from user to put student names
				postCode[i] = JOptionPane.showInputDialog("Enter Postal Code: ");
				
				// Sign
				array [i][j] = firstName[i] + separation+separation + lastName[i] + separation+separation + "("+ postCode[i] +")";
				
				System.out.println(array [i][j]);
				
			}
		}
		
	}
	
	public static void createGUIComponents () {
		
		// Using current class in staic function
		Practice_320_1 currentClass = new Practice_320_1();
		
		// Create a frame
		JFrame frame = new JFrame("Data Sorting");
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setDefaultLookAndFeelDecorated(true);
		frame.setSize(currentClass.appWidth, currentClass.appHeight);
		frame.setVisible(true);
		
		// Set a panel
		Practice_320_1 ourClass = new Practice_320_1();
		frame.setContentPane(ourClass.mainPanel());
		
	}
	
	public void actionPerformed(ActionEvent e) {
		
		// Sorting students 2d array
		if(e.getSource() == sortButton) {
			Arrays.sort(students, students[2]);
			sortResultMessage.setText("Process Complete!");
			
		// Export students 2d array as a data file to somewhere in drive
		} else {
			
			exportResultMessage.setText("Process Complete!");
		}
		
	}
	
	public static void main(String[] args) {

		SwingUtilities.invokeLater(new Runnable() {
			public void run () {
				
				createGUIComponents();
			}
		});

	}

}
