package com.fp.eb.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Time {

	private static class TIME_MAXIMUM {
		public static final int SEC = 60;
		public static final int MIN = 60;
		public static final int HOUR = 24;
		public static final int DAY = 30;
		public static final int MONTH = 12;
	}
	public static String calculateTime(Date date) {
		long curTime = System.currentTimeMillis();
		long regTime = date.getTime();
		long diffTime = (curTime - regTime) / 1000;
		String msg = null;
		if (diffTime < TIME_MAXIMUM.SEC) {
			// sec
			msg = "방금 전";
		} else if ((diffTime /= TIME_MAXIMUM.SEC) < TIME_MAXIMUM.MIN) {
			// min
			msg = diffTime + "분 전"; 
		} else if ((diffTime /= TIME_MAXIMUM.MIN) < TIME_MAXIMUM.HOUR) {
			// hour
			msg = new SimpleDateFormat("HH:mm").format(regTime);
		} else if ((diffTime /= TIME_MAXIMUM.HOUR) < TIME_MAXIMUM.DAY) {
			// day
			msg = new SimpleDateFormat("MM/dd").format(regTime);
		} else if ((diffTime /= TIME_MAXIMUM.DAY) < TIME_MAXIMUM.MONTH) {
			// month
			msg = new SimpleDateFormat("MM/dd").format(regTime);
		} else if((diffTime > TIME_MAXIMUM.MONTH)){
			// year
			msg = new SimpleDateFormat("YYYY/MM/dd").format(regTime);
		}
		return msg;
	}
	
}
