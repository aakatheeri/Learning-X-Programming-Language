package stx;
import java.awt.Color;
import javax.swing.*;

public class SecondTierResults {
	
	static JFrame frame;
	
	static String[] values;
	
	public SecondTierResults() {
		
	}
	
	public JPanel mainPane() {
		JPanel totalPanel = new JPanel();
		totalPanel.setLayout(null);
		totalPanel.setSize(frame.getWidth()-10,frame.getHeight()-10);
		totalPanel.setLocation(5,5);
		
		// Display informaiton on total panel
		String information = "<html>Your name is " + values[0] + " " + values[1] + "<br>";
		information+="	And Your age is " + values[2] + "</html>";
		
		JLabel label = new JLabel(information);
		label.setLocation(10,10);
		label.setSize(totalPanel.getWidth()-10, totalPanel.getHeight()-10);
		label.setForeground(Color.darkGray);
		label.setHorizontalAlignment(SwingConstants.LEFT);
		label.setVerticalAlignment(SwingConstants.TOP);
		totalPanel.add(label);
		
		totalPanel.setOpaque(true);
		return totalPanel;
	}
	
	private static void createGUIComponents() {
		
		JFrame.setDefaultLookAndFeelDecorated(true);
		frame = new JFrame("Result of your Information");

		SecondTierResults sTR = new SecondTierResults();
		frame.setSize(300,130);
		frame.setContentPane(sTR.mainPane());
		//frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setVisible(true);
		
	}
	
	public void includeValuesToDisplay(String[] strings) {
		values = strings;
	}
	
	public void perform() {
		
		SwingUtilities.invokeLater(new Runnable() {
			public void run() {
				createGUIComponents();
			}
		});
		
	}
	
	/* 	public static void main(String[] args) {
		
		SwingUtilities.invokeLater(new Runnable() {
			public void run() {
				
			}
		});

	} */

}
