<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
    <!--[if lt IE 9]>
		<script type="text/javascript" src="/Public/static/jianzhu/js/html5.js"></script>
		<![endif]-->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title><?php if($category['title'] == ''): echo C('WEB_SITE_TITLE'); else: echo ($category['title']); ?>-<?php echo C('WEB_SITE_TITLE'); endif; ?></title>
    <script type="text/javascript" src="/Public/static/jianzhu/js/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/Public/static/jianzhu/css/animate.css">
    <link rel="stylesheet" type="text/css" href="/Public/static/jianzhu/css/global.css">
    <link rel="stylesheet" type="text/css" href="/Public/static/jianzhu/css/style.css">
    <link rel="stylesheet" type="text/css" href="/Public/static/jianzhu/css/owl.carousel.min.css">
    <script type="text/javascript" src="/Public/static/jianzhu/js/owl.carousel.js"></script>
    <script type="text/javascript" src="/Public/static/jianzhu/js/main.js"></script>
    <script src="/Public/static/jianzhu/js/jquery.filterizr.min.js"></script>
</head>

<body>
	<?php $footer=M('document as a')->join('modao_document_footer as b') ->where("a.id=b.id and a.category_id=54 and a.status=1") ->find(); if(!empty($footer['url'])) { $url=explode(';',$footer['url']); $arr=array(); foreach($url as $key=>$v) { if($v) { $v=explode('&',$v); $arr[$v[0]]=$v[1]; } } } else { $arr=array(); } ?>
    <div class="header">
        <div class="wrap">
            <div class="logo flt"><a href="/"><img src="/Public/static/jianzhu/img/logo.png" /></a></div>
            <div class="menu frt">
                <ul>
                	<li class="<?php if($category['id'] == '' ): ?>on<?php endif; ?> i">
		                <a href="/">首页<label></label></a>
		            </li>
                <?php $_result = M("category")->alias("__DOCUMENT")->where("display=1 and pid=0 and status=1")->order("sort asc")->select();if($_result):$i=0;foreach($_result as $key=>$vo): $count =count($_result);++$i;$mod = ($i % 2 ); if($category['id'] == $vo['id'] ): ?><li class="on">
                    <?php else: ?>
                    <li><?php endif; ?>
                        <a href="<?php echo get_category_url($vo['id']);?>">
                        	<?php echo ($vo["title"]); ?><label></label>
                        </a>
                    </li><?php endforeach; endif;?>
                </ul>
            </div>
            <div class="menu_wrap"></div>
            <div class="clear"></div>
        </div>
    </div>
<?php $type=M('attribute')->where('id=90')->find(); ?>
<div class="mainer">
       <div class="banner2" style="background:url(<?php echo (get_cover($category['icon'],'path')); ?>) no-repeat center center; background-size:cover;">
            <div class="item"><div class="text"><div class="wrap"><h2><?php echo get_category_e_name(49);?></h2><p><?php echo get_category_title(49);?></p></div></div></div>
            <div class="kuang"></div>
        </div>
        <div class="page page6">
            <div class="wrap">
                <div class="page_tit2">
                    <h3><span>Company service</span></h3>
                    <!--<div class="frt div_select">
                       <select><option>最新一个月</option></select>
                    </div>-->
                    <div class="clear"></div>
                </div>
                <div class="news_list2">
                    <ul>
                    	<?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $img=M('document_article')->where("id=$vo[id]")->find(); $leixing=explode(',',$img['leixing']); $arr=array(); foreach($leixing as $key=>$v) { $arr[$v]=$type[$v]; } ?>
	                        <li>
	                            <div class="img"><a href="<?php echo U('Article/detail?id='.$vo['id']);?>"><img src="<?php echo (get_cover($img['img'],'path')); ?>" /></a></div>
	                            <div class="text">
	                                <h3><a href="<?php echo U('Article/detail?id='.$vo['id']);?>"><?php echo ($vo["title"]); ?></a></h3>
	                                <p class="p1"><span class="span1">来自：<?php echo ($img["laiyuan"]); ?></span><span class="span2">时间：<?php echo (date("Y-m-d",$vo["create_time"])); ?></span></p>
	                                <p class="p_text"><?php echo ($vo["description"]); ?></p>
	                                <p class="p_tips">
	                                	<?php if(is_array($arr)): $i = 0; $__LIST__ = $arr;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$co): $mod = ($i % 2 );++$i;?><label><?php echo ($co); ?></label><?php endforeach; endif; else: echo "" ;endif; ?>
	                                </p>
	                            </div>
	                        </li><?php endforeach; endif; else: echo "" ;endif; ?>
                    </ul>
                </div>

                <div class="pagesize">
                    <?php $__PAGE__ = new \Think\Page(get_list_count($category['id']), $category['list_row']);echo $__PAGE__->show(); ?>
                </div>
            </div>
        </div>
    </div>
  <!-------------------------------------- 尾部开始 -------------------------------------->
    <div class="footer animated fast" data-animation="fadeInDown">
        <div class="wrap">
            <div class="item item1">
                <label></label>
                <h3>关于我们</h3>
                <div class="text">
                    <p><?php echo ($footer['about']); ?></p>
                </div>
            </div>
            <div class="item">
                <label></label>
                <h3>联系我们</h3>
                <div class="text">
                    <ul>
                        <li>传真：<?php echo ($footer['fax']); ?></li>
                        <li>热线电话：<?php echo ($footer['phone']); ?></li>
                        <li>邮箱：<?php echo ($footer['email']); ?></li>
                        <li>地址：<?php echo ($footer['tel']); ?></li>
                    </ul>
                </div>
            </div>
            <div class="item">
                <label></label>
                <h3>友情链接</h3>
                <div class="text">
                    <ul>
                    	<?php if(is_array($arr)): $i = 0; $__LIST__ = $arr;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li><a href="<?php echo ($vo); ?>" target="_blank"><?php echo (L("$key")); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
                        
                    </ul>
                </div>
            </div>
            <div class="item item4">
                <label></label>
                <h3>企业官方微信</h3>
                <div class="img"><img src="<?php echo (get_cover($footer["wx"],'path')); ?>" /></div>
            </div>
            <div class="clear"></div>
        </div>
        <div class="foot">
            <p><a style="color: #636d76;" href="http://www.miibeian.gov.cn " target="_blank"><?php echo C('WEB_SITE_ICP');?></a> 版权所有 网站建设：莫道网络</p>
        </div>
    </div>
    <!-------------------------------------- 尾部结束 -------------------------------------->
</body>
</html>