package Exercises;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.Color;
import javax.swing.*;

public class ColorTextField_2013 implements ActionListener {
	
	int txAppWidth = 345, txAppHeight = 180;
	
	JPanel mainView;
	JTextField colorTX;
	
	public JPanel mainView() {
		
		mainView = new JPanel();
		mainView.setLayout(null);
		mainView.setSize(this.txAppWidth, this.txAppHeight);
		mainView.setLocation(0,0);
		
		colorTX = new JTextField();
		colorTX.setSize(this.txAppWidth - 10, 30);
		colorTX.setLocation(6, this.txAppHeight/2 - 25);
		colorTX.setEnabled(true);
		colorTX.setHorizontalAlignment(SwingConstants.CENTER);
		colorTX.addActionListener((ActionListener) this);
		mainView.add(colorTX);
		
		mainView.setOpaque(true);
		return mainView;
		
	}
	
	public void actionPerformed(ActionEvent event) {
		if (event.getSource() == colorTX) {
			
			if (colorTX.getText().trim().equals("white")) {
				mainView.setBackground(Color.WHITE);
			} else if (colorTX.getText().trim().equals("black")) {
				mainView.setBackground(Color.BLACK);
			} else if (colorTX.getText().trim().equals("green")) {
				mainView.setBackground(Color.GREEN);
			} else if (colorTX.getText().trim().equals("yellow")) {
				mainView.setBackground(Color.YELLOW);
			} else if (colorTX.getText().trim().equals("red")) {
				mainView.setBackground(Color.RED);
			} else if (colorTX.getText().trim().equals("blue")) {
				mainView.setBackground(Color.BLUE);
			}
			
		}
	}
	
	private static void guiComponents() {
		
		JFrame frame = new JFrame("++[[ Choose your Color ]]++");
		JFrame.setDefaultLookAndFeelDecorated(true);
		
		ColorTextField_2013 cTF12_Var = new ColorTextField_2013();
		frame.setContentPane(cTF12_Var.mainView());
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setSize(cTF12_Var.txAppWidth, cTF12_Var.txAppHeight);
		frame.setVisible(true);
	}
	
	public static void main(String[] args) {

		SwingUtilities.invokeLater(new Runnable() {
			public void run() {
				guiComponents();
			}
		});

	}

}
