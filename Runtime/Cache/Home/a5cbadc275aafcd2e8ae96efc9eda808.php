<?php if (!defined('THINK_PATH')) exit();?>﻿<?php $banner=M('document_newsimg as a') ->join('modao_picture as b on a.img=b.id') ->order('a.id desc') ->field('a.*,b.path') ->limit(1) ->find(); $top = M('document_solution_tent')->where('top=1')->order('id desc')->limit(10)->select(); ?>
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
            <div class="img" style="background-image: url(<?php echo ($banner['path']); ?>);">
                <div class="tt">
                    <h3><?php echo ($banner['adv_name']); ?></h3>
                    <p><?php echo ($banner['adv_ename']); ?></p>
                </div>
            </div>
        </div>
    </div>
    <div class="ui-fullpart">
        <div class="container">
            <div class="ui-newslrct">
                <div class="l">
                    <div class="ui-newslist">
                        <ul>
                            <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?><li>
                                <?php $content=M('document_solution_tent')->where("id=$v[id]")->find(); $img=M('picture')->where("id=$content[img]")->find(); ?>
                                <a href="<?php echo U('Article/detail?id='.$v['id']);?>" class="i"><img src="<?php echo ($img['path']); ?>" alt="">
                                    <div class="ct">
                                        <h3><?php echo ($v['title']); ?></h3>
                                        <p><?php echo (msubstr($content['solution_con'],0,106)); ?></p>
                                        <h5><?php echo (date("Y-m-d",$v['creat_time'])); ?></h5>
                                    </div>
                                    <div class="clearfix"></div>
                                </a>
                            </li><?php endforeach; endif; else: echo "" ;endif; ?>
                        </ul>
                    </div>
                    <div class="ht30"></div>
                    <div class="ui-paging">
                        <?php $__PAGE__ = new \Think\Page(get_list_count($category['id']), $category['list_row']);echo $__PAGE__->show(); ?>
                    </div>
                </div>
                <div class="r">
                    <div class="ui-leftnote">
                        <div class="hd">
                            <p>为您推荐</p>
                        </div>
                        <div class="ct">
                            <ul>
                                <?php if(is_array($top)): $i = 0; $__LIST__ = $top;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?><li>
                                        <p><a href="<?php echo U('Article/detail?id='.$v['id']);?>"><?php echo (msubstr($v['sname'],0,13)); ?></a></p>
                                    </li><?php endforeach; endif; else: echo "" ;endif; ?>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
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
    var count = $('.ui-paging a').length;
    if(count >2){
        $(".ui-paging a:first-child").html("<<");
        $(".ui-paging a:last-child").html(">>");
    }else{
        $(".ui-paging a").remove();
    }
</script>
</body>
</html>