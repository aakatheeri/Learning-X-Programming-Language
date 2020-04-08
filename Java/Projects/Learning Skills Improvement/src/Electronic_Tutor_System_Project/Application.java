package Electronic_Tutor_System_Project;
import javax.swing.*;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Application implements ActionListener {
	
	// Create instance of InitialComponents class that contain shortcut functions of Swing components
	static InitialComponents initial = new InitialComponents();
	
	// Create instances of all views/panels in this application
	AboutView aboutView;
	TopicsView topicsView;
	QuizesView quizesView;
	
	// Main components for this application
	JButton topicsButton, quezButton, aboutButton, backButton;
	//String currentView = new String("Home");
	JFrame frame;
	
	// Frame information
	String appTitle = "Learning Skills Improvement";
	int appWidth = 600;
	int appHeight = 700;
	
	// Topics buttons
	JButton firstTopic, secondTopic, thirdTopic, forthTopic, fifthTopic;
	
	public JPanel mainPane() {
		
		// Create main view/panel
		JPanel totalPanel = initial.createPanel(this.appWidth, this.appHeight, 0, 0, true);
		
		// Create three main menu (Learn, Quiz, About)
		topicsButton = initial.createButton("Topics", 150, 40, this.appWidth/2 - 260, this.appHeight/2 - 25);
		topicsButton.addActionListener(this);
		
		quezButton = initial.createButton("Quizzes", 150, 40, this.appWidth/2 - 80, this.appHeight/2 - 25);
		quezButton.addActionListener(this);
		
		aboutButton = initial.createButton("About", 150, 40, this.appWidth/2 + 100, this.appHeight/2 - 25);
		aboutButton.addActionListener(this);
		
		totalPanel.add(topicsButton);
		totalPanel.add(quezButton);
		totalPanel.add(aboutButton);
		
		return totalPanel;
	}
	
	private static void createGUIComponents () {
		
		// Create main frame of application
		Application app = new Application();
		app.frame = initial.createFrame(app.appTitle, app.appWidth, app.appHeight, app.mainPane(), true);
		
		// Create a value for each view/panel available in application
		app.aboutView = new AboutView(app);
		app.topicsView = new TopicsView(app);
		app.quizesView = new QuizesView(app);
		
	}
	
	public static void main(String[] args) {
		
		SwingUtilities.invokeLater(new Runnable() {
			public void run () {
				
				createGUIComponents();
			}
		});
		
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		
		// Switch to learn view
		if (e.getSource() == topicsButton) {
			
			System.out.println("Clicking topic button ..");
			this.frame.setContentPane(topicsView.getPane());
			
		// Switch to quez view
		} else if (e.getSource() == quezButton) {
			this.frame.setContentPane(quizesView.getPane());
			System.out.println("Clicking quiz button ..");
			
		// Switch to about view
		} else if (e.getSource() == aboutButton) {
			
			System.out.println("Clicking about button ..");
			this.frame.setContentPane(aboutView.getPane());
			
		}
		
	}

}
