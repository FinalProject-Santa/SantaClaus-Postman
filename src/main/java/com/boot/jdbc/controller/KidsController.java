package com.boot.jdbc.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boot.jdbc.model.biz.DiaryBiz;
import com.boot.jdbc.model.biz.MailHandler;
import com.boot.jdbc.model.biz.StickerBiz;
import com.boot.jdbc.model.dto.KidsDto;
import com.boot.jdbc.model.dto.MemberDto;

import edu.emory.mathcs.backport.java.util.Collections;



@Controller
@RequestMapping("/kids")
public class KidsController {
	
	//private static final Logger logger = LoggerFactory.getLogger(kidsController.class);
	
	@Autowired
	private DiaryBiz biz;
	@Autowired
	private StickerBiz stickerbiz;
	@Autowired
	private JavaMailSender mailSender;
	
	HttpSession session;
	
	
	@GetMapping("/main")
	public String main() {
		
		return "kids/main";
	}
	
	@GetMapping("/gamemain")
	public String puzzle() {
		
		return "kids/gamemain";
	}
	
	@GetMapping("/onelevel")
	public String puzzle_onelevel() {
		
		return "kids/puzzle_1level";
	}
	
	@GetMapping("/twolevel")
	public String puzzle_twolevel() {
		
		return "kids/puzzle_2level";
	}
	
	@GetMapping("/diary")
	public String diary() {
		
		return "kids/diary";
	}
	
	
	@GetMapping("/santamail")
	public String santamail() {
		
		return "kids/santa_mail";
	}
	
	
	@ResponseBody
	@RequestMapping(value = {"selectDate"}, method = RequestMethod.POST)
	public String selectDate(HttpServletRequest request) {
		
		session = request.getSession();
		String userId = ((MemberDto)session.getAttribute("member")).getUser_id();
		
		//String userId = request.getParameter("userID");
		LocalDate now = LocalDate.now();
		System.out.println(now);
		
		String today = biz.selectDate(userId,now); 
		System.out.println("select: "+biz.selectDate(userId,now));
		
		return today;
	};
	
	@ResponseBody
	@RequestMapping(value = {"fillDate"}, method = RequestMethod.POST)
	public String fillDate(HttpServletRequest request) {
		
		session = request.getSession();
		String userId = ((MemberDto)session.getAttribute("member")).getUser_id();
		
		String fillDate = request.getParameter("fillDate");
		LocalDate localdate = LocalDate.parse(fillDate, DateTimeFormatter.ofPattern("yyyyMMdd"));
		System.out.println("test :"+localdate);
		
		String date = biz.fillDate(userId,localdate);
		System.out.println("select: "+biz.fillDate(userId,localdate));
		
		return date;
	};
	
	
	@ResponseBody
	@RequestMapping(value = {"DiarySave"}, method = RequestMethod.POST)
	public ModelMap DiarySave(@RequestParam Map<Object, Object> param, final HttpServletRequest request, final HttpServletResponse response) throws Exception {
		ModelMap Map = new ModelMap();
		
		String binaryData = request.getParameter("imgSrc");
		
		session = request.getSession();
		
		String userId = ((MemberDto)session.getAttribute("member")).getUser_id();
		String userEmail = ((MemberDto)session.getAttribute("member")).getEmail();
		int kidsNo = ((KidsDto)session.getAttribute("kids")).getKids_no();
		String kidsnickname = ((KidsDto)session.getAttribute("kids")).getKids_nickname();
				
		FileOutputStream stream = null;
		LocalDate today = LocalDate.now();
		
		try {
		System.out.println("binary file " + binaryData);
		if(binaryData == null || binaryData.trim().equals("")) {
			throw new Exception();
		}
		binaryData = binaryData.replaceAll("data:image/png;base64,","");
		byte[]file = Base64.decodeBase64(binaryData);
		String fileName = today+" "+kidsnickname+"의 그림일기.png"; //UUID.randomUUID().toString()
		
		// 폴더 생성
		File newfile = new File("C:\\그림일기");
		newfile.mkdirs();
		
		stream = new FileOutputStream(newfile+"\\"+fileName);
		String filePath = newfile+"\\"+fileName;
//		param.put("filePath", filePath);
		
		biz.saveDiary(userId,kidsNo,filePath,userEmail);
		
		System.out.println(filePath);
		
		stream.write(file);
		stream.close();
		System.out.println("저장 완료");
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("에러 발생");
		}finally {
			if(stream != null) {
				stream.close();
			}
		}
		Map.addAttribute("resultMap","");
		
		return Map;
	};
	
