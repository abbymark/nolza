package co.kr.utils;

import java.io.File;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {

	static final int THUMB_WIDTH = 300;
	static final int THUMB_HEIGHT = 300;

	public static String fileUpload(String uploadPath,String fileName,byte[] fileData) throws Exception {

		UUID uid = UUID.randomUUID();

		String newFileName = uid + "_" + fileName;
		String imgPath = uploadPath;

		File target = new File(imgPath, newFileName);
		FileCopyUtils.copy(fileData, target);

		return newFileName;
	}

}
