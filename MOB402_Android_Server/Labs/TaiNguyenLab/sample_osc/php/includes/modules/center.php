<?php
/*
  $Id: new_products.php,v 1.34 2003/06/09 22:49:58 hpdl Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Released under the GNU General Public License
*/
?>
<!-- new_products //-->
<?php
    $info_box_contents = array();
	$info_box_contents[] = array('align' => 'center',
                                           'params' => 'class="smallText" cellspacing="0" valign="top"',
                                           'text' => '<table><tr>
<td height="157" valign="top" background="'.DIR_WS_IMAGES . 'theme/comp.jpg" style="background-repeat:no-repeat "><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="34%" height="64">&nbsp;</td>
                  <td width="66%" valign="bottom"><img src="'.DIR_WS_IMAGES . 'theme/a1.gif" width="192" height="58"></td>
                </tr>
              </table>
                <table width="100%" height="47"  border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="46%">&nbsp;</td>
                    <td width="54%" class="boxText"><img src="'.DIR_WS_IMAGES . 'theme/sd.jpg" width="5" height="7">&nbsp;Powered by Intel&#1042;&reg; Pentium&#1042;&reg; 4<br>                      <br>
                      <img src="'.DIR_WS_IMAGES . 'theme/spacer.gif" width="1" height="1"><em><img src="'.DIR_WS_IMAGES . 'theme/spacer.gif" width="1" height="1"></em>&nbsp;&nbsp;processor 2.80 GHz</td>
                  </tr>
                </table>
                <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="48%" height="38">&nbsp;</td>
                    <td width="52%" valign="bottom" class="boxText"><strong><a href="#" style="color:#484848; text-decoration:none ">Starting at $ 1,999.99</a></strong></td>
                  </tr>
                </table></td></tr></table>
');
  new contentBox($info_box_contents);
?>
<!-- new_products_eof //-->