	@ResponseBody
	@RequestMapping(value = {"DiaryFill"}, method = RequestMethod.POST)
	public ModelMap DiaryFill(final HttpServletRequest request, final HttpServletResponse response) throws Exception {
		ModelMap Map = new ModelMap();
		String binaryData = request.getParameter("imgSrc");
		
		session = request.getSession();
		
		String userId = ((MemberDto)session.getAttribute("member")).getUser_id();
		String userEmail = ((MemberDto)session.getAttribute("member")).getEmail();
		int kidsNo = ((KidsDto)session.getAttribute("kids")).getKids_no();
		String kidsnickname = ((KidsDto)session.getAttribute("kids")).getKids_nickname();
		
		String fillDate = request.getParameter("fillDate");
		LocalDate localdate = LocalDate.parse(fillDate, DateTimeFormatter.ofPattern("yyyyMMdd"));
		System.out.println("local: "+localdate);
		
		FileOutputStream stream = null;
		
		try {
		System.out.println("binary file " + binaryData);
		if(binaryData == null || binaryData.trim().equals("")) {
			throw new Exception();
		}
		binaryData = binaryData.replaceAll("data:image/png;base64,","");
		byte[]file = Base64.decodeBase64(binaryData);
		String fileName = localdate+" "+kidsnickname+"의 그림일기.png";
		
		// 폴더 생성
		File newfile = new File("C:\\그림일기");
		newfile.mkdirs();
		
		stream = new FileOutputStream(newfile+"\\"+fileName);
		String filePath = newfile+"\\"+fileName;
		
		biz.fillDiary(userId,kidsNo,filePath,localdate,userEmail);
		
		System.out.println(filePath);
		System.out.println(userId);
		stream.write(file);
		stream.close();
		System.out.println("저장 완료");
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("에러 발생");
		}finally {
			if(stream != null) {
				stream.close();
			}
		}
		Map.addAttribute("resultMap","");
		
		return Map;
	};
	
	
	@ResponseBody
	@RequestMapping(value = {"sendEmail"}, method = RequestMethod.POST)
	public void sendMailWithFiles(@RequestParam Map<Object, Object> param, final HttpServletRequest request, final HttpServletResponse response) throws MessagingException, IOException {
		
		String path = request.getParameter("imgSrc");
		System.out.println(path);
		
		session = request.getSession();
		
		String userEmail = ((MemberDto)session.getAttribute("member")).getEmail();
		String kidsnickname = ((KidsDto)session.getAttribute("kids")).getKids_nickname();

		MailHandler mailHandler = new MailHandler(mailSender);
		
		mailHandler.setFrom("jiyoun_908@naver.com");
		mailHandler.setTo(userEmail);
		mailHandler.setSubject("[Dear Santa_kids] "+kidsnickname+"의 그림일기");
		
		String htmlContent = "<img src='data:image/png;base64,"+path+"'><br>"+kidsnickname+"의 그림일기를 저장하여 간직하세요 :D";
		mailHandler.setText(htmlContent,true);
		//mailHandler.setInline("img1","classpath:resources/image/kids/img1.png");
		mailHandler.send();
	}
	
