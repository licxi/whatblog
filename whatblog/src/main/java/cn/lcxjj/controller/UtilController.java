package cn.lcxjj.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.lcxjj.util.ImageUtil;

@RequestMapping("util")
@Controller
public class UtilController {

	/**
	 * 获取验证码
	 * @param request
	 * @param response
	 */
	@RequestMapping("getVC.do")
	public void validataCode(HttpServletRequest request,HttpServletResponse response){
		Object[] vaImg = ImageUtil.createIamge();
		HttpSession session = request.getSession();
		session.setAttribute("vc", vaImg[0]);
		try {
			OutputStream os = response.getOutputStream();
			ImageIO.write((BufferedImage)vaImg[1], "png", os);
		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
	}
	
	@ResponseBody
	@RequestMapping("vc.do")
	public Map<String,String> vc(HttpServletRequest request,String vc){
		Map<String,String> map = new HashMap<String, String>();
		HttpSession session = request.getSession();
		String rightVC = (String) session.getAttribute("vc");
		if(rightVC.equalsIgnoreCase(vc)){
			map.put("msg", "ok");
		}else{
			map.put("msg", "error");
		}
		session.removeAttribute("vc");
		return map;
		
	}
	@ResponseBody
	@RequestMapping("fileupload.do")
	public Map<String,String> fileUpload(@RequestParam(value="imgUpl",required=false) 
		MultipartFile file,HttpServletRequest requset){
		Map<String,String> map = new HashMap<String,String>();
		String path = requset.getSession().getServletContext().getRealPath("/")+"/upload/img";//图片保存的路径
		//String path = requset.getSession().getServletContext().getRealPath("/")+"\\uploads";
		String fileName = file.getOriginalFilename(); //获取文件名
		String name = fileName.substring(0, fileName.indexOf("."));
		String fileType = fileName.substring(fileName.indexOf("."),fileName.length());
		String saveName = null;
		Date date = new Date();
		saveName = Base64.getEncoder().encodeToString((name+date.getTime()).getBytes());
		saveName = saveName.replace(".", "a");//防止出现"."
		String type = file.getContentType();
		/*System.out.println("文件类型："+type);
		System.err.println("文件大小："+file.getSize());
		System.out.println("文件名"+file.getOriginalFilename());
		System.out.println("保存的文件名："+saveName+fileType);*/
		System.out.println(path);
		File uploadFile = new File(path,saveName+fileType);
//		System.out.println("地址:"+path);
		/*if(!uploadFile.exists()){
			uploadFile.mkdirs();
		}*/
		try {
			file.transferTo(uploadFile); //将来要将路径保存到数据库中
			map.put("error", "0");
			map.put("url", "/whatblog/upload/img/"+saveName+fileType);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return map;
		
	}
}
