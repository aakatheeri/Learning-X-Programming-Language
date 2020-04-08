package Exercises;
import javax.swing.*;

import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.AdjustmentListener;
public class JSlider_assignment implements ActionListener {
	
	JPanel totalPanel;
	JScrollBar redSlider, blueSlider, greenSlider;
	
	
	public JScrollBar createNewScrollBar(int[] constructor, int width, int height, int xPoint, int yPoint, boolean isThereListener) {
		
		int scrollValue = 0, scrollExtent = 0, scrollMin = 0, scrollMax = 0;
		for (int i = 0; i < 4; i++) {
			//scrollOrientation = constructor[0];
			scrollValue = constructor[1];
			scrollExtent = constructor[2];
			scrollMin = constructor[3];
			scrollMax = constructor[4];
		}
		JScrollBar xSlider = new JScrollBar(JScrollBar.HORIZONTAL, scrollValue, scrollExtent, scrollMin, scrollMax);
		xSlider.setSize(width, height);
		xSlider.setLocation(xPoint, yPoint);
		
		if (isThereListener == true) {
			xSlider.addAdjustmentListener((AdjustmentListener) this);
		}
		
		return xSlider;
	}
	
	public JLabel createNewLabel(String title, int width, int height, int xPoint, int yPoint) {
		
		JLabel xLabel = new JLabel(title);
		xLabel.setSize(width, height);
		xLabel.setLocation(xPoint, yPoint);
		return xLabel;
		
	}
	
	public Color setColor(int red, int green, int blue) {
		Color color = new Color(red, green, blue);
		return color;
	}
	
	public JPanel createMainPane () {
		
		
		
		totalPanel = new JPanel();
		totalPanel.setLayout(null);
		totalPanel.setSize(200, 500);
		totalPanel.setLocation(0, 0);
		totalPanel.setForeground(setColor(0, 0, 0));
		
		
		int[] scrollProperties = {0,1,0,100};
		
		// Create red slider
		redSlider = createNewScrollBar(scrollProperties, 100, 30, 10, 50, true);
		totalPanel.add(redSlider);
		
		// Create green slider
		greenSlider = createNewScrollBar(scrollProperties, 100, 30, 50, 50, true);
		totalPanel.add(greenSlider);

		// Create blue slider
		blueSlider = createNewScrollBar(scrollProperties, 100, 30, 100, 50, true);
		totalPanel.add(blueSlider);
		
		// Create red Label
		JLabel redLabel = createNewLabel("Red", 20, 20, redSlider.getX()-10, redSlider.getY());
		totalPanel.add(redLabel);
		
		// Create green Label
		JLabel greenLabel = createNewLabel("Green", 20, 20, greenSlider.getX()-10, greenSlider.getY());
		totalPanel.add(greenLabel);
		
		// Create blue Label
		JLabel blueLabel = createNewLabel("Blue", 20, 20, blueSlider.getX()-10, blueSlider.getY());
		totalPanel.add(blueLabel);
		
		totalPanel.setOpaque(true);
		return totalPanel;
	}
	
	private static void createGUIComponents() {
		JFrame frame = new JFrame("++ Color Slider ++");
		JSlider_assignment slider = new JSlider_assignment();
		
		JFrame.setDefaultLookAndFeelDecorated(true);
		frame.setContentPane(slider.createMainPane());
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setSize(200, 500);
		frame.setVisible(true);
	}
	
	public void actionPerformed(ActionEvent e) {
		
		if (e.getSource() == redSlider || e.getSource() == blueSlider || e.getSource() == greenSlider) {
			totalPanel.setForeground(setColor(redSlider.getValue(), greenSlider.getValue(), blueSlider.getValue()));
		}
		
	}
	
	public static void main(String[] args) {
		
		SwingUtilities.invokeLater(new Runnable() {
			public void run() {
				createGUIComponents();
			}
		});

	}

}
