package common;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File oldFile) {

		// 리네임 규칙 만들기(절대 중복이 되지 않게)
		File newFile = null;

		do {

			long currentTime = System.currentTimeMillis();// 현재시간
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS"); // 년월일 _ 시간분초 밀리세컨
			int rndNum = (int) (Math.random() * 10000);
			String oldName = oldFile.getName();// 현재 사용자가 올린 파일명
			String ext = "";
			int dot = oldName.lastIndexOf(".");// 확장자를 잘라내기 위한 값.

			if (dot > -1) {// lastIndexOf : 못찾으면 -1 반환
				ext = oldName.substring(dot);
			}
			String newName = sdf.format(new Date(currentTime)) + "_" + rndNum + ext;
			// oldFile.getParent(): 부모 디렉토리 경로
			// newFile : 새로 만들어진 파일 이름.

			newFile = new File(oldFile.getParent(), newName);

		} while (!createNewFile(newFile));

		return newFile;

	}

	public boolean createNewFile(File f) {

		try {
			//파일이 있으면 false(생성안됨), 파일 없으면 true (파일생성) 
			return f.createNewFile();
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}

	}

}