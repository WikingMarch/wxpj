package entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
@Entity
@Table(name="userInfo")
public class userEntity {
	
public userEntity(){}
public userEntity(int uid){
	u_id=uid;
}

		@Id
		
		@GeneratedValue(generator="native")
		@GenericGenerator(name="native", strategy = "native")
	    private int u_id;
	    @Column(name="U_Tel")
	   private  String u_tel;
	    @Column(name="U_Password")
	    private String u_password;
	    @Column(name="U_Name")
	    private String u_name;
		
	    @Column(name="U_SID")
	    private String u_sid;
	    
	    @Column(name="U_Syear")
	    private String u_syear;
	    

	    @Column(name="U_XiaoQu")
	    private String u_xiaoqu;
	    
	    @Column(name="U_XueXiao")
	    private String u_xuexiao;
	    @Column(name="U_Lou")
	    private String u_lou;
	    
	    @Column(name="U_room")
	    private String u_room;
	    
	    @Column(name="U_Wxh")
	    private String u_wxh;
	    @Column(name="U_Zctime")
	    private String u_zctime;
	    @Column(name="U_State")
	    private String u_state;
	    @Column(name="U_Headimg")
	    private String u_headimg;
		
		@Override
		public String toString() {
			// TODO Auto-generated method stub
			return  this.u_name+","+this.u_sid+this.u_xuexiao+this.u_syear+this.u_room;
		}

		public int getU_id() {
			return u_id;
		}

		public void setU_id(int u_id) {
			this.u_id = u_id;
		}

		public String getU_tel() {
			return u_tel;
		}

		public void setU_tel(String u_tel) {
			this.u_tel = u_tel;
		}

		public String getU_password() {
			return u_password;
		}

		public void setU_password(String u_password) {
			this.u_password = u_password;
		}

		public String getU_name() {
			return u_name;
		}

		public void setU_name(String u_name) {
			this.u_name = u_name;
		}

		public String getU_sid() {
			return u_sid;
		}

		public void setU_sid(String u_sid) {
			this.u_sid = u_sid;
		}

		public String getU_syear() {
			return u_syear;
		}

		public void setU_syear(String u_syear) {
			this.u_syear = u_syear;
		}

		public String getU_xiaoqu() {
			return u_xiaoqu;
		}

		public void setU_xiaoqu(String u_xiaoqu) {
			this.u_xiaoqu = u_xiaoqu;
		}

		public String getU_xuexiao() {
			return u_xuexiao;
		}

		public void setU_xuexiao(String u_xuexiao) {
			this.u_xuexiao = u_xuexiao;
		}

		public String getU_lou() {
			return u_lou;
		}

		public void setU_lou(String u_lou) {
			this.u_lou = u_lou;
		}

		public String getU_room() {
			return u_room;
		}

		public void setU_room(String u_room) {
			this.u_room = u_room;
		}

		public String getU_wxh() {
			return u_wxh;
		}

		public void setU_wxh(String u_wxh) {
			this.u_wxh = u_wxh;
		}

		public String getU_zctime() {
			return u_zctime;
		}

		public void setU_zctime(String u_zctime) {
			this.u_zctime = u_zctime;
		}

		public String getU_state() {
			return u_state;
		}

		public void setU_state(String u_state) {
			this.u_state = u_state;
		}

		public String getU_headimg() {
			return u_headimg;
		}

		public void setU_headimg(String u_headimg) {
			this.u_headimg = u_headimg;
		}

}
