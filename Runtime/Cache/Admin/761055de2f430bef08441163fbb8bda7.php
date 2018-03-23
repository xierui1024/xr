<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title><?php echo ($meta_title); ?>|<?php echo C('WEB_SITE_TITLE');?></title>
    <link href="/Public/favicon.ico" type="image/x-icon" rel="shortcut icon">
    <link rel="stylesheet" type="text/css" href="/Public/Admin/css/base.css" media="all">
    <link rel="stylesheet" type="text/css" href="/Public/Admin/css/common.css" media="all">
    <link rel="stylesheet" type="text/css" href="/Public/Admin/css/module.css">
    <link rel="stylesheet" type="text/css" href="/Public/Admin/css/style.css" media="all">
	<link rel="stylesheet" type="text/css" href="/Public/Admin/css/<?php echo (C("COLOR_STYLE")); ?>.css" media="all">
     <!--[if lt IE 9]>
    <script type="text/javascript" src="/Public/static/jquery-1.10.2.min.js"></script>
    <![endif]--><!--[if gte IE 9]><!-->
    <script type="text/javascript" src="/Public/static/jquery-2.0.3.min.js"></script>
    <script type="text/javascript" src="/Public/Admin/js/jquery.mousewheel.js"></script>
    <!--<![endif]-->
    
