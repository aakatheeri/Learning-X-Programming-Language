import java.applet.*;
import java.awt.*;
public class Checkerboard extends Applet {

	public void init () {

	}
	
	public void paint(Graphics g) {
		
		int x,y;
		for (int i = 0; i < 8; i++) {
			for (int j = 0; j < 8; j++) {
				
				//margenX = 20;
				//margenY = 20;
				x = i*40;
				y = j*40;
				
				if (i%2 == j%2) {
					g.setColor(Color.WHITE);
				} else {
					g.setColor(Color.BLACK);
				}
				g.fillRect(x, y, 40, 40);
				
			}
		}
		
	}

}
