<?php
namespace Admin\Controller;
use Admin\Model\AuthGroupModel;
use Think\Page;

/**
 * 后台内容控制器
 * @author huajie <banhuajie@163.com>
 */
class DuotuController extends AdminController
{
	public function index()
	{
		//获取配置地址
		$dizhi="./Uploads/Picture/duotu/";
		$str=$_POST['str'];
		$arr=explode('#', $str);
		$array=array();
		//多图片转码
		$id_list=array();
		foreach($arr as $key=>$v)
		{
			$array[$key]=base64_decode($v);
			$file=$dizhi.time().$key.'.png';
			file_put_contents($file,$array[$key]);
			//存入picture表
			$file=substr($file,1);
			$data=array(
				'path'=>$file,
				'create_time'=>time(),
				'status' => 1
			);
			$pictur=M('picture')->add($data);
			$id_list[]=$pictur;
		}
			$id_list=json_encode($id_list);
		echo $id_list;
	}
}