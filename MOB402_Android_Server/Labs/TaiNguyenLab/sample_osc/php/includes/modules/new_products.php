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

  if ( (!isset($new_products_category_id)) || ($new_products_category_id == '0') ) {
    $new_products_query = tep_db_query("select p.products_id, p.products_image, p.products_tax_class_id, if(s.status, s.specials_new_products_price, p.products_price) as products_price from " . TABLE_PRODUCTS . " p left join " . TABLE_SPECIALS . " s on p.products_id = s.products_id where products_status = '1' order by p.products_date_added desc limit " . MAX_DISPLAY_NEW_PRODUCTS);
  } else {
    $new_products_query = tep_db_query("select distinct p.products_id, p.products_image, p.products_tax_class_id, if(s.status, s.specials_new_products_price, p.products_price) as products_price from " . TABLE_PRODUCTS . " p left join " . TABLE_SPECIALS . " s on p.products_id = s.products_id, " . TABLE_PRODUCTS_TO_CATEGORIES . " p2c, " . TABLE_CATEGORIES . " c where p.products_id = p2c.products_id and p2c.categories_id = c.categories_id and c.parent_id = '" . (int)$new_products_category_id . "' and p.products_status = '1' order by p.products_date_added desc limit " . MAX_DISPLAY_NEW_PRODUCTS);
  }

  $row = 0;
  $col = 0;
  $info_box_contents = array();
  while ($new_products = tep_db_fetch_array($new_products_query)) {
    $new_products['products_name'] = tep_get_products_name($new_products['products_id']);
	
	$sql = 'SELECT `products_description` FROM `products_description` WHERE products_id ='.$new_products['products_id'].' && language_id='.(int)$languages_id;
	$description_query = tep_db_query($sql);
	$description = mysql_fetch_array($description_query, MYSQL_ASSOC);        
	$description['products_description'] = substr($description['products_description'], 0, 50);
	$desc_len = strlen($description['products_description']);
$description['products_description'][$desc_len-1] = '.';
	$description['products_description'][$desc_len-2] = '.';
	$description['products_description'][$desc_len-3] = '.';
	
    if ($col == 0)
	$info_box_contents[$row][$col] = array('align' => 'center',
                                           'params' => 'class="smallText" cellspacing="0" width="50%" valign="top" bgcolor="#a5a5a5"',
                                           'text' => '<table width="100%"  border="0" cellspacing="0" cellpadding="4" bgcolor="#ffffff" cellpadding="0">
  <tr>
    <td colspan="2" height="20" width="100%" style="border-right:1px solid #a5a5a5; border-top:1px solid #a5a5a5 " ><a class=productTitle href="' . tep_href_link(FILENAME_PRODUCT_INFO, 'products_id=' . $new_products['products_id']) . '">' . $new_products['products_name'] . '</a></td>	
  </tr>
  <tr>
    <td><a href="' . tep_href_link(FILENAME_PRODUCT_INFO, 'products_id=' . $new_products['products_id']) . '">' . tep_image(DIR_WS_IMAGES . $new_products['products_image'], $new_products['products_name'], SMALL_IMAGE_WIDTH, SMALL_IMAGE_HEIGHT) . '</a></td>
	<td class="smallText" width="100%" style="border-right:1px solid #a5a5a5 ">'.$description['products_description']. '<br><br>'.tep_image(DIR_WS_IMAGES . '/theme/cvb.jpg', ABSMIDDLE).'&nbsp;<strong>'. $currencies->display_price($new_products['products_price'], tep_get_tax_rate($new_products['products_tax_class_id'])).'</strong></td>
  </tr>
</table>');
  else $info_box_contents[$row][$col] = array('align' => 'center',
                                           'params' => 'class="smallText" cellspacing="0" cellpadding="0" border=0 width="50%" valign="top" bgcolor="#a5a5a5"',
                                           'text' => '<table width="100%"  border="0" cellspacing="0" cellpadding="4" bgcolor="#ffffff" cellpadding="0">
  <tr>
    <td colspan="2" height="20"  style="border-top:1px solid #a5a5a5 "><a class=productTitle href="' . tep_href_link(FILENAME_PRODUCT_INFO, 'products_id=' . $new_products['products_id']) . '">' . $new_products['products_name'] . '</a></td>	
  </tr>
  <tr>
    <td><a href="' . tep_href_link(FILENAME_PRODUCT_INFO, 'products_id=' . $new_products['products_id']) . '">' . tep_image(DIR_WS_IMAGES . $new_products['products_image'], $new_products['products_name'], SMALL_IMAGE_WIDTH, SMALL_IMAGE_HEIGHT) . '</a></td>
	<td class="smallText">'.$description['products_description']. '<br><br>'.tep_image(DIR_WS_IMAGES . '/theme/cvb.jpg', ABSMIDDLE).'&nbsp;<strong>'. $currencies->display_price($new_products['products_price'], tep_get_tax_rate($new_products['products_tax_class_id'])).'</strong></td>
  </tr>
</table>');

    $col ++;
    if ($col > 1) {
      $col = 0;
      $row ++;
	  if ($row > 1)
	     break;
    }
  }

  new contentBox($info_box_contents);
?>
<!-- new_products_eof //-->
