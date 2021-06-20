<?php
/*
  $Id: index.php,v 1.3 2003/07/08 16:56:04 dgw_ Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Released under the GNU General Public License
*/

define('TEXT_MAIN', '<table width="100%" bgcolor="#F4F4F4" border="0" cellspacing="0" cellpadding="0" align="right" style="border:1px solid #CFCFCF">
                <tr><td width="100%" height="131" valign="top" background="'.DIR_WS_IMAGES . 'theme/banner1.jpg" style="background-repeat:no-repeat;background-position:right "><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="19%" height="92">&nbsp;</td>
                  <td width="95%" valign="bottom"><span class="boxText">Limited time Deals on PC’s<br> 
                    Servers and more!</span></td>
                </tr>
              </table>
                <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19%" height="23">&nbsp;</td>
                    <td width="92%" valign="bottom"><span class="style9"><a href="'.tep_href_link(FILENAME_SPECIALS).'" style="color:#1F5A88 ">Start shopping!</a></span></td>
                  </tr>
                </table></td></tr>				
                </table><br>');
define('TABLE_HEADING_NEW_PRODUCTS', 'Nuevos Productos En %s');
define('TABLE_HEADING_UPCOMING_PRODUCTS', 'Pr&oacute;ximamente');
define('TABLE_HEADING_DATE_EXPECTED', 'Lanzamiento');

if ( ($category_depth == 'products') || (isset($HTTP_GET_VARS['manufacturers_id'])) ) {
  define('HEADING_TITLE', 'A ver que tenemos aqui');
  define('TABLE_HEADING_IMAGE', '');
  define('TABLE_HEADING_MODEL', 'Modelo');
  define('TABLE_HEADING_PRODUCTS', 'Productos');
  define('TABLE_HEADING_MANUFACTURER', 'Fabricante');
  define('TABLE_HEADING_QUANTITY', 'Cantidad');
  define('TABLE_HEADING_PRICE', 'Precio');
  define('TABLE_HEADING_WEIGHT', 'Peso');
  define('TABLE_HEADING_BUY_NOW', 'Compre Ahora');
  define('TEXT_NO_PRODUCTS', 'No hay productos en esta categoria.');
  define('TEXT_NO_PRODUCTS2', 'No hay productos de este fabricante.');
  define('TEXT_NUMBER_OF_PRODUCTS', 'N&uacute;mero de Productos: ');
  define('TEXT_SHOW', '<b>Mostrar:</b>');
  define('TEXT_BUY', 'Compre 1 \'');
  define('TEXT_NOW', '\' ahora');
  define('TEXT_ALL_CATEGORIES', 'Todas');
  define('TEXT_ALL_MANUFACTURERS', 'Todos');
} elseif ($category_depth == 'top') {
  define('HEADING_TITLE', '&iquest;Que hay de nuevo por aqui?');
} elseif ($category_depth == 'nested') {
  define('HEADING_TITLE', 'Categorias');
}
?>
