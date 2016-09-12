package com.nbl.utils;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Random;

import com.alibaba.rocketmq.client.producer.SendStatus;

public class TestUtils {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		SendStatus ss = SendStatus.FLUSH_DISK_TIMEOUT;
		
		if("FLUSH_DISK_TIMEOUT".equals(ss.toString())){
			System.out.println("ss.same:"+ss);

		}
		
        SimpleDateFormat fmt = (SimpleDateFormat) DateFormat.getDateInstance(); 
        fmt.applyPattern("yyyyMMdd"); 
        System.out.println("----:"+fmt.format(Calendar.getInstance().getTime()));
        
        Random randomNumber = new Random();
        System.out.println("random:"+randomNumber.nextInt(999));
        
        String originalFilename = "mp.pfd";
        
        String name = originalFilename.substring(0, originalFilename.indexOf("."));
        System.out.println("name="+name);
	}

}
