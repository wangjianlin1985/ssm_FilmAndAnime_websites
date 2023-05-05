package com.sheep.service;

import java.util.List;

import com.sheep.pojo.Movie;

public interface MovieService {
	
	public int insertSelective(Movie movie);

	public List<Movie> getMoviesByUserID(Movie movie);
	
	public int delMovieById(String id);

	public Movie getMoviesByID(String movieId);

	public List<Movie> getMovieBySliderImage();

	public List<Movie> getMovieByCategory(long l);

	public List<Movie> selectByRankings();

	public List<Movie> selectByRankingsByCategory(Long category);

	public List<Movie> getMoviesByIDs(String mvs);

	public void updateByCondiction(Movie movies);

	public List<Movie> searchMovie(Movie movie);

	public List<Movie> getMovieNoSilder(Movie movie);

	public List<Movie> getUserMovies(Movie movie);
}
