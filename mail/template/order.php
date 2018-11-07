<?php defined("CATALOG") or die("Access denied");?>
<?php $message ="
<div class='table-responsive'>
    <table width=\"100%\" bgcolor=\"#2a2a2a\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" id=\"backgroundTable\" st-sortable=\"header\">
   <tbody>
      <tr>
         <td>
            <table width=\"600\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" align=\"center\" class=\"devicewidth\">
               <tbody>
                  <tr>
                     <td width=\"100%\">
                        <table bgcolor=\"#d41b29\" width=\"600\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" align=\"center\" class=\"devicewidth\">
                           <tbody>
                              <!-- Spacing -->
                              <tr>
                                 <td height=\"5\" style=\"font-size:1px; line-height:1px; mso-line-height-rule: exactly;\">&nbsp;</td>
                              </tr>
                              <!-- Spacing -->
                              <tr>
                                 <td>
                                    <!-- logo -->
                                    <table width=\"140\" align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"devicewidth\">
                                       <tbody>
                                          <tr>
                                             <td width=\"140\" height=\"60\" align=\"center\">
                                                <div class=\"imgpop\">
                                                   <a target=\"_blank\" href=\"#\">
                                                   <img src='".PATH."img/logo.png' alt=\"\" border=\"0\" width=\"118\" height=\"60\" style=\"display:block; border:none; outline:none; text-decoration:none;\">
                                                   </a>
                                                </div>
                                             </td>
                                          </tr>
                                       </tbody>
                                    </table>
                                    <!-- end of logo -->
                                    <!-- start of menu -->
                                    <table width=\"250\" border=\"0\" align=\"right\" valign=\"middle\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" class=\"devicewidth\">
                                       <tbody>
                                          <tr>
                                             <td align=\"center\" style=\"font-family: Helvetica, arial, sans-serif; font-size: 20px;color: #ffffff\" st-content=\"phone\"  height=\"60\">
                                               Phone : +1 123-456-6789
                                             </td>
                                          </tr>
                                       </tbody>
                                    </table>
                                    <!-- end of menu -->
                                 </td>
                              </tr>
                              <!-- Spacing -->
                              <tr>
                                 <td height=\"5\" style=\"font-size:1px; line-height:1px; mso-line-height-rule: exactly;\">&nbsp;</td>
                              </tr>
                              <!-- Spacing -->
                           </tbody>
                        </table>
                     </td>
                  </tr>
               </tbody>
            </table>
         </td>
      </tr>
   </tbody>
</table>
<table width=\"100%\" bgcolor=\"#2a2a2a\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" id=\"backgroundTable\" st-sortable=\"banner\">
   <tbody>
      <tr>
         <td>
            <table width=\"600\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" align=\"center\" class=\"devicewidth\">
               <tbody>
                  <tr>
                     <td width=\"100%\">
                        <table width=\"600\" align=\"center\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" class=\"devicewidth\">
                           <tbody>
                              <tr>
                                 <!-- start of image -->
                                 <td align=\"center\" st-image=\"banner-image\">
                                    <div class=\"imgpop\">
                                       <a target=\"_blank\" href=\"#\"><img width=\"600\" border=\"0\" height=\"300\" alt=\"\" border=\"0\" style=\"display:block; border:none; outline:none; text-decoration:none;\" src=\"".PATH."img/banner_test.jpg\" class=\"banner\"></a>
                                    </div>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                        <!-- end of image -->
                     </td>
                  </tr>
               </tbody>
            </table>
         </td>
      </tr>
   </tbody>
</table>
    <table style='width: 100%; border: 1px solid #ddd; border-collapse: collapse;'>
        <thead>
        <tr style='background: #f9f9f9;'>
            <th style='padding: 8px; border: 1px solid #ddd;'>Product name</th>
            <th style='padding: 8px; border: 1px solid #ddd;'>Count</th>
            <th style='padding: 8px; border: 1px solid #ddd;'>Price</th>
            <th style='padding: 8px; border: 1px solid #ddd;'>Amount</th>
        </tr>
        </thead>
        <tbody>";
           for($i=0, $list = count($order_list); $i < $list; $i++ ){         
            
                $message .="
                <tr>
                <td style='padding: 8px; border: 1px solid #ddd;'><a href=".PATH."product/".$order_list[$i]['cart_id_product'].">".$order_list[$i]['title']."</a></td>
                <td style='padding: 8px; border: 1px solid #ddd;'>".$order_list[$i]['cart_count']."</td>
                <td style='padding: 8px; border: 1px solid #ddd;'>".$order_list[$i]['cart_price']."</td>
                <td style='padding: 8px; border: 1px solid #ddd;'>".$order_list[$i]['cart_count'] * $order_list[$i]['cart_price']."</td>
            </tr>";
        }
                $message .="
            <tr>
            <td colspan='3' style='padding: 8px; border: 1px solid #ddd;'>Total: </td>
            <td style='padding: 8px; border: 1px solid #ddd;'>".$total_qty_order_old."</td>
        </tr>
        <tr>
            <td colspan='3' style='padding: 8px; border: 1px solid #ddd;'>Total amount: </td>
            <td style='padding: 8px; border: 1px solid #ddd;'>".$total_sum_order_old."</td>
        </tr>
        </tbody>
    </table>
</div>";