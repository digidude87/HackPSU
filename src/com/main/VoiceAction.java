package com.main;

import java.io.File;
import java.util.Scanner;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

public class VoiceAction extends ActionSupport implements ServletRequestAware {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private File upload;
	private String fileTxt;
	private HttpServletRequest servletRequest;
	private String uploadContentType;
	private String uploadFileName;

	/**
	 * @return the upload
	 */
	public File getUpload() {
		return upload;
	}

	/**
	 * @param upload
	 *            the upload to set
	 */
	public void setUpload(File upload) {
		this.upload = upload;
	}

	/**
	 * @return the uploadContentType
	 */
	public String getUploadContentType() {
		return uploadContentType;
	}

	/**
	 * @param uploadContentType
	 *            the uploadContentType to set
	 */
	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	/**
	 * @return the uploadFileName
	 */
	public String getUploadFileName() {
		return uploadFileName;
	}

	/**
	 * @param uploadFileName
	 *            the uploadFileName to set
	 */
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	/**
	 * @return the servletRequest
	 */
	public HttpServletRequest getServletRequest() {
		return servletRequest;
	}

	/**
	 * @param servletRequest
	 *            the servletRequest to set
	 */
	public void setServletRequest(HttpServletRequest servletRequest) {
		this.servletRequest = servletRequest;
	}

	/**
	 * @return the fileTxt
	 */
	public String getFileTxt() {
		return fileTxt;
	}

	/**
	 * @param fileTxt
	 *            the fileTxt to set
	 */
	public void setFileTxt(String fileTxt) {
		this.fileTxt = fileTxt;
	}

	public String chooseFile() {
		File tempFile = new File(this.getUploadFileName());
		this.fileTxt = "<p>";
		try {
			FileUtils.copyFile(this.upload, tempFile);
			/*
			 * scan = new Scanner(new FileReader(tempFile));
			 * while(scan.hasNextLine()){ while(scan.hasNext()){
			 * fileTxt+=scan.next()+" "; } fileTxt+="\n"; }
			 * System.out.println(fileTxt);
			 */
			String contents = new Scanner(tempFile).useDelimiter("\\Z").next();
			contents = contents.replaceAll("[^\\x20-\\x7e-\\n-\\r]", "\'");
			// contents=contents.replaceAll("\'", "\\\'");
			for (int i = 0; i < contents.length(); i++) {
				if (contents.charAt(i) == '\n' || contents.charAt(i) == '\r') {
					this.fileTxt += "</p><p>";
					continue;
				}
				this.fileTxt += contents.charAt(i);
			}
			this.fileTxt += "</p>";
			/*
			 * Gson gson = new Gson(); fileTxt = gson.toJson(fileTxt);
			 */
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String goHome() {
		return SUCCESS;
	}

	public String loadVisual() {
		return SUCCESS;
	}

	public String loadDyslexic() {
		return SUCCESS;
	}

	public String underconstruction() {
		return SUCCESS;
	}

}
