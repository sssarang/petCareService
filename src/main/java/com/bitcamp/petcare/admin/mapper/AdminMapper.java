package com.bitcamp.petcare.admin.mapper;

import com.bitcamp.petcare.admin.domain.AdminDTO;
import com.bitcamp.petcare.admin.domain.AdminVO;

public interface AdminMapper {
	
	public abstract int insertFAQ(AdminDTO dto);	//FAQ추가
	public abstract int deleteFAQ(AdminDTO dto);	//FAQ삭제
	public abstract int updateFAQ(AdminDTO dto);	//FAQ수정
	public abstract AdminVO selectFAQ(AdminDTO dto);	//FAQ조회
}