</head>
<body>
    <!-- 头部 -->
    <div class="header">
        <!-- Logo -->
        <span class="logo"></span>
        <!-- /Logo -->

        <!-- 主导航 -->
        <ul class="main-nav">
            <?php if(is_array($__MENU__["main"])): $i = 0; $__LIST__ = $__MENU__["main"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$menu): $mod = ($i % 2 );++$i;?><li class="<?php echo ((isset($menu["class"]) && ($menu["class"] !== ""))?($menu["class"]):''); ?>"><a href="<?php echo (U($menu["url"])); ?>"><?php echo ($menu["title"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
        </ul>
        <!-- /主导航 -->

        <!-- 用户栏 -->
        <div class="user-bar">
            <a href="javascript:;" class="user-entrance"><i class="icon-user"></i></a>
            <ul class="nav-list user-menu hidden">
                <li class="manager">你好，<em title="<?php echo session('user_auth.username');?>"><?php echo session('user_auth.username');?></em></li>
                <li><a href="<?php echo U('User/updatePassword');?>">修改密码</a></li>
                <li><a href="<?php echo U('User/updateNickname');?>">修改昵称</a></li>
                <li><a href="<?php echo U('Public/logout');?>">退出</a></li>
            </ul>
        </div>
    </div>
    <!-- /头部 -->

    <!-- 边栏 -->
    <div class="sidebar">
        <!-- 子导航 -->
        
    <div id="subnav" class="subnav">
    <?php if(!empty($_extra_menu)): ?>
        <?php echo extra_menu($_extra_menu,$__MENU__); endif; ?>
    <?php if(is_array($__MENU__["child"])): $i = 0; $__LIST__ = $__MENU__["child"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$sub_menu): $mod = ($i % 2 );++$i;?><!-- 子导航 -->
        <?php if(!empty($sub_menu)): if(!empty($key)): ?><h3><i class="icon icon-unfold"></i><?php echo ($key); ?></h3><?php endif; ?>
            <ul class="side-sub-menu">
                <?php if(is_array($sub_menu)): $i = 0; $__LIST__ = $sub_menu;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$menu): $mod = ($i % 2 );++$i;?><li>
                        <a class="item" href="<?php echo (U($menu["url"])); ?>"><?php echo ($menu["title"]); ?></a>
                    </li><?php endforeach; endif; else: echo "" ;endif; ?>
            </ul><?php endif; ?>
        <!-- /子导航 --><?php endforeach; endif; else: echo "" ;endif; ?>
 <h3>
 	<i class="icon <?php if(!in_array((ACTION_NAME), explode(',',"mydocument,draftbox,examine"))): ?>icon-fold<?php endif; ?>"></i>
 	个人中心
 </h3>
 	<ul class="side-sub-menu <?php if(!in_array((ACTION_NAME), explode(',',"mydocument,draftbox,examine"))): ?>subnav-off<?php endif; ?>">
 		<li <?php if((ACTION_NAME) == "mydocument"): ?>class="current"<?php endif; ?>><a class="item" href="<?php echo U('article/mydocument');?>">我的文档</a></li>
 		<?php if(($show_draftbox) == "1"): ?><li <?php if((ACTION_NAME) == "draftbox"): ?>class="current"<?php endif; ?>><a class="item" href="<?php echo U('article/draftbox');?>">草稿箱</a></li><?php endif; ?>
		<?php if(($show_examine) == "1"): ?><li <?php if((ACTION_NAME) == "draftbox"): ?>class="examine"<?php endif; ?>><a class="item" href="<?php echo U('article/examine');?>">待审核</a></li><?php endif; ?>
 	</ul>

    <?php if(is_array($nodes)): $i = 0; $__LIST__ = $nodes;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$sub_menu): $mod = ($i % 2 );++$i;?><!-- 子导航 -->
        <?php if(!empty($sub_menu)): ?><h3>
            	<i class="icon <?php if(($sub_menu['current']) != "1"): ?>icon-fold<?php endif; ?>"></i>
            	<?php if(($sub_menu['allow_publish']) > "0"): ?><a class="item" href="<?php echo (U($sub_menu["url"])); ?>"><?php echo ($sub_menu["title"]); ?></a><?php else: echo ($sub_menu["title"]); endif; ?>
            </h3>
            <ul class="side-sub-menu <?php if(($sub_menu["current"]) != "1"): ?>subnav-off<?php endif; ?>">
                <?php if(is_array($sub_menu['_child'])): $i = 0; $__LIST__ = $sub_menu['_child'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$menu): $mod = ($i % 2 );++$i;?><li <?php if($menu['id'] == $cate_id or $menu['current'] == 1): ?>class="current"<?php endif; ?>>
                        <?php if(($menu['allow_publish']) > "0"): ?><a class="item" href="<?php echo (U($menu["url"])); ?>"><?php echo ($menu["title"]); ?></a><?php else: ?><a class="item" href="javascript:void(0);"><?php echo ($menu["title"]); ?></a><?php endif; ?>

                        <!-- 一级子菜单 -->
                        <?php if(isset($menu['_child'])): ?><ul class="subitem">
                        	<?php if(is_array($menu['_child'])): foreach($menu['_child'] as $key=>$three_menu): ?><li>
                                <?php if(($three_menu['allow_publish']) > "0"): ?><a class="item" href="<?php echo (U($three_menu["url"])); ?>"><?php echo ($three_menu["title"]); ?></a><?php else: ?><a class="item" href="javascript:void(0);"><?php echo ($three_menu["title"]); ?></a><?php endif; ?>
                                <!-- 二级子菜单 -->
                                <?php if(isset($three_menu['_child'])): ?><ul class="subitem">
                                	<?php if(is_array($three_menu['_child'])): foreach($three_menu['_child'] as $key=>$four_menu): ?><li>
                                        <?php if(($four_menu['allow_publish']) > "0"): ?><a class="item" href="<?php echo U('index','cate_id='.$four_menu['id']);?>"><?php echo ($four_menu["title"]); ?></a><?php else: ?><a class="item" href="javascript:void(0);"><?php echo ($four_menu["title"]); ?></a><?php endif; ?>
                                        <!-- 三级子菜单 -->
                                        <?php if(isset($four_menu['_child'])): ?><ul class="subitem">
                                        	<?php if(is_array($four_menu['_child'])): $i = 0; $__LIST__ = $four_menu['_child'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$five_menu): $mod = ($i % 2 );++$i;?><li>
                                            	<?php if(($five_menu['allow_publish']) > "0"): ?><a class="item" href="<?php echo U('index','cate_id='.$five_menu['id']);?>"><?php echo ($five_menu["title"]); ?></a><?php else: ?><a class="item" href="javascript:void(0);"><?php echo ($five_menu["title"]); ?></a><?php endif; ?>
                                            </li><?php endforeach; endif; else: echo "" ;endif; ?>
                                        </ul><?php endif; ?>
                                        <!-- end 三级子菜单 -->
                                    </li><?php endforeach; endif; ?>
                                </ul><?php endif; ?>
                                <!-- end 二级子菜单 -->
                            </li><?php endforeach; endif; ?>
                        </ul><?php endif; ?>
                        <!-- end 一级子菜单 -->
                    </li><?php endforeach; endif; else: echo "" ;endif; ?>
            </ul><?php endif; ?>
        <!-- /子导航 --><?php endforeach; endif; else: echo "" ;endif; ?>
    <!-- 回收站 -->
	<?php if(($show_recycle) == "1"): ?><h3>
        <em class="recycle"></em>
        <a href="<?php echo U('article/recycle');?>">回收站</a>
    </h3><?php endif; ?>
</div>
<script>
    $(function(){
        $(".side-sub-menu li").hover(function(){
            $(this).addClass("hover");
        },function(){
            $(this).removeClass("hover");
        });
    })
