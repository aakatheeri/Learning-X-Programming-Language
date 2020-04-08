package Electronic_Tutor_System_Project;

import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.*;

public class SelectQuiz1View extends JPanel implements ActionListener {

	// Create instance of some classes
	static InitialComponents initial = new InitialComponents();
	Application app;
	FinishQuez finishQuiz;
	
	// Create panel global variables for using later
	int width, height;
	JPanel quizesPanel;
	int[] isRecordAnswer = new int[5];
	double rightAnswers = 0;
	double totalAnswers = 5.0;
	
	// Create components for this view/panel
	JButton cancelButton, finishButton;
	final ButtonGroup firstButtonGroup, secondButtonGroup, thirdButtonGroup, forthButtonGroup, fifthButtonGroup;
	JRadioButton firstOption, secondOption, thirdOption;
	JRadioButton firstOption2, secondOption2, thirdOption2;
	JRadioButton firstOption3, secondOption3, thirdOption3;
	JRadioButton firstOption4, secondOption4, thirdOption4;
	JRadioButton firstOption5, secondOption5, thirdOption5;
	
	
	public SelectQuiz1View(Application app) {

		// sign new values of width and height to global variables
		this.width = app.appWidth;
		this.height = app.appHeight;
		
		// Create about view/panel
		this.quizesPanel = initial.createPanel(this.width, this.height, 0, 0, true);
		
		// set application instance value to Application class
		this.app = app;
		this.finishQuiz = new FinishQuez(this.app);
		
		// set radio button groups
		firstButtonGroup = new ButtonGroup();
		secondButtonGroup = new ButtonGroup();
		thirdButtonGroup = new ButtonGroup();
		forthButtonGroup = new ButtonGroup();
		fifthButtonGroup = new ButtonGroup();
				
	}
	
