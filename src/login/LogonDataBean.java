package login;
import java.sql.Timestamp;
public class LogonDataBean {
private String id;
private String passwd;
private String name;
private Timestamp reg_date;
private String team;
private String job;
private String tel;
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getPasswd() {
	return passwd;
}
public void setPasswd(String passwd) {
	this.passwd = passwd;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public Timestamp getReg_date() {
	return reg_date;
}
public void setReg_date(Timestamp reg_date) {
	this.reg_date = reg_date;
}
public String getTeam() {
	return team;
}
public void setTeam(String team) {
	this.team = team;
}
public String getJob() {
	return job;
}
public void setJob(String job) {
	this.job = job;
}
public String getTel() {
	return tel;
}
public void setTel(String tel) {
	this.tel = tel;
}

}
