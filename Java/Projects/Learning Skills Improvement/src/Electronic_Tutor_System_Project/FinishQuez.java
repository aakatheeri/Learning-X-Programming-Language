package Electronic_Tutor_System_Project;
import java.awt.Font;
import java.awt.event.*;

import javax.swing.*;

public class FinishQuez extends JPanel implements ActionListener {

	// Create instance of InitialComponents, Application, SelectTopicView classes
	static InitialComponents initial = new InitialComponents();
	Application app;

	// Create panel global variables for using later
	int width, height;
	JPanel finishExamView;
	
	// Create components for this view/panel
	JButton quizesButton, homeButton;
	
	// Set some variables
	int quezID = 0, finalResultInPercentage;
	double rightAnswers, totalAnswers;
	
	public FinishQuez (Application app) {
		
		// sign new values of width and height to global variables
		this.width = app.appWidth;
		this.height = app.appHeight;
		
		// Create about view/panel
		this.finishExamView = initial.createPanel(this.width, this.height, 0, 0, true);
		
		// set application instance value to Application class
		this.app = app;
				
	}
	
	public void setQuezProperties(int quezID, int totalAnswers) {
		this.quezID = quezID;
		this.rightAnswers = 0;
		this.totalAnswers = totalAnswers;
	}
	
	private int getResultInPercentage() {
		System.out.println(this.rightAnswers + " / " + this.totalAnswers + " = " + (this.rightAnswers/this.totalAnswers));
		this.finalResultInPercentage = (int)((this.rightAnswers/this.totalAnswers) * 100.00);
		return this.finalResultInPercentage;
	}
	
	private JPanel paneContent() {
		
		// Title of finish view
		JLabel title = initial.createLabel("Result Of Quez", this.width, 40, 10, 30);
		title.setHorizontalAlignment(SwingConstants.CENTER);
		title.setFont(new Font("Heltavita", Font.BOLD, 30));
		finishExamView.add(title);
		
		// Adding result to message label
		String resultInString = "You got "+ Integer.toString(getResultInPercentage()) + "% from the quez.";
		JLabel resultInStringLabel = initial.createLabel(resultInString, this.width, 40, 10, title.getY() + 50);
		resultInStringLabel.setHorizontalAlignment(SwingConstants.CENTER);
		resultInStringLabel.setFont(new Font("Heltavita", Font.BOLD, 20));
		finishExamView.add(resultInStringLabel);
		
		// Setting buttons
		homeButton = initial.createButton("Home", 150, 45, (this.width/2) + 10, this.height/2);
		homeButton.setFont(new Font("Heltavita", Font.BOLD, 25));
		homeButton.addActionListener(this);
		quizesButton = initial.createButton("Quezes", 150, 45, (this.width/2) - 160, this.height/2);
		quizesButton.setFont(new Font("Heltavita", Font.BOLD, 25));
		quizesButton.addActionListener(this);
		
		finishExamView.add(quizesButton);
		finishExamView.add(homeButton);
		
		return finishExamView;
	}
	
	public JPanel getPane(double totalAnswers, double rightAnswers) {
		this.rightAnswers = rightAnswers;
		this.totalAnswers = totalAnswers;
		return paneContent();
	}

	public void actionPerformed(ActionEvent e) {

		// Handle quezes button
		if (e.getSource() == quizesButton) {
			System.out.println("Back to quezes ..");
			finishExamView.removeAll();
			this.app.frame.setContentPane(this.app.quizesView.getPane());
		}
		
		// Handle home button
		if (e.getSource() == homeButton) {
			System.out.println("Back to home ..");
			finishExamView.removeAll();
			this.app.frame.setContentPane(this.app.mainPane());
		}
		
	}
	
	
}
