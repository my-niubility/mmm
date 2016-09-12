package com.nbl.controller.product;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.customer.CustEnterpriseBean;
import com.nbl.jspbean.product.StandardProductBean;
import com.nbl.services.customer.CustEnterpriseService;
import com.nbl.services.product.PublishProductService;

/**
 * @author Donald
 * @createdate 2016年7月13日
 * @version 1.0 
 * @description :发布基金系列产品控制器
 */
@RequestMapping(value= "/publish")
@Controller
public class PublishFundProductController {

	private final static Logger logger = LoggerFactory.getLogger(PublishFundProductController.class); 
	
	@Resource
	private CustEnterpriseService enterpriseService;
	@Resource
	private PublishProductService publishProductService;
	

	@RequestMapping(value= "/project/fund_02",method = {RequestMethod.POST, RequestMethod.GET})
	public String  product02(HttpServletRequest request, HttpServletResponse response){
		logger.info("/project/fund_02===");
		//赋值
		StandardProductBean sp = this.setParameter(request);
		String productType = request.getParameter("productType");
		sp.setProductType(productType);
		logger.info("产品类型为           =   " + sp.getProductType());
		//默认查询
		CustEnterpriseBean cb = new CustEnterpriseBean();
		//根据前端每页展示数据条数
		PageVO<CustEnterpriseBean> pageVO = new PageVO<CustEnterpriseBean>(); 
		pageVO.setStartSize(0);
		pageVO.setSize(8);
		//默认查询分页条数查询
		List<CustEnterpriseBean> cbList = enterpriseService.pageListQueryEnterprise(pageVO, cb);
		if(cbList !=null && cbList.size()>0){
			logger.info("/根据默认条件计算总数据条数cbList.size()==="+cbList.size());
		}
		//根据相同查询条件计算总数据条数
		int count = enterpriseService.pageCountQueryEnterprise(cb);
		logger.info("/根据默认条件计算总数据条数=="+count);

		//设置session参数（session级别查询条件）
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", cb);

		request.getSession().setAttribute("cbList", cbList);
		request.getSession().setAttribute("accountCount", count);
		request.getSession().setAttribute("accountSize", 8);
		
		request.getSession().setAttribute("StandardProductBean", sp);
		return "/WEB-INF/view/product/fund_02_Project";
		
	}
	
private StandardProductBean setParameter(HttpServletRequest request){
		
		StandardProductBean sp = new StandardProductBean();
		
		//获取页面数据
		String productName = request.getParameter("productName");//产品名称
		String productTittleType = request.getParameter("productTittleType");//产品小类
		String startTime = request.getParameter("startTime");//募集开始时间
		String startdt = request.getParameter("startdt");//募集开始日期
		String scale = request.getParameter("scale");//募集规模
		String scaleLimit = scale;//投资上限
		String unitcost = request.getParameter("unitcost");//产品单价
		String rate = request.getParameter("rate");//年化利率
		String investMin = request.getParameter("investMin");//投资下限
		//0等额本息（月）1等额本金（月） 2一次还本付息（天） 3每月付息到期还本（月） 4每月付息到期还本（天）
		String rentMode = request.getParameter("rentMode"); 
		String subsidyFlag = request.getParameter("subsidyFlag");//0不补贴 1 补贴
		String subsidyRate = request.getParameter("subsidyRate");//补贴利率
		String subsidyDay = request.getParameter("subsidyDay");//补贴天数
		String redType = request.getParameter("redType");//红包抵扣类型 01  按用户发放 02 按产品发放  03 按投资金额发放  04 按活动类型发放
		//前台如果没有传过来产品小类为标准产品
		if(StringUtils.isNotEmpty(productTittleType)){
			sp.setProductTittleType(productTittleType);
			logger.info("产品小类类型为        = "+ sp.getProductTittleType());
		}else{
			sp.setProductTittleType(null);
		}
		
		if("99".equals(redType)){
			sp.setRedType("99");
		}else{
			sp.setRedType(redType);
			logger.info("红包类型为        = "+ sp.getRedType());
		}
		sp.setProductName(productName);
		sp.setRate(rate);
		sp.setRentMode(rentMode);
		sp.setScale(scale);
		sp.setScaleLimit(scaleLimit);
		sp.setStartdt((startTime.substring(0, 11)).replace("-", ""));
		sp.setSubsidyFlag(subsidyFlag);
		sp.setSubsidyDay(subsidyDay);
		sp.setSubsidyRate(subsidyRate);
		sp.setUnitcost(unitcost);
		sp.setInvestMin(Long.parseLong(investMin));
		sp.setRemainTerms(1L);//剩余期数
		sp.setFinancePortion(Long.parseLong(scale));
		try {
			sp.setStartTime( (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).parse(startTime));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return sp;
	}

	@RequestMapping(value = "/project/fund_03", method = { RequestMethod.POST, RequestMethod.GET })
	public String product03(HttpServletRequest request, HttpServletResponse response) {
		logger.info("/project/fund_03===");
		// 赋值
		StandardProductBean sp = (StandardProductBean) request.getSession().getAttribute("StandardProductBean");
		
		logger.info("基金03页面类型为           =   " + sp.getProductType());
		
		String finChoice = request.getParameter("finChoice");
		// 处理融资人Id、融资人名称
		String[] agr = finChoice.split(":");
		String financeId = agr[1];
		String financeName = agr[0];
		sp.setFinanceId(financeId);
		sp.setFinanceName(financeName);
		request.getSession().setAttribute("fund", sp);

		return "/WEB-INF/view/product/fund_03_Product";

	}

	@RequestMapping(value = "/project/fund_pub", method = { RequestMethod.POST, RequestMethod.GET })
	public String productPub(HttpServletRequest request, HttpServletResponse response) {
		logger.info("/project/fund_pub===");
		// 赋值
		StandardProductBean sp = (StandardProductBean) request.getSession().getAttribute("fund");

		// 保存
		boolean addFlag = publishProductService.publishStandard(sp);
		if (addFlag) {
			// 成功
			request.setAttribute("conName", "恭喜");
			request.setAttribute("modFlag", "成功");
		} else {
			// 失败
			request.setAttribute("conName", "恭喜");
			request.setAttribute("modFlag", "成功");
		}

		request.setAttribute("productName", sp.getProductName());
		return "/WEB-INF/view/product/standard_rs_Product";

	}
	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:页面工具上下页导航查询
	 */
	@RequestMapping(value= "/project/fund_02/pageList",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryChargePage(HttpServletRequest request, HttpServletResponse response){
		logger.info("/project/fund_02/pageList===");
		
		//设置session参数（session级别查询条件）
		PageVO<CustEnterpriseBean> pageVO = (PageVO<CustEnterpriseBean>) request.getSession().getAttribute("pageVo");
		CustEnterpriseBean cb = (CustEnterpriseBean) request.getSession().getAttribute("reqDto");
		//偏移量
		int offset = request.getParameter("pager.offset")==null? 0:Integer.parseInt(request.getParameter("pager.offset"));
		pageVO.setStartSize(offset);
		logger.info("/偏移量offset==="+offset);
		List<CustEnterpriseBean> cbList = enterpriseService.pageListQueryEnterprise(pageVO, cb);
		if(cbList !=null && cbList.size()>0){
			logger.info("/cbList.size()==="+cbList.size());
		}
		
		request.getSession().setAttribute("cbList", cbList);
		
		return "/WEB-INF/view/product/fund_02_Project";
		
	}
//
//	@RequestMapping(value= "/project/{direction}",method = {RequestMethod.POST, RequestMethod.GET})
//	public String project(HttpServletRequest request, HttpServletResponse response,@PathVariable String direction){
//		logger.info("/publish-project===");
//		if("front".equals(direction)){
//			this.setProductValues(request);
//		}
//		return "/WEB-INF/view/product/pubSolar_02_Project";
//		
//	}
//	@RequestMapping(value= "/finance/{direction}",method = {RequestMethod.POST, RequestMethod.GET})
//	public String finance(HttpServletRequest request, HttpServletResponse response,@PathVariable String direction){
//		logger.info("/publish-finance===");
//		if("front".equals(direction)){
//			this.setProjectVaules(request);
//		}
//		return "/WEB-INF/view/product/pubSolar_03_Finance";
//		
//	}
//
//	@RequestMapping(value= "/rent/{direction}",method = {RequestMethod.POST, RequestMethod.GET})
//	public String rent(HttpServletRequest request, HttpServletResponse response,@PathVariable String direction){
//		logger.info("/publish-rent===");
//		if("front".equals(direction)){
//			this.setFinanceVaules(request);
//		}
//		return "/WEB-INF/view/product/pubSolar_04_Rent";
//		
//	}
//
//	@RequestMapping(value= "/finAdd",method = RequestMethod.POST)
//	public String finAdd(HttpServletRequest request, HttpServletResponse response){
//		logger.info("/finAdd===");
//		//获取产品信息、项目信息、承租人信息、租赁物信息
//		SolarProductPublishBean pp = (SolarProductPublishBean)request.getSession().getAttribute("product");
//		SolarProjectPublishBean pj = (SolarProjectPublishBean)request.getSession().getAttribute("project");
//		FinanceExtendsBean fn = (FinanceExtendsBean)request.getSession().getAttribute("finance");
//		this.setRentVaules(request);
//		RentRigsterBean re = (RentRigsterBean)request.getSession().getAttribute("rent");
//		String productId = (String) request.getSession().getAttribute("productId");
//		logger.info("/提交汇总数据，SolarProductPublishBean==="+pp.toString());
//		logger.info("/提交汇总数据，SolarProjectPublishBean==="+pj.toString());
//		logger.info("/提交汇总数据，FinanceExtendsBean==="+fn.toString());
//		logger.info("/提交汇总数据，RentRigsterBean==="+re.toString());
//		logger.info("/提交汇总数据，获取产品id==="+productId);
//		Object mapObj = request.getSession().getAttribute(productId+"_map");
//		if(mapObj!=null){
//			pj.setProjectMap(mapObj.toString().getBytes());
//		}
//		Object env1Obj = request.getSession().getAttribute(productId+"_env1");
//		if(env1Obj!=null){
//			pj.setProjectEnv1(env1Obj.toString().getBytes());
//		}
//		Object env2Obj = request.getSession().getAttribute(productId+"_env2");
//		if(env2Obj!=null){
//			pj.setProjectEnv2(env2Obj.toString().getBytes());
//		}
//		Object env3Obj = request.getSession().getAttribute(productId+"_env3");
//		if(env3Obj!=null){
//			pj.setProjectEnv3(env3Obj.toString().getBytes());
//		}
//		Object env4Obj = request.getSession().getAttribute(productId+"_env4");
//		if(env4Obj!=null){
//			pj.setProjectEnv4(env4Obj.toString().getBytes());
//		}
//		publishSolarService.publishSolar(pp, pj, fn, re);
//		return "/WEB-INF/view/product/publishSuccess";
//		
//	}
//
//	
//	@RequestMapping(value= "/upload",method = RequestMethod.POST)
//	public void upload(HttpServletRequest request, HttpServletResponse response) throws Exception{
//		
//        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
//        MultipartFile multipartFile = multipartRequest.getFile("Filedata");//上传文件
//
//        String originalFilename = multipartFile.getOriginalFilename(); // 文件全名
//        String savePath = "/usr/local/upload/"+originalFilename;
//        File file = new File(savePath);
//        //如果目录不存在
//        if(!file.exists()){
//           //创建目录
//           file.mkdirs();
//           logger.info("/savePath="+savePath);
//        }
//        //产品id
//        String productId = (String) request.getSession().getAttribute("productId");
//        logger.info("/获取产品id="+productId);
//        String name = originalFilename.substring(0, originalFilename.indexOf("."));
//        //简化处理
//        if("map".equals(name)){
//        	logger.info("/map.size="+productId);
//        	request.getSession().setAttribute(productId+"_map", multipartFile.getBytes());
//        }else if("env1".equals(name)){
//        	request.getSession().setAttribute(productId+"_env1", multipartFile.getBytes());
//        }else if("env2".equals(name)){
//        	request.getSession().setAttribute(productId+"_env2", multipartFile.getBytes());
//        }else if("env3".equals(name)){
//        	request.getSession().setAttribute(productId+"_env3", multipartFile.getBytes());
//        }else{
//        	
//        }       
//        multipartFile.transferTo(file);
//		
//	}
//
//	
//	
//	@RequestMapping(value= "/upload.bak",method = RequestMethod.POST)
//	public void uploadBak(HttpServletRequest request, HttpServletResponse response){
//		//得到上传文件的保存目录，将上传的文件存放于WEB-INF目录下，不允许外界直接访问，保证上传文件的安全
//		String savePath = request.getContextPath()+"/upload";
//		//上传时生成的临时文件保存目录
//		String tempPath = request.getContextPath()+"/temp";
//		logger.info("/upload==savePath="+savePath+",tempPath="+tempPath);
//		logger.info("getAttributeNames="+request.getAttributeNames().toString());
//		
//		File tmpFile = new File(tempPath);
//		if (!tmpFile.exists()) {
//			//创建临时目录
//			tmpFile.mkdir();
//		}
//	    //消息提示
//		String message = "";
//		try{
//			//使用Apache文件上传组件处理文件上传步骤：
//			//1、创建一个DiskFileItemFactory工厂
//			DiskFileItemFactory factory = new DiskFileItemFactory();
//			//设置工厂的缓冲区的大小，当上传的文件大小超过缓冲区的大小时，就会生成一个临时文件存放到指定的临时目录当中。
//			factory.setSizeThreshold(1024*100);//设置缓冲区的大小为100KB，如果不指定，那么缓冲区的大小默认是10KB
//			//设置上传时生成的临时文件的保存目录
//			factory.setRepository(tmpFile);
//			//2、创建一个文件上传解析器
//			ServletFileUpload upload = new ServletFileUpload(factory);
//			//监听文件上传进度
//			upload.setProgressListener(new ProgressListener(){
//				public void update(long pBytesRead, long pContentLength, int arg2) {
//            	logger.info("文件大小为：" + pContentLength + ",当前已处理：" + pBytesRead);
//
//		         }});
//		    //解决上传文件名的中文乱码
//		    upload.setHeaderEncoding("UTF-8"); 
//		    //3、判断提交上来的数据是否是上传表单的数据
//		    if(!ServletFileUpload.isMultipartContent(request)){
//		        //按照传统方式获取数据
//		        return;
//		    }
//		                      
//            //设置上传单个文件的大小的最大值，目前是设置为1024*1024字节，也就是1MB
//            upload.setFileSizeMax(1024*1024);
//            //设置上传文件总量的最大值，最大值=同时上传的多个文件的大小的最大值的和，目前设置为10MB
//            upload.setSizeMax(1024*1024*10);
//            //4、使用ServletFileUpload解析器解析上传数据，解析结果返回的是一个List<FileItem>集合，每一个FileItem对应一个Form表单的输入项
//            List<FileItem> list = upload.parseRequest(request);
//            logger.info("表单大小为：" + list.size());
//            for(FileItem item : list){
//                //如果fileitem中封装的是普通输入项的数据
//                if(item.isFormField()){
//                   String name = item.getFieldName();
//                   //解决普通输入项的数据的中文乱码问题
//                   String value = item.getString("UTF-8");
//                   //value = new String(value.getBytes("iso8859-1"),"UTF-8");
//                   logger.info(name + "=" + value);
//                 }else{//如果fileitem中封装的是上传文件
//                   //得到上传的文件名称，
//                   String filename = item.getName();
//                   logger.info(filename);
//                   if(filename==null || filename.trim().equals("")){
//                      continue;
//                   }
//                   //注意：不同的浏览器提交的文件名是不一样的，有些浏览器提交上来的文件名是带有路径的，如：  c:\a\b\1.txt，而有些只是单纯的文件名，如：1.txt
//                   //处理获取到的上传文件的文件名的路径部分，只保留文件名部分
//                   filename = filename.substring(filename.lastIndexOf("\\")+1);
//                   //得到上传文件的扩展名
//                   String fileExtName = filename.substring(filename.lastIndexOf(".")+1);
//                   //如果需要限制上传的文件类型，那么可以通过文件的扩展名来判断上传的文件类型是否合法
//                   logger.info("上传的文件的扩展名是："+fileExtName);
//                   //获取item中的上传文件的输入流
//                   InputStream in = item.getInputStream();
//                   //得到文件保存的名称
//                   String saveFilename = makeFileName(filename);
//                   //得到文件的保存目录
//                   String realSavePath = makePath(saveFilename, savePath);
//                   //创建一个文件输出流
//                   FileOutputStream out = new FileOutputStream(realSavePath + "\\" + saveFilename);
//                   //创建一个缓冲区
//                   byte buffer[] = new byte[1024];
//                   //判断输入流中的数据是否已经读完的标识
//                   int len = 0;
//                   //循环将输入流读入到缓冲区当中，(len=in.read(buffer))>0就表示in里面还有数据
//                   while((len=in.read(buffer))>0){
//                     //使用FileOutputStream输出流将缓冲区的数据写入到指定的目录(savePath + "\\" + filename)当中
//                         out.write(buffer, 0, len);
//                   }
//                   //关闭输入流
//                   in.close();
//                   //关闭输出流
//                   out.close();
//                   //删除处理文件上传时生成的临时文件
//                   //item.delete();
//                   message = "文件上传成功！";
//                 }
//           }
//        }catch (FileUploadBase.FileSizeLimitExceededException e) {
//            e.printStackTrace();
////		                     request.setAttribute("message", "单个文件超出最大值！！！");
////		                     request.getRequestDispatcher("/message.jsp").forward(request, response);
//             return;
//         }catch (FileUploadBase.SizeLimitExceededException e) {
//             e.printStackTrace();
////		                    request.setAttribute("message", "上传文件的总的大小超出限制的最大值！！！");
////		                     request.getRequestDispatcher("/message.jsp").forward(request, response);
//             return;
//         }catch (Exception e) {
//            message= "文件上传失败！";
//             e.printStackTrace();
//        }
//        request.setAttribute("message",message);
////		                request.getRequestDispatcher("/message.jsp").forward(request, response);
//		
//	}
//
//	
//	/**
//	 * @param request
//	 * @description:生成产品要素集
//	 */
//	private void setProductValues(HttpServletRequest request){
//		
//		SolarProductPublishBean pp = new SolarProductPublishBean();
//		pp.setBackday(request.getParameter("backday"));
//		pp.setCarbon(request.getParameter("carbon"));
//		pp.setContrday(request.getParameter("contrday"));
//		pp.setHoldday(request.getParameter("holdday"));
//		pp.setLockday(request.getParameter("lockday"));
//		pp.setNonbackday(request.getParameter("nonbackday"));
//		pp.setProAddress(request.getParameter("proAddress"));
//		pp.setProductName(request.getParameter("productName"));
//		pp.setProductType(request.getParameter("productType"));
//		pp.setProjectStep(request.getParameter("projectStep"));
//		pp.setProScaleMess(request.getParameter("proScaleMess"));
//		pp.setRate(request.getParameter("rate"));
//		pp.setRentType(request.getParameter("rentType"));
//		pp.setScale(request.getParameter("scale"));
//		pp.setStartdt(request.getParameter("startdt"));
//		pp.setTransfer(request.getParameter("transfer"));
//		pp.setUnitcost(request.getParameter("unitcost"));
//		logger.info("productObject:-----"+pp.toString());
//		//生成产品id（pd_solar_8位日期_3位数字）
//		String dateSt = new DateTimeUtils().toDate8String(); 
//		String productId = "pd_solar_"+dateSt+"_"+new Random().nextInt(999);
//		pp.setProductId(productId);
//		request.getSession().setAttribute("productId", productId);
//		request.getSession().setAttribute("product", pp);
//	}
//	
//	/**
//	 * @param request
//	 * @description:生成项目要素集
//	 */
//	private void setProjectVaules(HttpServletRequest request){
//		SolarProjectPublishBean pp = new SolarProjectPublishBean();
//		pp.setProjectBenefit(request.getParameter("projectBenefit"));
//		pp.setProjectIntro(request.getParameter("projectIntro"));
//		pp.setProjectName(request.getParameter("projectName"));
//		pp.setProjectRemark1(request.getParameter("projectRemark1"));
//		pp.setProjectRemark2(request.getParameter("projectRemark2"));
//		pp.setProjectRemark3(request.getParameter("projectRemark3"));
//		pp.setProjectRemark4(request.getParameter("projectRemark4"));
//		pp.setProjectStaMess(request.getParameter("projectStaMess"));
//		pp.setRentOperateMess(request.getParameter("rentOperateMess"));
//		pp.setRentRights(request.getParameter("rentRights"));
//		pp.setRentTraceMess(request.getParameter("rentTraceMess"));
//		logger.info("projoctObject:-----"+pp.toString());
//		request.getSession().setAttribute("project", pp);
//
//	}
//
//	
//	/**
//	 * @param request
//	 * @description:生成承租人要素集
//	 */
//	private void setFinanceVaules(HttpServletRequest request){
//		
//		FinanceExtendsBean fn = new FinanceExtendsBean();
//		fn.setFinanceId(request.getParameter("financeId"));
//		fn.setFinanceIntro(request.getParameter("financeIntro"));
//		fn.setFinanceName(request.getParameter("financeName"));
//		fn.setGuaranteeType(request.getParameter("guaranteeType"));
//		fn.setOtherRemark1(request.getParameter("otherRemark1"));
//		fn.setOtherRemark2(request.getParameter("otherRemark2"));
//		fn.setOtherRemark3(request.getParameter("otherRemark3"));
//		fn.setRentMessage(request.getParameter("rentMessage"));
//		fn.setRentTotal(request.getParameter("rentTotal"));
//		fn.setRentTransfer(request.getParameter("rentTransfer"));
//		logger.info("financeObject:-----"+fn.toString());
//		request.getSession().setAttribute("finance", fn);
//		
//	}
//
//	/**
//	 * @param request
//	 * @description:生成租赁物要素集
//	 */
//	private void setRentVaules(HttpServletRequest request){
//		
//		RentRigsterBean re = new RentRigsterBean();
//
//		re.setOtherRemark1(request.getParameter("otherRemark1"));
//		re.setOtherRemark2(request.getParameter("otherRemark2"));
//		re.setOtherRemark3(request.getParameter("otherRemark3"));
//		re.setProduceIntro(request.getParameter("produceIntro"));
//		re.setRentMessage(request.getParameter("rentMessage"));
//		re.setRentName(request.getParameter("rentName"));
//		re.setRentProduce(request.getParameter("rentProduce"));
//		re.setRentUnit(request.getParameter("rentUnit"));
//		
//		logger.info("rentObject:-----"+re.toString());
//		request.getSession().setAttribute("rent", re);
//		
//	}
//
//	
//	private String makeFileName(String filename){  
//		//2.jpg
//        //为防止文件覆盖的现象发生，要为上传文件产生一个唯一的文件名
//		return UUID.randomUUID().toString() + "_" + filename;
//	}
//		
//    private String makePath(String filename,String savePath){
//        //得到文件名的hashCode的值，得到的就是filename这个字符串对象在内存中的地址
//        int hashcode = filename.hashCode();
//         int dir1 = hashcode&0xf;  //0--15
//        int dir2 = (hashcode&0xf0)>>4;  //0-15
//        //构造新的保存目录
//       String dir = savePath + "\\" + dir1 + "\\" + dir2;  //upload\2\3  upload\3\5
//       //File既可以代表文件也可以代表目录
//        File file = new File(dir);
//         //如果目录不存在
//        if(!file.exists()){
//            //创建目录
//            file.mkdirs();
//         }
//        return dir;
// }
	
}
