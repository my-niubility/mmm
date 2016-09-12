package com.nbl.controller.customer;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.ProgressListener;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.customer.CustEnterpriseBean;
import com.nbl.services.customer.CustEnterpriseService;
import com.nbl.utils.json.ResponseJson;

/**
 * @author gcs
 * @createdate 2016-07-14
 * @description 企业客户管理控制层
 * 
 * */

@RequestMapping("/enterprise")
@Controller
public class CustEnterpriseContronller {
	
	private final static Logger logger = LoggerFactory.getLogger(CustEnterpriseContronller.class);
	
	@Resource
	private CustEnterpriseService enterpriseService;
	
	/**
	 * @param request
	 * @param response
	 * @return mv
	 * @description: 指向添加页面
	 * */
	@RequestMapping("/add")
	public ModelAndView enterpriseAdd(HttpServletRequest request,HttpServletResponse response){
		logger.info("------enterprise/add-----");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/WEB-INF/view/customer/enterprise_add");
		return mv;	
	}
	
	/**
	 * @param request
	 * @param response
	 * @return mv
	 * @description: 企业客户添加 
	 * */
	@RequestMapping("/addResult")
	public ModelAndView enterpriseAddResult(HttpServletRequest request,HttpServletResponse response){
		logger.info("-----enterprise/addResult-----");
		ModelAndView mv = new ModelAndView();
		//企业名额
		String name = request.getParameter("name");
		CustEnterpriseBean cb = new CustEnterpriseBean();
		cb.setName(name);
		cb.setCredentialsType("C01");//证件类型 C01：营业执照 C09：组织机构代码证',
		cb.setPhone(request.getParameter("phone"));
		cb.setFax(request.getParameter("fax"));
		cb.setAddress(request.getParameter("address"));
		cb.setSummary(request.getParameter("summary"));
		cb.setCompanyImg(request.getParameter("companyImg"));
		cb.setOrganiztionImg(request.getParameter("organiztionImg"));
		cb.setTaxImg(request.getParameter("taxImg"));
		cb.setBankAccImg(request.getParameter("bankAccImg"));
		cb.setStatus("EFFECTIVE");//状态 EFFECTIVE:有效的FROZEN:冻结的
		cb.setCertStatus("NEW");//认证状态 NEW：未认证 PASSED：已认证通过 NOT_PASSED：未认证通过
		cb.setPrStatus("NEW");//审核状态：（用户线下新增用户） NEW：待审核 PASSED：审核通过NOT_PASSED：审核拒绝'
		cb.setLegalpersonId(request.getParameter("legalpersonId"));
		cb.setLegalpersonBackId(request.getParameter("legalpersonBackId")); 
		cb.setLegalpersonMobile(request.getParameter("legalpersonMobile"));
		cb.setCompanyPoaId(request.getParameter("companyPoaId"));
		cb.setAgentId(request.getParameter("agentId"));
		cb.setAgentBackId(request.getParameter("agentBackId"));
		cb.setAgentName(request.getParameter("agentName")); 
		cb.setAgentMobile(request.getParameter("agentMobile"));
		
		boolean addFlag = enterpriseService.enterpriseAdd(cb);
		if(addFlag){
			//成功
			request.setAttribute("name", name);		
			mv.setViewName("/WEB-INF/view/customer/enterprise_addResult");
		}else{
			//失败
			request.setAttribute("name", name);		
			mv.setViewName("/WEB-INF/view/customer/enterprise_failure");
		}
		return mv;
	}
	
	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:检查企业客户是否存在
	 */
	@RequestMapping("/checkQuery")
	public @ResponseBody ResponseJson enterpriseCheckQuery(HttpServletRequest request,HttpServletResponse response){
		logger.info("/enterpriseCheckQuery===");
		//用户名称
		String name = request.getParameter("name");
		boolean queryFlag = enterpriseService.enterpriseCheckQuery(name);
		if(queryFlag){
			//校验通过
			return new ResponseJson().success();
		}else{
			//校验失败，存在用户
			return new ResponseJson().failure();
		}
	}
	
	
	/**
	 * @param request
	 * @param response
	 * @return
	 * @deprecated:提交查询
	 * */
	@RequestMapping(value="/enterpriseQuery",method = {RequestMethod.POST, RequestMethod.GET})
	public String query(HttpServletRequest request,HttpServletResponse response){
		logger.info("/enterpriseQuery===");
		String id = request.getParameter("id");
		String name = request.getParameter("name");//姓名
	    String credentialsType = request.getParameter("credentialsType");//证件类型 C01：营业执照 C09：组织机构代码证',
	    String phone = request.getParameter("phone");
		String status = request.getParameter("status");//冻结状态  effective:有效的 frozen:冻结的
		String certStatus = request.getParameter("certStatus");//认证状态 NEW：未认证 PASSED：已认证通过 NOT_PASSED：未认证通过
		String prStatus = request.getParameter("prStatus");//审核状态：（用户线下新增用户） NEW：待审核 PASSED：审核通过NOT_PASSED：审核拒绝'
		
		CustEnterpriseBean reqDto = new CustEnterpriseBean();
		reqDto.setId(id);
		reqDto.setName(name);
		//NO、9、  999 表示没有选择直接查询
		if("NO".equals(credentialsType)){
			reqDto.setCredentialsType(null);
		}else{
			reqDto.setCredentialsType(credentialsType);
		}
		reqDto.setPhone(phone);
		if ("NO".equals(status)) {
			reqDto.setStatus(null);
		} else {
			reqDto.setStatus(status);
		}
		if ("NO".equals(certStatus)) {
			reqDto.setCertStatus(null);
		} else {
			reqDto.setCertStatus(certStatus);
		}
		if ("NO".equals(prStatus)) {
			reqDto.setPrStatus(null);
		} else {
			reqDto.setPrStatus(prStatus);
		}
		
		//根据前端每页展示数据条数
		int size = Integer.parseInt(request.getParameter("pageSize"));
		PageVO<CustEnterpriseBean> pageVO = new PageVO<CustEnterpriseBean>();
		pageVO.setStartSize(0);
		pageVO.setSize(size);
		logger.info("/每次查询条数==" + size);
		
		//默认查询分页条数查询
		List<CustEnterpriseBean> enterpriseList = enterpriseService.pageListQueryEnterprise(pageVO, reqDto);
		if(enterpriseList !=null && enterpriseList.size()>0){
			logger.info("/enterpriseList.size()==="+enterpriseList.size());
		}
		//查询总条数
		int count = enterpriseService.pageCountQueryEnterprise(reqDto);
		logger.info("/查询个人客户信息条数==" + count);
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", reqDto);
		request.getSession().setAttribute("enterpriseList", enterpriseList);
		request.getSession().setAttribute("enterpriseCount", count);
		request.getSession().setAttribute("chargeSize", size);
		return "/WEB-INF/view/customer/enterprise_query_body";
	}
	
	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:页面首次进入默认查询
	 * */
	
