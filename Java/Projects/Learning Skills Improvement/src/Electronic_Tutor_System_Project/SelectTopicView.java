package Electronic_Tutor_System_Project;
import java.awt.Font;
import java.awt.event.*;

import javax.swing.*;

public class SelectTopicView extends JPanel implements ActionListener {

	// Create instance of InitialComponents, Application classes
	static InitialComponents initial = new InitialComponents();
	Application app;
	
	// Create panel global variables for using later
	int width, height;
	JPanel topicsPanels[] = new JPanel[5];
	
	// Create components for this view/panel
	JButton backButton, homeButton, quezButton;
	
	public SelectTopicView(Application app) {

		// sign new values of width and height to global variables
		this.width = app.appWidth;
		this.height = app.appHeight;
		
		// Create about view/panel
		for (int i = 0; i < this.topicsPanels.length; i++) {
			this.topicsPanels[i] = initial.createPanel(this.width, this.height, 0, 0, true);
		}
		
		// set application instance value to Application class
		this.app = app;
		
	}
	
	public void paneContentForEachTopic(int topicIndex) {
		
		// set first topic
		if (topicIndex == 0) {
			
			// set up title of topic
			JLabel topicTitle = initial.createLabel("How to Improve Your Memory", this.width, 30, 10, 10);
			topicTitle.setFont(new Font("Heltavita", Font.BOLD, 20));
			topicsPanels[0].add(topicTitle);
			
			// set content of topic
			String content = initial.createContent("[1] Convince yourself that you do have a good memory that will improve. Too many people get stuck here and convince themselves their memory is bad, that they are just not good with names, that numbers just slip out of their minds for some reason. Erase those thoughts and vow to improve your memory. Celebrate even little achievements to keep yourself motivated.<br><br>" +
					"[2] Memory is best practiced through association.[1] The reason that most of us can't remember our friend's phone number is because 535-3473 is just a string of numbers that have no obvious connection to your friend. In order to use your memory efficiently, the best way is to actively create an association for things you're trying to remember.<br><br>" +
					"[3] Repeat information you're trying to memorize to yourself every few days or so. This is called spaced repetition learning. We are more likely to remember more recent things and things that we've experienced with greater frequency[2], so repeating associations and mnemonics to yourself is a good idea. Start practicing every day, and you can gradually decrease the frequency until you remember it naturally.<br><br>" +
					"[4] Organize your life. Keep items that you frequently need, such as keys and eyeglasses, in the same place every time. Use an electronic organizer or daily planner to keep track of appointments, due dates for bills, and other tasks. Keep phone numbers and addresses in an address book or enter them into your computer or cell phone.<br><br>" +
					"[5] Exercise your brain. Regularly \"exercising\" the brain keeps it growing and spurs the development of new nerve connections that can help improve memory. By developing new mental skills -- especially complex ones such as learning a new language or learning to play a new musical instrument -- and challenging your brain with puzzles and games, you can keep your brain active and improve its physiological functioning. Try some fun puzzle exercises everyday such as crosswords, Sudoku, and other games which are easy enough to for anyone.");
			
			// add string content to label content
			JLabel contentLabel = initial.createLabel(content, this.width - 20, this.height-120, 10, topicTitle.getY() + 40);
			contentLabel.setVerticalAlignment(SwingConstants.TOP);
			topicsPanels[0].add(contentLabel);
			
		
			// set second topic
			} else if (topicIndex == 1) {

				// set up title of topic
				JLabel topicTitle = initial.createLabel("How to get Your Homework Done Fast", this.width, 30, 10, 10);
				topicTitle.setFont(new Font("Heltavita", Font.BOLD, 20));
				topicsPanels[1].add(topicTitle);

				// set content of topic
				String content = initial.createContent("[1] Plan out how long it should take to get the assignment done. Set a schedule for yourself.<br><br>" +
						"[2] If you know you'll forget, DON'T postpone any assignments. Do everything you get on the same day that you got it.<br><br>" +
						"[3] Progress through your studies. Take short breaks between assignments, and remember to stay focused and concentrate.<br><br>" +
						"[4] Eat while you work. Reward yourself for each task accomplished.take short breaks and return to finish up the last of your work. Don't make the breaks too long, though.<br><br>" +
						"[5] Make sure you understand the homework so that you don't waste time becoming frustrated. Ask your teacher if you need help before you hand it in.<br><br>" +
						"[6] Gather supplies and bring them to a quiet work space. Try working at a table or desk.<br><br>" +
						"[7] Remove any sources of distraction. This means shutting off your cell phone, logging off your computer (unless you will need it for your homework), turning off the television and closing the door. Let your family know that you do not want to be disturbed while working so they can respect your privacy.<br><br>" +
						"[8] Time yourself on each assignment. This will help you work faster and keep you motivated instead of bored and forced to do the assignment.");
				
				// add string content to label content
				JLabel contentLabel = initial.createLabel(content, this.width - 20, this.height-120, 10, topicTitle.getY() + 40);
				contentLabel.setVerticalAlignment(SwingConstants.TOP);
				topicsPanels[1].add(contentLabel);

			// set third topic
			} else if (topicIndex == 2) {

				// set up title of topic
				JLabel topicTitle = initial.createLabel("How to Find Motivation to Do Homework", this.width, 30, 10, 10);
				topicTitle.setFont(new Font("Heltavita", Font.BOLD, 20));
				topicsPanels[2].add(topicTitle);

				// set content of topic
				String content = initial.createContent("[1] Plan ahead to have free time after school. If you have a study period, do as much of your homework then as possible. The more you do while you are at school, the less you will need to do at home.<br><br>" +
						"[2]Set goals and rewards. Once you've completed your goal and finished your homework, reward yourself with some little thing that you would find enjoyable and doable after you finish.<br><br>" +
						"[3] Work smarter, not harder. Break up your homework time into chunks. Take regular breaks. Set a timer; take a 5- to 10-minute break for each hour you study. Get up, stretch, and move around. Drink water and eat a little fruit: water will refresh your system, and 1/2 an apple provides a better effect than a sugary, energy drink .<br><br>" +
						"[4] Think of the consequence and Think of the benefits. What will happen, if you don't do your homework, and on the other hand think about What will happen, if you do your homework?.<br><br>" +
						"[5] Find a homework partner. Make sure this person isn't one of your crazy friends who'll distract you. Find someone to sit with who is quiet and focused. This will help you feel comfortable working, because someone else is working along with you. Just be sure not to end up talking more than working.<br><br>" +
						"[6] Disconnect. Turn off computer, phone etc. that could distract you easily. Don't get wrapped up on the computer or phone on a break because you will not remember what you were learning about and it will delay your finish time. Stay away from them at all costs unless you must do the homework on the computer.<br><br>" +
						"[7] Use simpler problems to find the steps to do harder solutions. Most problems can be broken down into simpler problems. That's a key to try on most math and science work and exams.");
				
				// add string content to label content
				JLabel contentLabel = initial.createLabel(content, this.width - 20, this.height-120, 10, topicTitle.getY() + 40);
				contentLabel.setVerticalAlignment(SwingConstants.TOP);
				topicsPanels[2].add(contentLabel);

			// set forth topic
			} else if (topicIndex == 3) {

				// set up title of topic
				JLabel topicTitle = initial.createLabel("How to Solve a Problem", this.width, 30, 10, 10);
				topicTitle.setFont(new Font("Heltavita", Font.BOLD, 20));
				topicsPanels[3].add(topicTitle);

				// set content of topic
				String content = initial.createContent("[1] Talk to people. If your problem is not immediate, and you have time to gather together people who have skills or experience that relate to your problem, take advantage of having such smart friends. Let's say you want to start a business, but don't know how to proceed.<br><br>" +
						"[2] Get your people together around the table. If you're in a business setting, call a meeting. If it's more informal and you're calling on friends, invite them over for a social business meeting.<br><br>" +
						"[3] Define the problem.<br><br>" +
						"[4] Make a plan. Talk to your team. Brainstorm—that is, listen to their ideas, discuss them, and build on them. Toss your ideas onto the table, and let people discuss them as well. Often times, you'll find that everybody will have little pieces of an idea, but together you create a much more substantial plan to continue.<br><br>" +
						"[5] Evaluate the results. When you have created your plan, gather your team again, and discuss what you have discovered. Brainstorm again, listening to and implementing what works, discarding what doesn't.<br><br>" +
						"[6] Repeat until you have fine-tuned your plan and you're ready to start your business. That problem has been solved, but there will be many more ahead!.");

				// add string content to label content
				JLabel contentLabel = initial.createLabel(content, this.width - 20, this.height-120, 10, topicTitle.getY() + 40);
				contentLabel.setVerticalAlignment(SwingConstants.TOP);
				topicsPanels[3].add(contentLabel);

			// set fifth topic
			} else if (topicIndex == 4) {


					// set up title of topic
				JLabel topicTitle = initial.createLabel("How to Generate New Ideas", this.width, 30, 10, 10);
				topicTitle.setFont(new Font("Heltavita", Font.BOLD, 20));
				topicsPanels[4].add(topicTitle);

				// set content of topic
				String content = initial.createContent("[1] Think in reverse: If you feel you cannot think of anything new, try turning things upside-down. Instead of focusing on how you could solve a problem/improve operations/enhance a product, consider how could you create the problem/worsen operations/downgrade the product. The reverse ideas will come flowing in. Consider these ideas – once you've reversed them again – as possible solutions for the original challenge.<br><br>" +
						"[2] Express yourself through different media: We have multiple intelligences but somehow, when faced with workplace challenges we just tend to use our verbal reasoning ability. How about expressing the challenge through different media? Clay, music, word association games, paint, there are several ways you can express the challenge. Don't bother about solving the challenge at this point. Just express it. Different expression might spark off different thought patterns. And these new thought patterns may yield new ideas.<br><br>" +
						"[3] Connect the Unconnected .<br><br>" +
						"[4] Mind map possible ideas: Put a key word or phrase in the middle of the page. Write whatever else comes in your mind on the same page. See if you can make any connections.<br><br>" +
						"[5] Get someone else's perspective: Ask different people what they would do if faced with your challenge. You could approach friends engaged in different kind of work, your spouse, a nine-year old child, customers, suppliers, senior citizens, someone from a different culture; in essence anyone who might see things differently.<br><br>" +
						"[6] Change of environment: Sometimes changing the setting changes your thought process.");

				// add string content to label content
				JLabel contentLabel = initial.createLabel(content, this.width - 20, this.height-120, 10, topicTitle.getY() + 40);
				contentLabel.setVerticalAlignment(SwingConstants.TOP);
				topicsPanels[4].add(contentLabel);

			}
		
		// create back button
		backButton = initial.createButton("Back", 100, 30, 10, this.height - 75);
		backButton.addActionListener(this);
		topicsPanels[topicIndex].add(backButton);
		
		// create home button
		homeButton = initial.createButton("Home", 100, 30, this.width - 120, this.height - 75);
		homeButton.addActionListener(this);
		topicsPanels[topicIndex].add(homeButton);
		
		// create quez button
		quezButton = initial.createButton("Quizzes", 100, 30, (this.width/2) - 50, this.height - 75);
		quezButton.addActionListener(this);
		topicsPanels[topicIndex].add(quezButton);
		
	}
	
	public JPanel getTopicPane(int topicIndex) {
		return topicsPanels[topicIndex];
	}
	
	public void actionPerformed(ActionEvent e) {

		// Handle back button
		if(e.getSource() == backButton) {
			System.out.println("Clicking back button ..");
			for(int i = 0; i < topicsPanels.length; i++) {
				topicsPanels[i].removeAll();
			}
			this.app.frame.setContentPane(this.app.topicsView.getPane());
		}
		
		// Handle quiz button
		if (e.getSource() == quezButton) {
			System.out.println("Going to quiz ..");
			for(int i = 0; i < topicsPanels.length; i++) {
				topicsPanels[i].removeAll();
			}
			this.app.frame.setContentPane(this.app.quizesView.getPane());
		}
		
		// Handle home button
		if (e.getSource() == homeButton) {
			System.out.println("Going to home ..");
			for(int i = 0; i < topicsPanels.length; i++) {
				topicsPanels[i].removeAll();
			}
			this.app.frame.setContentPane(this.app.mainPane());
		}
		
	}
	
}
