<?php
/*
  $Id: index.php,v 1.1 2003/06/11 17:38:00 hpdl Exp $

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
                </table><br>				
				');
define('TABLE_HEADING_NEW_PRODUCTS', 'New Products For %s');
define('TABLE_HEADING_UPCOMING_PRODUCTS', 'Upcoming Products');
define('TABLE_HEADING_DATE_EXPECTED', 'Date Expected');

if ( ($category_depth == 'products') || (isset($HTTP_GET_VARS['manufacturers_id'])) ) {
  define('HEADING_TITLE', 'Let\'s See What We Have Here');
  define('TABLE_HEADING_IMAGE', '');
  define('TABLE_HEADING_MODEL', 'Model');
  define('TABLE_HEADING_PRODUCTS', 'Product Name');
  define('TABLE_HEADING_MANUFACTURER', 'Manufacturer');
  define('TABLE_HEADING_QUANTITY', 'Quantity');
  define('TABLE_HEADING_PRICE', 'Price');
  define('TABLE_HEADING_WEIGHT', 'Weight');
  define('TABLE_HEADING_BUY_NOW', 'Buy Now');
  define('TEXT_NO_PRODUCTS', 'There are no products to list in this category.');
  define('TEXT_NO_PRODUCTS2', 'There is no product available from this manufacturer.');
  define('TEXT_NUMBER_OF_PRODUCTS', 'Number of Products: ');
  define('TEXT_SHOW', '<b>Show:</b>');
  define('TEXT_BUY', 'Buy 1 \'');
  define('TEXT_NOW', '\' now');
  define('TEXT_ALL_CATEGORIES', 'All Categories');
  define('TEXT_ALL_MANUFACTURERS', 'All Manufacturers');
} elseif ($category_depth == 'top') {
  define('HEADING_TITLE', 'What\'s New Here?');
} elseif ($category_depth == 'nested') {
  define('HEADING_TITLE', 'Categories');
}
?>