</script>


        <!-- /子导航 -->
    </div>
    <!-- /边栏 -->

    <!-- 内容区 -->
    <div id="main-content">
        <div id="top-alert" class="fixed alert alert-error" style="display: none;">
            <button class="close fixed" style="margin-top: 4px;">&times;</button>
            <div class="alert-content">这是内容</div>
        </div>
        <div id="main" class="main">
            
            <!-- nav -->
            <?php if(!empty($_show_nav)): ?><div class="breadcrumb">
                <span>您的位置:</span>
                <?php $i = '1'; ?>
                <?php if(is_array($_nav)): foreach($_nav as $k=>$v): if($i == count($_nav)): ?><span><?php echo ($v); ?></span>
                    <?php else: ?>
                    <span><a href="<?php echo ($k); ?>"><?php echo ($v); ?></a>&gt;</span><?php endif; ?>
                    <?php $i = $i+1; endforeach; endif; ?>
            </div><?php endif; ?>
            <!-- nav -->
            

            
	<script type="text/javascript" src="/Public/static/uploadify/jquery.uploadify.min.js"></script>
		<!--图片裁剪——开始-->
		<script src="/Public/Admin/img_caijian/js/iscroll-zoom.js" type="text/javascript" charset="utf-8"></script>
		<script src="/Public/Admin/img_caijian/js/hammer.js" type="text/javascript" charset="utf-8"></script>
		<script src="/Public/Admin/img_caijian/js/lrz.all.bundle.js" type="text/javascript" charset="utf-8"></script>
		<script src="/Public/Admin/img_caijian/js/jquery.photoclip.min.js" type="text/javascript" charset="utf-8"></script>
	<!--图片裁剪——结束-->
	<div class="main-title cf">
		<h2>
			编辑<?php echo (get_document_model($data["model_id"],'title')); ?> [
			<?php if(is_array($rightNav)): $i = 0; $__LIST__ = $rightNav;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$nav): $mod = ($i % 2 );++$i;?><a href="<?php echo U('article/index','cate_id='.$nav['id']);?>"><?php echo ($nav["title"]); ?></a>
			<?php if(count($rightNav) > $i): ?><i class="ca"></i><?php endif; endforeach; endif; else: echo "" ;endif; ?>
			<?php if(isset($article)): ?>：<a href="<?php echo U('article/index','cate_id='.$data['category_id'].'&pid='.$article['id']);?>"><?php echo ($article["title"]); ?></a><?php endif; ?>
			]
		</h2>
	</div>
	<!-- 标签页导航 -->
