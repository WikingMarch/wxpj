package common;

import java.net.URLEncoder;



public class GetSmsCode {
	private static String operation = "/industrySMS/sendSMS";

	private static String accountSid = Config.ACCOUNT_SID;
	//private static String to = "13865983754";
	private static String Content = "【因维特科技】您的验证码是#，10分钟输入有效。若非本人操作请忽略！";

	/**
	 * 验证码通知短信
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

	    // 提交请求
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
