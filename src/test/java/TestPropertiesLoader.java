import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import java.util.Properties;

import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;

import com.nbl.common.exception.MyBusinessRuntimeException;

public class TestPropertiesLoader {

	private final static String fileName = "classpath:properties/normalConfig.properties";
	private static ResourceLoader resourceLoader = new DefaultResourceLoader();


	public static void main(String[] args) {
		// TODO Auto-generated method stub
		readProperties(fileName);
	}

	
	/**
	 * @param fileName
	 * @return
	 * @description:读取配置文件
	 */
	public static Properties readProperties(String fileName){
		
		Properties prop = new Properties();
		System.out.println("------读取配置文件-------:"+fileName);
		
        //读取属性文件a.properties
		InputStream in;
		try {
			//in = new BufferedInputStream (new FileInputStream(fileName));
			
			Resource resource = resourceLoader.getResource( fileName );
			in = resource.getInputStream();
			
			prop.load(in);
	        //加载属性列表
	        Iterator<String> it=prop.stringPropertyNames().iterator();
	        while(it.hasNext()){
	            String key=it.next();
	            System.out.println(key+":"+prop.getProperty(key));
	        }
	        in.close();
			
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
			throw new MyBusinessRuntimeException(e1.getMessage()); 
		} catch (IOException e) {
			e.printStackTrace();
			throw new MyBusinessRuntimeException(e.getMessage()); 
		}   
        return prop;
	}
}