<div class="tab-wrap">
	<ul class="tab-nav nav">
		<?php $_result=parse_config_attr($model['field_group']);if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$group): $mod = ($i % 2 );++$i;?><li data-tab="tab<?php echo ($key); ?>" <?php if(($key) == "1"): ?>class="current"<?php endif; ?>><a href="javascript:void(0);"><?php echo ($group); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
	</ul>
	<div class="tab-content">
	<!-- 表单 -->
	<form id="form" action="<?php echo U('update');?>" method="post" class="form-horizontal">
		<!-- 基础文档模型 -->
		<?php $_result=parse_config_attr($model['field_group']);if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$group): $mod = ($i % 2 );++$i;?><div id="tab<?php echo ($key); ?>" class="tab-pane <?php if(($key) == "1"): ?>in<?php endif; ?> tab<?php echo ($key); ?>">
            <?php if(is_array($fields[$key])): $i = 0; $__LIST__ = $fields[$key];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$field): $mod = ($i % 2 );++$i; if($field['is_show'] == 1 || $field['is_show'] == 3): ?><div class="form-item cf">
                    <label class="item-label"><?php echo ($field['title']); ?><span class="check-tips"><?php if(!empty($field['remark'])): ?>（<?php echo ($field['remark']); ?>）<?php endif; ?></span></label>
                    <div class="controls">
                        <?php switch($field["type"]): case "num": ?><input type="text" class="text input-mid" name="<?php echo ($field["name"]); ?>" value="<?php echo ($data[$field['name']]); ?>"><?php break;?>
                            <?php case "string": ?><input type="text" class="text input-large" name="<?php echo ($field["name"]); ?>" value="<?php echo ($data[$field['name']]); ?>"><?php break;?>
                            <?php case "textarea": ?><label class="textarea input-large">
                                <textarea name="<?php echo ($field["name"]); ?>"><?php echo ($data[$field['name']]); ?></textarea>
                                </label><?php break;?>
                            <?php case "date": ?><input type="text" name="<?php echo ($field["name"]); ?>" class="text date" value="<?php echo (date('Y-m-d',$data[$field['name']])); ?>" placeholder="请选择日期" /><?php break;?>
                            <?php case "datetime": ?><input type="text" name="<?php echo ($field["name"]); ?>" class="text time" value="<?php echo (time_format($data[$field['name']])); ?>" placeholder="请选择时间" /><?php break;?>
                            <?php case "bool": ?><select name="<?php echo ($field["name"]); ?>">
                                    <?php $_result=parse_field_attr($field['extra']);if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option value="<?php echo ($key); ?>" <?php if(($data[$field['name']]) == $key): ?>selected<?php endif; ?>><?php echo ($vo); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
                                </select><?php break;?>
                            <?php case "select": ?><select name="<?php echo ($field["name"]); ?>">
                                    <?php $_result=parse_field_attr($field['extra']);if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option value="<?php echo ($key); ?>" <?php if(($data[$field['name']]) == $key): ?>selected<?php endif; ?>><?php echo ($vo); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
                                </select><?php break;?>
                            <?php case "radio": $_result=parse_field_attr($field['extra']);if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><label class="radio">
                                    <input type="radio" value="<?php echo ($key); ?>" name="<?php echo ($field["name"]); ?>" <?php if(($data[$field['name']]) == $key): ?>checked="checked"<?php endif; ?>><?php echo ($vo); ?>
                                	</label><?php endforeach; endif; else: echo "" ;endif; break;?>
                            <?php case "checkbox": $_result=parse_field_attr($field['extra']);if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><label class="checkbox">
                                    <input type="checkbox" value="<?php echo ($key); ?>" name="<?php echo ($field["name"]); ?>[]" <?php if(check_document_position2($data[$field['name']],$key)): ?>checked="checked"<?php endif; ?>><?php echo ($vo); ?>
                                	</label><?php endforeach; endif; else: echo "" ;endif; break;?>
                            <?php case "editor": ?><label class="textarea">
                                <textarea name="<?php echo ($field["name"]); ?>"><?php echo ($data[$field['name']]); ?></textarea>
                                <?php echo hook('adminArticleEdit', array('name'=>$field['name'],'value'=>$data[$field['name']]));?>
                                </label><?php break;?>
                            <?php case "picture": ?><div class="controls">
									<input type="file" id="upload_picture_<?php echo ($field["name"]); ?>">
									<input type="hidden" name="<?php echo ($field["name"]); ?>" id="cover_id_<?php echo ($field["name"]); ?>" value="<?php echo ($data[$field['name']]); ?>"/>
									<div class="upload-img-box">
									<?php if(!empty($data[$field['name']])): ?><div class="upload-pre-item"><img src="<?php echo (get_cover($data[$field['name']],'path')); ?>"/></div>
										<a href="javascript:;" onclick="clearImge_<?php echo ($field["name"]); ?>(this)">清除图片</a><?php endif; ?>
									</div>
								</div>
								<script type="text/javascript">
								//上传图片
							    /* 初始化上传插件 */
								$("#upload_picture_<?php echo ($field["name"]); ?>").uploadify({
							        "height"          : 30,
							        "swf"             : "/Public/static/uploadify/uploadify.swf",
							        "fileObjName"     : "download",
							        "buttonText"      : "上传图片",
							        "uploader"        : "<?php echo U('File/uploadPicture',array('session_id'=>session_id()));?>",
							        "width"           : 120,
							        'removeTimeout'	  : 1,
							        'fileTypeExts'	  : '*.jpg; *.png; *.gif;',
							        "onUploadSuccess" : uploadPicture<?php echo ($field["name"]); ?>,
							        'onFallback' : function() {
							            alert('未检测到兼容版本的Flash.');
							        }
							    });
								function uploadPicture<?php echo ($field["name"]); ?>(file, data){
							    	var data = $.parseJSON(data);
							    	var src = '';
							        if(data.status){
							        	$("#cover_id_<?php echo ($field["name"]); ?>").val(data.id);
							        	src = data.url || '' + data.path
							        	$("#cover_id_<?php echo ($field["name"]); ?>").parent().find('.upload-img-box').html(
							        		'<div class="upload-pre-item"><img src="' + src + '"/></div><a href="javascript:;" onclick="clearImge_<?php echo ($field["name"]); ?>(this)">清除图片</a>'
							        	);
							        } else {
							        	updateAlert(data.info);
							        	setTimeout(function(){
							                $('#top-alert').find('button').click();
							                $(that).removeClass('disabled').prop('disabled',false);
							            },1500);
							        }
							    }
								function clearImge_<?php echo ($field["name"]); ?>(obj){
					                $(obj).prev().hide()
					                $(obj).hide();
					                $("#cover_id_<?php echo ($field["name"]); ?>").val('');
					            }
								</script><?php break;?>
                            <?php case "file": $str=explode(',',$data[$field['name']]); $str=array_filter($str); $name=$field['name']; ?>
								<div class="controls">
									<input type="file" id="upload_file_<?php echo ($field["name"]); ?>">
									<?php if(is_array($str)): $i = 0; $__LIST__ = $str;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><input type="hidden" name="<?php echo ($name); ?>[]" value="<?php echo ($vo); ?>" id="file_id_<?php echo ($i); ?>"/><?php endforeach; endif; else: echo "" ;endif; ?>
									<div class="upload-img-box">
										<?php if(isset($data[$field['name']])): if(is_array($str)): $i = 0; $__LIST__ = $str;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="upload-pre-file"><span class="upload_icon_all"></span><?php echo (get_table_field($vo,'id','name','File')); ?></div>
											<a href="javascript:;" data_id="<?php echo ($i); ?>" id="clear_<?php echo ($i); ?>" onclick="clearfile(<?php echo ($i); ?>)">清除附件</a><?php endforeach; endif; else: echo "" ;endif; endif; ?>
									</div>
								</div>
								<script type="text/javascript">
							    /* 初始化上传插件 */
								$("#upload_file_<?php echo ($field["name"]); ?>").uploadify({
							        "height"          : 30,
							        "swf"             : "/Public/static/uploadify/uploadify.swf",
							        "fileObjName"     : "download",
							        "buttonText"      : "上传附件",
							        "uploader"        : "<?php echo U('File/upload',array('session_id'=>session_id()));?>",
							        "width"           : 120,
							        'removeTimeout'	  : 1,
							        "onUploadSuccess" : uploadFile<?php echo ($field["name"]); ?>,
							        'onFallback' : function() {
							            alert('未检测到兼容版本的Flash.');
							        }
							    });
								function uploadFile<?php echo ($field["name"]); ?>(file, data){
									var data = $.parseJSON(data);
							        if(data.status){
							        	var name = "<?php echo ($field["name"]); ?>";
							        	$("#upload_file_file_id-queue").parent().append('<input type="hidden" name="<?php echo ($field["name"]); ?>[]" value="'+data.id+'" id="file_id_<?php echo ($field["name"]); ?>"/>');
							        	
							        	$("#upload_file_file_id-queue").parent().find('.upload-img-box').append(
							        		"<div class=\"upload-pre-file\"><span class=\"upload_icon_all\"></span>" + data.info + "</div>"+'<a href="javascript:;" onclick="clearfile_<?php echo ($field["name"]); ?>(this)">清除附件</a>'
							        	);
							        } else {
							        	updateAlert(data.info);
							        	setTimeout(function(){
							                $('#top-alert').find('button').click();
							                $(that).removeClass('disabled').prop('disabled',false);
							            },1500);
							        }
							    }
								function clearfile(obj){
					                $("#clear_"+obj).prev().hide()
					                $("#clear_"+obj).hide();
					                $("#file_id_"+obj).val('');
					            }
								</script><?php break;?>
                            
                             <!--多图上传开始-->
                            <?php case "duotu": $duotu=explode(',',$data[$field['name']]); ?>
                            	<ul id="img_id"  style=" overflow: hidden;">
                            		<?php if(is_array($duotu)): $i = 0; $__LIST__ = $duotu;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li style="float: left;" >
	                            			<img src="<?php echo (get_cover($vo,'path')); ?>"/>
											<a href="javascript:;" v_id="img_<?php echo ($vo); ?>">清除图片</a>
										</li><?php endforeach; endif; else: echo "" ;endif; ?>
                            	</ul>
                             	<div class="page-container" >
									<div id="uploader" class="wu-example">
										<div class="queueList">
											<div id="dndArea" class="placeholder">
												<div id="filePicker" class="webuploader-container">
													<div class="webuploader-pick">点击选择图片</div>
														<input type="file" name="file" class="webuploader-element-invisible" multiple="multiple" accept="images/*">
														<label style="opacity: 0; width: 100%; height: 100%; display: block; cursor: pointer; background: rgb(255, 255, 255);"></label>
												</div>
												<p>或将照片拖到这里</p>
											</div>
										
										</div>
										<div class="statusBar" style="display:none">
											<div class="progress" style="display: none;">
												<span class="text">0%</span>
												<span class="percentage" style="width: 0%;"></span>
											</div>    
											<div class="info">共0张(0B)，已上传0张</div>
											<div class="btns">
												<div id="filePicker2" class="webuploader-container"><div class="webuploader-pick" id="add">继续添加</div>
													<input type="file" name="file" class="webuploader-element-invisible" multiple="multiple" accept="images/*">
													<label style="opacity: 0; width: 100%; height: 100%; display: block; cursor: pointer; background: rgb(255, 255, 255);"></label>
												</div>
												<div class="uploadBtn state-pedding" >开始上传</div>
											</div>
										</div>
									</div>
									<?php if(is_array($duotu)): $i = 0; $__LIST__ = $duotu;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><input type="hidden" name="lunbo[]" value="<?php echo ($vo); ?>" id="img_<?php echo ($vo); ?>"><?php endforeach; endif; else: echo "" ;endif; ?>
								</div><?php break;?>
                            <!--多图上传结束-->
                            
                            <!--图片裁剪-->
                            <?php case "img_caijian": $chicun=explode(',',$field['remark']); if($chicun[0]>300||$chicun[1]>300) { $width=$chicun[0]/3; $height=$chicun[1]/3; } else { $width=$chicun[0]; $height=$chicun[1]; } ?>
                            	<div class="yc-upload-wrap">
                            		<input type="hidden" name="<?php echo ($field['name']); ?>" value="<?php echo ($data[$field['name']]); ?>" id="clear_id_<?php echo ($field['name']); ?>"/>
                            		<?php if(!empty($data[$field['name']])): ?><div class="upload-pre-item" id="clear_img_<?php echo ($field['name']); ?>">
												<img src="<?php echo (get_cover($data[$field['name']],'path')); ?>" style="width: <?php echo ($width); ?>px;height: <?php echo ($height); ?>px;"/>
											<a href="javascript:;" onclick="clearImges_<?php echo ($field["name"]); ?>(this)">清除图片</a>
											</div><?php endif; ?>
									<div class="yc-upload-box">
										<div class="container">
								        	<div class="row">
										        <div class="col-md-12 col-sm-12 col-xs-12" style="padding:0;">
										        	<div class="ycupload-mainbox">
										        		<div class="ycupload-line"></div>
										        		<div  style="min-height:1px;">
										        			<div class="container">
													        	<div class="row">
															        <div class="col-md-12 col-sm-12 col-xs-12" style="padding-right:0;padding-left:36px;">
															        	<div style="min-height:1px;line-height:160px;text-align:center;position:relative;" ontouchstart="">
															        		<div class="cover-wrap" id="cover-wrap_<?php echo ($field['name']); ?>" style="display:none;position:fixed;left:0;top:0;width:100%;height:100%;background: rgba(0, 0, 0, 0.4);z-index: 10000000;text-align:center;">	
															        			<div class="" style="max-width:100%;margin:100px auto;background-color:#FFFFFF;overflow: hidden;border-radius:4px;">
															        				<div id="clipArea_<?php echo ($field['name']); ?>" style="margin:10px;height: 520px;"></div>
															        				<div class="" style="height:56px;line-height:36px;text-align: center;padding-top:8px;">
															        					<div id="clipBtn_<?php echo ($field['name']); ?>" style="cursor:pointer; width:120px;border-radius: 4px;background-color:#26af60;color: #FFFFFF; margin-left: 300px;">保存封面</div>
															        					<div class="quxiao"  style=" cursor:pointer;width:120px;border-radius: 4px;background-color:#af2652;color: #FFFFFF; margin-left: 500px; margin-top: -35px;">取消</div>
															        				</div>
															        			</div>
															        		</div>
																        	
																        	<div class="" style="width:140px;height:32px;border-radius: 4px;background-color:#26af60;color: #FFFFFF;font-size: 14px;text-align:center;line-height:32px;outline:none;margin-left:-35px;position:relative;">
																        		上传封面图
																        		<input type="file" id="file_<?php echo ($field['name']); ?>" style="cursor:pointer;opacity:0;filter:alpha(opacity=0);width:100%;height:100%;position:absolute;top:0;left:0;">
																        	</div>
																        	<div style="height:10px;"></div>
																        	<div id="view_<?php echo ($field['name']); ?>" style="width: <?php echo ($width); ?>px;height: <?php echo ($height); ?>px; margin-left: -35px; display: none;">
																        		
																        	</div>
															        	</div>
														        	</div>
													        	</div>
												        	</div>
										        		</div>
										        	</div>
										        	
									        	</div>
								        	</div>
							        	</div>
									</div>
								</div>
	    <script type="text/javascript">
	    	 $('.quxiao').click(function()
	    {
	    	$('.cover-wrap').hide();
	    });
	   //清除图片
	    function clearImges_<?php echo ($field["name"]); ?>(obj)
			{
				$(obj).parent().remove();
				$("#clear_id_<?php echo ($field['name']); ?>").val('');
				
			};
		//上传封面
		var clipArea = new bjj.PhotoClip("#clipArea_<?php echo ($field['name']); ?>", {
			size: [<?php echo ($field['remark']); ?>],// 截取框的宽和高组成的数组。默认值为[260,260]
			outputSize: [<?php echo ($field['remark']); ?>], // 输出图像的宽和高组成的数组。默认值为[0,0]，表示输出图像原始大小
			//outputType: "jpg", // 指定输出图片的类型，可选 "jpg" 和 "png" 两种种类型，默认为 "jpg"
			file: "#file_<?php echo ($field['name']); ?>", // 上传图片的<input type="file">控件的选择器或者DOM对象
			view: "#view_<?php echo ($field['name']); ?>", // 显示截取后图像的容器的选择器或者DOM对象
			ok: "#clipBtn_<?php echo ($field['name']); ?>", // 确认截图按钮的选择器或者DOM对象
			loadStart: function() {
				// 开始加载的回调函数。this指向 fileReader 对象，并将正在加载的 file 对象作为参数传入
				$('#cover-wrap_<?php echo ($field['name']); ?>').fadeIn();
				console.log("照片读取中");
			},
			loadComplete: function() {
				 // 加载完成的回调函数。this指向图片对象，并将图片地址作为参数传入
				console.log("照片读取完成");
			},
			//loadError: function(event) {}, // 加载失败的回调函数。this指向 fileReader 对象，并将错误事件的 event 对象作为参数传入
			clipFinish: function(dataURL) {
				
				 // 裁剪完成的回调函数。this指向图片对象，会将裁剪出的图像数据DataURL作为参数传入
				$('#cover-wrap_<?php echo ($field['name']); ?>').fadeOut();
				$('#view').css('background-size','100% 100%');
				var src=dataURL.substring(23);
				$.ajax({
					type:"post",
					url:"<?php echo U('Caijian/index');?>",
					data:{'str':src},
					async:true,
					success:function(msg)
					{
						if('shibai'==msg)
						{
							alert("图片上传失败！");
						}
						if(1<=msg&&!isNaN(msg))
						{
							$("#clear_img_<?php echo ($field['name']); ?>").remove();
							$("#clear_id_<?php echo ($field['name']); ?>").val(msg);
							$("#view_<?php echo ($field['name']); ?>").html('<a href="javascript:;" onclick="clearImges_<?php echo ($field["name"]); ?>(this)">清除图片</a>');
						}
						
					}
				});
				
			}
			
		});
		$(document).ready(function()
		{
			
			$("#clipBtn_<?php echo ($field['name']); ?>").click(function()
			{
				$("#view_<?php echo ($field['name']); ?>").show();
				
			});
		});
		
	    </script><?php break;?>
                            
                            
                            <?php default: ?>
                            <input type="text" class="text input-large" name="<?php echo ($field["name"]); ?>" value="<?php echo ($data[$field['name']]); ?>"><?php endswitch;?>
                    </div>
                </div><?php endif; endforeach; endif; else: echo "" ;endif; ?>
        </div><?php endforeach; endif; else: echo "" ;endif; ?>

		<div class="form-item cf">
			<button class="btn submit-btn ajax-post hidden" id="submit" type="submit" target-form="form-horizontal">确 定</button>
			<a class="btn btn-return" href="<?php echo (cookie('__forward__')); ?>">返 回</a>
			<?php if(C('OPEN_DRAFTBOX') and (ACTION_NAME == 'add' or $data['status'] == 3)): ?><button class="btn save-btn" url="<?php echo U('article/autoSave');?>" target-form="form-horizontal" id="autoSave">
				存草稿
			</button><?php endif; ?>
			<input type="hidden" name="id" value="<?php echo ((isset($data["id"]) && ($data["id"] !== ""))?($data["id"]):''); ?>"/>
			<input type="hidden" name="pid" value="<?php echo ((isset($data["pid"]) && ($data["pid"] !== ""))?($data["pid"]):''); ?>"/>
			<input type="hidden" name="model_id" value="<?php echo ((isset($data["model_id"]) && ($data["model_id"] !== ""))?($data["model_id"]):''); ?>"/>
			<input type="hidden" name="group_id" value="<?php echo ((isset($data["group_id"]) && ($data["group_id"] !== ""))?($data["group_id"]):''); ?>"/>
			<input type="hidden" name="category_id" value="<?php echo ((isset($data["category_id"]) && ($data["category_id"] !== ""))?($data["category_id"]):''); ?>">
		</div>
	</form>
	</div>
