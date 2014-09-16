package com.shili.lu.common.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.coobird.thumbnailator.Thumbnails;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shili.lu.common.annotation.NoSecurity;
import com.shili.lu.common.model.ResAttachment;
import com.shili.lu.common.service.ResAttachmentServiceI;
import com.shili.lu.common.util.CommonUtils;

@Controller
@RequestMapping("/resClientAttachmentController")
public class ClientResAttachmentController {
	@Autowired
	private ResAttachmentServiceI resAttachmentService;

	/**
	 * 查看图片
	 * 
	 * @param attachmentId
	 *            附件id
	 * @param width
	 *            宽度
	 * @param height
	 *            高度
	 * @throws IOException
	 */
	@RequestMapping("/clientViewImage")
	@NoSecurity
	public void viewImage(HttpServletRequest request, Long attachmentId,
			Integer width, Integer height, HttpServletResponse response)
			throws IOException {
		ResAttachment attachment = resAttachmentService
				.getByPrimaryKey(attachmentId);
		if (attachment != null) {
			String filePath = CommonUtils.getAttachmentRealPath(request,
					attachment);
			File file = new File(filePath);
			if (file.exists()) {
				if (width != null && width > 0 && height != null && height > 0) {
					Thumbnails.of(file).size(width, height)
							.keepAspectRatio(false)
							.toOutputStream(response.getOutputStream());
				} else {
					response.setContentType("image/png");
					InputStream ins = new FileInputStream(filePath);// 构造一个读取文件的IO流对象
					BufferedInputStream bins = new BufferedInputStream(ins);// 放到缓冲流里面
					OutputStream outs = response.getOutputStream();// 获取文件输出IO流
					BufferedOutputStream bouts = new BufferedOutputStream(outs);

					int bytesRead = 0;
					byte[] buffer = new byte[8192];
					// 开始向网络传输文件流
					while ((bytesRead = bins.read(buffer, 0, 8192)) != -1) {
						bouts.write(buffer, 0, bytesRead);
					}
					bouts.flush();// 这里一定要调用flush()方法
					ins.close();
					bins.close();
					outs.close();
					bouts.close();
				}

			}
		}
	}
}
