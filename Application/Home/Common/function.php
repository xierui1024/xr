<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

/**
 * 前台公共库文件
 * 主要定义前台公共函数库
 */

/**
 * 检测验证码
 * @param  integer $id 验证码ID
 * @return boolean     检测结果
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
function check_verify($code, $id = 1){
	$verify = new \Think\Verify();
	return $verify->check($code, $id);
}

/*
 * 
 * 文档读取
 * $table 表名称
 * $category_id 栏目名称
 * $num 读取文档数量
 * */
 function parse_field_attr($string) {
    if(0 === strpos($string,':')){
        // 采用函数定义
        return   eval('return '.substr($string,1).';');
    }elseif(0 === strpos($string,'[')){
        // 支持读取配置参数（必须是数组类型）
        return C(substr($string,1,-1));
    }
    
    $array = preg_split('/[,;\r\n]+/', trim($string, ",;\r\n"));
    if(strpos($string,':')){
        $value  =   array();
        foreach ($array as $val) {
            list($k, $v) = explode(':', $val);
            $value[$k]   = $v;
        }
    }else{
        $value  =   $array;
    }
    return $value;
}
 
function document_article($table,$category_id,$num=6)
{
	$list=M('document as a')->join("$table as b")
			->where("a.id=b.id and a.status=1 and a.category_id='{$category_id}'")
			->order('a.level desc, a.update_time desc')->limit($num)
			->select();
	 return $list;	
}
/**
 * 获取列表总行数
 * @param  string  $category 分类ID
 * @param  integer $status   数据状态
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
function get_list_count($category, $status = 1){
    static $count;
    if(!isset($count[$category])){
        $count[$category] = D('Document')->listCount($category, $status);
    }
    return $count[$category];
}

/**
 * 获取段落总数
 * @param  string $id 文档ID
 * @return integer    段落总数
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
function get_part_count($id){
    static $count;
    if(!isset($count[$id])){
        $count[$id] = D('Document')->partCount($id);
    }
    return $count[$id];
}

/**
 * 获取导航URL
 * @param  string $url 导航URL
 * @return string      解析或的url
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
function get_nav_url($url){
    switch ($url) {
        case 'http://' === substr($url, 0, 7):
        case 'https://' === substr($url, 0, 8):
			case '#' === substr($url, 0, 1):
            break;        
        default:
            $url = U($url);
            break;
    }
    return $url;
}

function get_category_url($id)
{
    $name = get_category($id, 'name');
    $link = get_category($id, 'url');
    return !empty($link) ? $link : U('Article/lists?category='.$name);
}

function get_category_detail($id)
{
    $name = get_category($id, 'name');
    return U('Article/lists?category='.$name.'&isdetail=1');
}

//面包屑
function get_parent_category($cid)
{
    if(empty($cid))
    {
        return false;
    }
    $cates  =   M('Category')->where(array('status'=>1))->field('id,title,pid')->order('sort')->select();
    $child  =   get_category($cid); //获取参数分类的信息
    $pid    =   $child['pid'];
    $temp   =   array();
    $res[]  =   $child;
    while(true)
    {
        foreach ($cates as $key=>$cate)
        {
            if($cate['id'] == $pid)
            {
                $pid = $cate['pid'];
                array_unshift($res, $cate); //将父分类插入到数组第一个元素前
            }
        }
        if($pid == 0)
        {
            break;
        }
    }
    return $res;
}

/*预览文件*/
function yulan($id=null)
{
	if(empty($id) || !is_numeric($id)){
		$this->error('参数错误！');
	}
	$file=M('document_download as a')->join('hxz_file as b')->where("a.file_id=b.id and a.id='{$id}'")->find();
	$url='__ROOT__/Uploads/Download/'.$file['savepath'].'/'.$file['savename'];
	return $url;
}
	
function get_p_category($cid)
{
    if(empty($cid))
    {
        return false;
    }
    $cates  =   M('Category')->where(array('status'=>1))->field('id,title,pid')->order('sort')->select();
    $child  =   get_category($cid); //获取参数分类的信息
    $pid    =   $child['pid'];
    $temp   =   array();
    $res[]  =   $child;
    while(true){
        foreach ($cates as $key=>$cate){
            if($cate['id'] == $pid){
                $pid = $cate['pid'];
                array_unshift($res, $cate); //将父分类插入到数组第一个元素前
            }
        }
        if($pid == 0){
            break;
        }
    }
    return $res[0]['id'];
}