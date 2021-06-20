<?php
/*
  $Id: index.php,v 1.2 2003/07/11 09:04:22 jan0815 Exp $

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
define('TABLE_HEADING_NEW_PRODUCTS', 'Neue Produkte im %s');
define('TABLE_HEADING_UPCOMING_PRODUCTS', 'Wann ist was verf&uuml;gbar');
define('TABLE_HEADING_DATE_EXPECTED', 'Datum');

if ( ($category_depth == 'products') || (isset($HTTP_GET_VARS['manufacturers_id'])) ) {
  define('HEADING_TITLE', 'Unser Angebot');
  define('TABLE_HEADING_IMAGE', '');
  define('TABLE_HEADING_MODEL', 'Artikel-Nr.');
  define('TABLE_HEADING_PRODUCTS', 'Produkte');
  define('TABLE_HEADING_MANUFACTURER', 'Hersteller');
  define('TABLE_HEADING_QUANTITY', 'Anzahl');
  define('TABLE_HEADING_PRICE', 'Preis');
  define('TABLE_HEADING_WEIGHT', 'Gewicht');
  define('TABLE_HEADING_BUY_NOW', 'Bestellen');
  define('TEXT_NO_PRODUCTS', 'Es gibt keine Produkte in dieser Kategorie.');
  define('TEXT_NO_PRODUCTS2', 'Es gibt kein Produkt, das von diesem Hersteller stammt.');
  define('TEXT_NUMBER_OF_PRODUCTS', 'Artikel: ');
  define('TEXT_SHOW', '<b>Darstellen:</b>');
  define('TEXT_BUY', '1 x \'');
  define('TEXT_NOW', '\' bestellen!');
  define('TEXT_ALL_CATEGORIES', 'Alle Kategorien');
  define('TEXT_ALL_MANUFACTURERS', 'Alle Hersteller');
} elseif ($category_depth == 'top') {
  define('HEADING_TITLE', 'Unser Angebot');
} elseif ($category_depth == 'nested') {
  define('HEADING_TITLE', 'Kategorien');
}
?>