	public void paneContentForEachQuez() {
		
			JLabel firstQuezTitle = initial.createLabel("Quiz 1", this.width, 30, (this.width/2) - 40, 10);
			firstQuezTitle.setFont(new Font("Heltavita", Font.BOLD, 22));
			quizesPanel.add(firstQuezTitle);
			
			// Question 1
			JLabel q1 = initial.createLabel("Question [1]: To save memory you have to:", this.width, 30, 10, firstQuezTitle.getY() + 40);
			q1.setFont(new Font("Heltavita", Font.BOLD, 14));
			
			firstOption = initial.createRadioButton("Having a confidince that you can improve", false, this.width, 35, q1.getX(), q1.getY() + 25);
			secondOption = initial.createRadioButton("Saving a lot of things and words", false, this.width, 35, firstOption.getX(), firstOption.getY() + 25);
			thirdOption = initial.createRadioButton("You can't improve your memory", false, this.width, 35, secondOption.getX(), secondOption.getY() + 25);
			
			// add action listener to radio buttons available
			firstOption.addActionListener(this);
			secondOption.addActionListener(this);
			thirdOption.addActionListener(this);
			
			// add options to one group
			firstButtonGroup.add(firstOption);
			firstButtonGroup.add(secondOption);
			firstButtonGroup.add(thirdOption);
			
			// Question 2
			JLabel q2 = initial.createLabel("Question [2]: To save memory you have to:", this.width, 30, 10, thirdOption.getY() + 40);
			q2.setFont(new Font("Heltavita", Font.BOLD, 14));
			
			firstOption2 = initial.createRadioButton("Practice what you want to save", false, this.width, 35, q2.getX(), q2.getY() + 25);
			secondOption2 = initial.createRadioButton("Save what you want by forcing yourself", false, this.width, 35, firstOption2.getX(), firstOption2.getY() + 25);
			thirdOption2 = initial.createRadioButton("Tell someone to remind you", false, this.width, 35, secondOption2.getX(), secondOption2.getY() + 25);
			
			// add action listener to radio buttons available
			firstOption2.addActionListener(this);	
			secondOption2.addActionListener(this);
			thirdOption2.addActionListener(this);
						
			// add options to one group
			secondButtonGroup.add(firstOption2);
			secondButtonGroup.add(secondOption2);
			secondButtonGroup.add(thirdOption2);
			
			// Question 3
			JLabel q3 = initial.createLabel("Question [3]: One of many methods to remember things:", this.width, 30, 10, thirdOption2.getY() + 40);
			q3.setFont(new Font("Heltavita", Font.BOLD, 14));
			
			firstOption3 = initial.createRadioButton("Ask about others these things", false, this.width, 35, q3.getX(), q3.getY() + 25);
			secondOption3 = initial.createRadioButton("Just write forgettable things in paper and hold it all the time", false, this.width, 35, firstOption3.getX(), firstOption3.getY() + 25);
			thirdOption3 = initial.createRadioButton("Visualise things as memorable image", false, this.width, 35, secondOption3.getX(), secondOption3.getY() + 25);
			
			// add action listener to radio buttons available
			firstOption3.addActionListener(this);	
			secondOption3.addActionListener(this);
			thirdOption3.addActionListener(this);
						
			// add options to one group
			thirdButtonGroup.add(firstOption3);
			thirdButtonGroup.add(secondOption3);
			thirdButtonGroup.add(thirdOption3);
			
			// create cancel and finish button
			cancelButton = initial.createButton("Cancel", 100, 30, 10, this.height - 75);
			cancelButton.addActionListener(this);
			finishButton = initial.createButton("Finish", 100, 30, this.width - 120, this.height - 75);
			finishButton.addActionListener(this);
			
			// Question 4
			JLabel q4 = initial.createLabel("Question [4]: One method to practice what you want to save it in memory is:", this.width, 30, 10, thirdOption3.getY() + 40);
			q4.setFont(new Font("Heltavita", Font.BOLD, 14));
			
			firstOption4 = initial.createRadioButton("Save things in your memory from first time", false, this.width, 35, q4.getX(), q4.getY() + 25);
			secondOption4 = initial.createRadioButton("Repeating  information or doing thing again and again", false, this.width, 35, firstOption4.getX(), firstOption4.getY() + 25);
			thirdOption4 = initial.createRadioButton("Save many words", false, this.width, 35, secondOption4.getX(), secondOption4.getY() + 25);
			
			// add action listener to radio buttons available
			firstOption4.addActionListener(this);	
			secondOption4.addActionListener(this);
			thirdOption4.addActionListener(this);
						
			// add options to one group
			forthButtonGroup.add(firstOption4);
			forthButtonGroup.add(secondOption4);
			forthButtonGroup.add(thirdOption4);
			
			// Question 5
			JLabel q5 = initial.createLabel("Question [5]: One of many methods to exercising your brain is:", this.width, 30, 10, thirdOption4.getY() + 40);
			q5.setFont(new Font("Heltavita", Font.BOLD, 14));
			
			firstOption5 = initial.createRadioButton("Solving addition process like (1+5 = 6)", false, this.width, 35, q5.getX(), q5.getY() + 25);
			secondOption5 = initial.createRadioButton("Running and doing exercises", false, this.width, 35, firstOption5.getX(), firstOption5.getY() + 25);
			thirdOption5 = initial.createRadioButton("Playing puzzle games and trying to play hard levels on them", false, this.width, 35, secondOption5.getX(), secondOption5.getY() + 25);
			
			// add action listener to radio buttons available
			firstOption5.addActionListener(this);	
			secondOption5.addActionListener(this);
			thirdOption5.addActionListener(this);
						
			// add options to one group
			fifthButtonGroup.add(firstOption5);
			fifthButtonGroup.add(secondOption5);
			fifthButtonGroup.add(thirdOption5);

			
			// add all components to quez
			quizesPanel.add(firstQuezTitle);
			quizesPanel.add(q1);
			quizesPanel.add(q2);
			quizesPanel.add(q3);
			quizesPanel.add(q4);
			quizesPanel.add(q5);
			quizesPanel.add(cancelButton);
			quizesPanel.add(finishButton);
			quizesPanel.add(firstOption);
			quizesPanel.add(secondOption);
			quizesPanel.add(thirdOption);
			quizesPanel.add(firstOption2);
			quizesPanel.add(secondOption2);
			quizesPanel.add(thirdOption2);
			quizesPanel.add(firstOption3);
			quizesPanel.add(secondOption3);
			quizesPanel.add(thirdOption3);
			quizesPanel.add(firstOption4);
			quizesPanel.add(secondOption4);
			quizesPanel.add(thirdOption4);
			quizesPanel.add(firstOption5);
			quizesPanel.add(secondOption5);
			quizesPanel.add(thirdOption5);
			
		
	}
	
