<?php if (!defined('THINK_PATH')) exit(); $banner=M('document_callus as a') ->join('modao_picture as b on a.img=b.id') ->join('modao_picture as c on a.image=c.id') ->order('a.id desc') ->field('a.*,b.path,c.path as image') ->limit(1) ->find(); ?>
<!DOCTYPE html>
<html lang="zh">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="format-detection" content="telephone=no">
		<title>化工</title>
		<link rel="stylesheet" type="text/css" href="/Public/static/huogong/css/style.css"/>
		<link rel="stylesheet" type="text/css" href="/Public/static/huogong/css/custom.css"/>
		<script src="/Public/static/huogong/js/script.js"></script>
		<script src="/Public/static/huogong/js/custom.js"></script>
		<style>
			
		</style>
	</head>
	<body style="display: none;">
		<!-------------------------------------- 头部开始 -------------------------------------->
		<header>
    <div class="container">
        <a href="" class="mbtn"></a>
        <div class="menu">
            <ul>
                <li>
                <a href="/" class="<?php if($category['id'] == '' ): ?>on<?php endif; ?> i">首页<label></label></a>
                </li>
                <?php $_result = M("category")->alias("__DOCUMENT")->where("display=1 and pid=0 and status=1 and id !=70")->order("sort asc")->select();if($_result):$i=0;foreach($_result as $key=>$vo): $count =count($_result);++$i;$mod = ($i % 2 );?><li>
                    <?php if($category['id'] == $vo['id'] ): ?><a href="<?php echo get_category_url($vo['id']);?>" class="on">
                            <?php echo ($vo["title"]); ?><label></label>
                        </a>
                   <?php else: ?>
                        <a href="<?php echo get_category_url($vo['id']);?>">
                            <?php echo ($vo["title"]); ?><label></label>
                        </a><?php endif; ?>
                    </li><?php endforeach; endif;?>
            </ul>
        </div>
        <div class="logo"><a href=""><img src="/Public/static/huogong/img/logo.png" alt=""></a></div>
        <div class="clearfix"></div>
    </div>
</header>
		<!-------------------------------------- 头部结束 -------------------------------------->
		<!-------------------------------------- 主体开始 -------------------------------------->
		<main>
			<div class="ui-fullpart nopd">
				<div class="ui-banner">
					<div class="img gt" style="background-image: url(<?php echo ($banner['path']); ?>);">
						<div class="tt">
							<h3><?php echo ($banner['adv_name']); ?></h3>
							<p><?php echo ($banner['adv_ename']); ?></p>
						</div>
						<div class="ct">
							<p><?php echo ($banner['content']); ?></p>
						</div>
					</div>
				</div>
			</div>
			<div class="ui-fullpart" style="padding-top: 0;">
				<div class="container">
					<div class="ui-contactus">
						<div class="view">
							<img src="" alt=""><?php echo ($banner['map']); ?>
						</div>
						<div class="text">
							<p class="p1"><?php echo ($banner['address']); ?></p>
							<p class="p2"><?php echo ($banner['eaddress']); ?></p>
							<p class="p3"><?php echo ($banner['mobile']); ?></p>
							<p class="p4">
								<img src="<?php echo ($banner['image']); ?>" alt="">
							</p>
							<p class="p5"><?php echo ($banner['www']); ?></p>
						</div>
					</div>
				</div>
			</div>
		</main>
		<!-------------------------------------- 主体结束 -------------------------------------->
		<!-------------------------------------- 尾部开始 -------------------------------------->
		<?php $footer = M('document_fot as a') ->join('modao_picture as b on a.img=b.id') ->join('modao_picture as c on a.img1=c.id') ->join('modao_picture as d on a.img2=d.id') ->order('a.id desc') ->field('b.path as image,c.path as img1,d.path as img2,a.id,a.footcont,a.imgname1,a.imgname2,a.copyright,a.copyurl,a.copyname') ->limit(1) ->find(); $category = M('category')->where('display=1 and pid=0 and status=1 and id!=70')->field('id,title')->select(); ?>
<footer>
    <div class="a">
        <div class="container">
            <div class="list">
                <ul>
                    <li>
                        <div class="text">
                            <h3><img src="<?php echo ($footer['image']); ?>" alt=""></h3>
                            <p><?php echo ($footer['footcont']); ?></p>
                        </div>
                    </li>
                    <li>
                        <div class="link">
                            <ul>
                                <?php if(is_array($category)): $i = 0; $__LIST__ = $category;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?><li><p><a href="<?php echo get_category_url($v['id']);?>"><?php echo ($v['title']); ?></a></p></li><?php endforeach; endif; else: echo "" ;endif; ?>
                                <div class="clearfix"></div>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <div class="qbox">
                            <table>
                                <tr>
                                    <td>
                                        <div class="i">
                                            <img src="<?php echo ($footer['img1']); ?>" alt="">
                                            <p><?php echo ($footer['imgname1']); ?></p>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="i">
                                            <img src="<?php echo ($footer['img2']); ?>" alt="">
                                            <p><?php echo ($footer['imgname2']); ?></p>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </li>
                    <div class="clearfix"></div>
                </ul>
            </div>
        </div>
    </div>
    <div class="b">
        <div class="container">
            <div class="info">
                <p><?php echo ($footer['copyright']); ?><a href="<?php echo ($footer['copyurl']); ?>"><?php echo ($footer['copyname']); ?></a></p>
            </div>
        </div>
    </div>
</footer>
		<!-------------------------------------- 尾部开始 -------------------------------------->
		<script>
			
		</script>
	</body>
</html>