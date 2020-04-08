import java.io.File;

import org.apache.commons.io.FileUtils;

public class CopyFileByCommonLibrary {

	public static void main(String[] args) {
		
		try {
			File f1 = new File("textor.txt");
			File f2 = new File("target.txt");
			
			FileUtils.copyFile(f1, f2);
			
			System.out.println("Copying completed!");
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	
}