	@GetMapping("/FillSticker")
	public String FillSticker(HttpServletRequest request, Model model) throws ParseException {
		
		String fillDate = request.getParameter("write_date");
		System.out.println(fillDate);
		
		SimpleDateFormat dtFormat = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
		
		Date formatDate = dtFormat.parse(fillDate);
		String strDate = simpleDateFormat.format(formatDate);
		System.out.println("strDate: "+strDate);
		
		model.addAttribute("Date",fillDate);
		model.addAttribute("strDate",strDate);
		return "kids/fill_diary";
	}
	
	
	@PostMapping("/sticker")
	public String selectSticker(HttpServletRequest request,Model model) {
		
		int i;
		session = request.getSession();
		
		String userId = ((MemberDto)session.getAttribute("member")).getUser_id();
		int kidsNo = ((KidsDto)session.getAttribute("kids")).getKids_no();
		
		//스티커 개수
		stickerbiz.selectDiary(kidsNo);
		int stickerCount = stickerbiz.selectDiary(kidsNo);
		stickerbiz.deleteSticker(kidsNo);
		stickerbiz.insertSticker(kidsNo,stickerCount);
		
		//스티커 날짜
		stickerbiz.selectStickerDate(kidsNo);
		
		ArrayList<String> Date = stickerbiz.selectStickerDate(kidsNo);
		
		List<Integer> DecDay = new ArrayList<>();
		List<Integer> JanDay = new ArrayList<>(); // 1월 데이터 날짜
		List<String> totalDay = new ArrayList<>(); // 1일-31일
		
		
		
		for(i=1; i<10; i++) {
			totalDay.add("0"+Integer.toString(i));
		}
		
		for(i=10; i<=31; i++) {
			totalDay.add(Integer.toString(i));
		}
		
		model.addAttribute("totalDay",totalDay);
		
		
		for(i=0; i<Date.size(); i++) {
			if(Date.get(i).matches("(.*)-12-(.*)")) {
				DecDay.add(Integer.parseInt(Date.get(i).substring(8)));
				Collections.sort(DecDay);
				model.addAttribute("DecDay",DecDay);
				model.addAttribute("DecSize", DecDay.size());
			}else if(Date.get(i).matches("(.*)-02-(.*)")) {
				JanDay.add(Integer.parseInt(Date.get(i).substring(8)));
				Collections.sort(JanDay);
				model.addAttribute("JanDay",JanDay); //FebDay
				model.addAttribute("JanSize", JanDay.size()); //FebSize
			}
		}
		
		return "/kids/sticker";
	}
	
	
	@GetMapping("/mainsticker")
	public String selectSticker_menu(HttpServletRequest request,Model model) {
		
		int i;
		session = request.getSession();
		
		String userId = ((MemberDto)session.getAttribute("member")).getUser_id();
		int kidsNo = ((KidsDto)session.getAttribute("kids")).getKids_no();
		
		//스티커 개수
		stickerbiz.selectDiary(kidsNo);
		int stickerCount = stickerbiz.selectDiary(kidsNo);
		stickerbiz.deleteSticker(kidsNo);
		stickerbiz.insertSticker(kidsNo,stickerCount);
		
		//스티커 날짜
		stickerbiz.selectStickerDate(kidsNo);
		
		ArrayList<String> Date = stickerbiz.selectStickerDate(kidsNo);
		
		List<Integer> DecDay = new ArrayList<>();
		List<Integer> JanDay = new ArrayList<>(); // 1월 데이터 날짜
		List<String> totalDay = new ArrayList<>(); // 1일-31일
		
		
		
		for(i=1; i<10; i++) {
			totalDay.add("0"+Integer.toString(i));
		}
		
		for(i=10; i<=31; i++) {
			totalDay.add(Integer.toString(i));
		}
		
		model.addAttribute("totalDay",totalDay);
		
		
		for(i=0; i<Date.size(); i++) {
			if(Date.get(i).matches("(.*)-12-(.*)")) {
				DecDay.add(Integer.parseInt(Date.get(i).substring(8)));
				Collections.sort(DecDay);
				model.addAttribute("DecDay",DecDay);
				model.addAttribute("DecSize", DecDay.size());
			}else if(Date.get(i).matches("(.*)-02-(.*)")) {
				JanDay.add(Integer.parseInt(Date.get(i).substring(8)));
				Collections.sort(JanDay);
				model.addAttribute("JanDay",JanDay); //FebDay
				model.addAttribute("JanSize", JanDay.size()); //FebSize
			}
		}
		
		return "/kids/sticker";
	}
	
	
	@GetMapping("/samegame")
	public String sameGame() {
		
		return "kids/same_game";
	}
	
	@ResponseBody
	@RequestMapping(value = {"gamePoint"}, method = RequestMethod.POST)
	public String gamePoint(HttpServletRequest request) {
		
		session = request.getSession();
		
		int kidsNo = ((KidsDto)session.getAttribute("kids")).getKids_no();
		
		biz.insertPoint(kidsNo);
		return "point";
	}
	
}
