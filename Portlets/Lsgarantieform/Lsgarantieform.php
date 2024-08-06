<?php declare(strict_types=1);

namespace Plugin\ls_plugin\Portlets\Lsgarantieform; 
use PHPMailer\PHPMailer\PHPMailer;

use JTL\OPC\InputType;
use JTL\OPC\Portlet;
use JTL\OPC\PortletInstance;

/**
 * Class Lsform
 * @package JTL\OPC\Portlets
 */
class Lsgarantieform extends Portlet
{

    /**
     * 
     * @return string
     * 
     */
    public function getButtonHtml(): string{
        return '
        <svg class="svg-icon" style="width: 3em; height: 3em;vertical-align: middle;fill: currentColor;overflow: hidden;" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg">
        <path d="M333.8 603.3h356.3c16 0 28.9-12.9 28.9-28.9 0-16-12.9-28.9-28.9-28.9H333.8c-16 0-28.9 12.9-28.9 28.9 0.1 16.1 13 28.9 28.9 28.9zM333.8 813.7h356.3c16 0 28.9-12.9 28.9-28.9 0-16-12.9-28.9-28.9-28.9H333.8c-16 0-28.9 12.9-28.9 28.9 0.1 16 13 28.9 28.9 28.9zM333.8 393h356.3c16 0 28.9-12.9 28.9-28.9 0-16-12.9-28.9-28.9-28.9H333.8c-16 0-28.9 12.9-28.9 28.9 0.1 16 13 28.9 28.9 28.9zM386.7 182.7h250.5c16 0 28.9-12.9 28.9-28.9 0-16-12.9-28.9-28.9-28.9h-40.3a91.7 91.7 0 0 0 6.4-33.6C603.3 41 562.4 0 512 0s-91.3 41-91.3 91.3c0 11.9 2.3 23.2 6.4 33.6h-40.3c-16 0-28.9 12.9-28.9 28.9s12.9 28.9 28.8 28.9z m72-91.4c0-29.4 23.9-53.3 53.3-53.3s53.3 23.9 53.3 53.3c0 12.7-4.5 24.4-12 33.6h-82.6c-7.5-9.1-12-20.8-12-33.6z" fill="#040000" />
        <path d="M853.3 121h-98.9c-18 0-32.5 14.5-32.5 32.5s14.5 32.5 32.5 32.5h98.9c14.7 0 26.6 11.9 26.6 26.6v719.9c0 14.7-11.9 26.6-26.6 26.6H170.7c-14.7 0-26.6-11.9-26.6-26.6v-720c0-14.7 11.9-26.6 26.6-26.6h98.9c18 0 32.5-14.5 32.5-32.5s-14.5-32.5-32.5-32.5h-98.9c-50.5 0-91.6 41-91.6 91.6v719.9c0 50.5 41 91.6 91.6 91.6h682.7c50.5 0 91.6-41 91.6-91.6V212.5c-0.1-50.6-41.1-91.5-91.7-91.5z" fill="#040000" /></svg>
        <span>Lsgarantieform</span>';
    }

    /**
     * @return array
     */
    public function getPropertyDesc(): array
    {
        $desc = [
            'title'   => [
                'label'   => \__('Title'),
                'type'    => InputType::TEXT,
                'default' => \__(''),
                'desc'=>'some desc about the field', 
                'width'   => 100 
            ],
			'description'   => [
                'label'   => \__('Description'),
                'type'    => InputType::RICHTEXT,
                'default' => \__(''),
                'width'   => 100 
            ],
        ];

        return $desc;
    }

