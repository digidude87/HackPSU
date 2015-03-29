package com.main;

import java.io.File;
import java.util.Scanner;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;

public class VoiceAction extends ActionSupport {
	private String filePath;
	private File inpFile;
	private String fileTxt;

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

	/**
	 * @return the inpFile
	 */
	public File getInpFile() {
		return inpFile;
	}

	/**
	 * @param inpFile
	 *            the inpFile to set
	 */
	public void setInpFile(File inpFile) {
		this.inpFile = inpFile;
	}

	/**
	 * @return the filePath
	 */
	public String getFilePath() {
		return filePath;
	}

	/**
	 * @param filePath
	 *            the filePath to set
	 */
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String chooseFile() {
		File tempFile = this.inpFile;
		Scanner scan;
		this.fileTxt = "<p>";
		try {
			/*
			 * scan = new Scanner(new FileReader(tempFile));
			 * while(scan.hasNextLine()){ while(scan.hasNext()){
			 * fileTxt+=scan.next()+" "; } fileTxt+="\n"; }
			 * System.out.println(fileTxt);
			 */
			String contents = new Scanner(inpFile).useDelimiter("\\Z").next();
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
			/*Gson gson = new Gson();
			fileTxt = gson.toJson(fileTxt);*/
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
