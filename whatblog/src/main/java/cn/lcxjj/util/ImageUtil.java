package cn.lcxjj.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.util.Random;

public class ImageUtil {
	/**
	 * 第一个元素为验证码
	 * 第二个元素为图片
	 * @return
	 */
	public static Object[] createIamge(){
		BufferedImage validateCodeImg = new BufferedImage(100, 34, BufferedImage.TYPE_INT_RGB);
		Graphics g = validateCodeImg.getGraphics();
		Random rd = new Random();
		//设置画笔颜色
		g.setColor(new Color(rd.nextInt(255),rd.nextInt(255) , rd.nextInt(255)));
		g.fillRect(0, 0, 100, 34);
		String validateCode = getValidateCode();
		g.setColor(new Color(rd.nextInt(255),rd.nextInt(255) , rd.nextInt(255)));
		//绘制验证码
		g.setFont(new Font("", Font.BOLD, 24));
		g.drawString(validateCode, 5, 25);
		//画三条不同的干扰线
		for(int i = 0;i<8;i++){
			g.setColor(new Color(rd.nextInt(255),rd.nextInt(255) , rd.nextInt(255)));
			g.drawLine(rd.nextInt(100), rd.nextInt(30), rd.nextInt(100), rd.nextInt(30));
		}
		return new Object[]{validateCode,validateCodeImg};
	}
	private static String getValidateCode(){
		StringBuffer sb = new StringBuffer();
		Random rd = new Random();
		int i = 0;
		// 获取[0-9a-zA-Z]中五位数
		do {
			int r = rd.nextInt(124);
			if (!(r < 65 || (r >= (65 + 26) && (r < (97))) || r >= (97 + 26)) || (r>=48 && r<58)) {
					sb.append((char) r);
					i++;
			}
		} while (i < 5);
		return sb.toString() ;
		
	}
	
}