</div>

        </div>
        <div class="cont-ft">
            <div class="copyright">
                <div class="fl"><?php echo C('WEB_SITE_TITLE');?></div>
                <div class="fr">V<?php echo (ONETHINK_VERSION); ?></div>
            </div>
        </div>
    </div>
    <!-- /内容区 -->
    <script type="text/javascript">
    (function(){
        var ThinkPHP = window.Think = {
            "ROOT"   : "", //当前网站地址
            "APP"    : "/admin.php?s=", //当前项目地址
            "PUBLIC" : "/Public", //项目公共目录地址
            "DEEP"   : "<?php echo C('URL_PATHINFO_DEPR');?>", //PATHINFO分割符
            "MODEL"  : ["<?php echo C('URL_MODEL');?>", "<?php echo C('URL_CASE_INSENSITIVE');?>", "<?php echo C('URL_HTML_SUFFIX');?>"],
            "VAR"    : ["<?php echo C('VAR_MODULE');?>", "<?php echo C('VAR_CONTROLLER');?>", "<?php echo C('VAR_ACTION');?>"]
        }
    })();
    </script>
    <script type="text/javascript" src="/Public/static/think.js"></script>
    <script type="text/javascript" src="/Public/Admin/js/common.js"></script>
    <script type="text/javascript">
        +function(){
            var $window = $(window), $subnav = $("#subnav"), url;
            $window.resize(function(){
                $("#main").css("min-height", $window.height() - 130);
            }).resize();

            /* 左边菜单高亮 */
            url = window.location.pathname + window.location.search;
            url = url.replace(/(\/(p)\/\d+)|(&p=\d+)|(\/(id)\/\d+)|(&id=\d+)|(\/(group)\/\d+)|(&group=\d+)/, "");
            $subnav.find("a[href='" + url + "']").parent().addClass("current");

            /* 左边菜单显示收起 */
            $("#subnav").on("click", "h3", function(){
                var $this = $(this);
                $this.find(".icon").toggleClass("icon-fold");
                $this.next().slideToggle("fast").siblings(".side-sub-menu:visible").
                      prev("h3").find("i").addClass("icon-fold").end().end().hide();
            });

            $("#subnav h3 a").click(function(e){e.stopPropagation()});

            /* 头部管理员菜单 */
            $(".user-bar").mouseenter(function(){
                var userMenu = $(this).children(".user-menu ");
                userMenu.removeClass("hidden");
                clearTimeout(userMenu.data("timeout"));
            }).mouseleave(function(){
                var userMenu = $(this).children(".user-menu");
                userMenu.data("timeout") && clearTimeout(userMenu.data("timeout"));
                userMenu.data("timeout", setTimeout(function(){userMenu.addClass("hidden")}, 100));
            });

	        /* 表单获取焦点变色 */
	        $("form").on("focus", "input", function(){
		        $(this).addClass('focus');
	        }).on("blur","input",function(){
				        $(this).removeClass('focus');
			        });
		    $("form").on("focus", "textarea", function(){
			    $(this).closest('label').addClass('focus');
		    }).on("blur","textarea",function(){
			    $(this).closest('label').removeClass('focus');
		    });

            // 导航栏超出窗口高度后的模拟滚动条
            var sHeight = $(".sidebar").height();
            var subHeight  = $(".subnav").height();
            var diff = subHeight - sHeight; //250
            var sub = $(".subnav");
            if(diff > 0){
                $(window).mousewheel(function(event, delta){
                    if(delta>0){
                        if(parseInt(sub.css('marginTop'))>-10){
                            sub.css('marginTop','0px');
                        }else{
                            sub.css('marginTop','+='+10);
                        }
                    }else{
                        if(parseInt(sub.css('marginTop'))<'-'+(diff-10)){
                            sub.css('marginTop','-'+(diff-10));
                        }else{
                            sub.css('marginTop','-='+10);
                        }
                    }
                });
            }
        }();
    </script>
    
