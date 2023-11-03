package days06.mvc.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor
@Builder
public class BoardDTO {

	private int seq;
	private String writer;
	private String pwd;
	private String email;
	private String title;
	// java.sql.Date는 시간정보가 없다.
	// 					     java.util.Date의 자식 클래스이다.
	private Date writedate;
	private int readed;
	private int tag;
	private String content;

} // class