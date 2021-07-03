package com.skilldistillery.film.controllers;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.film.database.DatabaseAccessor;
import com.skilldistillery.film.entities.Film;

@Controller

public class FilmController {
	@Autowired
	DatabaseAccessor db;
	
	@RequestMapping(path= {"/", "home.do"})
	public String index() {
		return "home";
	}
	
	@RequestMapping(path= "userChoice.do")
	public String getSelectedForm(@RequestParam("userOption") String option, Model mv) {
		if(option.equals("createFilm")) {
			return "createFilmForm";
		}else if(option.equals("filmID")) {
			mv.addAttribute("typeOfSearch", "Id");
			return "getFilmForm";
		}else if(option.equals("filmKeyword")){
			mv.addAttribute("typeOfSearch", "Keyword");
			return "getFilmForm";
		}else {
			return "home.do";
		}
	}
	

	@RequestMapping(path="result.do", params="Id")
	public String searchForFilmById(@RequestParam("Id")int userFilmId, Model mv) {
		List<Film> results = new ArrayList<>();
		Film singleResult = null;
		System.out.println(userFilmId);
		try {
			singleResult = db.findFilmById(userFilmId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(singleResult != null) {
			results.add(singleResult);
		}
		mv.addAttribute("userFilm", results);
		return "lookupResult";
	}
	
	@RequestMapping(path="result.do", params="Keyword")
	public String searchForFilmByKeyword(@RequestParam("Keyword")String userSearch, Model mv) {
		List<Film> results = null;	
		try {
			results = db.findFilmByKeyword(userSearch);
		} catch (Exception e) {	
		}
		mv.addAttribute("userFilm", results);
		System.out.println(results);
		return "lookupResult";
	}
	

	//TODO: mapping for film creation command object?
	//      PRG - Post Redirect Get
	//      hooking up the DAO
	
	
	
	

	
}
