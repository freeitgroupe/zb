<?php
defined("CATALOG") or die("Access denied");
$message= "<table cellpadding='0' cellspacing='0' border='0' width='100%'>
    <tr>
        <td valign='top' align='center' id='top' class='outer' bgcolor='#3d4852' background='images/bg_body.gif'>
            <table class='texttopbottom' cellpadding='0' cellspacing='0' align='center' width='600'>
                <tr>
                    <td valign='top'><img src='images/blank.gif' width='1' height='8' alt='' /></td>
                </tr>
                <tr>
                    <td align='center' valign='top' colspan='3' style='font-family: Verdana, Arial, sans-serif; color: #8d9ca4;font-size: 10px;margin: 0;'>
                        <p>You are receiving this newsletter because ...</p>
                        <p>Having trouble reading this email? <webversion>View it in your browser</webversion>. <unsubscribe>Unsubscribe Instantly</unsubscribe>.</p>
                    </td>
                </tr>
                <tr>
                    <td style='background: url('images/bg_top.png') no-repeat;'><img src='images/blank.gif' width='1' height='12' alt='' /></td>
                </tr>
            </table>
            
            <table cellpadding='0' cellspacing='0' align='center' width='600' style='background: url('images/bg_email_singlecol.png') repeat-y;'>
                <tr>
                    <td rowspan='4' valign='top'><img src='images/blank.gif' width='15' height='1' alt='' /></td>
                    <td rowspan='4' valign='top'><img src='images/header_strip.gif' alt='''' width='20' height='249' /></td>
                    <td rowspan='3' valign='top'><img src='images/header_l.gif' alt='''' width='405' height='184' /></td>
                    <td bgcolor='#fbfdfd' colspan='2' width='100' height='26'><img src='images/blank.gif' width='100' height='26' alt='' /></td>
                    <td rowspan='4' valign='top'><img src='images/header_r.gif' alt='''' width='45' height='249' /></td>
                    <td rowspan='4' valign='top'><img src='images/blank.gif' width='15' height='1' alt='' />
                    </td>
                </tr>
                <tr>
                    <td valign='top'><img src='images/header_mbsbg.gif' width='16' height='79' alt=''' /></td>
                    <td valign='top' width='84' align='left' class='date' height='79'>
                        <p class='month'><currentmonthname></p>
                        <p class='year'><currentyear></p>
                    </td>
                </tr>
                <tr>
                    <td colspan='2'><img src='images/header_m.gif' alt='''' width='100' height='79' /></td>
                </tr>
                <tr>
                    <td style='background: url(images/bg_title.gif) no-repeat;' background='images/bg_title.gif' valign='bottom' colspan='3' height='65' align='left'>
                        <h1>
                            ABC WIDGETS.
                        </h1>
                    </td>
                </tr>


                <tr>
                    <td colspan='7' align='left' valign='top'>
                        <table cellpadding='0' cellspacing='0' width='600' align='left'>
                            <tr>
                                <td colspan='2'><img src='images/topbot_singlecol.gif' width='600' height='14' alt='''' /></td>
                            </tr>
                            <tr>
                                <td valign='top' width='600'>
                                    <repeater>
                                        <table cellpadding='0' cellspacing='0' width='600' class='whitecol'>
                                            <tr>
                                                <td valign='top' width='15' rowspan='3'><img src='images/title_rightsinglecol_blue1.gif' alt='' width='15' height='56' /></td>
                                                <td bgcolor='#eaf4f7' valign='top' width='21' rowspan='3'><img src='images/title_blue2.gif' alt='' width='21' height='56' /></td>
                                                <td bgcolor='#eaf4f7'><img src='images/blank.gif' alt='' width='1' height='20' /></td>
                                                <td bgcolor='#eaf4f7' rowspan='4'><img src='images/blank.gif' alt='' width='20' height='1' /></td>
                                                <td rowspan='4'><img src='images/blank.gif' alt='' width='15' height='1' /></td>
                                            </tr>
                                            <tr>
                                                <td bgcolor='#eaf4f7' valign='top' width='529'><h2>A small river named Duden flows by their place and supplies</h2></td>
                                            </tr>
                                            <tr>
                                                <td bgcolor='#eaf4f7' valign='top' class='border'>
                                                    <p>A wonderful serenity has taken <a href=''#'>possession</a> of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart. I am alone, and feel the charm of existence in this spot, which was created for the bliss of souls like mine.</p><ul><li>Bullet Point 1</li></ul>

                                                   
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign='top' width='15'>&nbsp;</td>
                                                <td bgcolor='#eaf4f7' colspan='2' valign='top' align='right' class='backtotop'><a href='#top'>Back to top</a></td>
                                            </tr>
                                        </table>
                                    </repeater>
                                </td>
                            </tr>
                            <tr>
                                <td colspan='2'><img src='images/topbot_singlecol.gif' width='600' height='10' alt='' /></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <table class='texttopbottom' cellpadding='0' cellspacing='0' align='center' width='600'>
                <tr>
                    
                </tr>
                <tr>
                    <td rowspan='2'><img src='images/blank.gif' width='15' height='1' alt='' /></td>
                    <td valign='top' align='center' style='font-family: Verdana, Arial, sans-serif; color: #8d9ca4;font-size: 10px;margin: 0;'>
                        <p>
                            Do you know someone who might be interested in receiving this monthly newsletter?
                            <forwardtoafriend>Forward this email to a friend</forwardtoafriend>.
                        </p>
                        <p>
                            Not interested anymore?  <unsubscribe>Unsubscribe Instantly</unsubscribe>.
                        </p>
                    </td>
                    <td rowspan='2'><img src='images/blank.gif' width='15' height='1' alt='' /></td>
                </tr>
                <tr>
                    <td><img src='images/blank.gif' width='570' height='8' alt='' /></td>
                </tr>
            </table>
        </td>
    </tr>
</table>"

?>