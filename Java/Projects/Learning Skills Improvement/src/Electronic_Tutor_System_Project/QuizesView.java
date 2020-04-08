package Electronic_Tutor_System_Project;
import java.awt.Font;
import java.awt.event.*;

import javax.swing.*;

public class QuizesView extends JPanel implements ActionListener {

	// Create instance of InitialComponents, Application, SelectTopicView classes
	static InitialComponents initial = new InitialComponents();
	Application app;
	SelectQuiz1View sq1View;
	SelectQuiz2View sq2View;
	SelectQuiz3View sq3View;
	
	// Create panel global variables for using later
	int width, height;
	JPanel quizesPanel;
	
	// Create components for this view/panel
	JButton backButton, firstQuiz, secondQuiz, thirdQuiz;
	
	public QuizesView (Application app) {
		
		// sign new values of width and height to global variables
		this.width = app.appWidth;
		this.height = app.appHeight;
		
		// Create about view/panel
		this.quizesPanel = initial.createPanel(this.width, this.height, 0, 0, true);
		
		// set application instance value to Application class
		this.app = app;
		this.sq1View = new SelectQuiz1View(this.app);
		this.sq2View = new SelectQuiz2View(this.app);
		this.sq3View = new SelectQuiz3View(this.app);
		
	}
	
	private JPanel paneContent() {
		
		// Create Quez buttons
		firstQuiz = initial.createButton("Quiz 1", this.width - 50, 50, 20, 27);
		firstQuiz.addActionListener(this);
		
		secondQuiz = initial.createButton("Quiz 2", this.width - 50, 50, 20, firstQuiz.getY() + 60);
		secondQuiz.addActionListener(this);
		
		thirdQuiz = initial.createButton("Quiz 3", this.width - 50, 50, 20, secondQuiz.getY() + 60);
		thirdQuiz.addActionListener(this);
		
				
		// Create back button to return to main view/panel
		backButton = initial.createButton("Back", 100, 30, 10, this.height - 75);
		backButton.addActionListener(this);
		
		// Add components to about view/panel
		this.quizesPanel.add(firstQuiz);
		this.quizesPanel.add(secondQuiz);
		this.quizesPanel.add(thirdQuiz);
		this.quizesPanel.add(backButton);
			
		return this.quizesPanel;
	}
	
	public JPanel getPane() {
		return paneContent();
	}
	
	public void actionPerformed(ActionEvent e) {
		
		// Handle back button to home view (main view/panel in Application class)
		if(e.getSource() == backButton) {
			System.out.println("Clicking back button ..");
			quizesPanel.removeAll();
			this.app.frame.setContentPane(this.app.mainPane());
		}
		
		// Handle first quiz
		if(e.getSource() == firstQuiz) {
			System.out.println("Trying first quiz ..");
			quizesPanel.removeAll();
			this.sq1View.paneContentForEachQuez();
			this.app.frame.setContentPane(this.sq1View.getTopicPane());
		}
		
		// Handle second quiz
		if(e.getSource() == secondQuiz) {
			System.out.println("Trying second quiz ..");
			quizesPanel.removeAll();
			this.sq2View.paneContentForEachQuez();
			this.app.frame.setContentPane(this.sq2View.getTopicPane());
		}
		
		// Handle third quiz
		if(e.getSource() == thirdQuiz) {
			System.out.println("Trying third quiz ..");
			quizesPanel.removeAll();
			this.sq3View.paneContentForEachQuez();
			this.app.frame.setContentPane(this.sq3View.getTopicPane());
		}
		
	}

}
