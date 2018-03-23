<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Home\Controller;
use OT\DataDictionary;

/**
 * 前台首页控制器
 * 主要获取首页聚合数据
 */
class IndexController extends HomeController {

	//系统首页
    public function index()
    {

        $category = D('Category')->getTree();
        $lists    = D('Document')->lists(null);
        $this->assign('category',$category);//栏目
        $this->assign('lists',$lists);//列表
        $this->assign('page',D('Document')->page);//分页
        $this->display();
    }
	//案例
	public function ajax($p = 1)
	{
		$id=I('id');
		if(!empty($id)&&!is_nan($id))
		{
			$list=M('document as a')->join("modao_document_anli as b")
			->where("a.id=b.id and a.status=1 and a.category_id=53 and b.leixing like '%{$id}%'")
			->page($p,9)
			->order('a.level desc, a.update_time desc')
			->select();
			if(!empty($list)&&is_array($list))
			{
				$count      =M('document as a')->join("modao_document_anli as b")
								->where("a.id=b.id and a.status=1 and a.category_id=53 and b.leixing like '%{$id}%'")
								->count();
				$Page       = new \Think\Page($count,9);// 实例化分页类 传入总记录数和每页显示的记录数
				$show       = $Page->show();// 分页显示输出
				$this->assign('page',$show);// 赋值分页输出
				$this->assign('id',$id);
				$this->assign('list',$list);
				$this->display();
			}
			else
			{
				$this->redirect('Index/index');
			}
		}
		else
		{
			$this->redirect('Index/index');
		}
	}
	
	public function biaodan()
	{
		if(IS_POST)
		{
			$data=$_POST;
			if(empty($data['name'])||empty($data['phone'])||empty($data['xuqiu']))
			{
				$data='sb';
			}
			else
			{
				//存入文档表
				$array_1=array
				(
					'title'=>$data['name'],
					'description'=>$data['xuqiu'],
					'update_time'=>time(),
					'category_id'=>51,
					'model_id'=>16
				);
				$add=M('document')->add($array_1);
				
				if($add)
				{
					//存入附表
					$array_2=array
					(
						'phone'=>$data['phone'],
						'id'=>$add
					);
					M('document_xuqiu')->add($array_2);
					$data='success';
				}
				else
				{
					$data='wz';
				}
			}
		}
		else
		{
			$data='wz';
			$this->redirect('Index/index');
		}
		echo $data;
	}

	//关于我们
	public function aboutus(){
		$id=I('id');
		if(!empty($id)&&!is_nan($id))
		{
            $newrow=M('document_aboutus')->where("id=$id")->find();
				$this->assign('id',$id);
				$this->assign('newrow',$newrow);
				$this->display();
		}
		else
		{
			$this->redirect('Index/index');
		}
	}

    //典型案例
    public function classic($p = 1)
    {
        $id=I('id');
        if(!empty($id)&&!is_nan($id))
        {
            $list=M('document_classic as a')
                ->join("modao_picture as b on b.id=a.img")
                ->join("modao_document as c on c.id=a.id")
                ->where("a.c_type=$id and c.status=1")
                ->page($p,9)
                ->select();
            if(!empty($list)&&is_array($list))
            {
                $count      =M('document_classic as a')
                    ->join("modao_picture as b on b.id=a.img")
                    ->join("modao_document as c on c.id=a.id")
                    ->where("a.c_type=$id and c.status=1")
                    ->count();
                $Page       = new \Think\Page($count,9);// 实例化分页类 传入总记录数和每页显示的记录数
                $show       = $Page->show();// 分页显示输出
                $this->assign('page',$show);// 赋值分页输出
                $this->assign('id',$id);
                $this->assign('list',$list);
                print
                $this->display();
            }
            else
            {
                $this->redirect('Index/classic/id/'.'1');
            }
        }
        else
        {
            $this->redirect('Index/classic/id/'.'1');
        }
    }

    //首页文章
    public function aritcle($p = 1)
    {
        $id=I('id');
        $list=M('document_solution_tent as a')
                ->join('modao_document as b on b.id=a.id')
                ->where("a.n_type=$id and b.status=1")
                ->field('a.*,b.create_time')
                ->order('a.id desc')
                ->limit(4)
                ->select();
        foreach($list as &$v){
            $v['ym'] = date('Y-m',$v['create_time']);
            $v['d'] = date('d',$v['create_time']);
        }
        $this->ajaxReturn($list,'json');
    }

    //关于我们
    public function abouttype(){
        $id=I('id');
        $row=M('document_aboutus as a')
            ->join('modao_document as b on b.id=a.id')
            ->where("b.status=1 and a.id=$id")
            ->find();
        $this->ajaxReturn($row,'json');
    }

}