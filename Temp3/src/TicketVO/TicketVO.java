package TicketVO;

import java.util.Date;


/*
 CREATE TABLE ticket1(
    Id NUMBER(5) not null,
    ticketName varchar2(30) not null,
    MovieDate varchar2(20) not null,
    MovieTime varchar2(20) not null,
    MovieSeat varchar2(20) not null  
      
); 
 
 */
public class TicketVO {
	
	private int id;
	private String ticketName;
	private String MovieDate;
	private String MovieTime;
	private String MovieSeat;
	
	public TicketVO() {
	}
	public TicketVO(int id, String ticketName, String MovieDate, String MovieTime, String MovieSeat) {
		this.id= id;
		this.MovieDate = MovieDate;
		this.MovieTime = MovieTime;
		this.MovieSeat = MovieSeat;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTicketName() {
		return ticketName;
	}
	public void setTicketName(String ticketName) {
		this.ticketName = ticketName;
	}
	public String getMovieDate() {
		return MovieDate;
	}
	public void setMovieDate(String movieDate) {
		MovieDate = movieDate;
	}
	public String getMovieTime() {
		return MovieTime;
	}
	public void setMovieTime(String movieTime) {
		MovieTime = movieTime;
	}
	public String getMovieSeat() {
		return MovieSeat;
	}
	public void setMovieSeat(String movieSeat) {
		MovieSeat = movieSeat;
	}
}