<link href="/Public/static/datetimepicker/css/datetimepicker.css" rel="stylesheet" type="text/css">
<?php if(C('COLOR_STYLE')=='blue_color') echo '<link href="/Public/static/datetimepicker/css/datetimepicker_blue.css" rel="stylesheet" type="text/css">'; ?>
<link href="/Public/static/datetimepicker/css/dropdown.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/Public/static/datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="/Public/static/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script type="text/javascript">

Think.setValue("type", <?php echo ((isset($data["type"]) && ($data["type"] !== ""))?($data["type"]):'""'); ?>);
Think.setValue("display", <?php echo ((isset($data["display"]) && ($data["display"] !== ""))?($data["display"]):0); ?>);

$('#submit').click(function(){
	$('#form').submit();
});

$(function(){
    $('.date').datetimepicker({
        format: 'yyyy-mm-dd',
        language:"zh-CN",
        minView:2,
        autoclose:true
    });
    $('.time').datetimepicker({
        format: 'yyyy-mm-dd hh:ii',
        language:"zh-CN",
        minView:2,
        autoclose:true
    });
    showTab();

	<?php if(C('OPEN_DRAFTBOX') and (ACTION_NAME == 'add' or $data['status'] == 3)): ?>//保存草稿
	var interval;
	$('#autoSave').click(function(){
        var target_form = $(this).attr('target-form');
        var target = $(this).attr('url')
        var form = $('.'+target_form);
        var query = form.serialize();
        var that = this;

        $(that).addClass('disabled').attr('autocomplete','off').prop('disabled',true);
        $.post(target,query).success(function(data){
            if (data.status==1) {
                updateAlert(data.info ,'alert-success');
                $('input[name=id]').val(data.data.id);
            }else{
                updateAlert(data.info);
            }
            setTimeout(function(){
                $('#top-alert').find('button').click();
                $(that).removeClass('disabled').prop('disabled',false);
            },1500);
        })

        //重新开始定时器
        clearInterval(interval);
        autoSaveDraft();
        return false;
    });

	//Ctrl+S保存草稿
	$('body').keydown(function(e){
		if(e.ctrlKey && e.which == 83){
			$('#autoSave').click();
			return false;
		}
	});

	//每隔一段时间保存草稿
	function autoSaveDraft(){
		interval = setInterval(function(){
			//只有基础信息填写了，才会触发
			var title = $('input[name=title]').val();
			var name = $('input[name=name]').val();
			var des = $('textarea[name=description]').val();
			if(title != '' || name != '' || des != ''){
				$('#autoSave').click();
			}
		}, 1000*parseInt(<?php echo C('DRAFT_AOTOSAVE_INTERVAL');?>));
	}
	autoSaveDraft();<?php endif; ?>

});
</script>

