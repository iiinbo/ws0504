package com.kbstar.controller;

import com.kbstar.dto.Adm;

import com.kbstar.service.AdmService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController // ajax에서 요청이 들어오면 그 요청을 받고 전달하는 곳! @RestController
public class AjaxImplController {

    @Autowired
    AdmService admservice; // 회원가입 시 id중복확인 위해


    //id 중복체크
    @RequestMapping("/checkid")
    public Object checkid(String id) throws Exception { // ajax에서 보내주는 값 : id.
       
        Adm adm = null;
        adm = admservice.get(id);
       int result = 0; // id 존재 '1', 미존재 '0' 
        
        if(adm != null ){ // adm 회원정보 id가 있다면,
          result = 1; // 기존재
       }
        return result;
    }

}