    /**
     * @return array
     */
    public function getPropertyTabs(): array
    {
        return [
            __('Styles')    => 'styles',
            __('Animation') => 'animations',
        ];
    }
}
if(isset($_POST['r_submit'])){ 
$mail = new PHPMailer();
$mail->isSMTP();
$mail->Host = 'w01861c2.kasserver.com';
$mail->SMTPAuth = true;
$mail->Username = 'jaspreet@listandsell.de';
$mail->Password = 'Jaspreet_1234#';
$mail->SMTPSecure = 'tls';
$mail->Port = 587;

$mail->setFrom('jaspreet@listandsell.de', 'Eness');
$mail->addAddress('jaspreet@listandsell.de', 'jaspreet@listandsell.de');
mb_internal_encoding("UTF-8"); 
$mail->Subject = mb_encode_mimeheader('return','UTF-8','Q');
// $mail->Subject = 'Rückrufservice';
// Set HTML
$mail->isHTML(TRUE);
    $rechnungsnummer = $_POST["rechnungsnummer"];
    $firma = $_POST["firma"];
    $firstname = $_POST["firstname"];
    $lastname = $_POST["lastname"];
    $hausnummer = $_POST["hausnummer"];
    $plz = $_POST["plz"];
    $ort = $_POST["ort"];
    $country = $_POST["country"];
    $phone = $_POST["phone"];
    $email = $_POST["email"];
    //$gewährleistungsbedingungen = isset($_POST["gewährleistungsbedingungen"]) ? "Ja" : "Nein";
    //$datenschutzbestimmungen = isset($_POST["datenschutzbestimmungen"]) ? "Ja" : "Nein";

      //  $to = "jaspreet@listandsell.de"; // Replace with the recipient's email address
        //$subject = "New Form Submission";
        //$headers = "From: " . $email;
        
        // Prepare email body
        //$mail->Body = "Name: $firstname \nEmail: $email\n\n Gerätebezeichnung: $gerätebezeichnung\n\n seriennummer:
         //$seriennummer \n\n Hersteller :$manufacturer \n\n fehlerbeschreibung:$fehlerbeschreibung\n\n firma: $firma \n\n firstname:$firstname
        //  \n\n lastname: $lastname \n\n hausnummer:$hausnummer \n\n plz:$plz \n\n ort:$ort \n\n Land :$country
       // \n\n phone:$phone\n\n ";

        $mail->Body = '<html xmlns="http://www.w3.org/1999/xhtml"> <head> <meta http-equiv="Content-Type" content="text/html; "/> <title>Enesse</title> <style type="text/css"> body{margin: 0; padding: 0; min-width: 100% !important; background-color: #f2f2f2;}.my-email-body img{width: 32px;}.content{width: 100%; max-width: 600px; margin: 0 auto; border: 1px solid #f2f2f2;}.btn{padding: 10px; background-color: #fbf1f1; margin: 25px auto; width: 25%; min-width: 200px; color: #000000; display: block; text-align: center;}a{text-decoration: none;}table img{width: 43px;}</style> </head> <body> <div class="content" style="margin-top:20px"> <div style="text-align:center;width: 100%; height: 80px; padding-top: 25px; background-color: #fff; border-bottom: 2px dotted #e8e8e8;"> <div style="width: 100%; margin: 0 auto;"><img style="margin:auto;" src="https://enesse.shop-template.de/media/image/opc/ls/BANYOX - Logo-Teslim-05" alt="Enesse"/></div></div><div style="width: 550px; background-color: #ffffff; padding: 0px 25px 50px; margin-bottom: 0px; color: #000000;"> <br/> <br/>
        <p><b>First Name: </b>'. $firstname .'</p>
        <p><b>Last Name: </b>'. $lastname .'</p>
        <p><b>Email: </b>' . $email .'</p>
        <p><b>Rechnungsnummer: </b>' . $rechnungsnummer . '</p>
        <p><b>Firma: </b>' . $firma . '</p>
        <p><b>Hausnummer: </b>' . $hausnummer . '</p>
        <p><b>PLZ: </b>' . $plz . '</p>
        <p><b>ort: </b>' . $ort . '</p>
        <p><b>country: </b>' . $country . '</p>
        <p><b>phone: </b>' . $phone . '</p>   
        <br/> <br/></div></div></body></html>';
    //$sentMailResult = mail($to, $subject, $emailBody, $headers);
 
    if(!$mail->send()){
        echo 'Message could not be sent.';
        echo 'Mailer Error: ' . $mail->ErrorInfo;
    }
    else{
    echo "<div class='popup-messgae'><div class='ovly'><h3>Email sent successfully</h3> <div class='retrn-crs'><span>×</span>
      </div> </div></div>";
    }
    //header("Refresh: 0");
}
