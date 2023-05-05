package com.sheep.pojo;

public class Res {
	
	private String userName;
	private String movieId;
	private String type;//资源类型：影片还是影片的缩略图
	private String mvExtName;
	private String imgExtName;
	
	@Override
	public String toString() {
		return "Res [userName=" + userName + ", movieId=" + movieId + ", type=" + type + ", mvExtName=" + mvExtName
				+ ", imgExtName=" + imgExtName + "]";
	}
	public String getMvExtName() {
		return mvExtName;
	}
	public void setMvExtName(String mvExtName) {
		this.mvExtName = mvExtName;
	}
	public String getImgExtName() {
		return imgExtName;
	}
	public void setImgExtName(String imgExtName) {
		this.imgExtName = imgExtName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getMovieId() {
		return movieId;
	}
	public void setMovieId(String movieId) {
		this.movieId = movieId;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	public String getResPath() {
		if( type.equals("img") ){
			//目标: d:\myvod\img\  andy  \5111mdetbv9in2fj4ji5t2u6ieru470s.png
			//[1] d:\myvod\img  <---- EnvUtils.imgPath
			//[2] andy <---- this.user
			//[3] 影片ID <---- this.movieId
			//[4] .png  <---- this.extName
			return userName+movieId+imgExtName;
		}else{
			//目标: d:\myvod\video\andy\5111mdetbv9in2fj4ji5t2u6ieru470s.flv
			return userName+movieId+mvExtName;
		}
	}
}
