package org.petopia.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.URLEncoder;

import org.petopia.dao.SitterDAO;
import org.petopia.vo.Photo;

import com.opensymphony.xwork2.ActionSupport;

public class FileDownloadAction extends ActionSupport {
	private int photoNo;
	
	private String contentType;
	private String contentDisposition;
	private InputStream inputStream;
	private long contentLength;
	
	public String execute() throws Exception {
		String savedfile = null;
		String originalfile = null;
		String basePath = null;
		
		Photo photo = new SitterDAO().getPhoto(photoNo);
		savedfile = photo.getSavedfile();
		originalfile = photo.getOriginalfile();
		basePath = getText("board.uploadpath");
		
		String serverFullPath = basePath + "/" + savedfile;
		
		File file = new File(serverFullPath);
		setContentLength(file.length());
		setContentDisposition("attachment;filename=" + URLEncoder.encode(originalfile, "UTF-8"));
		
		inputStream = new FileInputStream(serverFullPath);
		
		return SUCCESS;
	}

	public int getPhotoNo() {
		return photoNo;
	}

	public void setPhotoNo(int photoNo) {
		this.photoNo = photoNo;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public String getContentDisposition() {
		return contentDisposition;
	}

	public void setContentDisposition(String contentDisposition) {
		this.contentDisposition = contentDisposition;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public long getContentLength() {
		return contentLength;
	}

	public void setContentLength(long contentLength) {
		this.contentLength = contentLength;
	}
	
}
