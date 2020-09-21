package kr.green.project.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.project.Vo.DateVo;
import kr.green.project.Vo.InnVo;
import kr.green.project.Vo.PetVo;
import kr.green.project.Vo.UserVo;
import kr.green.project.dao.InnDao;
import kr.green.project.dto.mypageDto;
import kr.green.project.pagination.Criteria;
import kr.green.project.pagination.PageMaker;

@Service
public class InnServiceImp implements InnService {

	
	@Autowired
	InnDao innDao;
	
	@Override
	public void insertInnDo(UserVo user, PetVo pet, InnVo inn) {
		innDao.insertPet(pet);
		// pet에 관한 정보 추가 
		inn.setInn_petnum(pet.getPetnum());
		
		// user의 mail을 가져와서 Inn_user_mail로 설정해주겠다.
		inn.setInn_user_mail(user.getMail());

		// inn에 관한 내용 추가 
		innDao.insertInn(inn);
		
	}
	// 예약된 날짜들을 취합해서 보여주기 위한 코드.
	@Override
	public ArrayList<String> getDateList(Calendar cal,int max) {
		// string형식으로 res 에 결과값 저장하도록 새로 선언해줌.
		ArrayList<String> res = new ArrayList<String>();
		
		// 데이터 형식은 이렇게 지정해준다는것
		SimpleDateFormat transFormat = 
				new SimpleDateFormat("yyyy-MM-dd");
		// 문자열 strdate
		String strdate = transFormat.format(cal.getTime());
		// 지금은 테스트를 위해 db에 저장된 값으로 예를 들어 날짜 지정함. 원래는 여기서 원하는 달에 대한 날짜들을 반복문으로 처리해줘야한다. 예를 들면 9월1일~9월31일까지 반복문으로 ! 그래서 반복문 사이에 있는 날짜들에 예약 리스르를 저장하게끔
		// 9월 말이 찍히게 하는 코드 추가
		cal.set(Calendar.DAY_OF_MONTH , cal.getActualMaximum(Calendar.DAY_OF_MONTH));
										// 해당 월이 가지고있는 마지막 일수
		String enddate =  transFormat.format(cal.getTime());
		ArrayList<String> dateList = null;
		try {
			dateList = getDateList(strdate,enddate);
			for(String tmp : dateList) {
				ArrayList<DateVo> list = innDao.getDates(tmp);
				System.out.println("예약일:"+tmp);
				System.out.println("예약갯수:"+list.size());

				// 만약 각각의 날짜에 예약된 수가 최대로 예약되어질 수 있는 수와 같다면, res에 strdate저장해주기.
				if(list.size() >= max) {
					res.add(tmp);
				}
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return res;
	}
	/* getDateList의 역할. 
	 시작 체크인 날짜와 끝 체크아웃 날짜를 스트링 형식으로 바꿔준 후, 
	 dates 라는 리스트에 입력된 날짜들을 넣어준다. 
	 이후 currentDate는 startDate로 새로 선언되어, 조건문을 반복한다. 
	 currentDate가 endDate보다 0보다 작거나 같을때, 조건문 실행. currentDate로 startDate가 새로 지정된
	 Calender c에 현재 날짜에 해당하는 날짜로 지정되어 c라는 변수에 currentDate가 저장.
	 c.add(Calendar.DAY_OF_MONTH,1) 은 현재 날짜에 하루를 더해준다. 
	 */  
	public ArrayList<String> getDateList(String start, String end) throws ParseException{
		final String DATE_PATTERN = "yyyy-MM-dd";
		
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_PATTERN);
		// 데이트 형식의 날짜들 스트링 형식으로 바꿔주는 코드 
		Date startDate = sdf.parse(start);
		Date endDate = sdf.parse(end);
		
		ArrayList<String> dates = new ArrayList<String>();
		
		Date currentDate = startDate;
		while (currentDate.compareTo(endDate) <= 0) { // compareTo는 결과값이 -1, 0, 1 로 나옴
			dates.add(sdf.format(currentDate));
			Calendar c = Calendar.getInstance();
			c.setTime(currentDate);
			c.add(Calendar.DAY_OF_MONTH, 1);
			currentDate = c.getTime();
		}
		return dates;
	}

	// 반려견에 대한 정보 
	@Override
	public PetVo getMyPet(int inn_petnum) {
		return innDao.getMyPet(inn_petnum);
		
	}
	
	// 숙박에 대한 정보
	@Override
	public ArrayList<mypageDto> getMyInn(String mail, Criteria cri) {
		final String DATE_PATTERN = "yyyy-MM-dd";
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_PATTERN);
		Date date = new Date();
		String today = sdf.format(date);
		return innDao.getMyInn(mail, today, cri);
	}
	
	// 페이지네이션
	@Override public PageMaker getPageMakerByMypage(Criteria cri,String mail ) { 
		final String DATE_PATTERN = "yyyy-MM-dd";
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_PATTERN);
		Date date = new Date();
		String today = sdf.format(date);
		PageMaker pm = new PageMaker(); 
		pm.setCri(cri);
		pm.setTotalCount(innDao.getTotalCountByMypage(cri ,mail,today));
		return pm; 
	}
	
	// 예약 취소  
	@Override
	public void deleteInn(Integer data) {
		innDao.deleteInn(data);
	}
	
	// 관리자 페이지 예약 목록
	@Override
	public ArrayList<mypageDto> getAdminInn(Criteria cri) {
		final String DATE_PATTERN = "yyyy-MM-dd";
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_PATTERN);
		Date date = new Date();
		String today = sdf.format(date);
		return innDao.getAdminInn(today,cri);
	}
	
	@Override
	public PageMaker getPageMakerByAdmin(Criteria cri) {
		final String DATE_PATTERN = "yyyy-MM-dd";
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_PATTERN);
		Date date = new Date();
		String today = sdf.format(date);
		PageMaker pm = new PageMaker(); 
		pm.setCri(cri);
		pm.setTotalCount(innDao.getTotalCountByAdmin(cri,today));
		return pm;
	}
	
	

	

	
}
