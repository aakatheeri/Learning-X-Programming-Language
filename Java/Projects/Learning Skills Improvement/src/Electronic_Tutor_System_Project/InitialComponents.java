package Electronic_Tutor_System_Project;

import java.awt.event.ActionListener;

import javax.swing.*;

public class InitialComponents {

	
	public JFrame createFrame(String title, int width, int height, JPanel pane, boolean isExitByCloseIcon) {
		JFrame newFrame = new JFrame(title);
		//JFCInitial jfi = new JFCInitial(this.AppName);
		
		JFrame.setDefaultLookAndFeelDecorated(true);
		newFrame.setContentPane(pane);
		if (isExitByCloseIcon == true) {
			newFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		}
		newFrame.setSize(width, height);
		newFrame.setVisible(true);
		
		return newFrame;
	}
	
	public JPanel createPanel(int width, int height, int xPoint, int yPoint, boolean isOpaque) {
		JPanel view = new JPanel();
		view.setLayout(null);
		view.setSize(width, height);
		view.setLocation(xPoint,yPoint);
		view.setOpaque(isOpaque);
		
		return view;
		
	}
	
	public JLabel createLabel(String title, int width, int height, int xPoint, int yPoint) {
		JLabel label = new JLabel(title);
		label.setSize(width, height);
		label.setLocation(xPoint, yPoint);
		return label;
	}
	
	public JTextField createTextField(String title, int width, int height, int xPoint, int yPoint, boolean isEnabled) {
		JTextField textField = new JTextField(title);
		textField.setSize(width, height);
		textField.setLocation(xPoint, yPoint);
		if (isEnabled == true) {
			textField.setEnabled(true);
		}
		return textField;
		
	}
	
	public JButton createButton(String title, int width, int height, int xPoint, int yPoint) {
		JButton button = new JButton(title);
		button.setSize(width, height);
		button.setLocation(xPoint, yPoint);
		
		return button;
		
	}
	
	public JRadioButton createRadioButton(String title, boolean status, int width, int height, int xPoint, int yPoint) {
		JRadioButton button = new JRadioButton(title, status);
		button.setSize(width, height);
		button.setLocation(xPoint, yPoint);
		return button;
	}
	
	public String createContent(String content) {
		
		String contentValue = "<html><body>" + content +"</body></html>";
		return contentValue;
		
	}
	
}
