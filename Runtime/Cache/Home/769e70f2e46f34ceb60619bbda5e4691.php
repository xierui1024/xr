<?php if (!defined('THINK_PATH')) exit(); $banner=M('document_indexlb as a') ->join('modao_document as b') ->join('modao_picture as c') ->where('b.id=a.id and a.banner=c.id') ->field('a.*,b.title,c.path') ->order('a.id desc') ->select(); $about=M('document_indexab as a') ->join('modao_picture as b on a.img=b.id') ->field('a.*,b.path') ->order('id desc') ->limit(1) ->find(); $wenan=M('document_solution_tent as a') ->join('modao_picture as b on a.img=b.id') ->join('modao_document as c on c.id=a.id') ->where('a.n_type=3 and c.status=1') ->order('a.id desc') ->field('a.*,b.path') ->limit(4) ->select(); $anli=M('document_classic as a') ->join('modao_picture as b on a.img=b.id') ->join('modao_document as c on c.id=a.id') ->where('a.top=2 and c.status=1') ->order('a.id desc') ->field('a.*,b.path') ->limit(4) ->select(); $type=M('attribute')->where('id=175')->find(); $type=parse_field_attr($type['extra']); $list=M('document_solution_tent as a') ->join('modao_document as b on b.id=a.id') ->where('a.n_type=1 and b.status=1') ->order('a.id desc') ->field('a.*,b.create_time') ->limit(4) ->select(); ?>
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
				<div class="ui-homebanner">
					<div id="carousel-homebanner" class="carousel slide" data-ride="carousel" data-interval="3000">
					  <ol class="carousel-indicators">
					    <li data-target="#carousel-homebanner" data-slide-to="0" class="active"></li>
					    <li data-target="#carousel-homebanner" data-slide-to="1"></li>
					    <li data-target="#carousel-homebanner" data-slide-to="2"></li>
					  </ol>
					  <div class="carousel-inner" role="listbox">
						  <?php if(is_array($banner)): $i = 0; $__LIST__ = $banner;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?><!--<?php if($i == $i): ?><div class="item active"><?php else: ?><div class="item"><?php endif; ?>-->
							<div class="item">
								<div class="img" style="background-image: url(<?php echo ($v['path']); ?>);">
									<div class="container">
										<div class="tt">
											<p class="p1 wow fadeInLeft"><?php echo ($v['title']); ?></p>
											<p class="p2 wow fadeInLeft" data-wow-delay="100ms"><?php echo ($v['content']); ?></p>
										</div>
									</div>
								</div>
							</div><?php endforeach; endif; else: echo "" ;endif; ?>
					  </div>
					</div>
				</div>
			</div>
			<div class="ui-fullpart" style="padding-top: 0;">
				<div class="container">
					<div class="ui-homeabout wow fadeInUp">
						<div class="ui-title">
							<h3><?php echo ($about['ztitle']); ?></h3>
							<p><?php echo ($about['etitle']); ?></p>
						</div>
						<div class="ui-text1">
							<p><?php echo ($about['content']); ?></p>
						</div>
						<div class="ui-more">
							<p><a href="Article/lists/category/aboutus.html">了解详情</a></p>
						</div>
					</div>
				</div>
			</div>
			<div class="ui-fullpart bg-g">
				<div class="container">
					<div class="ui-title">
						<h3>解决方案</h3>
						<p>Solution</p>
					</div>
					<div class="ui-solution wow fadeInUp">
						<ul>
							<?php if(is_array($wenan)): $i = 0; $__LIST__ = $wenan;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v1): $mod = ($i % 2 );++$i;?><li>
								<!--<?php if($i == 1 or $i == 2): ?><a href="<?php echo U('Article/detail?id='.$v1['id']);?>" class="i"><?php else: ?><a href="<?php echo U('Article/detail?id='.$v1['id']);?>" class="i r"><?php endif; ?>-->
								<?php if($i == 1 or $i == 2): ?><a href="<?php echo U('/Article/lists/category/solution');?>" class="i"><?php else: ?><a href="<?php echo U('/Article/lists/category/solution');?>" class="i r"><?php endif; ?>
									<div class="view">
										<img src="<?php echo ($v1['path']); ?>" alt="">
									</div>
									<div class="text"><i></i>
										<h3><?php echo ($v1['sname']); ?></h3>
										<p><?php echo (msubstr($v1['solution_con'],0,50)); ?></p>
									</div>
									<div class="clearfix"></div>
								</a>
							</li><?php endforeach; endif; else: echo "" ;endif; ?>
							<div class="clearfix"></div>
						</ul>
					</div>
				</div>
			</div>
			<div class="ui-fullpart" style="background-color: #0072c3; padding-bottom: 0;">
				<div class="ui-title wt">
					<h3>典型案例</h3>
					<p>classic case</p>
				</div>
				<div class="ui-text1 wt">
					<p>案例，就是人们在生产生活当中所经历的典型的富有多种意义的事件陈述。它是人们所经历的故事当中的有意截取。<br>案例一般包括三大要素。案例对于人们的学习，研究，生活借鉴等具有重要意义。</p>
				</div>
				<div class="ui-homecase wow fadeInUp">
					<ul>
						<?php if(is_array($anli)): $i = 0; $__LIST__ = $anli;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v2): $mod = ($i % 2 );++$i;?><li>
							<a href="Article/lists/category/classic.html" class="i"><img src="<?php echo ($v2['path']); ?>" alt="">
								<div class="ct">
									<h3><?php echo ($v2['cname']); ?></h3>
									<p><?php echo (msubstr($v2['content'],0,20)); ?></p>
									<h5><label for="">了解详情</label></h5>
								</div>
							</a>
						</li><?php endforeach; endif; else: echo "" ;endif; ?>
						<div class="clearfix"></div>
					</ul>
				</div>
			</div>
			<div class="ui-fullpart nopd bg-g">
				<div class="container">
					<div class="ui-more mb" style="margin-bottom: 40px;">
						<p><a href="Article/lists/category/classic.html">查看更多</a></p>
					</div>
				</div>
			</div>
			<div class="ui-fullpart">
				<div class="container">
					<div class="ui-homenews wow fadeInUp">
						<div class="hd">
							<div class="tabs">
								<ul role="tablist">
									<li role="presentation" class="active" id="new"><a href="#news1" role="tab" data-toggle="tab">最新动态</a></li>
									<li role="presentation" id="zixun"><a href="#news2" role="tab" data-toggle="tab">新闻资讯</a></li>
									<div class="clearfix"></div>
								</ul>
							</div>
						</div>
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane active" id="news1">
								<div class="ct">
									<div class="r">
										<a href="/Article/lists/category/newsmedia" class="news">
											<div class="img">
												<img src="<?php echo ($about['path']); ?>" alt="">
											</div>
											<div class="txt">
												<h3><?php echo ($about['ftitle']); ?></h3>
												<p><?php echo (msubstr($about['fcontent'],0,50)); ?></p>
											</div>
										</a>
									</div>
									<div class="l">
										<div class="list">
											<ul id="remove">
												<?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v4): $mod = ($i % 2 );++$i;?><li>
													<a href="<?php echo U('Article/detail?id='.$v4['id']);?>" class="i">
														<div class="dt">
															<p class="p1"><?php echo (date("d",$v4['create_time'])); ?></p>
															<p class="p2"><?php echo (date("Y-m",$v4['create_time'])); ?></p>
														</div>
														<div class="ct">
															<h3><?php echo ($v4['sname']); ?></h3>
															<p><?php echo (msubstr($v4['solution_con'],0,70)); ?></p>
														</div>
														<div class="clearfix"></div>
													</a>
												</li><?php endforeach; endif; else: echo "" ;endif; ?>
											</ul>
										</div>
									</div>
									<div class="clearfix"></div>
								</div>
								<div class="clearfix"></div>
							</div>
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
            $(".item").each(function(){
				$('.item').removeClass('active');
				$(this).addClass('item active');
            });
			$('#new').click('on',function(){
                $.getJSON("<?php echo U('Index/aritcle');?>",{id:1},function(data){
                    console.log(data);
                    var html = '';
                    for (var i in data) {
						html +='<li><a href="<?php echo U("Article/detail/id/'+data[i].id+'");?>" class="i">'
							+'<div class="dt">'+'<p class="p1">'+data[i].d+'</p>'+'<p class="p2">'+data[i].ym+'</p></div>'
							+'<div class="ct">'+'<h3>'+data[i].sname+'</h3>'+'<p style="position:relative;width:488px; height:48px;overflow:hidden;">'+data[i].solution_con+'</p>'+'</div><div class="clearfix"></div></a></li>';
                    }
                    $('#remove li').remove();
                    $('#remove').append(html);
				});
			});
            $('#zixun').click('on',function(){
                $.getJSON("<?php echo U('Index/aritcle');?>",{id:2},function(data){
                    console.log(data);
                    var html = '';
                    for (var i in data) {
                        html +='<li><a href="<?php echo U("Article/detail/id/'+data[i].id+'");?>" class="i">'
                            +'<div class="dt">'+'<p class="p1">'+data[i].d+'</p>'+'<p class="p2">'+data[i].ym+'</p></div>'
                            +'<div class="ct">'+'<h3>'+data[i].sname+'</h3>'+'<p style="position:relative;width:488px; height:48px;overflow:hidden;">'+data[i].solution_con+'</p>'+'</div><div class="clearfix"></div></a></li>';
                    }
                    $('#remove li').remove();
                    $('#remove').append(html);
                });
            });
		</script>
	</body>
</html>