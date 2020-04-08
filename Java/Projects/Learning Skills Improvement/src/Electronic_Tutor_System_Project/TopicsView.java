package Electronic_Tutor_System_Project;
import java.awt.Font;
import java.awt.event.*;
import javax.swing.*;

public class TopicsView extends JPanel implements ActionListener {

	// Create instance of InitialComponents, Application, SelectTopicView classes
	static InitialComponents initial = new InitialComponents();
	Application app;
	SelectTopicView selectTopicView;
	
	// Create panel global variables for using later
	int width, height;
	JPanel topicsPanel;
	
	// Create components for this view/panel
	JButton backButton, firstTopic, secondTopic, thirdTopic, forthTopic, fifthTopic;
	
	public TopicsView(Application app) {
		
		// sign new values of width and height to global variables
		this.width = app.appWidth;
		this.height = app.appHeight;
		
		// Create about view/panel
		this.topicsPanel = initial.createPanel(this.width, this.height, 0, 0, true);
		
		// set application instance value to Application class
		this.app = app;
		this.selectTopicView = new SelectTopicView(this.app);
				
	}
	
	private JPanel paneContent() {
		
		// Create topics buttons
		firstTopic = initial.createButton("How to Improve Your Memory", this.width - 50, 50, 20, 27);
		firstTopic.setFont(new Font("Heltavita", Font.BOLD, 20));
		firstTopic.addActionListener(this);
		
		secondTopic = initial.createButton("Finding New Ideas", this.width - 50, 50, 20, firstTopic.getY() + 60);
		secondTopic.setFont(new Font("Heltavita", Font.BOLD, 20));
		secondTopic.addActionListener(this);
		
		thirdTopic = initial.createButton("Doing hardwork or assignment", this.width - 50, 50, 20, secondTopic.getY() + 60);
		thirdTopic.setFont(new Font("Heltavita", Font.BOLD, 20));
		thirdTopic.addActionListener(this);
		
		forthTopic = initial.createButton("How to Find Motivation to Do Homework", this.width - 50, 50, 20, thirdTopic.getY() + 60);
		forthTopic.setFont(new Font("Heltavita", Font.BOLD, 20));
		forthTopic.addActionListener(this);
		
		fifthTopic = initial.createButton("How to Solve a Problem", this.width - 50, 50, 20, forthTopic.getY() + 60);
		fifthTopic.setFont(new Font("Heltavita", Font.BOLD, 20));
		fifthTopic.addActionListener(this);
		
		// Create back button to return to main view/panel
		backButton = initial.createButton("Back", 100, 30, 10, this.height - 75);
		backButton.addActionListener(this);
		
		// Add components to about view/panel
		this.topicsPanel.add(firstTopic);
		this.topicsPanel.add(secondTopic);
		this.topicsPanel.add(thirdTopic);
		this.topicsPanel.add(forthTopic);
		this.topicsPanel.add(fifthTopic);
		this.topicsPanel.add(backButton);
		
		
		return this.topicsPanel;
	}
	
	public JPanel getPane() {
		return paneContent();
	}
	
	public void actionPerformed(ActionEvent e) {
		
		// Handle back button to home view (main view/panel in Application class)
		if(e.getSource() == backButton) {
			System.out.println("Clicking back button ..");
			topicsPanel.removeAll();
			app.frame.setContentPane(app.mainPane());
		}
		
		// Handle topics button
		if(e.getSource() == firstTopic) {
			System.out.println("Going to first topic ..");
			topicsPanel.removeAll();
			selectTopicView.paneContentForEachTopic(0);
			app.frame.setContentPane(selectTopicView.getTopicPane(0));
		} else if(e.getSource() == secondTopic) {
			System.out.println("Going to second topic ..");
			topicsPanel.removeAll();
			selectTopicView.paneContentForEachTopic(1);
			app.frame.setContentPane(selectTopicView.getTopicPane(1));
		} else if(e.getSource() == thirdTopic) {
			System.out.println("Going to third topic ..");
			topicsPanel.removeAll();
			selectTopicView.paneContentForEachTopic(2);
			app.frame.setContentPane(selectTopicView.getTopicPane(2));
		} else if(e.getSource() == forthTopic) {
			System.out.println("Going to forth topic ..");
			topicsPanel.removeAll();
			selectTopicView.paneContentForEachTopic(3);
			app.frame.setContentPane(selectTopicView.getTopicPane(3));
		} else if(e.getSource() == fifthTopic) {
			System.out.println("Going to fifth topic ..");
			topicsPanel.removeAll();
			selectTopicView.paneContentForEachTopic(4);
			app.frame.setContentPane(selectTopicView.getTopicPane(4));
		}
		
	}
}
