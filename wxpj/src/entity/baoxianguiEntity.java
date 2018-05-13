package entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
@Entity
@Table(name="baoxiangui")
public class baoxianguiEntity {

	@Id
	
	@GeneratedValue(generator="native")
	@GenericGenerator(name="native", strategy = "native")
    private int B_ID;
    @Column(name="B_Num")
   private  String B_Num;
    @Column(name="B_Area")
    private String B_Area;
    @Column(name="B_Address")
    private String B_Address;
	
    @Column(name="B_Type")
    private String B_Type;
    @Column(name="B_Name")
    private String B_Name;
    @Column(name="B_State")
    private String B_State;
	public int getB_ID() {
		return B_ID;
	}
	public void setB_ID(int b_ID) {
		B_ID = b_ID;
	}
	public String getB_Num() {
		return B_Num;
	}
	public void setB_Num(String b_Num) {
		B_Num = b_Num;
	}
	public String getB_Area() {
		return B_Area;
	}
	public void setB_Area(String b_Area) {
		B_Area = b_Area;
	}
	public String getB_Address() {
		return B_Address;
	}
	public void setB_Address(String b_Address) {
		B_Address = b_Address;
	}
	public String getB_Type() {
		return B_Type;
	}
	public void setB_Type(String b_Type) {
		B_Type = b_Type;
	}
	public String getB_Name() {
		return B_Name;
	}
	public void setB_Name(String b_Name) {
		B_Name = b_Name;
	}
	public String getB_State() {
		return B_State;
	}
	public void setB_State(String b_State) {
		B_State = b_State;
	}
	
	
	
	
}
