package common;

import java.net.URLEncoder;



public class GetSmsCode {
	private static String operation = "/industrySMS/sendSMS";

	private static String accountSid = Config.ACCOUNT_SID;
	//private static String to = "13865983754";
	private static String Content = "����ά�ؿƼ���������֤����#��10����������Ч�����Ǳ��˲�������ԣ�";

	/**
	 * ��֤��֪ͨ����
	 */
	public static void execute(String to,String code)
	{
		String tmpSmsContent = null;
	    try{
	    	
	    	String smsContent=Content.replace("#", code);
	    	System.out.println(smsContent);
	      tmpSmsContent = URLEncoder.encode(smsContent, "UTF-8");
	    }catch(Exception e){
	      
	    }
	    String url = Config.BASE_URL + operation;
	    String body = "accountSid=" + accountSid + "&to=" + to + "&smsContent=" + tmpSmsContent
	        + HttpUtil.createCommonParam();

	    // �ύ����
	    String result = HttpUtil.post(url, body);
	    System.out.println("result:" + "\n" + result);
	}
	public static void main(String []args){
		
		//execute();
		String id=(String )null;
		String s="#";
		String t=s.replace("#", "3");
		System.out.println(s+";"+t);
	}
	

}
