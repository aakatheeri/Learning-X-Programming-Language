import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;

public class ReadFromNetwork {

	public static void main(String[] args) {
		
		try {
			
			// Selecting url of source to deal with
			URL url = new URL("http://mashable.com/rss/");
			
			// Using InputStream class for reading from that source connection
			InputStream stream = url.openStream();
			BufferedInputStream buf = new BufferedInputStream(stream);
			
			// Organizing and using characters or strings from source connection results
			StringBuilder sb = new StringBuilder();
			
			// Using loop for reading URL source
			while (true) {
				
				// Reading from URL source connection
				int data = buf.read();
				
				// Making sure that reading is end and break the loop process
				if (data == -1) {
					break;
				} else {
					// Append data received from URL source connection + convert data to characters
					sb.append((char)data);
				}
				
			}
			
			// Print out the result
			System.out.println(sb);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
}