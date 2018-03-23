<?php if (!defined('THINK_PATH')) exit(); $lxwm=M('document_lxwm as a') ->join('modao_document as b') ->join('modao_picture as c') ->where('b.id=a.id and a.banner=c.id') ->field('a.*,b.title,c.path') ->order('a.id desc') ->find(); $lunbo=M('document_lunbo as a') ->join('modao_picture as b on a.banner=b.id') ->order('a.id desc') ->limit(3) ->field('b.path') ->select(); $aboutus=M('document_aboutus')->order('id desc')->limit(4)->select(); $newrow=M('document_aboutus')->order('id desc')->limit(1)->find(); ?>
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
					<div class="img" style="background-image: url(<?php echo ($lxwm['path']); ?>);">
						<div class="tt">
							<h3><?php echo ($lxwm['title']); ?></h3>
							<p><?php echo ($lxwm['ename']); ?></p>
						</div>
					</div>
				</div>
			</div>
			<div class="ui-fullpart">
				<div class="container">
					<div class="ui-mainlrct wow fadeInUp">
						<div class="l">
							<div class="ui-head1">
								<p>关于我们</p>
							</div>
							<div class="ui-leftnavi">
								<ul>
									<?php if(is_array($aboutus)): $i = 0; $__LIST__ = $aboutus;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?><li><p id="addclass"><a href="<?php echo U('Index/aboutus?id='.$v['id']);?>" data-toggle="tab" onclick="atype(<?php echo ($v["id"]); ?>)"><?php echo ($v['about_aname']); ?></a></p></li><?php endforeach; endif; else: echo "" ;endif; ?>
									<div class="clearfix"></div>
								</ul>
							</div>
							<div class="ht30 mb-hide"></div>
							<div class="ui-head1 mb-hide">
								<p>联系我们</p>
							</div>
							<div class="ui-leftnavi mb-hide">
								<ul>
									<li>
										<p><i class="ico1"></i>
											<?php echo ($lxwm['address']); ?>
										</p>
									</li>
									<li>
										<p><i class="ico2"></i>
											<?php echo ($lxwm['mobile']); ?>
										</p>
									</li>
									<li>
										<p><i class="ico3"></i>
											<?php echo ($lxwm['email']); ?>
										</p>
									</li>
								</ul>
							</div>
						</div>
						<div class="r addr">
							<div class="ui-abouttext">
								<p><?php echo ($newrow['contant']); ?></p>
								<p><br></p>
								<?php if(is_array($aboutus)): $i = 0; $__LIST__ = $aboutus;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v1): $mod = ($i % 2 );++$i;?><p><b><?php echo ($v1['about_aname']); ?></b></p>
								<div class="ht15"></div>
								<p><?php echo ($v1['about_atent']); ?></p>
								<br><?php endforeach; endif; else: echo "" ;endif; ?>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="ht90"></div>
					<div class="ui-contactview wow fadeInUp lrlist" data-count-pc="3" data-count-mb="1">
						<a href="#carousel-contactview" class="aw l" role="button" data-slide="prev"></a>
						<a href="#carousel-contactview" class="aw r" role="button" data-slide="next"></a>
						<div class="ct">
							<ul>
								<?php if(is_array($lunbo)): $i = 0; $__LIST__ = $lunbo;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li>
									<a href="" class="i">
										<img src="<?php echo ($vo['path']); ?>" alt="">
									</a>
								</li><?php endforeach; endif; else: echo "" ;endif; ?>
							</ul>
							<div class="clearfix"></div>
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
			function atype(obj) {
			    var id = obj;
                var str = '';
                $.getJSON("<?php echo U('Index/abouttype');?>",{id:id},function(data){
                    str = '<div class="ui-abouttext"><p>'+data['contant']+'</p><p><br></p>'
						+'<p><b>'+data['about_aname']+'</b></p><div class="ht15"></div>'
						+'<p>'+data['about_atent']+'</p>'
						+'<br></div>';
                $('.ui-abouttext').remove();
                $('.addr').append(str);
                });
            };
            $(document).ready(function(){
                $('#addclass a').click(function(){
                    $('#addclass a').removeClass('on');
                    $(this).addClass('on');
                })
            });
		</script>
	</body>
</html>