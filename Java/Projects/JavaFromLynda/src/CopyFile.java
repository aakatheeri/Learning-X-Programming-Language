import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

public class CopyFile {

	public static void main(String[] args) {
		
		try {
			
			// Declare two files to use
			File f1 = new File("textor.txt");
			File f2 = new File("target.txt");
			
			// Using file to read and copy by InputStram
			InputStream in = new FileInputStream(f1);
			
			// Using file to be copied (target) by OutputStram
			OutputStream out = new FileOutputStream(f2);
			
			// Declaring how many bytes to use and length of file content
			byte[] buf = new byte[1024];
			int len;
			
			// Using loop for writing process
			while ((len = in.read(buf)) > 0) {
				// Copy first file to second file by write() method in OutputStream class
				out.write(buf, 0, len);
			}
			
			// Close files
			in.close();
			out.close();
			
			// Print out successful message
			System.out.println("Copying completed!");
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	
}