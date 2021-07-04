package com.skilldistillery.film.controllers;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.film.database.DatabaseAccessor;
import com.skilldistillery.film.entities.Film;

@Controller

public class FilmController {
	@Autowired
	DatabaseAccessor db;

	@RequestMapping(path = { "/", "home.do" })
	public String index() {
		return "home";
	}

	@RequestMapping(path = "userChoice.do")
	public String getSelectedForm(@RequestParam("userOption") String option, Model mv) {
		if (option.equals("addFilm")) {
			return "addFilmForm";
		} else if (option.equals("filmID")) {
			mv.addAttribute("typeOfSearch", "Id");
			return "getFilmForm";
		} else if (option.equals("filmKeyword")) {
			mv.addAttribute("typeOfSearch", "Keyword");
			return "getFilmForm";
		} else {
			return "home.do";
		}
	}

	@RequestMapping(path = "result.do", params = "Id")
	public String searchForFilmById(@RequestParam("Id") int userFilmId, Model mv) {
		List<Film> results = new ArrayList<>();
		Film singleResult = null;
		System.out.println(userFilmId);
		try {
			singleResult = db.findFilmById(userFilmId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (singleResult != null) {
			results.add(singleResult);
		}
		mv.addAttribute("userFilm", results);
		return "lookupResult";
	}

	@RequestMapping(path = "result.do", params = "Keyword")
	public String searchForFilmByKeyword(@RequestParam("Keyword") String userSearch, Model mv) {
		List<Film> results = null;
		try {
			results = db.findFilmByKeyword(userSearch);
		} catch (Exception e) {
		}
		mv.addAttribute("userFilm", results);
		System.out.println(results);
		return "lookupResult";
	}

	// mapping for film creation command object
	// hooking up the DAO etc...
	// When the form is submitted, the request data is turned into a film object.
	// Any fields not present are set to their defaults.

	@RequestMapping(path = "addFilm.do", method = RequestMethod.POST)
	public String addFilm(Film film, Model mv,  RedirectAttributes redir)
			throws SQLException {
		List<Film> results = new ArrayList<>();;
//		Film results = null;
		try {
			results.add(db.addFilm(film));
		} catch (Exception e) {
			System.out.println("Something went wrong.");
		}
		mv.addAttribute("userFilm", results); 
		redir.addFlashAttribute("film", results); 
		System.out.println(results);
		return "redirect:filmAdded.do"; // redirects to new mapping
	}

	// PRG - Post Redirect Get
	@RequestMapping(path = "filmAdded.do", method = RequestMethod.GET ) // mapping to handle Redirect
	public String filmAdded(Model mv, @ModelAttribute(value="film") List<Film> film) {
		mv.addAttribute("userFilm", film); 
		return "lookupResult";
	}

}
