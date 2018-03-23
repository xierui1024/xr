<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="format-detection" content="telephone=no">
		<title>页面演示</title>
		<style>
			body{
				font-family: 微软雅黑;
				font-size: 12px;
			}
			a{
				color: #000;
			}

			h3{
				text-align: center;
			}
			ol{
				background-color: #fffff0;
				padding-top: 10px;
				padding-bottom: 10px;
			}
			li{
				padding: 5px 0;
			}
			p{
				text-align: center;
			}

			#qr{
				text-align: center;
				margin-top: -10px;
			}
			#qr img{
				max-width: 200px;
			}
		</style>
	</head>
	<body>
		<main>
			<h3>页面列表</h3>
			<hr>
			<ol>
				<?php  
				function showDir($filedir){
					$dir = @dir($filedir);
					while(($file = $dir->read())!==false){
						if(strpos($file, '.html')>0){
				  		echo "<li><a href='html/" .mb_convert_encoding($file, "UTF-8", "GBK"). "' target='_blank'>".mb_convert_encoding($file, "UTF-8", "GBK")."</a></li>";
						}
					}
					$dir->close();
				}  
				showDir("./html/");  
				?>
			</ol>
			<hr>
			<h3>手机浏览</h3>
			<div id="qr">
				<script>
					var img=document.createElement("img");
					img.src='http://qr.liantu.com/api.php?text='+location.toString();;
					document.getElementById('qr').appendChild(img);
				</script>
			</div>
		</main>
	</body>
</html>