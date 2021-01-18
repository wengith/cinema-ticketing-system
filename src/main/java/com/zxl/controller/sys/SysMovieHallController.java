package com.zxl.controller.sys;

import com.zxl.entity.Msm;
import com.zxl.entity.TMoviehall;
import com.zxl.service.TMoviehallService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@RequestMapping("/sysHall")
public class SysMovieHallController {
    @Autowired
    private TMoviehallService tMoviehallService;


    @RequestMapping("/findAll")
    public String finAll(ModelMap modelMap){
        List<TMoviehall> all = tMoviehallService.findAll(null);
        modelMap.addAttribute("halls",all);
        return "sysMovieHall";
    }

    @RequestMapping("/previewSeats")
    public String previewSeats(Integer raw,Integer clu,String hall,ModelMap modelMap){
//        Msm byId = tMovieorderService.findById(id);
        modelMap.addAttribute("raw",raw);
        modelMap.addAttribute("clu",clu);
        modelMap.addAttribute("hall",hall);
        return "sys_preview_seat";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(TMoviehall tMoviehall){
        tMoviehallService.insert(tMoviehall);
        return "redirect:/sysHall/findAll";
    }
    @RequestMapping("/delete")
    public String delete(Integer id){
        tMoviehallService.deleteById(id);
        return "redirect:/sysHall/findAll";
    }

    /**
     * 更新影厅开放状态 1/0
     * @param id
     * @param status
     * @return
     */
    @RequestMapping("/updateStatus")
    public String delete(Integer id, Integer status){
        TMoviehall tMoviehall = new TMoviehall();
        tMoviehall.setMoviehallid(id);
        tMoviehall.setStatus(status);
        tMoviehallService.update(tMoviehall);
        return "redirect:/sysHall/findAll";
    }

}