	@RequestMapping(value="/enterprise_query_body",method = {RequestMethod.POST,RequestMethod.GET})
	public String queryBody(HttpServletRequest request,HttpServletResponse response){
		logger.info("/enterprise_query_body---");
		CustEnterpriseBean reqDto = new CustEnterpriseBean();
		
		//每页展示数据条数
		PageVO<CustEnterpriseBean> pageVO = new PageVO<CustEnterpriseBean>();
		pageVO.setStartSize(0);
		pageVO.setSize(8);
		//默认查询分页条数查询
		List<CustEnterpriseBean> enterpriseList = enterpriseService.pageListQueryEnterprise(pageVO, reqDto);
		if(enterpriseList !=null && enterpriseList.size()>0){
			logger.info("/enterpriseList.size()==="+enterpriseList.size());
		}
		//查询总条数
		int count = enterpriseService.pageCountQueryEnterprise(reqDto);
		logger.info("/查询个人客户信息条数==" + count);
		request.getSession().setAttribute("pageVo", pageVO);
		request.getSession().setAttribute("reqDto", reqDto);
		request.getSession().setAttribute("enterpriseList", enterpriseList);
		request.getSession().setAttribute("enterpriseCount", count);
		request.getSession().setAttribute("chargeSize", 8);
		return "/WEB-INF/view/customer/enterprise_query_body";
	}
	
	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:页面工具上下页导航查询
	 */
	@RequestMapping(value= "/enterprisePageList",method = {RequestMethod.POST, RequestMethod.GET})
	public String  queryAccountPage(HttpServletRequest request, HttpServletResponse response){
		logger.info("/enterprisePageList---");
		
		//设置session参数（session级别查询条件）
		PageVO<CustEnterpriseBean> pageVO = (PageVO<CustEnterpriseBean>) request.getSession().getAttribute("pageVo");
		CustEnterpriseBean reqDto = (CustEnterpriseBean) request.getSession().getAttribute("reqDto");
		//偏移量
		int offset = request.getParameter("pager.offset")==null? 0:Integer.parseInt(request.getParameter("pager.offset"));
		pageVO.setStartSize(offset);
		logger.info("/偏移量offset==="+offset);
		List<CustEnterpriseBean> enterpriseList = enterpriseService.pageListQueryEnterprise(pageVO, reqDto);
		if(enterpriseList !=null && enterpriseList.size()>0){
			logger.info("/enterpriseList.size()==="+enterpriseList.size());
		}
		request.getSession().setAttribute("enterpriseList", enterpriseList);
		
		return "/WEB-INF/view/customer/enterprise_query_body";
		
	}
	
	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:根据企业ID来查询详情
	 */
	@RequestMapping(value= "/enterpriseDetail",method = {RequestMethod.POST, RequestMethod.GET})
	public String  enterpriseDetail(HttpServletRequest request, HttpServletResponse response){
		logger.info("/-----查询企业客户明细enterpriseDetail-----");
		String id = request.getParameter("id");
		logger.info("-----根据企业编号id----:{}",id);
		CustEnterpriseBean cb = enterpriseService.detailQueryEnterprise(id);
			
		request.setAttribute("enterprise", cb);
		return "/WEB-INF/view/customer/enterprise_query_detail";
		
	}
	/**
	 * @param request
	 * @param response
	 * @return
	 * @description:根据企业ID来修改企业审核信息
	 */
	@RequestMapping(value= "/enterpriseModifyInfo",method = {RequestMethod.POST, RequestMethod.GET})
	public String  modifyEnterpriseForId(HttpServletRequest request, HttpServletResponse response){
		logger.info("/-----查询企业客户明细enterpriseModify-----");
		String sessName = request.getSession().getAttribute("userName").toString();//获取当前用户做审核跟踪用
		String id = request.getParameter("id");
		logger.info("-----根据企业编号id----:{}",id);
		CustEnterpriseBean cb = enterpriseService.detailQueryEnterprise(id);
			
		request.setAttribute("enterprise", cb);
		return "/WEB-INF/view/customer/enterprise_modify";
		
	}
	
