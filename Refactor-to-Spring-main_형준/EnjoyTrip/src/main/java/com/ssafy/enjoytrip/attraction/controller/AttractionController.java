package com.ssafy.enjoytrip.attraction.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ssafy.enjoytrip.attraction.model.Attraction;
import com.ssafy.enjoytrip.attraction.model.ContentType;
import com.ssafy.enjoytrip.attraction.model.Sido;
import com.ssafy.enjoytrip.attraction.model.service.AttractionService;
import com.ssafy.enjoytrip.attraction.model.service.AttractionServiceImpl;

//이거하면 _ 를 를 제거해준다 
//underscore to camelcase

@Controller
@RequestMapping("/attraction")
public class AttractionController extends HttpServlet {
	
	private AttractionService attService;
	
	private Map<String, List> typeMap;
	
	public AttractionController(AttractionService attService) throws Exception {
		super();
		this.attService = attService;
		typeMap = new HashMap<String, List>();
		
		//시도 리스트 
		List<Sido> sidoList = attService.sidoList();
		typeMap.put("sidoList", sidoList);	
		//관광지 타입 리스트
		List<ContentType> contentTypeList = attService.contentTypeList();
		typeMap.put("contentTypeList", contentTypeList);
		
		
	}
	
		
	//JSP에서 typeMap을 접근할수있다 (/attraction 일경우)
	@ModelAttribute("typeMap")
	public Map<String, List> getTypeMap() {
		return typeMap;
	}
	
	@GetMapping("mainList")
	private String mainList() {
		return "/attraction/main";
	}
	
	
	//디테일 페이지 클릭시 AJAX로 전달해줄 데이터 
	@GetMapping("attracionDetail")
	private void attracionDetail(int idCode, HttpServletResponse response) {
		try {
			System.out.println(idCode);
			Attraction att = attService.getAttraction(idCode);
			
			ObjectMapper objectMapper = new ObjectMapper();
			String attListJson = objectMapper.writeValueAsString(att);
			System.out.println(attListJson);
			response.setContentType("application/json;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print(attListJson);
			out.flush();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//디테일 페이지 리스트 정보 받아오기
	@GetMapping("detailForm")
	private String detailForm(int contentId, String mode, Model model) {
		
		try {
			//출력할 리스트 반환 받음
			List<Attraction> attList = attService.attListByDetailForm(contentId, mode);
			model.addAttribute("attList", attList);
			
			if(mode.equals("sido")) {
			List<Sido> sidos = typeMap.get("sidoList");
			
			for(Sido sido : sidos) {
					if(sido.getSidoCode() == attList.get(0).getSidoCode()) {
						model.addAttribute("allboxInfo", sido.getSidoName());
					}
				}
			}else if(mode.equals("content")) {
				List<ContentType> listType = typeMap.get("contentTypeList");
				for(ContentType type : listType) {
					//System.out.println(type.getContentTypeName());
					if(type.getContentTypeId() == attList.get(0).getContentTypeId()) {
						model.addAttribute("allboxInfo", type.getContentTypeName());
					}
				}
			}else model.addAttribute("allboxInfo",  "");
		
		} catch(Exception e) {
			e.printStackTrace();
			return "/error/error";
		}
		return "/attraction/detail_information";
	}
	
	@GetMapping("detail")
	private void detail(int contentId, String mode, HttpServletResponse response) {
		
		try {
			List<Attraction> attList = attService.attListByDetail(contentId, mode);
			for(Attraction list : attList) {
				System.out.println(list.toString());
			}
			//object를 json 형식으로 변형 ( list object 를 json으로 !)
			ObjectMapper objectMapper = new ObjectMapper();
			String attListJson = objectMapper.writeValueAsString(attList);
			//reponse 타입 설정
			response.setContentType("application/json;charset=UTF-8");
			//printWirter 타입의 out선언
			PrintWriter out = response.getWriter();
			out.print(attListJson);
			out.flush();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	

	@GetMapping("contentPage")
	private String contentPage(@RequestParam("content")int contentTypeId, Model model) {
		
		try {
			List<Attraction> attList = attService.attListByContent(contentTypeId);
			List<ContentType> contentTypeList = typeMap.get("contentTypeList");
			String contentTypeName = "";
			for(ContentType content : contentTypeList) {
				if(contentTypeId == content.getContentTypeId()) contentTypeName = content.getContentTypeName();
			}
			model.addAttribute("attList", attList);
			model.addAttribute("contentTypeName", contentTypeName);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "/attraction/contentPage";
	}

	@GetMapping("areaPage")
	private String areaPage(@RequestParam("sido")String sidoCode, Model model) {
		
		try {
			List<ContentType> contentTypeList = typeMap.get("contentTypeList");;
			model.addAttribute("contentList", contentTypeList);
			model.addAttribute("sidoCode", Integer.valueOf(sidoCode));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "attraction/areaPage";
	}
	
	@GetMapping("areaContent")
	private void areaContent(@RequestParam("sido")int sidoCode, @RequestParam("content") int contentId, HttpServletResponse response) {
		
		System.out.println(sidoCode +" " + contentId);
		try {
			List<Attraction> attList = attService.attList(sidoCode, contentId);
			ObjectMapper objectMapper = new ObjectMapper();
			String attListJson = objectMapper.writeValueAsString(attList);
			System.out.println(attListJson);
			response.setContentType("application/json;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print(attListJson);
			out.flush();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	@PostMapping("search")
	private String search(String keyword, HttpServletResponse response, Model model, HttpServletRequest request ) throws ServletException, IOException {
		try {
			List<Attraction> attList = attService.search(keyword);
//			System.out.println(attList);
			if(attList.size() == 0) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('검색결과가 없습니다.');</script>");
				out.flush();
				String url = request.getHeader("REFERER"); 
				return url;
			}
			String tmp = "검색어 : "+keyword;
			model.addAttribute("attList", attList);
			model.addAttribute("allboxInfo",  tmp);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/attraction/detail_information";
	}
}
