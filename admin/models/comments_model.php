<?php
defined("CATALOG") or die("Access denied");

function get_comments_admin(){
  $res = Model_Driver::get_instance()->select(['*'],'comments');
  if(!$res){return ['res'=>false, 'mess'=>'Err select comments!'];}
  $new_arr=[];
  $arr_res = [];
  foreach ($res as $key=>$value){
      if(is_array($value)){
          foreach ($value as $k=>$v){
              if($k=='approved'){
                  if($v==0){
                      $new_arr[$k]='wait';
                  }
                  if($v==1){
                      $new_arr[$k]='public';
                  }
                  if($v==2){
                      $new_arr[$k]='spam';
                  }
                  if($v==3){
                      $new_arr[$k]='deleted';
                  }
              }else{
                  $new_arr[$k]=$v;
              }
          }
          $arr_res[$key]=$new_arr;
      }
  }
  return ['res'=>$arr_res];
}