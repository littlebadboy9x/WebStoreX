package com.example.webstorex.Service;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

@Service
public class ParamService {
	@Autowired
	HttpServletRequest req;
	@Autowired
	ServletContext app;

	public String getString(String name, String defaultValue) {
		String nameValue = req.getParameter(name);
		if (name.isEmpty()) {
			return defaultValue;
		} else {
			return nameValue;
		}
	}

	public int getInt(String name, int defaultValue) {
		String nameValue = req.getParameter(name);
		try {
			return Integer.parseInt(nameValue);
		} catch (Exception e) {
			return defaultValue;
		}
	}

	public double getDouble(String name, double defaultValue) {
		String nameValue = req.getParameter(name);
		try {
			return Double.parseDouble(nameValue);
		} catch (Exception e) {
			return defaultValue;
		}
	}

	public boolean getBoolean(String name, boolean defaultValue) {
		String nameValue = req.getParameter(name);
		try {
			return Boolean.parseBoolean(nameValue);
		} catch (Exception e) {
			return defaultValue;
		}
	}

	public Date getDate(String name, String pattern) throws RuntimeException {
		String nameValue = req.getParameter(name);
		try {
			DateFormat dateformat = new SimpleDateFormat(pattern);
			Date changeDate = dateformat.parse(nameValue);
			return changeDate;
		} catch (Exception e) {
			return null;
		}
	}

	
	public File save(MultipartFile file, String path) throws RuntimeException {
		File pathUpload = new File(app.getRealPath(path));
		if (!pathUpload.exists()) {
			pathUpload.mkdirs();
		}
		try {
			String filename = file.getOriginalFilename();
			String filenamewithdate = filename.substring(0, filename.lastIndexOf('.')) + System.currentTimeMillis()
					+ filename.substring(filename.lastIndexOf('.'));
			File fileUpload = new File(pathUpload, filenamewithdate);
			file.transferTo(fileUpload);

			return fileUpload;
		} catch (IllegalStateException | IOException e) {
			return null;
		}

	}
	
}
