<?php
/**
 * Created by PhpStorm.
 * User: #
 * Date: 2021/3/10
 * Time: 22:15
 */
namespace app\common\util;

use think\facade\Env;
use phpmailer\phpmailer;

class Sendemail
{
    public static function sendEmail($email=0,$content=0) {
        include Env::get('root_path').'vendor/phpmailer/PHPMailer.php';
        include Env::get('root_path').'vendor/phpmailer/SMPT.php';

        date_default_timezone_set('PRC');//set time
//Create a new PHPMailer instance
        $mail = new PHPMailer;
//Tell PHPMailer to use SMTP
        $mail->isSMTP();
//Enable SMTP debugging
// 0 = off (for production use)
// 1 = client messages
// 2 = client and server messages
        $mail->SMTPDebug = 2;
//Ask for HTML-friendly debug output
        $mail->Debugoutput = 'html';
//Set the hostname of the mail server
        $mail->Host = "smtp.126.com";
//Set the SMTP port number - likely to be 25, 465 or 587
        $mail->Port = 465;
//Whether to use SMTP authentication
        $mail->SMTPAuth = true;
//Username to use for SMTP authentication
        $mail->Username = "Ahua0710@126.com";
//Password to use for SMTP authentication
        $mail->Password = "MRHUYGKMEVOTXBJV";
//Set who the message is to be sent from
        $mail->setFrom('Ahua0710@126.com', 'First send');
//Set an alternative reply-to address
//$mail->addReplyTo('replyto@example.com', 'First Last');
//Set who the message is to be sent to
        $mail->addAddress('mml1015@163.com', 'Cjh');
//Set the subject line
        $mail->Subject = 'PHPMailer SMTP test from jianhua';
//Read an HTML message body from an external file, convert referenced images to embedded,
//convert HTML into a basic plain-text alternative body
        $mail->msgHTML("这是一个建桦的邮件测试");
//Replace the plain text body with one created manually
//$mail->AltBody = 'This is a plain-text message body';
//Attach an image file
//$mail->addAttachment('images/phpmailer_mini.png');

//send the message, check for errors
        if (!$mail->send()) {
            return $mail->ErrorInfo;
            //echo "Mailer Error: " . $mail->ErrorInfo;
        } else {
            return "email success";
        }

    }
}