package entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
@Entity
@Table(name="orderInfo")
public class orderEntity {

	@Id
	@GeneratedValue(generator="native")
	@GenericGenerator(name="native", strategy = "native")
	private int d_id;
	@Column(name="D_Num")
	   private  String d_num;
	    @Column(name="D_Time")
	    private String d_time;
	    @Column(name="D_Jdtime")
	    private String d_jdtime;
	    @Column(name="D_Xdtime")
	    private String d_xdtime;
	    @Column(name="D_Type")
	    private String d_type;
	    @Column(name="D_State")
	    private String d_state;
	    @Column(name="D_Comments")
	    private String d_comments;
	    @Column(name="D_CMtime")
	    private String d_cmtime;
		@Column(name="D_Score")
	    private String d_score;
	    
		@Column(name="D_Uid")
	    private String d_uid;
		@Column(name="D_Address")
	    private String d_address;
		@Column(name="D_Wid")
	    private String d_wid;
		@Column(name="D_Aid")
	    private String d_aid;
		
    public int getD_id() {
		return d_id;
	}
	public void setD_id(int d_id) {
		this.d_id = d_id;
	}
	public String getD_num() {
		return d_num;
	}
	public void setD_num(String d_num) {
		this.d_num = d_num;
	}
	public String getD_time() {
		return d_time;
	}
	public void setD_time(String d_time) {
		this.d_time = d_time;
	}
	public String getD_jdtime() {
		return d_jdtime;
	}
	public void setD_jdtime(String d_jdtime) {
		this.d_jdtime = d_jdtime;
	}
	public String getD_state() {
		return d_state;
	}
	public void setD_state(String d_state) {
		this.d_state = d_state;
	}
	public String getD_comments() {
		return d_comments;
	}
	public void setD_comments(String d_comments) {
		this.d_comments = d_comments;
	}
	public String getD_cmtime() {
		return d_cmtime;
	}
	public void setD_cmtime(String d_cmtime) {
		this.d_cmtime = d_cmtime;
	}
	/**
	 * @return the d_score
	 */
	public String getD_score() {
		return d_score;
	}
	/**
	 * @param d_score the d_score to set
	 */
	public void setD_score(String d_score) {
		this.d_score = d_score;
	}
	/**
	 * @return the d_type
	 */
	public String getD_type() {
		return d_type;
	}
	/**
	 * @param d_type the d_type to set
	 */
	public void setD_type(String d_type) {
		this.d_type = d_type;
	}
	
	
	/**
	 * @return the d_aid
	 */
	public String getD_aid() {
		return d_aid;
	}
	/**
	 * @param d_aid the d_aid to set
	 */
	public void setD_aid(String d_aid) {
		this.d_aid = d_aid;
	}
	/**
	 * @return the d_wid
	 */
	public String getD_wid() {
		return d_wid;
	}
	/**
	 * @param d_wid the d_wid to set
	 */
	public void setD_wid(String d_wid) {
		this.d_wid = d_wid;
	}
	/**
	 * @return the d_uid
	 */
	public String getD_uid() {
		return d_uid;
	}
	/**
	 * @param d_uid the d_uid to set
	 */
	public void setD_uid(String d_uid) {
		this.d_uid = d_uid;
	}
	/**
	 * @return the d_xdtime
	 */
	public String getD_xdtime() {
		return d_xdtime;
	}
	/**
	 * @param d_xdtime the d_xdtime to set
	 */
	public void setD_xdtime(String d_xdtime) {
		this.d_xdtime = d_xdtime;
	}
	/**
	 * @return the d_address
	 */
	public String getD_address() {
		return d_address;
	}
	/**
	 * @param d_address the d_address to set
	 */
	public void setD_address(String d_address) {
		this.d_address = d_address;
	}
	
}
