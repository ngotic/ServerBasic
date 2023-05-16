package com.test.ajax;


import lombok.Data;

@Data // @Getter + @Setter + @ToString + @EqualsAndHashCode + @RequiredArgsConstructor
public class MemoDTO {
	
	private String seq;
	private String memo;
	private String regdate;
	private String cseq;
	
	private String icon;
	private String color;
}
