package com.test.memo;

import lombok.*;

//@Getter
//@Setter
//@ToString
@Data // @Getter + @Setter + @ToString + @EqualsAndHashCode + @RequiredArgsConstructor
public class MemoDTO {
	
	private String seq;
	private String memo;
	private String regdate;
	private String cseq;
	
	private String icon;
	private String color;
}


//seq number primary key, -- 번호(PK)
//memo varchar2(2000) not null,   -- 메모
//regdate date default sysdate not null, -- 작성시각
//cseq number not null references tblCategory(seq) -- 카메고리