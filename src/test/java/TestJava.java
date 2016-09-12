import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author gcs
 * @createdate 2016年9月1日	
 * @version 1.0
 * 产品货架问题
 */

public class TestJava {
	public static void main(String[] args) {
		String [] shelf1 = new String[2];
		Map<String,List<String>> productMap = new HashMap<String,List<String>>();
		
		shelf1[0] = "1";
		shelf1[1] = "2";
		for (String string : shelf1) {
			List<String> retList = productMap.get(string);
			if (retList !=null && retList.size()>0) {
				
				retList.add("1");
				productMap.put(string, retList);
			} else {
//				if(shelf1List.contains("shelf1")){
//					
//				}else{
//					shelf1List.add("shelf1");
//				}
				List<String> shelf1List = new ArrayList<String>();
				shelf1List.add("shelf1");
				productMap.put(string, shelf1List);
			}
		}
	}
}
