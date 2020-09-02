package kr.green.project.Vo;

public class PetVo {
	private String pname;
	private String pgender;
	private String pino;
	private String psur;
	private String pcau;
	private String ptype;
	private String pet_user_mail;
	private String pet_inn_num;
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPgender() {
		return pgender;
	}
	public void setPgender(String pgender) {
		this.pgender = pgender;
	}
	public String getPino() {
		return pino;
	}
	public void setPino(String pino) {
		this.pino = pino;
	}
	public String getPsur() {
		return psur;
	}
	public void setPsur(String psur) {
		this.psur = psur;
	}
	public String getPcau() {
		return pcau;
	}
	public void setPcau(String pcau) {
		this.pcau = pcau;
	}
	public String getPtype() {
		return ptype;
	}
	public void setPtype(String ptype) {
		this.ptype = ptype;
	}
	public String getPet_user_mail() {
		return pet_user_mail;
	}
	public void setPet_user_mail(String pet_user_mail) {
		this.pet_user_mail = pet_user_mail;
	}
	public String getPet_inn_num() {
		return pet_inn_num;
	}
	public void setPet_inn_num(String pet_inn_num) {
		this.pet_inn_num = pet_inn_num;
	}
	@Override
	public String toString() {
		return "PetVo [pname=" + pname + ", pgender=" + pgender + ", pino=" + pino + ", psur=" + psur + ", pcau=" + pcau
				+ ", ptype=" + ptype + ", pet_user_mail=" + pet_user_mail + ", pet_inn_num=" + pet_inn_num + "]";
	}
	
}
