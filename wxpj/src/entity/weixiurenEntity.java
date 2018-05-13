package entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="weixinrenInfo")
public class weixiurenEntity {

	@Id
	
	@GeneratedValue(generator="native")
	@GenericGenerator(name="native", strategy = "native")
    private int w_id;
    @Column(name="W_Num")
   private  String w_num;
    @Column(name="W_Password")
    private String w_password;
    @Column(name="W_Name")
    private String w_name;
    @Column(name="W_Tel")
    private String w_tel;
    @Column(name="W_Wxh")
    private String w_wxh;
    @Column(name="W_Worktime")
    private String w_worktime;
   
    @Column(name="W_Zcm")
    private String w_zcm;
    @Column(name="W_Zctime")
    private String w_zctime;
    
    @Column(name="W_Xuexiao")
    private String w_xuexiao;
    
    @Column(name="W_Xiaoqu")
   private String w_xiaoqu;
    
    
    @Column(name="W_Headimg")
    private String w_headimg;
    @Column(name="W_Score")
    private String w_score;
    
    @Column(name="W_State")
    private String w_state;
    
    @Column(name="W_Accept")
    private String w_accept;
	

	public String getW_num() {
		return w_num;
	}

	public void setW_num(String w_num) {
		this.w_num = w_num;
	}

	public String getW_password() {
		return w_password;
	}

	public void setW_password(String w_password) {
		this.w_password = w_password;
	}

	public String getW_name() {
		return w_name;
	}

	public void setW_name(String w_name) {
		this.w_name = w_name;
	}

	public String getW_tel() {
		return w_tel;
	}

	public void setW_tel(String w_tel) {
		this.w_tel = w_tel;
	}

	public String getW_wxh() {
		return w_wxh;
	}

	public void setW_wxh(String w_wxh) {
		this.w_wxh = w_wxh;
	}

	public String getW_worktime() {
		return w_worktime;
	}

	public void setW_worktime(String w_worktime) {
		this.w_worktime = w_worktime;
	}

	public String getW_state() {
		return w_state;
	}

	public void setW_state(String w_state) {
		this.w_state = w_state;
	}

	public String getW_zcm() {
		return w_zcm;
	}

	public void setW_zcm(String w_zcm) {
		this.w_zcm = w_zcm;
	}

	public String getW_zctime() {
		return w_zctime;
	}

	public void setW_zctime(String w_zctime) {
		this.w_zctime = w_zctime;
	}

	public String getW_headimg() {
		return w_headimg;
	}

	public void setW_headimg(String w_headimg) {
		this.w_headimg = w_headimg;
	}

	/**
	 * @return the w_xiaoqu
	 */
	public String getW_xiaoqu() {
		return w_xiaoqu;
	}

	/**
	 * @param w_xiaoqu the w_xiaoqu to set
	 */
	public void setW_xiaoqu(String w_xiaoqu) {
		this.w_xiaoqu = w_xiaoqu;
	}

	/**
	 * @return the w_xuexiao
	 */
	public String getW_xuexiao() {
		return w_xuexiao;
	}

	/**
	 * @param w_xuexiao the w_xuexiao to set
	 */
	public void setW_xuexiao(String w_xuexiao) {
		this.w_xuexiao = w_xuexiao;
	}

	/**
	 * @return the w_accept
	 */
	public String getW_accept() {
		return w_accept;
	}

	/**
	 * @param w_accept the w_accept to set
	 */
	public void setW_accept(String w_accept) {
		this.w_accept = w_accept;
	}

	/**
	 * @return the w_score
	 */
	public String getW_score() {
		return w_score;
	}

	/**
	 * @param w_score the w_score to set
	 */
	public void setW_score(String w_score) {
		this.w_score = w_score;
	}

	/**
	 * @return the w_id
	 */
	public int getW_id() {
		return w_id;
	}

	/**
	 * @param w_id the w_id to set
	 */
	public void setW_id(int w_id) {
		this.w_id = w_id;
	}

	
	
}
