package Electronic_Tutor_System_Project;

import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.*;

public class SelectQuiz2View extends JPanel implements ActionListener {

	// Create instance of some classes
	static InitialComponents initial = new InitialComponents();
	Application app;
	FinishQuez finishQuez;
	
	// Create panel global variables for using later
	int width, height;
	JPanel quizPanel;
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
	
	
	public SelectQuiz2View(Application app) {

		// sign new values of width and height to global variables
		this.width = app.appWidth;
		this.height = app.appHeight;
		
		// Create about view/panel
		quizPanel = initial.createPanel(this.width, this.height, 0, 0, true);
		
		// set application instance value to Application class
		this.app = app;
		this.finishQuez = new FinishQuez(this.app);
		
		// set radio button groups
		firstButtonGroup = new ButtonGroup();
		secondButtonGroup = new ButtonGroup();
		thirdButtonGroup = new ButtonGroup();
		forthButtonGroup = new ButtonGroup();
		fifthButtonGroup = new ButtonGroup();
				
	}
	
	public void paneContentForEachQuez() {
		
		JLabel firstQuizTitle = initial.createLabel("Quiz 1", this.width, 30, (this.width/2) - 40, 10);
		firstQuizTitle.setFont(new Font("Heltavita", Font.BOLD, 22));
		quizPanel.add(firstQuizTitle);
		
		// Question 1
		JLabel q1 = initial.createLabel("Question [1]: Choose one source of distraction while studying:", this.width + 300, 30, 10, firstQuizTitle.getY() + 40);
		q1.setFont(new Font("Heltavita", Font.BOLD, 14));
		
		firstOption = initial.createRadioButton("Books", false, this.width, 35, q1.getX(), q1.getY() + 25);
		secondOption = initial.createRadioButton("Television", false, this.width, 35, firstOption.getX(), firstOption.getY() + 25);
		thirdOption = initial.createRadioButton("Paper", false, this.width, 35, secondOption.getX(), secondOption.getY() + 25);
		
		// add action listener to radio buttons available
		firstOption.addActionListener(this);
		secondOption.addActionListener(this);
		thirdOption.addActionListener(this);
		
		// add options to one group
		firstButtonGroup.add(firstOption);
		firstButtonGroup.add(secondOption);
		firstButtonGroup.add(thirdOption);
		
		// Question 2
		JLabel q2 = initial.createLabel("Question [2]: If you know you'll forget_____", this.width + 300, 30, 10, thirdOption.getY() + 40);
		q2.setFont(new Font("Heltavita", Font.BOLD, 14));
		
		firstOption2 = initial.createRadioButton("Don't postpone any assignments", false, this.width, 35, q2.getX(), q2.getY() + 25);
		secondOption2 = initial.createRadioButton("Do not do the work", false, this.width, 35, firstOption2.getX(), firstOption2.getY() + 25);
		thirdOption2 = initial.createRadioButton("Ask your family for help ", false, this.width, 35, secondOption2.getX(), secondOption2.getY() + 25);
		
		// add action listener to radio buttons available
		firstOption2.addActionListener(this);	
		secondOption2.addActionListener(this);
		thirdOption2.addActionListener(this);
					
		// add options to one group
		secondButtonGroup.add(firstOption2);
		secondButtonGroup.add(secondOption2);
		secondButtonGroup.add(thirdOption2);
		
		// Question 3
		JLabel q3 = initial.createLabel("Question [3]: Make sure you understand the homework _____", this.width, 30, 10, thirdOption2.getY() + 40);
		q3.setFont(new Font("Heltavita", Font.BOLD, 14));
		
		firstOption3 = initial.createRadioButton("So that you don't waste time becoming frustrated", false, this.width, 35, q3.getX(), q3.getY() + 25);
		secondOption3 = initial.createRadioButton("So you do not need to do it", false, this.width, 35, firstOption3.getX(), firstOption3.getY() + 25);
		thirdOption3 = initial.createRadioButton("So your family will do it", false, this.width, 35, secondOption3.getX(), secondOption3.getY() + 25);
		
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
		JLabel q4 = initial.createLabel("Question [4]: What dose working smarter means?", this.width, 30, 10, thirdOption3.getY() + 40);
		q4.setFont(new Font("Heltavita", Font.BOLD, 14));
		
		firstOption4 = initial.createRadioButton("Never take a break", false, this.width, 35, q4.getX(), q4.getY() + 25);
		secondOption4 = initial.createRadioButton("Doing all the homework’s at once ", false, this.width, 35, firstOption4.getX(), firstOption4.getY() + 25);
		thirdOption4 = initial.createRadioButton("Break up your homework time into chunks", false, this.width, 35, secondOption4.getX(), secondOption4.getY() + 25);
		
		// add action listener to radio buttons available
		firstOption4.addActionListener(this);	
		secondOption4.addActionListener(this);
		thirdOption4.addActionListener(this);
					
		// add options to one group
		forthButtonGroup.add(firstOption4);
		forthButtonGroup.add(secondOption4);
		forthButtonGroup.add(thirdOption4);
		
		// Question 5
		JLabel q5 = initial.createLabel("Question [5]: What should you do if you want to finish your homework fast?", this.width, 30, 10, thirdOption4.getY() + 40);
		q5.setFont(new Font("Heltavita", Font.BOLD, 14));
		
		firstOption5 = initial.createRadioButton("Sleep", false, this.width, 35, q5.getX(), q5.getY() + 25);
		secondOption5 = initial.createRadioButton("Do as much homework as you can", false, this.width, 35, firstOption5.getX(), firstOption5.getY() + 25);
		thirdOption5 = initial.createRadioButton("Have fun with friends", false, this.width, 35, secondOption5.getX(), secondOption5.getY() + 25);
		
		// add action listener to radio buttons available
		firstOption5.addActionListener(this);	
		secondOption5.addActionListener(this);
		thirdOption5.addActionListener(this);
					
		// add options to one group
		fifthButtonGroup.add(firstOption5);
		fifthButtonGroup.add(secondOption5);
		fifthButtonGroup.add(thirdOption5);

		
		// add all components to Quiz
		quizPanel.add(firstQuizTitle);
		quizPanel.add(q1);
		quizPanel.add(q2);
		quizPanel.add(q3);
		quizPanel.add(q4);
		quizPanel.add(q5);
		quizPanel.add(cancelButton);
		quizPanel.add(finishButton);
		quizPanel.add(firstOption);
		quizPanel.add(secondOption);
		quizPanel.add(thirdOption);
		quizPanel.add(firstOption2);
		quizPanel.add(secondOption2);
		quizPanel.add(thirdOption2);
		quizPanel.add(firstOption3);
		quizPanel.add(secondOption3);
		quizPanel.add(thirdOption3);
		quizPanel.add(firstOption4);
		quizPanel.add(secondOption4);
		quizPanel.add(thirdOption4);
		quizPanel.add(firstOption5);
		quizPanel.add(secondOption5);
		quizPanel.add(thirdOption5);
		
	}
	
