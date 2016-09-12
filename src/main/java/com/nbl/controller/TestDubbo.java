package com.nbl.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;


/**
 * @author Donald
 * @createdate 2016年3月17日
 * @version 1.0 
 * @description :
 */
@Controller
public class TestDubbo {
	private final static Logger logger = LoggerFactory.getLogger(TestDubbo.class); 
//	//@Autowired
//	private DubboConsumerInterface demoServiceRemote;
//	
//	@RequestMapping(value= "/portal-dubbo")
//	public ModelAndView getRequsetValue(HttpServletRequest request, HttpServletResponse response){
//		
//		ModelAndView mv = new ModelAndView();
//		String ms = demoServiceRemote.getName("tangchuchu");
//		if(ms==null){
//			logger.info("test logger:"+"");
//
//		}else{
//			logger.info("test logger:"+ms);
//
//		}
//		
//		Map map = new HashMap();
//		
//		mv.addObject("name", ms);
//		mv.setViewName("hello");
//		return mv;
//		
//	}
	
}