	public JPanel getTopicPane() {
		return quizesPanel;
	}

	public void actionPerformed(ActionEvent e) {
		
		// Handle cancel button
		if (e.getSource() == cancelButton) {
			System.out.println("Back to home ..");
			this.quizesPanel.removeAll();
			this.app.frame.setContentPane(this.app.quizesView.getPane());
		}
		
		// Handle first question radio buttons
		if (e.getSource() == firstOption) {
			if (isRecordAnswer[0] != 1) {
				isRecordAnswer[0] = 1;
				rightAnswers+=1;
			}
		} else if (e.getSource() == secondOption) {
			if (isRecordAnswer[0] == 1) {
				isRecordAnswer[0] = 0;
				rightAnswers-=1;
			}
			
		} else if (e.getSource() == thirdOption) {
			if (isRecordAnswer[0] == 1) {
				isRecordAnswer[0] = 0;
				rightAnswers-=1;
			}
		}
		
		// Handle second question radio buttons
		if (e.getSource() == firstOption2) {
			if (isRecordAnswer[1] != 1) {
				isRecordAnswer[1] = 1;
				rightAnswers+=1;
			}
		} else if (e.getSource() == secondOption2) {
			if (isRecordAnswer[1] == 1) {
				isRecordAnswer[1] = 0;
				rightAnswers-=1;
			}
		} else if (e.getSource() == thirdOption2) {
			if (isRecordAnswer[1] == 1) {
				isRecordAnswer[1] = 0;
				rightAnswers-=1;
			}
		}
		
		// Handle third question radio buttons
		if (e.getSource() == thirdOption3) {
			if (isRecordAnswer[2] != 1) {
				isRecordAnswer[2] = 1;
				rightAnswers+=1;
			}
		} else if (e.getSource() == secondOption3) {
			if (isRecordAnswer[2] == 1) {
				isRecordAnswer[2] = 0;
				rightAnswers-=1;
			}
		} else if (e.getSource() == firstOption3) {
			if (isRecordAnswer[2] == 1) {
				isRecordAnswer[2] = 0;
				rightAnswers-=1;
			}
		}
		
		// Handle forth question radio buttons
		if (e.getSource() == secondOption4) {
			if (isRecordAnswer[3] != 1) {
				isRecordAnswer[3] = 1;
				rightAnswers+=1;
			}
		} else if (e.getSource() == thirdOption4) {
			if (isRecordAnswer[3] == 1) {
				isRecordAnswer[3] = 0;
				rightAnswers-=1;
			}
		} else if (e.getSource() == firstOption4) {
			if (isRecordAnswer[3] == 1) {
				isRecordAnswer[3] = 0;
				rightAnswers-=1;
			}
		}
		
		// Handle fifth question radio buttons
		if (e.getSource() == thirdOption5) {
			if (isRecordAnswer[4] != 1) {
				isRecordAnswer[4] = 1;
				rightAnswers+=1;
			}
		} else if (e.getSource() == secondOption5) {
			if (isRecordAnswer[4] == 1) {
				isRecordAnswer[4] = 0;
				rightAnswers-=1;
			}
		} else if (e.getSource() == firstOption5) {
			if (isRecordAnswer[4] == 1) {
				isRecordAnswer[4] = 0;
				rightAnswers-=1;
			}
		}
		
		System.out.println(rightAnswers);
		
		// Handle finish button
		if (e.getSource() == finishButton) {
			System.out.println("Finish quez ..");
			this.quizesPanel.removeAll();
			this.app.frame.setContentPane(this.finishQuiz.getPane(totalAnswers, rightAnswers));
		}
		
	}
}
