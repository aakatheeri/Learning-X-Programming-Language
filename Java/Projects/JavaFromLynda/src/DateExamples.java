import java.text.DateFormat;
import java.util.Date;
import java.util.GregorianCalendar;

public class DateExamples {

	public static void main(String[] args) {
	
	// Print out date in default format
	Date d = new Date();
	System.out.println("Using Date Class: "+d);
	
	// Write a date using Gregorian Calendar
	GregorianCalendar gc = new GregorianCalendar(2008, 5, 2);
	gc.add(GregorianCalendar.DATE, 4); /* add 4 days to date */
	Date d2 = gc.getTime();
	System.out.println("Using GregorianCalendar class with Date class: "+d2);
	
	DateFormat df = DateFormat.getDateInstance(DateFormat.FULL);
	String sd = df.format(d2);
	System.out.println("Using DateFormat: "+sd);
	
	}
	
}