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
	public ArrayList<String> getDateList(Calendar cal) {
		// string형식으로 res 에 결과값 저장하도록 새로 선언해줌.
		ArrayList<String> res = new ArrayList<String>();
		
		// 데이터 형식은 이렇게 지정해준다는것
		SimpleDateFormat transFormat = 
				new SimpleDateFormat("yyyy-MM-dd");
		// 문자열 strdate
		String strdate = transFormat.format(cal.getTime());
		
		// 지금은 테스트를 위해 db에 저장된 값으로 예를 들어 날짜 지정함. 원래는 여기서 원하는 달에 대한 날짜들을 반복문으로 처리해줘야한다. 예를 들면 9월1일~9월31일까지 반복문으로 ! 그래서 반복문 사이에 있는 날짜들에 예약 리스르를 저장하게끔!
		//strdate = "2020-09-21"; // 이 밑으로 이제 반복문을 실행시켜주면 작동하게된다. 
		
		// 9월 말이 찍히게 하는 코드 추가, 테스트 하다가 말았음!
		cal.set(Calendar.DAY_OF_MONTH , cal.getActualMaximum(Calendar.DAY_OF_MONTH));
		String enddate =  transFormat.format(cal.getTime());
		
		ArrayList<String> dateList = null;
		
		try {
			dateList = getDateList(strdate,enddate);
			for(String tmp : dateList) {
				ArrayList<DateVo> list = innDao.getDates(tmp);

				int cnt = 0; // 새로 변수 하나 선언해주고, cnt는 예약되어질 날짜들 각각의 초기값! 처음엔 당연히 0으로 선언되어지는게 맞다.
				int max = 2; // 예를 들어 하루에 들어갈 마리수를 max로 2마리를 지정해줬을경우를 가정하고 테스트 !
				// for 반복문. tmp에 list값 저장해서 카운트 해주기
				for(DateVo tmp2 : list) {
					// 숙박기간중에 시작 날짜가 포함되어있으면 true, 아니면false. 
					System.out.println(tmp2);
					if(tmp2.range(tmp)) {
						cnt ++;
					}
				}
				System.out.println(cnt);
				
				// 만약 각각의 날짜에 예약된 수가 최대로 예약되어질 수 있는 수와 같다면, res에 strdate저장해주기.
				if(cnt == max) {
					res.add(tmp);
				}
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		ArrayList<DateVo> list = innDao.getDates(strdate);
//
//		int cnt = 0; // 새로 변수 하나 선언해주고, cnt는 예약되어질 날짜들 각각의 초기값! 처음엔 당연히 0으로 선언되어지는게 맞다.
//		int max = 2; // 예를 들어 하루에 들어갈 마리수를 max로 2마리를 지정해줬을경우를 가정하고 테스트 !
//		// for 반복문. tmp에 list값 저장해서 카운트 해주기
//		for(DateVo tmp : list) {
//			// 숙박기간중에 시작 날짜가 포함되어있으면 true, 아니면false. 
//			System.out.println(tmp);
//			if(tmp.range(strdate)) {
//				cnt ++;
//			}
//		}
//		System.out.println(cnt);
//		
//		// 만약 각각의 날짜에 예약된 수가 최대로 예약되어질 수 있는 수와 같다면, res에 strdate저장해주기.
//		if(cnt == max) {
//			res.add(strdate);
//		}
			
		
		return res;
	}

	public ArrayList<String> getDateList(String start, String end) throws ParseException{
		final String DATE_PATTERN = "yyyy-MM-dd";
		
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_PATTERN);
		Date startDate = sdf.parse(start);
		Date endDate = sdf.parse(end);
		ArrayList<String> dates = new ArrayList<String>();
		Date currentDate = startDate;
		while (currentDate.compareTo(endDate) <= 0) {
			dates.add(sdf.format(currentDate));
			Calendar c = Calendar.getInstance();
			c.setTime(currentDate);
			c.add(Calendar.DAY_OF_MONTH, 1);
			currentDate = c.getTime();
		}
		
		return dates;
	}
	
	
	// 퍼블릭 보이드 ( 컨트롤러에서 만든 메서드 ) ~~ htt
	// 	dao.insert~~ 숙박정보 + 유저~~
	// 퍼블릭 보이드  ~~ htt 강아지 정보
	// dao.get~~ 숙박정보 ( 유저메일을 통해 숙박번호 받아오기 ) 
	// select max(num) from 숙박정보 where mail = 유저메일 ( 이렇게 설정해주는 이유는 제이 마지막 큰 숫자가 최근일이 되기 때문에! )
	// dao.insert 강아지정보 + 유저 + 숙박번호 ~~ 
}
