<?php
namespace app\admin\controller;

use app\admin\model\Video as VideoModel;

/**
 * 文章管理
 * Class Article
 * @package app\admin\controller
 */
class Video extends AdminBase
{
    protected $video_model;
   

    protected function _initialize()
    {
        parent::_initialize();
        $this->video_model  = new VideoModel();
        
       
    }

    /**
     * 文章管理
     * @param int    $cid     分类ID
     * @param string $keyword 关键词
     * @param int    $page
     * @return mixed
     */
    public function index($v_sel,$page = 1)
    {
        $video_list  = $this->video_model->where('v_sel',$v_sel)->order(['v_datetime' => 'desc'])->paginate(15, false, ['page' => $page]);
        return $this->fetch('index', compact('video_list','v_sel'));
    }

    /**
     * 添加文章
     * @return mixed
     */
    public function add($v_sel)
    {
        return $this->fetch('',compact('v_sel'));
    }

    /**
     * 保存文章
     */
    public function save()
    {
        if ($this->request->isPost()) {
            $data["v_title"]=$_POST['v_title'];
            $data["v_pic"]=$_POST['thumb'];
            $data["v_text"]=$_POST['v_text'];
            $data["v_text1"]=$_POST['v_text1'];
            $data["v_money"]=$_POST['v_money'];
            $data["v_time"]=$_POST['v_time'];
            $data["v_score"]=$_POST['v_score'];
            $data["v_sel"]=$_POST['v_sel'];
            $data["v_lx"]=$_POST['v_lx'];
            $data["v_datetime"]=$_POST['v_datetime'];
            if (!empty($_FILES)) {
				//如果有文件上传 上传附件
                $this->_upload();
                $data["v_href"]=$_POST['v_href'];
            }

            $validate_result = $this->validate($data, 'Video');
            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                if ($this->video_model->allowField(true)->save($data)) {
                    $this->success('保存成功');
                } else {
                    $this->error('保存失败');
                }
            }
        }
    }

    /**
     * 编辑文章
     * @param $id
     * @return mixed
     */
    public function edit($v_id,$v_sel){
        $video = $this->video_model->find($v_id);
        return $this->fetch('edit', compact('video','v_sel'));
    }

    /**
     * 更新文章
     * @param $id
     */
    public function update($v_id)
    {
        if ($this->request->isPost()) {
            $data["v_title"]=$_POST['v_title'];
            $data["v_pic"]=$_POST['thumb'];
            $data["v_text"]=$_POST['v_text'];
            $data["v_text1"]=$_POST['v_text1'];
            $data["v_money"]=$_POST['v_money'];
            $data["v_time"]=$_POST['v_time'];
            $data["v_score"]=$_POST['v_score'];
            $data["v_sel"]=$_POST['v_sel'];
            $data["v_lx"]=$_POST['v_lx'];
            $data["v_datetime"]=$_POST['v_datetime'];
            if($_FILES["video"]["name"]<>""){
                if (!empty($_FILES)) {
                    //如果有文件上传 上传附件
                    $this->_upload();
                }

                /*$videoResult = Db::query('select * from byc_video where v_id=:v_id',['v_id'=>$v_id]);
                $aaa=$videoResult[0]["v_href"];
                if($aaa<>""){
                    unlink("/public".$aaa);  
                }*/
                $data["v_href"]=$_POST["v_href"];	
            }else{
                $data["v_href"]=$_POST["v_hrefa"];
            }
            $validate_result = $this->validate($data, 'Video');
            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                if ($this->video_model->save($data, ['v_id' => $v_id]) !== false) {
                    $this->success('更新成功');
                } else {
                    $this->error('更新失败');
                }
            }
        }
    }

    /**
     * 删除文章
     * @param int   $id
     * @param array $ids
     */
    public function delete($v_id = 0, $ids = [])
    {
        $v_id = $ids ? $ids : $v_id;
        if ($v_id) {
            if ($this->video_model->destroy($v_id)) {
                $this->success('删除成功');
            } else {
                $this->error('删除失败');
            }
        } else {
            $this->error('请选择需要删除的视频');
        }
    }

    //文件上传
	public function _upload(){
        $file = request()->file('video');
        // 移动到框架应用根目录/public/uploads/ 目录下
        $info = $file->validate(['size'=>9000000000,'ext'=>'flv,mp4'])->move(ROOT_PATH . 'public' . DS . 'uploads');
        if($info){
            $_POST['v_href'] = "/uploads/".date("Ymd")."/".$info->getFilename(); 
        }else{
            // 上传失败获取错误信息
            echo $file->getError();
        }
    }
}