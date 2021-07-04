package com.skilldistillery.film.database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.skilldistillery.film.entities.Actor;
import com.skilldistillery.film.entities.Film;

public class DatabaseAccessorObject implements DatabaseAccessor {
	private static final String URL = "jdbc:mysql://localhost:3306/sdvid?useSSL=false&useLegacyDatetimeCode=false&serverTimezone=US/Mountain";
	private String user = "student";
	private String pass = "student";

	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Film addFilm(Film film) throws SQLException {
		Film f = film;
		String sql = "INSERT INTO film (title, description, language_id, release_year,  "
				+ "	  rental_duration, rental_rate, length, replacement_cost, rating) "
				+ "	  VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(URL, user, pass);
			conn.setAutoCommit(false); // Start transaction
			PreparedStatement st = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			st.setString(1, f.getTitle());
			st.setString(2, f.getDescription());
			st.setInt(3, f.getLanguage_id());
			st.setString(4, f.getRelease_year());
			st.setInt(5, f.getRental_duration());
			st.setDouble(6, f.getRental_rate());
			st.setInt(7, f.getLength());
			st.setDouble(8, f.getReplacement_cost());
			st.setString(9, f.getRating());
			int uc = st.executeUpdate();
			System.out.println(uc + " film record created.");
			if (uc != 1) {
				System.err.println("Oh no, looks like something went wrong. We've got to roll back");
				conn.rollback();
				return null;
			}
			// Now get the auto-generated film ID:
			ResultSet keys = st.getGeneratedKeys();
			int filmId = 0;
			if (keys.next()) {
				filmId = keys.getInt(1);
				System.out.println("New film ID: " + filmId);
			}
			sql = "SELECT * FROM film WHERE film.id = ?";
			st = conn.prepareStatement(sql);
			st.setInt(1, filmId);
			ResultSet rs = st.executeQuery();
			if (rs.next()) {
				System.out.println(rs.getInt("id") + " " + rs.getString("title") + " " + rs.getString("description"));
				f.setId(rs.getInt("id")); //sets the original film's ID to the new generated ID
			}

			conn.commit();
			st.close();
			conn.close();
		} catch (SQLException e) {
			conn.rollback();
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public boolean deleteFilm(Film film) {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(URL, user, pass);
			conn.setAutoCommit(false); // START TRANSACTION
			String sql = "DELETE FROM film WHERE film.id = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, film.getId());
			int updateCount = stmt.executeUpdate();
			conn.commit(); // COMMIT TRANSACTION
		} catch (SQLException sqle) {
			sqle.printStackTrace();
			if (conn != null) {
				try {
					conn.rollback();
				} catch (SQLException sqle2) {
					System.err.println("Error trying to rollback");
				}
			}
			return false;
		}
		return true;
	}

