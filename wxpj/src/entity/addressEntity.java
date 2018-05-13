package entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="addressInfo")
public class addressEntity {
	@Id
	@GeneratedValue(generator="native")
	@GenericGenerator(name="native", strategy = "native")
    private int a_id;
   
	@Column(name="A_XueXiao")
   private  String a_xuexiao;
    @Column(name="A_XiaoQu")
    private String a_xiaoqu;
  
	
    @Column(name="A_address")
    private String a_address;
    @Column(name="A_Tel")
    private String a_tel;
    @Column(name="A_Name")
    private String a_name;
  
    @Column(name="U_Id")
    private String u_id;
    public int getA_id() {
		return a_id;
	}
	public void setA_id(int a_id) {
		this.a_id = a_id;
	}
	public String getA_xuexiao() {
		return a_xuexiao;
	}
	public void setA_xuexiao(String a_xuexiao) {
		this.a_xuexiao = a_xuexiao;
	}
	public String getA_xiaoqu() {
		return a_xiaoqu;
	}
	public void setA_xiaoqu(String a_xiaoqu) {
		this.a_xiaoqu = a_xiaoqu;
	}

	public String getA_tel() {
		return a_tel;
	}
	public void setA_tel(String a_tel) {
		this.a_tel = a_tel;
	}
	public String getA_name() {
		return a_name;
	}
	public void setA_name(String a_name) {
		this.a_name = a_name;
	}
	/**
	 * @return the u_id
	 */
	public String getU_id() {
		return u_id;
	}
	/**
	 * @param u_id the u_id to set
	 */
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	/**
	 * @return the a_address
	 */
	public String getA_address() {
		return a_address;
	}
	/**
	 * @param a_address the a_address to set
	 */
	public void setA_address(String a_address) {
		this.a_address = a_address;
	}
}
