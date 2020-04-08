package Electronic_Tutor_System_Project;
import java.awt.Font;
import java.awt.event.*;
import javax.swing.*;

public class AboutView extends JPanel implements ActionListener {
	
	// Create instance of InitialComponents, Application classes
	static InitialComponents initial = new InitialComponents();
	Application app;
	
	// Create panel global variables for using later
	int width, height;
	JPanel aboutPanel;
	
	// Create components for this view/panel
	JButton backButton;
	
	public AboutView(Application app) {
		
		// sign new values of width and height to global variables
		this.width = app.appWidth;
		this.height = app.appHeight;
		
		// Create about view/panel
		this.aboutPanel = initial.createPanel(this.width, this.height, 0, 0, true);
		
		// set application instance value to Application class
		this.app = app;
	}
	
	private JPanel paneContent() {
		// Create a title of about view/panel
		JLabel titleOfPanel = initial.createLabel("About us", this.width, 50, 15, 15);
		titleOfPanel.setFont(new Font("Heltavita", Font.BOLD, 20));
		titleOfPanel.setHorizontalAlignment(SwingConstants.LEFT);
		
		// Create content of about us
		String content = initial.createContent("[Learning Skills Improvement is application deveped by two Zayed University students who are Ahmed Arfan Alkathiri and Amer Alnuimi. <br> <br> This application shows 5 topics about how to improving learning skills for students in schools and universities. However, it contains many points of steps, and 3 quizes after finishing any topic. <br> <br> This application support Mac OS X and Windows operating systems. Developed using Java as programming language and Eclipse as Java IDE (Integrated Development Environment).");
		JLabel contentLabel = initial.createLabel(content, this.width - 25, 300, titleOfPanel.getX(), (titleOfPanel.getY() + titleOfPanel.getHeight()));
		contentLabel.setHorizontalAlignment(SwingConstants.LEFT);
		contentLabel.setVerticalAlignment(SwingConstants.TOP);
		
		// Create back button to return to main view/panel
		backButton = initial.createButton("Back", 100, 30, 10, this.height - 75);
		backButton.addActionListener(this);
		
		// Add components to about view/panel
		aboutPanel.add(titleOfPanel);
		aboutPanel.add(contentLabel);
		aboutPanel.add(backButton);
		
		return aboutPanel;	
	}
	
	public JPanel getPane() {
		return paneContent();
	}
	
	public void actionPerformed(ActionEvent e) {
		
		// Handle back button to home view (main view/panel in Application class)
		if(e.getSource() == backButton) {
			System.out.println("Clicking back button ..");
			aboutPanel.removeAll();
			app.frame.setContentPane(app.mainPane());
		}
		
	}
}
