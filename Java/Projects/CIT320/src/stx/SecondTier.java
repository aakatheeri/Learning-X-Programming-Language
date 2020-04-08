package stx;
import javax.swing.*;
import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;


public class SecondTier implements ActionListener {
	
	JPanel totalPanel, firstPanel, lastPanel, agePanel;
	JLabel firstnameLabel, lastnameLabel, ageLabel;
	JTextField firstnameTextField, lastnameTextField, ageTextField;
	JButton submitButton;
	
	public JPanel createPaneComponents() {
		
		// Main Panel
		totalPanel = new JPanel();
		totalPanel.setLayout(null);
		totalPanel.setLocation(0,0);
		totalPanel.setSize(280, 155);
		
		// first, last, age panels
		firstPanel = new JPanel();
		firstPanel.setLayout(null);
		firstPanel.setLocation(0,3);
		firstPanel.setSize(290, 30);
		totalPanel.add(firstPanel);
		
		lastPanel = new JPanel();
		lastPanel.setLayout(null);
		lastPanel.setLocation(0,38);
		lastPanel.setSize(290, 30);
		totalPanel.add(lastPanel);
		
		agePanel = new JPanel();
		agePanel.setLayout(null);
		agePanel.setLocation(0,73);
		agePanel.setSize(290, 30);
		totalPanel.add(agePanel);
		
		// first, last, age labels
		firstnameLabel = new JLabel("Firstname");
		firstnameLabel.setLocation(0,4);
		firstnameLabel.setSize(80, 30);
		firstnameLabel.setForeground(Color.black);
		firstnameLabel.setHorizontalAlignment(SwingConstants.RIGHT);
		firstPanel.add(firstnameLabel);
		
		lastnameLabel = new JLabel("Lastname");
		lastnameLabel.setLocation(0,4);
		lastnameLabel.setSize(80, 30);
		lastnameLabel.setHorizontalAlignment(SwingConstants.RIGHT);
		lastnameLabel.setForeground(Color.black);
		lastPanel.add(lastnameLabel);
		
		ageLabel = new JLabel("Age");
		ageLabel.setLocation(0,4);
		ageLabel.setSize(80, 30);
		ageLabel.setHorizontalAlignment(SwingConstants.RIGHT);
		ageLabel.setForeground(Color.black);
		agePanel.add(ageLabel);
		
		// first, last, age textfield
		firstnameTextField = new JTextField();
		firstnameTextField.setLocation(90, 10);
		firstnameTextField.setSize(180, 20);
		firstPanel.add(firstnameTextField);
		
		lastnameTextField = new JTextField();
		lastnameTextField.setLocation(90, 10);
		lastnameTextField.setSize(180, 20);
		lastPanel.add(lastnameTextField);
		
		ageTextField = new JTextField();
		ageTextField.setLocation(90, 10);
		ageTextField.setSize(180, 20);
		agePanel.add(ageTextField);
		
		submitButton = new JButton("Show");
		submitButton.addActionListener(this);
		submitButton.setSize(50, 20);
		submitButton.setLocation(totalPanel.getWidth()-62, totalPanel.getHeight()-40);
		totalPanel.add(submitButton);
		
		totalPanel.setOpaque(true);
		return totalPanel;
		
	}
	
	private static void createGUIComponents() {
		
		JFrame.setDefaultLookAndFeelDecorated(true);
		JFrame frame = new JFrame("++ Your Information ++");
		
		SecondTier sTier = new SecondTier();
		frame.setContentPane(sTier.createPaneComponents());
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setSize(290, 170);
		frame.setVisible(true);
	}
	
	public void actionPerformed(ActionEvent e) {
		if(e.getSource() == submitButton) {
			
			if (firstnameTextField.getText().trim().length() != 0 && lastnameTextField.getText().trim().length() != 0 && ageTextField.getText().trim().length() != 0) {
				
				firstnameLabel.setForeground(Color.black);
				lastnameLabel.setForeground(Color.black);
				ageLabel.setForeground(Color.black);
				
				String[] values = {firstnameTextField.getText(), lastnameTextField.getText(), ageTextField.getText()};
				SecondTierResults sTR = new SecondTierResults();
				sTR.includeValuesToDisplay(values);
				sTR.perform();
				
			} else {
				
				if (firstnameTextField.getText().trim().length() == 0) {
					firstnameLabel.setForeground(Color.red);
				} else {
					firstnameLabel.setForeground(Color.black);
				}
				
				if (lastnameTextField.getText().trim().length() == 0) {
					lastnameLabel.setForeground(Color.red);
				} else {
					lastnameLabel.setForeground(Color.black);
				}
				
				if (ageTextField.getText().trim().length() == 0) {
					ageLabel.setForeground(Color.red);
				} else {
					ageLabel.setForeground(Color.black);
				}
			}
		}
	}
	
	public static void main (String args[]) {
		
		SwingUtilities.invokeLater(new Runnable() {
			public void run() {
				createGUIComponents();
			}
		});
		
	}
}
