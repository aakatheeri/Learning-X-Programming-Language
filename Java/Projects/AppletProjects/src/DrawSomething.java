import java.applet.*;
import java.awt.*;
public class DrawSomething extends Applet {

	public void init() {
		
	}
	
	public void paint (Graphics g) {
		
		// Fill Cap rectangle
		g.fillRect(140, 50, 60, 30);
		g.fillRect(110, 80, 120, 10);
		
		// Draw head and eyes
		g.drawOval(130, 80, 80, 80);
		g.drawOval(140, 100, 10, 10);
		g.drawOval(190, 100, 10, 10);
		
		// Draw the smile in the face
		g.drawArc(140, 100, 60, 50, 180, 180);
		
		// Draw circular body
		g.drawOval(105,160,130,90);
		g.drawOval(80,250,180,120);
		
		
	}
}
