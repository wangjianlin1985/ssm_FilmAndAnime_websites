/**
 * 删除影片
 */
function delMovie(movieID) {
	var flag = confirm('确定删除吗？');
	if(flag){
		window.location.href="delMovie?movieid="+movieID;
	}
}
function delMovieByAdmin(movieID) {
	var flag = confirm('确定删除吗？');
	if(flag){
		window.location.href="http://localhost:8080/VodPlay/delMovieByAdmin?movieid="+movieID;
	}
}
/**
 * 编辑影片
 * @param movieID
 * @returns
 */
function editMovie(movieID) {
	window.location.href="editMovie?movieid="+movieID;
}

function editMovieByAdmin(movieID) {
	window.location.href="http://localhost:8080/VodPlay/editMovieByAdmin?movieid="+movieID;
}

function changeIsplay(movieID) {
	window.location.href="http://localhost:8080/VodPlay/saveEditMovieByAdmin?movieId="+movieID;
}


/**
 * 搜索影片
 * @returns
 */
function searchMovie() {
	window.location.href="searchMovie?movieName="+$("#movieName").val();
}