	public JPanel getTopicPane() {
		return quizPanel;
	}

	public void actionPerformed(ActionEvent e) {
		
		// Handle cancel button
		if (e.getSource() == cancelButton) {
			System.out.println("Back to home ..");
			quizPanel.removeAll();
			this.app.frame.setContentPane(this.app.quizesView.getPane());
		}
		
		// Handle first question radio buttons
		if (e.getSource() == secondOption) {
			if (isRecordAnswer[0] != 1) {
				isRecordAnswer[0] = 1;
				rightAnswers+=1;
			}
		} else if (e.getSource() == firstOption) {
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
		if (e.getSource() == firstOption3) {
			if (isRecordAnswer[2] != 1) {
				isRecordAnswer[2] = 1;
				rightAnswers+=1;
			}
		} else if (e.getSource() == secondOption3) {
			if (isRecordAnswer[2] == 1) {
				isRecordAnswer[2] = 0;
				rightAnswers-=1;
			}
		} else if (e.getSource() == thirdOption3) {
			if (isRecordAnswer[2] == 1) {
				isRecordAnswer[2] = 0;
				rightAnswers-=1;
			}
		}
		
		// Handle forth question radio buttons
		if (e.getSource() == thirdOption4) {
			if (isRecordAnswer[3] != 1) {
				isRecordAnswer[3] = 1;
				rightAnswers+=1;
			}
		} else if (e.getSource() == secondOption4) {
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
		if (e.getSource() == secondOption5) {
			if (isRecordAnswer[4] != 1) {
				isRecordAnswer[4] = 1;
				rightAnswers+=1;
			}
		} else if (e.getSource() == thirdOption5) {
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
			System.out.println("Finish quiz ..");
			quizPanel.removeAll();
			this.app.frame.setContentPane(this.finishQuez.getPane(totalAnswers, rightAnswers));
		}
		
	}
}
