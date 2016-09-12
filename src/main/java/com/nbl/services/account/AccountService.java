package com.nbl.services.account;

import java.util.List;

import com.nbl.common.vo.PageVO;
import com.nbl.jspbean.account.LoginAccountBean;
import com.nbl.jspbean.portion.ChargeBean;

/**
 * @author Donald
 * @createdate 2016年5月6日
 * @version 1.0 
 * @description :管理账户操作接口
 */
public interface AccountService {
	
	/**
	 * @param pageVO
	 * @param cb
	 * @return
	 * @description:分页查询
	 */
	public List<LoginAccountBean> pageListQueryAccount(PageVO<LoginAccountBean> pageVO,LoginAccountBean cb);
	
	/**
	 * @param cb
	 * @return
	 * @description:分页查询统计总数
	 */
	public int pageCountQueryAccount(LoginAccountBean cb);
	
	/**
	 * @param accountName
	 * @return
	 * @description:登录账户明细查询
	 */
	public LoginAccountBean detailQueryAccount(String accountName);
	
	/**
	 * @param accountName
	 * @return
	 * @description:账户是否存在检查
	 */
	public boolean accountCheckQuery(String accountName);
	
	/**
	 * @param cb
	 * @return
	 * @description:账户增加
	 */
	public boolean accountAdd(LoginAccountBean cb);
	
	/**
	 * @param loginName
	 * @param newPass
	 * @return
	 * @description:修改密码
	 */
	public boolean modifyPass(String loginName,String newPass);
	
}
