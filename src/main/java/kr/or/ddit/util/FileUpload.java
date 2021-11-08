package kr.or.ddit.util;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class FileUpload {

	public static boolean fileUpload(MultipartFile multiFile) {
		String uploadFolder = "C:\\workspace (3)\\workspace\\springGuestBoard\\src\\main\\webapp\\resources\\images";
		
		File file = new File(uploadFolder, multiFile.getOriginalFilename());
		
		try {
			multiFile.transferTo(file);
			return true;
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return false;
	}
}
