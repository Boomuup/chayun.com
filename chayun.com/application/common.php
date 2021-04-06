<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件
use phpmailer\PHPMailer;
/**
 * 9000 success
 * 9001 参数不存在，非法参数
 * 9002 数据请求失败
 * 9003 权限不够
 * @param $code
 * @param string $url
 */
function returnJson($code,$msg='',$url='')
{
    return ['code'=>$code,'msg'=>$msg,'url'=>$url];
}


function sendemail($email,$title,$content,$username)
{
    $mail = new PHPMailer();

    $mail->isSMTP();// 使用SMTP服务
    $mail->CharSet = "utf8";// 编码格式为utf8，不设置编码的话，中文会出现乱码
    $mail->Host = "smtp.126.com";// 发送方的SMTP服务器地址
    $mail->SMTPAuth = true;// 是否使用身份验证
    $mail->Username = "ahua0710@126.com";//发送方的qq邮箱用户名，就是你申请qq的SMTP服务使用的qq邮箱
    $mail->Password = "VOAMKHEHHSIOYBDC";//发送方的邮箱密码，注意用qq邮箱这里填写的是“客户端授权密码”而不是邮箱的登录密码
    $mail->SMTPSecure = "ssl";//使用ssl协议方式
    $mail->Port = 465;// qq邮箱的ssl协议方式端口号是465/587

    $mail->setFrom("ahua0710@126.com","茶韵商城官方网站");// 设置发件人信息，如邮件格式说明中的发件人，这里会显示为Mailer(xxxx@qq.com），Mailer是当做名字显示
    $mail->addAddress($email,$username);// 设置收件人信息，如邮件格式说明中的收件人，这里会显示为Liang(yyyy@qq.com)
    $mail->addReplyTo("ahua0710@126.com","Reply");// 设置回复人信息，指的是收件人收到邮件后，如果要回复，回复邮件将发送到的邮箱地址
    //$mail->addCC("xxx@qq.com");// 设置邮件抄送人，可以只写地址，上述的设置也可以只写地址(这个人也能收到邮件)
    //$mail->addBCC("xxx@qq.com");// 设置秘密抄送人(这个人也能收到邮件)
    //$mail->addAttachment("bug0.jpg");// 添加附件
    $mail->isHTML(true);
    $mail->Subject = $title;// 邮件标题
    $mail->Body = $content;// 邮件正文
    //$mail->AltBody = "This is the plain text纯文本";// 这个是设置纯文本方式显示的正文内容，如果不支持Html方式，就会用到这个，基本无用

    if(!$mail->send()){// 发送邮件
        return $mail->ErrorInfo;// 输出错误信息

    }else{
        return 1;
    }
}