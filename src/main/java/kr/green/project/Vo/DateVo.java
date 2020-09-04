package kr.green.project.Vo;

import org.apache.ibatis.javassist.expr.Instanceof;

public class DateVo {
	private String st_date;
	private String end_date;
	
	
	public String getSt_date() {
		return st_date;
	}
	public void setSt_date(String st_date) {
		this.st_date = st_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	@Override
	public String toString() {
		return "DateVo [st_date=" + st_date + ", end_date=" + end_date + "]";
	}
	
	// range 범위
	/* compareTo를 써줬을 경우 시작 날짜와 끝 날짜를 비교했을때 앞 날짜가 작았을 경우에는 -1로 같은경우는 0 또 이 둘과 반대 되는 경우에는 1로 출력이 되는데, 
	 * 샘플 코드로 테스트 해봤을 때 체크인과 체크아웃 날짜가 같을 경우 뒤에 날짜 기준으로 계산되어 나오기때문에 사실 앞 날짜는 필요가 없게된다. 
	 * 그래서 밑에 쓴 코드도 끝날자를 현재 날짜와 비교해서 0보다 크거가 같은 경우를 나타내주는것! 
	 */
	
	public boolean range(String date) {
		
		if(st_date.compareTo(date)<=0 && end_date.compareTo(date)>=0 )
			return true;
		return false;
	}
	
	
	
}
