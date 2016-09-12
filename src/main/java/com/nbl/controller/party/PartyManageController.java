package com.nbl.controller.party;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nbl.jspbean.party.PartyBean;
import com.nbl.service.manager.constant.PartyRoleType;
@RequestMapping(value= "/party")
@Controller
public class PartyManageController {

	private final static Logger logger = LoggerFactory.getLogger(PartyManageController.class); 

	@RequestMapping(value= "/add")
	public ModelAndView partyAdd(HttpServletRequest request, HttpServletResponse response){
		logger.info("/pary-add===");
		ModelAndView mv = new ModelAndView();		
		mv.setViewName("/WEB-INF/view/party/party_add");
		return mv;
		
	}

	@RequestMapping(value= "/query")
	public ModelAndView partyQuery(HttpServletRequest request, HttpServletResponse response){
		logger.info("/partyQuery===");
		ModelAndView mv = new ModelAndView();		
		
		List<PartyBean> list = new ArrayList<PartyBean>();
		PartyBean pb = new PartyBean();
		pb.setPartyNumber(PartyRoleType.GENERAL_MANA_OFFICE.getValue());
		pb.setPartyName(PartyRoleType.GENERAL_MANA_OFFICE.getDisplayName());
		pb.setPartyDescription("总监办作为平台运营指导办公");
		pb.setPartyPerson("刘总");
		pb.setPhone("13988888888");
		pb.setPartyParent(null);
		pb.setCreateTime(new Date());
		
		PartyBean pb1 = new PartyBean();
		pb1.setPartyNumber(PartyRoleType.OPERATE_BRANCH.getValue());
		pb1.setPartyName(PartyRoleType.OPERATE_BRANCH.getDisplayName());
		pb1.setPartyDescription("运营部门将参与整个平台运作");
		pb1.setPartyParent(PartyRoleType.GENERAL_MANA_OFFICE.getDisplayName());
		pb1.setPartyPerson("周总");
		pb1.setPhone("13988888888");
		pb1.setCreateTime(new Date());

		PartyBean pb2 = new PartyBean();
		pb2.setPartyNumber(PartyRoleType.MARKET_BRANCH.getValue());
		pb2.setPartyName(PartyRoleType.MARKET_BRANCH.getDisplayName());
		pb2.setPartyDescription("市场部参与平台市场开拓");
		pb2.setPartyPerson("史总");
		pb2.setPhone("13988888888");
		pb2.setPartyParent(PartyRoleType.GENERAL_MANA_OFFICE.getDisplayName());
		pb2.setCreateTime(new Date());

		
		list.add(pb);
		list.add(pb1);
		list.add(pb2);
		
		request.getSession().setAttribute("partyQueryList", list);
		
		mv.setViewName("/WEB-INF/view/party/party_query");
		return mv;
		
	}

	
	@RequestMapping(value= "/addResult")
	public ModelAndView partyAddResult(HttpServletRequest request, HttpServletResponse response){
		logger.info("/partyAddResult===");
		ModelAndView mv = new ModelAndView();
		
		
		mv.setViewName("/WEB-INF/view/party/party_addResult");
		return mv;
		
	}

	

}
