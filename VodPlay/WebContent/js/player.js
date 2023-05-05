CKobject.embed("ckplayer/ckplayer.swf",// 注意：这里必须为“ckplayer.swf”文件，用于加载flash播放器
"ckplayer", "ckplayer1", "600", "400", true, {
	f : "video/1.mp4",
	c : 0
}, [ 'video/1.mp4->video/mp4' ]

);

/*
 
CKobject.embed(
		'flash播放器文件路径',
		'容器ID（用于绑定到网页中）',
		'播放器的ID（将播放器替换绑定到网页后，播放器id）',
		'宽度，可以是百分比',
		'高度，可以是百分比',
		优先调用设置（false=优先调用flash播放器，true=优先调用HTML5播放器）,
		flash播放器的初始化参数（对象形式），以及HTML5初始化参数，比如默认播放/暂停等设置,
		HTML5视频播放地址（数组形式），详细的可参考官网HTML5视频调用的说明
)
*/