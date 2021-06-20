<?php
/*
  $Id: header.php,v 1.42 2003/06/10 18:20:38 hpdl Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Released under the GNU General Public License
*/

// check if the 'install' directory exists, and warn of its existence
  if (WARN_INSTALL_EXISTENCE == 'true') {
    if (file_exists(dirname($HTTP_SERVER_VARS['SCRIPT_FILENAME']) . '/install')) {
      $messageStack->add('header', WARNING_INSTALL_DIRECTORY_EXISTS, 'warning');
    }
  }

// check if the configure.php file is writeable
  if (WARN_CONFIG_WRITEABLE == 'true') {
    if ( (file_exists(dirname($HTTP_SERVER_VARS['SCRIPT_FILENAME']) . '/includes/configure.php')) && (is_writeable(dirname($HTTP_SERVER_VARS['SCRIPT_FILENAME']) . '/includes/configure.php')) ) {
      $messageStack->add('header', WARNING_CONFIG_FILE_WRITEABLE, 'warning');
    }
  }

// check if the session folder is writeable
  if (WARN_SESSION_DIRECTORY_NOT_WRITEABLE == 'true') {
    if (STORE_SESSIONS == '') {
      if (!is_dir(tep_session_save_path())) {
        $messageStack->add('header', WARNING_SESSION_DIRECTORY_NON_EXISTENT, 'warning');
      } elseif (!is_writeable(tep_session_save_path())) {
        $messageStack->add('header', WARNING_SESSION_DIRECTORY_NOT_WRITEABLE, 'warning');
      }
    }
  }

// check session.auto_start is disabled
  if ( (function_exists('ini_get')) && (WARN_SESSION_AUTO_START == 'true') ) {
    if (ini_get('session.auto_start') == '1') {
      $messageStack->add('header', WARNING_SESSION_AUTO_START, 'warning');
    }
  }

  if ( (WARN_DOWNLOAD_DIRECTORY_NOT_READABLE == 'true') && (DOWNLOAD_ENABLED == 'true') ) {
    if (!is_dir(DIR_FS_DOWNLOAD)) {
      $messageStack->add('header', WARNING_DOWNLOAD_DIRECTORY_NON_EXISTENT, 'warning');
    }
  }

  if ($messageStack->size('header') > 0) {
    echo $messageStack->output('header');
  }
?>
<div style="height:21px; "></div>
<table width="715"  border="0" cellspacing="0" cellpadding="0" align="center">
        <tr>
          <td width="6%"><a href="<?php echo tep_href_link(FILENAME_DEFAULT); ?>"><img src="<?php echo DIR_WS_IMAGES  ?>theme/logo.jpg" width="177" height="59" border="0"></a></td>
          <td width="94%" valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td align="right"><img src="<?php echo DIR_WS_IMAGES  ?>theme/call.jpg" width="184" height="35"></td>
            </tr>
            <tr>
              <td><table width="100%"  border="0" cellpadding="0" cellspacing="0" background="<?php echo DIR_WS_IMAGES  ?>theme/ui.jpg">
                <tr>
                  <td width="26%"><em><img src="<?php echo DIR_WS_IMAGES  ?>theme/ui.jpg" width="1" height="24"></em></td>
                  <td width="74%"><span class="style1"><a href="<?php echo tep_href_link(FILENAME_DEFAULT); ?>" class="top" style="color:#FFFFFF;text-decoration:none">home</a>&nbsp; |&nbsp; <a href="<?php echo tep_href_link(FILENAME_DEFAULT,'cPath=1'); ?>" class="top" style="color:#FFFFFF;text-decoration:none">hardware</a>&nbsp; |&nbsp; <a href="<?php echo tep_href_link(FILENAME_DEFAULT,'cPath=2'); ?>" class="top" style="color:#FFFFFF;text-decoration:none">software</a> &nbsp;&nbsp;|&nbsp; &nbsp;<a href="<?php echo tep_href_link(FILENAME_DEFAULT,'cPath=3'); ?>" class="top"  style="color:#FFFFFF;text-decoration:none">DVD</a> &nbsp;|&nbsp; <a href="<?php echo tep_href_link(FILENAME_SHOPPING_CART); ?>"  class="top" style="color:#FFFFFF;text-decoration:none">your cart</a>&nbsp; |&nbsp; <a href="<?php echo tep_href_link(FILENAME_SHIPPING); ?>" class="top"  style="color:#FFFFFF;text-decoration:none">shipping</a></span></td>
                </tr>
              </table></td>
            </tr>
          </table></td>
        </tr>
</table>

<?php
  if (isset($HTTP_GET_VARS['error_message']) && tep_not_null($HTTP_GET_VARS['error_message'])) {
?>
<table border="0" width="100%" cellspacing="0" cellpadding="2">
  <tr class="headerError">
    <td class="headerError"><?php echo htmlspecialchars(urldecode($HTTP_GET_VARS['error_message'])); ?></td>
  </tr>
</table>
<?php
  }

  if (isset($HTTP_GET_VARS['info_message']) && tep_not_null($HTTP_GET_VARS['info_message'])) {
?>
<table border="0" width="100%" cellspacing="0" cellpadding="2">
  <tr class="headerInfo">
    <td class="headerInfo"><?php echo htmlspecialchars($HTTP_GET_VARS['info_message']); ?></td>
  </tr>
</table>
<?php
  }
?>