	@RequestMapping(value="/toEnterpriseMain",method = {RequestMethod.POST,RequestMethod.GET})
	public String queryMain(HttpServletRequest request,HttpServletResponse response){
		logger.info("-----toEnterpriseMain-----");
		return "/WEB-INF/view/customer/enterprise_query_main";
	}
	
	@RequestMapping(value="/enterprise_query_top",method = {RequestMethod.POST,RequestMethod.GET})
	public String queryTop(HttpServletRequest request,HttpServletResponse response){
		logger.info("------enterprise_query_top-----");
		return "/WEB-INF/view/customer/enterprise_query_top";
	}
	
	
	@RequestMapping(value= "/upload",method = RequestMethod.POST)
	public void upload(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        MultipartFile multipartFile = multipartRequest.getFile("Filedata");//上传文件

        String originalFilename = multipartFile.getOriginalFilename(); // 文件全名
        String savePath = "/usr/local/upload/"+originalFilename;
        File file = new File(savePath);
        //如果目录不存在
        if(!file.exists()){
           //创建目录
           file.mkdirs();
           logger.info("/savePath="+savePath);
        }
        //产品id
        String productId = (String) request.getSession().getAttribute("productId");
        logger.info("/获取产品id="+productId);
        String name = originalFilename.substring(0, originalFilename.indexOf("."));
        //简化处理
        if("map".equals(name)){
        	logger.info("/map.size="+productId);
        	request.getSession().setAttribute(productId+"_map", multipartFile.getBytes());
        }else if("env1".equals(name)){
        	request.getSession().setAttribute(productId+"_env1", multipartFile.getBytes());
        }else if("env2".equals(name)){
        	request.getSession().setAttribute(productId+"_env2", multipartFile.getBytes());
        }else if("env3".equals(name)){
        	request.getSession().setAttribute(productId+"_env3", multipartFile.getBytes());
        }else{
        	
        }       
        multipartFile.transferTo(file);
		
	}

	
	