	public boolean updateFilm(Film film) {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(URL, user, pass);
			conn.setAutoCommit(false); // START TRANSACTION
			String sql = "UPDATE film SET title=?, description=? " + " WHERE id=?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, film.getTitle());
			stmt.setString(2, film.getDescription());
			stmt.setInt(3, film.getId());
			int updateCount = stmt.executeUpdate();
			conn.commit(); // COMMIT TRANSACTION
		} catch (SQLException sqle) {
			sqle.printStackTrace();
			if (conn != null) {
				try {
					conn.rollback();
				} // ROLLBACK TRANSACTION ON ERROR
				catch (SQLException sqle2) {
					System.err.println("Error trying to rollback");
				}
			}
			return false;
		}
		return true;
	}

	@Override
	public Film findFilmById(int filmId) throws SQLException {
		Connection conn = DriverManager.getConnection(URL, user, pass);
		String sql = "SELECT *, language.name 'language' FROM film JOIN language ON film.language_id = language.id WHERE film.id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, filmId);
//		System.out.println(stmt);
		ResultSet rs = stmt.executeQuery();
		Film f = null;
		if (rs.next() == false) {
			return null;
		} else {
			do {
				int id = rs.getInt("id");
				String title = rs.getString("title");
				String description = rs.getString("description");
				String release_year = rs.getString("release_year");
				int language_id = rs.getInt("language_id");
				int rental_duration = rs.getInt("rental_duration");
				double rental_rate = rs.getDouble("rental_rate");
				int length = rs.getInt("length");
				double replacement_cost = rs.getDouble("replacement_cost");
				String rating = rs.getString("rating");
				String special_features = rs.getString("special_features");
				// instantiates a new instance of Film based on the constructor
				f = new Film(id, title, description, release_year, language_id, rental_duration, rental_rate, length,
						replacement_cost, rating, special_features);
				f.setLanguage_name(rs.getString("language"));
				f.setActors(findActorsByFilmId(filmId));
			} while (rs.next());
		}
		rs.close();
		stmt.close();
		conn.close();
		return f; // returns ONE film object based on the Film ID
	}

	@Override
	public List<Film> findFilmByKeyword(String keyWord) throws SQLException {
		Connection conn = DriverManager.getConnection(URL, user, pass);
		String sql = "SELECT *,language.name 'language_name' FROM film JOIN language ON film.language_id = language.id WHERE film.title LIKE ? OR film.description LIKE ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, "%" + keyWord + "%");
		stmt.setString(2, "%" + keyWord + "%");
		ResultSet rs = stmt.executeQuery();
		List<Film> films = new ArrayList<Film>();
		if (rs.next() == false) {
			return null;
		} else {
			do {
				Film film = parseResultSet(rs);
				films.add(film);
			} while (rs.next());
		}
		return films; // returns a List of film objects
	}

	public Film parseResultSet(ResultSet rs) throws SQLException {
		Film film = new Film();
		film.setId(rs.getInt("id"));
		film.setTitle(rs.getString("title"));
		film.setDescription(rs.getString("description"));
		film.setRelease_year(rs.getString("release_year"));
		film.setLanguage_id(rs.getInt("language_id"));
		film.setRental_duration(rs.getInt("rental_duration"));
		film.setRental_rate(rs.getDouble("rental_rate"));
		film.setLength(rs.getInt("length"));
		film.setReplacement_cost(rs.getDouble("replacement_cost"));
		film.setRating(rs.getString("rating"));
		film.setSpecial_features(rs.getString("special_features"));
		film.setActors(findActorsByFilmId(rs.getInt("id")));
		film.setLanguage_name(rs.getString("language_name"));
		return film;
	}

	@Override
	public Actor findActorById(int actorId) throws SQLException {
		Connection conn = DriverManager.getConnection(URL, user, pass);
		String sql = "SELECT * FROM actor WHERE actor.id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, actorId);
		ResultSet rs = stmt.executeQuery();
		Actor a = null;
		if (rs.equals(null)) {
			return null;
		}
		while (rs.next()) {
			int id = rs.getInt("id");
			String first_name = rs.getString("first_name");
			String last_name = rs.getString("last_name");
			a = new Actor(id, first_name, last_name);
		}
		rs.close();
		stmt.close();
		conn.close();
		return a;
	}

	@Override
	public List<Actor> findActorsByFilmId(int filmId) throws SQLException {
		Connection conn = DriverManager.getConnection(URL, user, pass);
		String sql = "SELECT film.title, actor.id, actor.first_name, actor.last_name "
				+ "FROM film JOIN film_actor ON film.id = film_actor.film_id"
				+ " JOIN actor ON film_actor.actor_id = actor.id " + "WHERE film.id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, filmId);
		ResultSet rs = stmt.executeQuery();
		if (rs.equals(null)) {
			return null;
		}
		List<Actor> actorList = new ArrayList<Actor>();
		while (rs.next()) {
			actorList.add(findActorById(rs.getInt("id"))); // should cycle through rs actors and add to the list
//			System.out.println(
//					rs.getString("title") + " " + rs.getString("first_name") + " " + rs.getString("last_name"));
		}
		return actorList;
	}

}
