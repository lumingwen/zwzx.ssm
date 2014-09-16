package com.shili.lu.common.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.shili.lu.common.dao.ResAttachmentMapper;
import com.shili.lu.common.model.ResAttachment;
import com.shili.lu.common.util.Constants;

@Service("resAttachmentService")
public class ResAttachmentServiceImpl implements ResAttachmentServiceI {
	@Autowired
	private ResAttachmentMapper resAttachmentMapper;
	@Value(value = "${fileSavePath}")
	private String fileSavePath;

	@Override
	public Integer insert(ResAttachment resAttachment) {
		// TODO Auto-generated method stub
		return resAttachmentMapper.insert(resAttachment);
	}

	@Override
	public Integer update(ResAttachment resAttachment) {
		// TODO Auto-generated method stub
		return resAttachmentMapper.updateByPrimaryKey(resAttachment);
	}

	@Override
	public Integer delete(Long id) {
		// TODO Auto-generated method stub
		return resAttachmentMapper.deleteByPrimaryKey(id);
	}

	@Override
	public ResAttachment getByPrimaryKey(Long id) {
		// TODO Auto-generated method stub
		return resAttachmentMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<ResAttachment> getByRel(ResAttachment resAttachment) {
		// TODO Auto-generated method stub
		return resAttachmentMapper.selectByRel(resAttachment);
	}

	/**
	 * 验证并保存文件
	 * 
	 * @param request
	 * @param file
	 *            文件
	 * @param fileSize
	 *            文件大小
	 * @param fileTypes
	 *            文件类型
	 * @return
	 */
	@Override
	public ResAttachment saveFile(MultipartFile file, Long limit_size,
			String[] limit_type, HttpServletRequest request) {
		ResAttachment resAttachment = new ResAttachment();
		if (checkFile(file, limit_size, limit_type)) {
			try {
				String fileName = file.getOriginalFilename();
				String filePath = getFilePath(fileName, request);
				InputStream is;
				is = file.getInputStream();
				File descFile = new File(request.getSession()
						.getServletContext().getRealPath("/")
						+ filePath);
				OutputStream os = new FileOutputStream(descFile);
				byte[] buffer = new byte[1024];
				int length = 0;
				while (-1 != (length = (is.read(buffer)))) {
					os.write(buffer, 0, length);
				}
				is.close();
				os.close();
				resAttachment.setCreateTime(new Date());
				resAttachment.setUpdateTime(new Date());
				resAttachment.setDeleteFlag(Constants.DEL_FLAG_NO);
				resAttachment.setOldName(fileName);
				resAttachment.setSavePath(filePath);
				// -------------------
				// 文件保存路径
				// String oldName = file.getOriginalFilename();
				// String relativePath = getFilePath(oldName, request);
				// String filePath = request.getSession().getServletContext()
				// .getRealPath("/");// 文件存放根目录
				// // 转存文件
				// file.transferTo(new File(filePath + relativePath));
				// 设置附件对象相关属性
				// resAttachment.setCreateTime(new Date());
				// resAttachment.setDeleteFlag(Constants.DEL_FLAG_NO);
				// resAttachment.setOldName(oldName);
				// resAttachment.setSavePath(relativePath);
				return resAttachment;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	/**
	 * 获取文件保存路径及名称
	 * 
	 * @param request
	 * @param fileName
	 *            真实文件名
	 * @return 文件保存后的文件路径及文件名称
	 */
	public String getFilePath(String fileName, HttpServletRequest request) {
		int index = fileName.lastIndexOf(".");
		fileName = UUID.randomUUID().toString()
				+ fileName.substring(index, fileName.length());// 获得新的文件名
		String filePath = request.getSession().getServletContext()
				.getRealPath("/");// 文件存放根目录
		String relativePath = fileSavePath
				+ new SimpleDateFormat("yyyy//MM//dd//").format(new Date())
				+ fileName;// 根目录下的目录
		filePath = filePath + relativePath;
		String paths[] = filePath.split("//");
		String dir = paths[0];
		for (int i = 0; i < paths.length - 2; i++) {
			try {
				dir = dir + "/" + paths[i + 1];
				File dirFile = new File(dir);
				if (!dirFile.exists()) {
					dirFile.mkdir();
				}
			} catch (Exception err) {
				System.err.println("ELS - Chart : 文件夹创建发生异常");
			}
		}
		File fp = new File(filePath);
		if (!fp.exists()) {
			return relativePath; // 文件不存在，执行下载功能
		} else {
			return relativePath; // 文件存在不做处理
		}
	}

	/**
	 * 验证文件大小和类型
	 * 
	 * @param file
	 *            文件
	 * @param fileSize
	 *            文件大小单位M
	 * @param fileTypes
	 *            文件类型
	 * @return
	 */
	public boolean checkFile(MultipartFile file, long fileSize,
			String[] fileTypes) {
		if (fileTypes == null || fileTypes.length == 0) {
			return true;
		}
		boolean flag = false;
		if (!file.isEmpty() && file.getSize() < fileSize * 1024 * 1024) {
			String fileName = file.getOriginalFilename();
			if (fileName.length() > 0) {
				int index = fileName.lastIndexOf(".");
				fileName = fileName.substring(index, fileName.length());// 获得后缀名
				fileName = fileName.toUpperCase();
				for (int i = 0; i < fileTypes.length; i++) {
					if (fileName.contains(fileTypes[i])) {
						flag = true;
						break;
					}
				}
			}
		}
		return flag;
	}

	/**
	 * 根据关联信息删除对应的附件信息
	 */
	@Override
	public Integer deleteByRel(ResAttachment resAttachment) {
		// TODO Auto-generated method stub
		return resAttachmentMapper.deleteByRel(resAttachment);
	}

}
