package common;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

public class LibraryString {
        
    public static String md5(String input) {
        String result = input;
        MessageDigest md = null; 
        if(input != null) {
            try {
                md = MessageDigest.getInstance("MD5"); //or "SHA-1"
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(LibraryString.class.getName()).log(Level.SEVERE, null, ex);
            }
            md.update(input.getBytes());
            BigInteger hash = new BigInteger(1, md.digest());
            result = hash.toString(16);
            while(result.length() < 32) { //40 for SHA-1
                result = "0" + result;
            }
        }
        return result;
    }
    
	public static boolean isPassword(String password){
        String regex = "^c([a-zA-Z0-9!@#$%^&]{5,29})"; // 6-30 kí tự kí tự đầu là [a-zA-Z]
        return password.matches(regex);
    }
	
	public static String renameFile(String fileName){
		String[] arrImg =  fileName.split("\\.");
		String duoiFileImg = arrImg[arrImg.length - 1];
		String nameFile = "";
		for (int i  = 0;i< (arrImg.length - 1) ; i++) {
			if(i == 0){
				nameFile = arrImg[i];
			}else{
				nameFile += "-"+arrImg[i];
			}
		}
		nameFile = nameFile + "-"+System.nanoTime() +"."+duoiFileImg;
		return nameFile;
	}
	
	public static String renameDFile(String filename){
		String output = "";
		String[] arrImg =  filename.split("\\.");
		SimpleDateFormat sdf = new SimpleDateFormat("ddMMyyyyHHmmss");
		String fier = sdf.format(new Date());
		output = output + fier + "."+ arrImg[arrImg.length-1] ;
		return  output;
	}
    
}
