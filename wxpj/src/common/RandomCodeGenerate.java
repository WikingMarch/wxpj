package common;

import java.util.Random;

public class RandomCodeGenerate {
	
	
	public static String getSmsCode(){
		
		String s="";
		Random r=new Random(System.currentTimeMillis());
		for(int i=0;i<6;i++)
		s+=r.nextInt(9);
		return s;
		
	}
	

}
