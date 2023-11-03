package days06;

import java.text.DecimalFormat;

public class FormatUtil {

	// 1. 인스턴스 메소드
	public String number(long number, String pattern) {
		DecimalFormat df = new DecimalFormat(pattern);
		return df.format(number);
	}
	
	// 2. static 메소드
	public static String staticNumber(long number, String pattern) {
		DecimalFormat df = new DecimalFormat(pattern);
		return df.format(number);
	}
}


