package com.skilldistillery.film.app;

import java.sql.SQLException;
import java.util.InputMismatchException;
import java.util.List;
import java.util.Scanner;

import com.skilldistillery.film.database.DatabaseAccessorObject;
import com.skilldistillery.film.entities.Actor;
import com.skilldistillery.film.entities.Film;

public class MVCFilmQueryApp {
	com.skilldistillery.film.database.DatabaseAccessor db = new DatabaseAccessorObject();

	public static void main(String[] args) throws SQLException {
		MVCFilmQueryApp app = new MVCFilmQueryApp();
//    app.test();
		app.launch();
	}

//	private void test() throws SQLException {
//		Film film = db.findFilmById(13);
//		System.out.println(film);
//	}

	private void launch() throws SQLException {
		Scanner input = new Scanner(System.in);

		startUserInterface(input);

		input.close();
	}

	private void startUserInterface(Scanner input) throws SQLException {
		boolean loopAgain = true;
		do {
			System.out.println("******************************************");
			System.out.println("* Choose one of the options below:       *");
			System.out.println("* 1. Look up a film by its id            *");
			System.out.println("* 2. Look up a film by a search keyword. *");
			System.out.println("* 3. Add new film.                       *");
			System.out.println("* 4. Exit the application.               *");
			System.out.println("******************************************");

			int uI = 0;
			try {
				uI = input.nextInt();
			} catch (InputMismatchException e) {
				System.err.println("Invalid input.");
				input.nextLine(); // Clear input buffer
				continue;
			}

			switch (uI) {
			case 1:
				lookUpFilmByID(input);
				break;
			case 2:
				lookUpFilmByKeyword(input);
				break;
			case 3:
				addNewFilm(input);
				break;
			case 4:
				System.out.println("Thank you, come again.");
				loopAgain = false;
				break;
			default:
				System.out.println("Invalid input, try again");
				break;
			}
			input.nextLine(); // clears the input buffer
		} while (loopAgain);
	}

//	private void subMenuInterface(Scanner input) throws SQLException {
//		boolean loopAgain = true;
//		do {
//			System.out.println("What option would you like:");
//			System.out.println("1. View all film details");
//			System.out.println("2. Return to previous menu");
//			// try catch block here
//			int uI = input.nextInt();
//
//			switch (uI) {
//			case 1:
//				lookUpFilmByID(input);
//				break;
//			case 2:
//				lookUpFilmByKeyword(input);
//				break;
//			default:
//				System.out.println("Invalid input, try again");
//				break;
//			}
//
//		} while (loopAgain);
//
//	}
	private void addNewFilm(Scanner input) throws SQLException {
		System.out.println("Adding a film");
		Film film = new Film();
		film.setId(1001);
		film.setTitle("Creature of the Blackjack Lagoon");
		film.setDescription("A riveting movie about a swamp monster with crippling debt and a gambling addiction");
		film.setRelease_year(null);
		film.setLanguage_id(1);
		film.setRental_duration(30);
		film.setRental_rate(3.50);
		film.setLength(120);
		film.setReplacement_cost(20.20);
		film = db.addFilm(film);
		deleteFilm(input, film);

	}

	private void deleteFilm(Scanner input, Film film) throws SQLException {
		System.out.println("Would you like to delete this film?");
		input.nextLine(); // clears the buffer
		String userInput = input.nextLine();
		if (userInput.equalsIgnoreCase("n") || userInput.equalsIgnoreCase("No")) {
			System.out.println("no changes made");

		} else {
			if (db.deleteFilm(film)) {
				System.out.println("film removed successfully");
			}
		}
	}

	private void lookUpFilmByID(Scanner input) throws SQLException {
		System.out.println("Please enter the film ID you would like to search for: ");
		Film film = db.findFilmById(input.nextInt());
		try {
			displayFilm(film);
		} catch (NullPointerException e) {
			System.out.println("No results, please try again.");
		}
	}

	private void lookUpFilmByKeyword(Scanner input) throws SQLException {
		System.out.println("Please enter the search term for the film are looking for: ");
		List<Film> films = db.findFilmByKeyword(input.next());
		try {
			for (Film f : films) {
				displayFilm(f);
			}
		} catch (NullPointerException e) {
			System.out.println("No results, please try again.");
		}
	}

	private void displayFilm(Film film) throws SQLException {
		Scanner input = new Scanner(System.in);
		System.out.println("\n" + film.getTitle());
		System.out.println("Language: " + film.getLanguage_name());
		System.out.println("Released on " + film.getRelease_year());
		System.out.println(film.getRating() + " Rating");
		System.out.println(film.getDescription());
		System.out.println("Starring the cast of: ");
		for (Actor a : film.getActors()) {
			System.out.println("- " + a.getFirstName() + " " + a.getLastName());
		}
		deleteFilm(input, film);
		System.out.println();
	}

}