<!--多图-->
<link rel="stylesheet" type="text/css" href="/Public/static/datetimepicker/css/demo.css">
	<link rel="stylesheet" type="text/css" href="/Public/static/datetimepicker/css/webuploader.css">
	<script type="text/javascript" src="/Public/static/datetimepicker/js/webuploader.min.js"></script>
	
	<script type="text/javascript">
	//上传多图
			$('.uploadBtn').click(function()
			{
				var str_data=$('.filelist li').not(".state-complete").find('img').map(function()
				{
					return $(this).attr('src').substring(23);
				}).get().join("#");
				$.ajax({
					type:"post",
					url:"<?php echo U('Duotu/index');?>",
					data:{str:str_data},
					async:true,
					success:function(msg)
					{
						if(msg!='')
						{
							var obj = JSON.parse(msg);
							$.each(obj, function(k,value)
							{
								$(".page-container").append('<input type="hidden" name="lunbo[]"  value="'+value+'"/>');
							});
						}
					}
				});
			});
		
		//继续添加	
			$('#filePicker2').click(function()
			{
				$(".uploadBtn").removeClass('disabled');
			});
		//删除图片
		$('#img_id li a').click(function()
		{
			var v_id=$(this).attr("v_id");
			$(this).parent().remove();
			$("#"+v_id).remove();
			
		})
	
		
	window.webuploader = {
		config:{
			thumbWidth: 335, //缩略图宽度，可省略，默认为110
			thumbHeight: 218, //缩略图高度，可省略，默认为110
			wrapId: 'uploader', //必填
		}

	}
	</script>
	<script src="/Public/static/datetimepicker/js/extend-webuploader.js" type="text/javascript"></script>

</body>
</html>