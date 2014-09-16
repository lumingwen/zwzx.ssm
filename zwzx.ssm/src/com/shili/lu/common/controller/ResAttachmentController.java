package com.shili.lu.common.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.coobird.thumbnailator.Thumbnails;
import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.shili.lu.common.annotation.NoSecurity;
import com.shili.lu.common.model.ResAttachment;
import com.shili.lu.common.service.ResAttachmentServiceI;
import com.shili.lu.common.util.CommonUtils;

@Controller
@RequestMapping("/resAttachmentController")
public class ResAttachmentController {
	@Autowired
	private ResAttachmentServiceI resAttachmentService;

	private final Logger log = Logger.getLogger(getClass());

	/**
	 * ajax上传
	 * 
	 */
	@RequestMapping(value = "/ajaxUpload", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String ajaxUpload(HttpServletRequest request,
			@RequestParam("file") MultipartFile file, Integer type) {
		Long limit_size = 10L;
		String[] limit_type = null;
		ResAttachment attachment = null;
		attachment = resAttachmentService.saveFile(file, limit_size,
				limit_type, request);
		if (attachment != null) {
			resAttachmentService.insert(attachment);
			log.info("保存附件成功");
		} else {
			log.info("保存文件失败");
		}
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		// 返回
		JSONObject json = JSONObject.fromObject(attachment);
		String str = json.toString();
		return str;
	}

	/**
	 * editor图片上传
	 * 
	 */
	@RequestMapping(value = "/addEditorImage", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String addEditorImage(HttpServletRequest request,
			@RequestParam("file") MultipartFile file) {
		// 上传图片
		Long limit_size = 10L;
		String[] limit_type = new String[] { ".JPG", ".GIF", ".BMP", ".TIF",
				".PNG" };// 文件类型限制
		ResAttachment attachment = null;
		attachment = resAttachmentService.saveFile(file, limit_size,
				limit_type, request);
		if (attachment != null) {
			resAttachmentService.insert(attachment);
			log.info("保存附件成功");
		} else {
			log.info("保存文件失败");
		}
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		// 返回
		StringBuffer sb = new StringBuffer();
		sb.append("{ 'original':'");
		sb.append(attachment == null ? "" : attachment.getOldName());
		sb.append("','url':'attachmentId=");
		sb.append(attachment == null ? "-1" : attachment.getId());
		sb.append("', 'title':'图片描述', 'state':'");
		sb.append(attachment == null ? "\\u672a\\u77e5\\u9519\\u8bef"
				: "SUCCESS");
		sb.append("'}");
		return sb.toString();
	}

	/**
	 * 插入
	 * 
	 * @param resProductFlights
	 * @return
	 */
	@RequestMapping("/addAttachment")
	public ResAttachment addAttachment(HttpServletRequest request,
			@RequestParam("file") MultipartFile file) {
		Long limit_size = 3L;// 文件大小限制为3M
		String[] limit_type = new String[] { ".JPG", ".GIF", ".BMP", ".TIF" };// 文件类型限制
		ResAttachment attachment = null;
		attachment = resAttachmentService.saveFile(file, limit_size,
				limit_type, request);
		if (attachment != null) {
			resAttachmentService.insert(attachment);
			log.info("保存附件成功");
		} else {
			log.info("保存文件失败");
		}
		return attachment;
	}

	@RequestMapping("/getAttachment")
	@NoSecurity
	public void getAttachment(HttpServletRequest request,
			@RequestParam("id") long id, HttpServletResponse response) {
		try {
			ResAttachment attachment = resAttachmentService.getByPrimaryKey(id);
			String relativePath = attachment.getSavePath();
			String fileName = attachment.getOldName();
			if (!"".equals(relativePath)) {
				String filePath = CommonUtils.getAttachmentRealPath(request,
						attachment);
				File file = new File(filePath);// 构造要下载的文件
				if (file.exists()) {
					InputStream ins = new FileInputStream(filePath);// 构造一个读取文件的IO流对象
					BufferedInputStream bins = new BufferedInputStream(ins);// 放到缓冲流里面
					OutputStream outs = response.getOutputStream();// 获取文件输出IO流
					BufferedOutputStream bouts = new BufferedOutputStream(outs);
					response.setContentType("application/x-download");// 设置response内容的类型
					response.setHeader(
							"Content-disposition",
							"attachment;filename="
									+ URLEncoder.encode(fileName, "UTF-8"));// 设置头部信息
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
				} else {
					System.out.println("下载的文件不存在");
				}
			} else {
				System.out.println("下载文件时参数错误");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

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
	@RequestMapping("/viewImage")
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
