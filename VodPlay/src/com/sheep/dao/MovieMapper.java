package com.sheep.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sheep.pojo.Movie;

@Repository
public interface MovieMapper {
    int deleteByPrimaryKey(String id);

    int insert(Movie record);

    int insertSelective(Movie record);

    Movie selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Movie record);

    int updateByPrimaryKey(Movie record);

	List<Movie> selectMovies(Movie movie);
	
	int queryMovieCount(Movie movie);

	List<Movie> selectSliderMV();

	List<Movie> selectByCategory(long l);
	
	List<Movie> selectByRankings();

	List<Movie> selectByRankingsByCategory(Long category);

	List<Movie> getMoviesByIDs(String mvs);
	
	List<Movie> searchMoive(Movie movie);

	int searchMovieCount(Movie movie);
	
	int getMovieNoSilderCount();
	
	int getUserMovieCount();
	
	int getIsplayMovieCount();
	
	List<Movie> getMoviesBySlider();
	
	List<Movie> getIsplayMovie(Movie movie);
	
	List<Movie> getUserMovie(Movie movie);

	List<Movie> getMovieNoSilder(Movie movie);
}