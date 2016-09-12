

import java.util.HashMap;
import java.util.Map;

import com.nbl.utils.HttpClientUtils;

public class TestGetSession {

	
	public static void main(String[] args){
		// TODO Auto-generated method stub
		
		Map paramMap = new HashMap();

		String url = "http://localhost:8080/zlebank-energy-manager/getSession";
		HttpClientUtils.sendPost(url, paramMap, null);
	}
	

}
