package com.sheep.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sheep.dao.MovieMapper;
import com.sheep.dao.UserMapper;
import com.sheep.pojo.Movie;
import com.sheep.pojo.User;
import com.sheep.service.MovieService;

@Service
public class MoiveServiceImpl implements MovieService {

	@Autowired
	private MovieMapper movieMapper;
	
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public int insertSelective(Movie movie) {
		return movieMapper.insertSelective(movie);
	}

	@Override
	public List<Movie> getMoviesByUserID(Movie movie) {
		
		int count = this.movieMapper.queryMovieCount(movie);
		movie.setTotalRecords(count);
		List<Movie> movieList = this.movieMapper.selectMovies(movie);
		
		for(Movie movieItem: movieList) {
			if(movieItem.getUserId() == null) {
				movieItem.setUsername("admin"); 
			} else {
				User user = userMapper.selectByPrimaryKey(movieItem.getUserId());
				movieItem.setUsername(user.getUserName());
			}
		}
		
		
		return movieList;
	}

	@Override
	public int delMovieById(String id) {
		int result = this.movieMapper.deleteByPrimaryKey(id);
		return result;
	}

	@Override
	public Movie getMoviesByID(String movieId) {
		
		Movie movie = this.movieMapper.selectByPrimaryKey(movieId);
		
		if(movie.getUserId() == null) movie.setUsername("admin");
		else {
			User user = userMapper.selectByPrimaryKey(movie.getUserId());
			movie.setUsername(user.getUserName());
		}
	 
		return movie;
	}

	@Override
	public List<Movie> getMovieBySliderImage() {
		List<Movie> movieList = movieMapper.selectSliderMV();
		for(Movie movieItem: movieList) {
			if(movieItem.getUserId() == null) {
				movieItem.setUsername("admin"); 
			} else {
				User user = userMapper.selectByPrimaryKey(movieItem.getUserId());
				movieItem.setUsername(user.getUserName());
			}
		}
		
		return movieList;
	}

	@Override
	public List<Movie> getMovieByCategory(long l) {
		List<Movie> movieList = this.movieMapper.selectByCategory(l);
		for(Movie movieItem: movieList) {
			if(movieItem.getUserId() == null) {
				movieItem.setUsername("admin"); 
			} else {
				User user = userMapper.selectByPrimaryKey(movieItem.getUserId());
				movieItem.setUsername(user.getUserName());
			}
		}
		
		return movieList;
	}

	@Override
	public List<Movie> selectByRankings() {
		List<Movie> movieList = this.movieMapper.selectByRankings();
		for(Movie movieItem: movieList) {
			if(movieItem.getUserId() == null) {
				movieItem.setUsername("admin"); 
			} else {
				User user = userMapper.selectByPrimaryKey(movieItem.getUserId());
				movieItem.setUsername(user.getUserName());
			}
		}
		
		return movieList;
	}

	@Override
	public List<Movie> selectByRankingsByCategory(Long category)  {
		List<Movie> movieList = this.movieMapper.selectByRankingsByCategory(category);
		
		for(Movie movieItem: movieList) {
			if(movieItem.getUserId() == null) {
				movieItem.setUsername("admin"); 
			} else {
				User user = userMapper.selectByPrimaryKey(movieItem.getUserId());
				movieItem.setUsername(user.getUserName());
			}
		}
		
		return movieList;
	}

	@Override
	public List<Movie> getMoviesByIDs(String mvs) {
		return this.movieMapper.getMoviesByIDs(mvs);
	}

	@Override
	public void updateByCondiction(Movie movies) {
		this.movieMapper.updateByPrimaryKeySelective(movies);
	}

	@Override
	public List<Movie> searchMovie(Movie movie) {
		int count = this.movieMapper.searchMovieCount(movie);
		movie.setTotalRecords(count); 
		
		List<Movie> movieList = this.movieMapper.searchMoive(movie);
		for(Movie movieItem: movieList) {
			if(movieItem.getUserId() == null) {
				movieItem.setUsername("admin"); 
			} else {
				User user = userMapper.selectByPrimaryKey(movieItem.getUserId());
				movieItem.setUsername(user.getUserName());
			}
		}
		
		return movieList;
		
		
		
	}

	@Override
	public List<Movie> getMovieNoSilder(Movie movie) {
		int count = this.movieMapper.getMovieNoSilderCount();
		movie.setTotalRecords(count);
		return this.movieMapper.getMovieNoSilder(movie);
	}

	@Override
	public List<Movie> getUserMovies(Movie movie) {
		int count =this.movieMapper.getUserMovieCount();
		movie.setTotalRecords(count);
		return this.movieMapper.getUserMovie(movie);
	}

}