	@RequestMapping(value= "/upload.bak",method = RequestMethod.POST)
	public void uploadBak(HttpServletRequest request, HttpServletResponse response){
		//得到上传文件的保存目录，将上传的文件存放于WEB-INF目录下，不允许外界直接访问，保证上传文件的安全
		String savePath = request.getContextPath()+"/upload";
		//上传时生成的临时文件保存目录
		String tempPath = request.getContextPath()+"/temp";
		logger.info("/upload==savePath="+savePath+",tempPath="+tempPath);
		logger.info("getAttributeNames="+request.getAttributeNames().toString());
		
		File tmpFile = new File(tempPath);
		if (!tmpFile.exists()) {
			//创建临时目录
			tmpFile.mkdir();
		}
	    //消息提示
		String message = "";
		try{
			//使用Apache文件上传组件处理文件上传步骤：
			//1、创建一个DiskFileItemFactory工厂
			DiskFileItemFactory factory = new DiskFileItemFactory();
			//设置工厂的缓冲区的大小，当上传的文件大小超过缓冲区的大小时，就会生成一个临时文件存放到指定的临时目录当中。
			factory.setSizeThreshold(1024*100);//设置缓冲区的大小为100KB，如果不指定，那么缓冲区的大小默认是10KB
			//设置上传时生成的临时文件的保存目录
			factory.setRepository(tmpFile);
			//2、创建一个文件上传解析器
			ServletFileUpload upload = new ServletFileUpload(factory);
			//监听文件上传进度
			upload.setProgressListener(new ProgressListener(){
				public void update(long pBytesRead, long pContentLength, int arg2) {
            	logger.info("文件大小为：" + pContentLength + ",当前已处理：" + pBytesRead);

		         }});
		    //解决上传文件名的中文乱码
		    upload.setHeaderEncoding("UTF-8"); 
		    //3、判断提交上来的数据是否是上传表单的数据
		    if(!ServletFileUpload.isMultipartContent(request)){
		        //按照传统方式获取数据
		        return;
		    }
		                      
            //设置上传单个文件的大小的最大值，目前是设置为1024*1024字节，也就是1MB
            upload.setFileSizeMax(1024*1024);
            //设置上传文件总量的最大值，最大值=同时上传的多个文件的大小的最大值的和，目前设置为10MB
            upload.setSizeMax(1024*1024*10);
            //4、使用ServletFileUpload解析器解析上传数据，解析结果返回的是一个List<FileItem>集合，每一个FileItem对应一个Form表单的输入项
            List<FileItem> list = upload.parseRequest(request);
            logger.info("表单大小为：" + list.size());
            for(FileItem item : list){
                //如果fileitem中封装的是普通输入项的数据
                if(item.isFormField()){
                   String name = item.getFieldName();
                   //解决普通输入项的数据的中文乱码问题
                   String value = item.getString("UTF-8");
                   //value = new String(value.getBytes("iso8859-1"),"UTF-8");
                   logger.info(name + "=" + value);
                 }else{//如果fileitem中封装的是上传文件
                   //得到上传的文件名称，
                   String filename = item.getName();
                   logger.info(filename);
                   if(filename==null || filename.trim().equals("")){
                      continue;
                   }
                   //注意：不同的浏览器提交的文件名是不一样的，有些浏览器提交上来的文件名是带有路径的，如：  c:\a\b\1.txt，而有些只是单纯的文件名，如：1.txt
                   //处理获取到的上传文件的文件名的路径部分，只保留文件名部分
                   filename = filename.substring(filename.lastIndexOf("\\")+1);
                   //得到上传文件的扩展名
                   String fileExtName = filename.substring(filename.lastIndexOf(".")+1);
                   //如果需要限制上传的文件类型，那么可以通过文件的扩展名来判断上传的文件类型是否合法
                   logger.info("上传的文件的扩展名是："+fileExtName);
                   //获取item中的上传文件的输入流
                   InputStream in = item.getInputStream();
                   //得到文件保存的名称
                   String saveFilename = makeFileName(filename);
                   //得到文件的保存目录
                   String realSavePath = makePath(saveFilename, savePath);
                   //创建一个文件输出流
                   FileOutputStream out = new FileOutputStream(realSavePath + "\\" + saveFilename);
                   //创建一个缓冲区
                   byte buffer[] = new byte[1024];
                   //判断输入流中的数据是否已经读完的标识
                   int len = 0;
                   //循环将输入流读入到缓冲区当中，(len=in.read(buffer))>0就表示in里面还有数据
                   while((len=in.read(buffer))>0){
                     //使用FileOutputStream输出流将缓冲区的数据写入到指定的目录(savePath + "\\" + filename)当中
                         out.write(buffer, 0, len);
                   }
                   //关闭输入流
                   in.close();
                   //关闭输出流
                   out.close();
                   //删除处理文件上传时生成的临时文件
                   //item.delete();
                   message = "文件上传成功！";
                 }
           }
        }catch (FileUploadBase.FileSizeLimitExceededException e) {
            e.printStackTrace();
//		                     request.setAttribute("message", "单个文件超出最大值！！！");
//		                     request.getRequestDispatcher("/message.jsp").forward(request, response);
             return;
         }catch (FileUploadBase.SizeLimitExceededException e) {
             e.printStackTrace();
//		                    request.setAttribute("message", "上传文件的总的大小超出限制的最大值！！！");
//		                     request.getRequestDispatcher("/message.jsp").forward(request, response);
             return;
         }catch (Exception e) {
            message= "文件上传失败！";
             e.printStackTrace();
        }
        request.setAttribute("message",message);
//		                request.getRequestDispatcher("/message.jsp").forward(request, response);
		
	}
	
	private String makeFileName(String filename){  
		//2.jpg
        //为防止文件覆盖的现象发生，要为上传文件产生一个唯一的文件名
		return UUID.randomUUID().toString() + "_" + filename;
	}
		
    private String makePath(String filename,String savePath){
        //得到文件名的hashCode的值，得到的就是filename这个字符串对象在内存中的地址
        int hashcode = filename.hashCode();
         int dir1 = hashcode&0xf;  //0--15
        int dir2 = (hashcode&0xf0)>>4;  //0-15
        //构造新的保存目录
       String dir = savePath + "\\" + dir1 + "\\" + dir2;  //upload\2\3  upload\3\5
       //File既可以代表文件也可以代表目录
        File file = new File(dir);
         //如果目录不存在
        if(!file.exists()){
            //创建目录
            file.mkdirs();
         }
        return dir;
    }
    
}
