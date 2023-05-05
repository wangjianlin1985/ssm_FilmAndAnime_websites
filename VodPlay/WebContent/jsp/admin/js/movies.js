/**
 * 删除轮播影片
 */
function changeMovie(movieID) {
	var flag = confirm('确定删除吗？');
	if(flag){
		window.location.href="http://localhost:8080/VodPlay/changeMovie?movieid="+movieID;
	}
}
/**
 * 编辑影片
 * @param movieID
 * @returns
 */
function editMovie(movieID) {
	window.location.href="http://localhost:8080/VodPlay/editMovie?movieid="+movieID;
}


/**
 * 搜索影片
 * @returns
 */
function searchMovie() {
	window.location.href="searchMovie?movieName="+$("#movieName").val();
}
