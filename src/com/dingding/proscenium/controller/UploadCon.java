package com.dingding.proscenium.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/upload")
public class UploadCon {

			@RequestMapping(value="/add") 
			public String upload(){
				
						return "upload";
			} 
}
