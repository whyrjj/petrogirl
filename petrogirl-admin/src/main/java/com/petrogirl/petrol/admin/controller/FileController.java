package com.petrogirl.petrol.admin.controller;

import com.petrogirl.petrol.common.entity.Dict;
import com.petrogirl.petrol.common.entity.ImgInfo;
import com.petrogirl.petrol.common.utils.DictUtils;
import com.petrogirl.petrol.common.utils.MD5FileUtil;
import com.petrogirl.petrol.common.utils.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


@Controller
@RequestMapping("${adminPath}/file")
public class FileController {
	
	@RequestMapping(value = {"/uploadImg"})
	@ResponseBody
	public ImgInfo add(MultipartFile file, HttpServletRequest request) throws IOException {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String todayString = sdf.format(date);
		String fileName = MD5FileUtil.getMD5String(file.getBytes()) + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		
		File saveDir = new File(request.getSession().getServletContext().getRealPath("/static/assets/upload/" + todayString));
		if (!saveDir.exists()) {
			saveDir.mkdirs();
		}
		File saveFile = new File(saveDir, fileName);
		file.transferTo(saveFile);
		
		
		List<Dict> dictList = DictUtils.getDictList("uploadPath");
		for (Dict dict : dictList) {
			if (StringUtils.isNotBlank(dict.getValue())) {
				File saveDir2 = new File(dict.getValue() +"/"+ todayString);
				if (!saveDir2.exists()) {
					saveDir2.mkdirs();
				}
				
				File saveFile2 = new File(saveDir2, fileName);
				FileCopyUtils.copy(saveFile, saveFile2);
			}
		}
		
		String domain = DictUtils.getDictValue("downloadDomain", request.getSession().getServletContext().getContextPath() + "/static/assets/upload");
		ImgInfo imgInfo = new ImgInfo();
		imgInfo.setDomain(domain);
		imgInfo.setPath("/"+ todayString + "/" + fileName);
		
	    return imgInfo;  
	}
}
