package com.skilldistillery.film.database;

import java.sql.SQLException;
import java.util.List;

import com.skilldistillery.film.entities.Actor;
import com.skilldistillery.film.entities.Film;

public interface DatabaseAccessor {
	public Film findFilmById(int filmId) throws SQLException;

	public Actor findActorById(int actorId) throws SQLException;

	public List<Actor> findActorsByFilmId(int filmId) throws SQLException;
	
	public List<Film> findFilmByKeyword(String keyWord) throws SQLException;

	public Film addFilm(Film film) throws SQLException;

	public boolean deleteFilm(int filmId) throws SQLException;
}

//interfaces define the signature, but not the body