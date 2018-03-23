<?php
namespace Admin\Controller;
use Admin\Model\AuthGroupModel;
use Think\Page;

/**
 * 后台内容控制器
 * @author huajie <banhuajie@163.com>
 */
class CaijianController extends AdminController
{
	public function index()
	{
		//获取配置地址
		$dizhi="./Uploads/Picture/caijian/";
		$str=$_POST['str'];
		if($str)
		{
			$src=base64_decode($str);
			$file=$dizhi.time().'.png';
			file_put_contents($file,$src);
			$file=substr($file,1);
			$data=array(
				'path'=>$file,
				'create_time'=>time(),
				'status' => 1
			);
			$pictur=M('picture')->add($data);
			$data=$pictur;
		}
		else
		{
			$data='shibai';
		}
		echo $data;
		
	}
}