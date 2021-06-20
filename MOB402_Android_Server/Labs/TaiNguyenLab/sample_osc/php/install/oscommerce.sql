# phpMyAdmin MySQL-Dump
# version 2.3.2
# http://www.phpmyadmin.net/ (download page)
#
# Host: localhost
# Generation Time: Apr 12, 2005 at 02:01 PM
# Server version: 4.00.00
# PHP Version: 4.2.3
# Database : `oscommerce`
# --------------------------------------------------------

#
# Table structure for table `address_book`
#
CREATE TABLE address_book (
  address_book_id int(11) NOT NULL auto_increment,
  customers_id int(11) NOT NULL default '0',
  entry_gender char(1) NOT NULL default '',
  entry_company varchar(32) default NULL,
  entry_firstname varchar(32) NOT NULL default '',
  entry_lastname varchar(32) NOT NULL default '',
  entry_street_address varchar(64) NOT NULL default '',
  entry_suburb varchar(32) default NULL,
  entry_postcode varchar(10) NOT NULL default '',
  entry_city varchar(32) NOT NULL default '',
  entry_state varchar(32) default NULL,
  entry_country_id int(11) NOT NULL default '0',
  entry_zone_id int(11) NOT NULL default '0',
  PRIMARY KEY  (address_book_id),
  KEY idx_address_book_customers_id (customers_id)
) TYPE=MyISAM;

#
# Dumping data for table `address_book`
#

INSERT INTO address_book VALUES (1, 1, 'm', 'ACME Inc.', 'John', 'Doe', '1 Way Street', '', '12345', 'NeverNever', '', 223, 12);
# --------------------------------------------------------

#
# Table structure for table `address_format`
#

CREATE TABLE address_format (
  address_format_id int(11) NOT NULL auto_increment,
  address_format varchar(128) NOT NULL default '',
  address_summary varchar(48) NOT NULL default '',
  PRIMARY KEY  (address_format_id)
) TYPE=MyISAM;

#
# Dumping data for table `address_format`
#

INSERT INTO address_format VALUES (1, '$firstname $lastname$cr$streets$cr$city, $postcode$cr$statecomma$country', '$city / $country');
INSERT INTO address_format VALUES (2, '$firstname $lastname$cr$streets$cr$city, $state    $postcode$cr$country', '$city, $state / $country');
INSERT INTO address_format VALUES (3, '$firstname $lastname$cr$streets$cr$city$cr$postcode - $statecomma$country', '$state / $country');
INSERT INTO address_format VALUES (4, '$firstname $lastname$cr$streets$cr$city ($postcode)$cr$country', '$postcode / $country');
INSERT INTO address_format VALUES (5, '$firstname $lastname$cr$streets$cr$postcode $city$cr$country', '$city / $country');
# --------------------------------------------------------

#
# Table structure for table `banners`
#

CREATE TABLE banners (
  banners_id int(11) NOT NULL auto_increment,
  banners_title varchar(64) NOT NULL default '',
  banners_url varchar(255) NOT NULL default '',
  banners_image varchar(64) NOT NULL default '',
  banners_group varchar(10) NOT NULL default '',
  banners_html_text text,
  expires_impressions int(7) default '0',
  expires_date datetime default NULL,
  date_scheduled datetime default NULL,
  date_added datetime NOT NULL default '0000-00-00 00:00:00',
  date_status_change datetime default NULL,
  status int(1) NOT NULL default '1',
  PRIMARY KEY  (banners_id)
) TYPE=MyISAM;

#
# Dumping data for table `banners`
#

INSERT INTO banners VALUES (1, 'osCommerce', 'http://www.oscommerce.com', 'banners/oscommerce.gif', '468x50', '', 0, NULL, NULL, '2005-03-28 17:23:41', NULL, 1);
# --------------------------------------------------------

#
# Table structure for table `banners_history`
#

CREATE TABLE banners_history (
  banners_history_id int(11) NOT NULL auto_increment,
  banners_id int(11) NOT NULL default '0',
  banners_shown int(5) NOT NULL default '0',
  banners_clicked int(5) NOT NULL default '0',
  banners_history_date datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (banners_history_id)
) TYPE=MyISAM;

#
# Dumping data for table `banners_history`
#

INSERT INTO banners_history VALUES (1, 1, 36, 0, '2005-04-01 16:39:54');
# --------------------------------------------------------

#
# Table structure for table `categories`
#

CREATE TABLE categories (
  categories_id int(11) NOT NULL auto_increment,
  categories_image varchar(64) default NULL,
  parent_id int(11) NOT NULL default '0',
  sort_order int(3) default NULL,
  date_added datetime default NULL,
  last_modified datetime default NULL,
  PRIMARY KEY  (categories_id),
  KEY idx_categories_parent_id (parent_id)
) TYPE=MyISAM;

#
# Dumping data for table `categories`
#

INSERT INTO categories VALUES (1, 'category_hardware.gif', 0, 1, '2005-03-28 17:23:41', NULL);
INSERT INTO categories VALUES (2, 'category_software.gif', 0, 2, '2005-03-28 17:23:41', NULL);
INSERT INTO categories VALUES (3, 'category_dvd_movies.gif', 0, 3, '2005-03-28 17:23:41', NULL);
INSERT INTO categories VALUES (4, 'subcategory_graphic_cards.gif', 1, 0, '2005-03-28 17:23:41', NULL);
INSERT INTO categories VALUES (5, 'subcategory_printers.gif', 1, 0, '2005-03-28 17:23:41', NULL);
INSERT INTO categories VALUES (6, 'subcategory_monitors.gif', 1, 0, '2005-03-28 17:23:41', NULL);
INSERT INTO categories VALUES (7, 'subcategory_speakers.gif', 1, 0, '2005-03-28 17:23:41', NULL);
INSERT INTO categories VALUES (8, 'subcategory_keyboards.gif', 1, 0, '2005-03-28 17:23:41', NULL);
INSERT INTO categories VALUES (9, 'subcategory_mice.gif', 1, 0, '2005-03-28 17:23:41', NULL);
INSERT INTO categories VALUES (10, 'subcategory_action.gif', 3, 0, '2005-03-28 17:23:41', NULL);
INSERT INTO categories VALUES (11, 'subcategory_science_fiction.gif', 3, 0, '2005-03-28 17:23:41', NULL);
INSERT INTO categories VALUES (12, 'subcategory_comedy.gif', 3, 0, '2005-03-28 17:23:41', NULL);
INSERT INTO categories VALUES (13, 'subcategory_cartoons.gif', 3, 0, '2005-03-28 17:23:41', NULL);
INSERT INTO categories VALUES (14, 'subcategory_thriller.gif', 3, 0, '2005-03-28 17:23:41', NULL);
INSERT INTO categories VALUES (15, 'subcategory_drama.gif', 3, 0, '2005-03-28 17:23:41', NULL);
INSERT INTO categories VALUES (16, 'subcategory_memory.gif', 1, 0, '2005-03-28 17:23:41', NULL);
INSERT INTO categories VALUES (17, 'subcategory_cdrom_drives.gif', 1, 0, '2005-03-28 17:23:41', NULL);
INSERT INTO categories VALUES (18, 'subcategory_simulation.gif', 2, 0, '2005-03-28 17:23:41', NULL);
INSERT INTO categories VALUES (19, 'subcategory_action_games.gif', 2, 0, '2005-03-28 17:23:41', NULL);
INSERT INTO categories VALUES (20, 'subcategory_strategy.gif', 2, 0, '2005-03-28 17:23:41', NULL);
INSERT INTO categories VALUES (21, 'Data_canle_category.gif', 1, 0, '2005-04-12 11:52:05', NULL);
INSERT INTO categories VALUES (22, 'Floppy_category.gif', 1, 0, '2005-04-12 11:55:55', '2005-04-12 11:56:12');
INSERT INTO categories VALUES (23, 'Notebook_subcategory.gif', 1, 0, '2005-04-12 12:00:31', NULL);
INSERT INTO categories VALUES (24, 'Mitherboards_subcategory.gif', 1, 0, '2005-04-12 12:12:49', '2005-04-12 12:13:26');
INSERT INTO categories VALUES (25, 'subcategory_coolers.gif', 1, 0, '2005-04-12 13:38:32', NULL);
# --------------------------------------------------------

#
# Table structure for table `categories_description`
#

CREATE TABLE categories_description (
  categories_id int(11) NOT NULL default '0',
  language_id int(11) NOT NULL default '1',
  categories_name varchar(32) NOT NULL default '',
  PRIMARY KEY  (categories_id,language_id),
  KEY idx_categories_name (categories_name)
) TYPE=MyISAM;

#
# Dumping data for table `categories_description`
#

INSERT INTO categories_description VALUES (1, 1, 'Hardware');
INSERT INTO categories_description VALUES (2, 1, 'Software');
INSERT INTO categories_description VALUES (3, 1, 'DVD Movies');
INSERT INTO categories_description VALUES (4, 1, 'Graphics Cards');
INSERT INTO categories_description VALUES (5, 1, 'Printers');
INSERT INTO categories_description VALUES (6, 1, 'Monitors');
INSERT INTO categories_description VALUES (7, 1, 'Speakers');
INSERT INTO categories_description VALUES (8, 1, 'Keyboards');
INSERT INTO categories_description VALUES (9, 1, 'Mice');
INSERT INTO categories_description VALUES (10, 1, 'Action');
INSERT INTO categories_description VALUES (11, 1, 'Science Fiction');
INSERT INTO categories_description VALUES (12, 1, 'Comedy');
INSERT INTO categories_description VALUES (13, 1, 'Cartoons');
INSERT INTO categories_description VALUES (14, 1, 'Thriller');
INSERT INTO categories_description VALUES (15, 1, 'Drama');
INSERT INTO categories_description VALUES (16, 1, 'Memory');
INSERT INTO categories_description VALUES (17, 1, 'CDROM Drives');
INSERT INTO categories_description VALUES (18, 1, 'Simulation');
INSERT INTO categories_description VALUES (19, 1, 'Action');
INSERT INTO categories_description VALUES (20, 1, 'Strategy');
INSERT INTO categories_description VALUES (1, 2, 'Hardware');
INSERT INTO categories_description VALUES (2, 2, 'Software');
INSERT INTO categories_description VALUES (3, 2, 'DVD Filme');
INSERT INTO categories_description VALUES (4, 2, 'Grafikkarten');
INSERT INTO categories_description VALUES (5, 2, 'Drucker');
INSERT INTO categories_description VALUES (6, 2, 'Bildschirme');
INSERT INTO categories_description VALUES (7, 2, 'Lautsprecher');
INSERT INTO categories_description VALUES (8, 2, 'Tastaturen');
INSERT INTO categories_description VALUES (9, 2, 'Mäuse');
INSERT INTO categories_description VALUES (10, 2, 'Action');
INSERT INTO categories_description VALUES (11, 2, 'Science Fiction');
INSERT INTO categories_description VALUES (12, 2, 'Komödie');
INSERT INTO categories_description VALUES (13, 2, 'Zeichentrick');
INSERT INTO categories_description VALUES (14, 2, 'Thriller');
INSERT INTO categories_description VALUES (15, 2, 'Drama');
INSERT INTO categories_description VALUES (16, 2, 'Speicher');
INSERT INTO categories_description VALUES (17, 2, 'CDROM Laufwerke');
INSERT INTO categories_description VALUES (18, 2, 'Simulation');
INSERT INTO categories_description VALUES (19, 2, 'Action');
INSERT INTO categories_description VALUES (20, 2, 'Strategie');
INSERT INTO categories_description VALUES (1, 3, 'Hardware');
INSERT INTO categories_description VALUES (2, 3, 'Software');
INSERT INTO categories_description VALUES (3, 3, 'Peliculas DVD');
INSERT INTO categories_description VALUES (4, 3, 'Tarjetas Graficas');
INSERT INTO categories_description VALUES (5, 3, 'Impresoras');
INSERT INTO categories_description VALUES (6, 3, 'Monitores');
INSERT INTO categories_description VALUES (7, 3, 'Altavoces');
INSERT INTO categories_description VALUES (8, 3, 'Teclados');
INSERT INTO categories_description VALUES (9, 3, 'Ratones');
INSERT INTO categories_description VALUES (10, 3, 'Accion');
INSERT INTO categories_description VALUES (11, 3, 'Ciencia Ficcion');
INSERT INTO categories_description VALUES (12, 3, 'Comedia');
INSERT INTO categories_description VALUES (13, 3, 'Dibujos Animados');
INSERT INTO categories_description VALUES (14, 3, 'Suspense');
INSERT INTO categories_description VALUES (15, 3, 'Drama');
INSERT INTO categories_description VALUES (16, 3, 'Memoria');
INSERT INTO categories_description VALUES (17, 3, 'Unidades CDROM');
INSERT INTO categories_description VALUES (18, 3, 'Simulacion');
INSERT INTO categories_description VALUES (19, 3, 'Accion');
INSERT INTO categories_description VALUES (20, 3, 'Estrategia');
INSERT INTO categories_description VALUES (21, 1, 'Data Cables');
INSERT INTO categories_description VALUES (21, 2, 'Data Cables');
INSERT INTO categories_description VALUES (21, 3, 'Data Cables');
INSERT INTO categories_description VALUES (22, 1, 'Floppy Drivers');
INSERT INTO categories_description VALUES (22, 2, 'Floppy Drivers');
INSERT INTO categories_description VALUES (22, 3, 'Floppy Drivers');
INSERT INTO categories_description VALUES (23, 1, 'Notebooks');
INSERT INTO categories_description VALUES (23, 2, 'Notebooks');
INSERT INTO categories_description VALUES (23, 3, 'Notebooks');
INSERT INTO categories_description VALUES (24, 1, 'MotherBoards');
INSERT INTO categories_description VALUES (24, 2, 'MotherBoards');
INSERT INTO categories_description VALUES (24, 3, 'MotherBoards');
INSERT INTO categories_description VALUES (25, 1, 'Coolers');
INSERT INTO categories_description VALUES (25, 2, 'Coolers');
INSERT INTO categories_description VALUES (25, 3, 'Coolers');
# --------------------------------------------------------

#
# Table structure for table `configuration`
#

CREATE TABLE configuration (
  configuration_id int(11) NOT NULL auto_increment,
  configuration_title varchar(64) NOT NULL default '',
  configuration_key varchar(64) NOT NULL default '',
  configuration_value varchar(255) NOT NULL default '',
  configuration_description varchar(255) NOT NULL default '',
  configuration_group_id int(11) NOT NULL default '0',
  sort_order int(5) default NULL,
  last_modified datetime default NULL,
  date_added datetime NOT NULL default '0000-00-00 00:00:00',
  use_function varchar(255) default NULL,
  set_function varchar(255) default NULL,
  PRIMARY KEY  (configuration_id)
) TYPE=MyISAM;

#
# Dumping data for table `configuration`
#

INSERT INTO configuration VALUES (1, 'Store Name', 'STORE_NAME', 'osCommerce', 'The name of my store', 1, 1, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (2, 'Store Owner', 'STORE_OWNER', 'Harald Ponce de Leon', 'The name of my store owner', 1, 2, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (3, 'E-Mail Address', 'STORE_OWNER_EMAIL_ADDRESS', 'root@localhost', 'The e-mail address of my store owner', 1, 3, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (4, 'E-Mail From', 'EMAIL_FROM', 'osCommerce <root@localhost>', 'The e-mail address used in (sent) e-mails', 1, 4, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (5, 'Country', 'STORE_COUNTRY', '223', 'The country my store is located in <br><br><b>Note: Please remember to update the store zone.</b>', 1, 6, NULL, '2005-03-28 17:23:41', 'tep_get_country_name', 'tep_cfg_pull_down_country_list(');
INSERT INTO configuration VALUES (6, 'Zone', 'STORE_ZONE', '18', 'The zone my store is located in', 1, 7, NULL, '2005-03-28 17:23:41', 'tep_cfg_get_zone_name', 'tep_cfg_pull_down_zone_list(');
INSERT INTO configuration VALUES (7, 'Expected Sort Order', 'EXPECTED_PRODUCTS_SORT', 'desc', 'This is the sort order used in the expected products box.', 1, 8, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_select_option(array(\'asc\', \'desc\'),');
INSERT INTO configuration VALUES (8, 'Expected Sort Field', 'EXPECTED_PRODUCTS_FIELD', 'date_expected', 'The column to sort by in the expected products box.', 1, 9, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_select_option(array(\'products_name\', \'date_expected\'),');
INSERT INTO configuration VALUES (9, 'Switch To Default Language Currency', 'USE_DEFAULT_LANGUAGE_CURRENCY', 'false', 'Automatically switch to the language\'s currency when it is changed', 1, 10, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (10, 'Send Extra Order Emails To', 'SEND_EXTRA_ORDER_EMAILS_TO', '', 'Send extra order emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 1, 11, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (11, 'Use Search-Engine Safe URLs (still in development)', 'SEARCH_ENGINE_FRIENDLY_URLS', 'false', 'Use search-engine safe urls for all site links', 1, 12, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (12, 'Display Cart After Adding Product', 'DISPLAY_CART', 'true', 'Display the shopping cart after adding a product (or return back to their origin)', 1, 14, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (13, 'Allow Guest To Tell A Friend', 'ALLOW_GUEST_TO_TELL_A_FRIEND', 'false', 'Allow guests to tell a friend about a product', 1, 15, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (14, 'Default Search Operator', 'ADVANCED_SEARCH_DEFAULT_OPERATOR', 'and', 'Default search operators', 1, 17, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_select_option(array(\'and\', \'or\'),');
INSERT INTO configuration VALUES (15, 'Store Address and Phone', 'STORE_NAME_ADDRESS', 'Store Name\nAddress\nCountry\nPhone', 'This is the Store Name, Address and Phone used on printable documents and displayed online', 1, 18, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_textarea(');
INSERT INTO configuration VALUES (16, 'Show Category Counts', 'SHOW_COUNTS', 'true', 'Count recursively how many products are in each category', 1, 19, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (17, 'Tax Decimal Places', 'TAX_DECIMAL_PLACES', '0', 'Pad the tax value this amount of decimal places', 1, 20, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (18, 'Display Prices with Tax', 'DISPLAY_PRICE_WITH_TAX', 'false', 'Display prices with tax included (true) or add the tax at the end (false)', 1, 21, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (19, 'First Name', 'ENTRY_FIRST_NAME_MIN_LENGTH', '2', 'Minimum length of first name', 2, 1, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (20, 'Last Name', 'ENTRY_LAST_NAME_MIN_LENGTH', '2', 'Minimum length of last name', 2, 2, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (21, 'Date of Birth', 'ENTRY_DOB_MIN_LENGTH', '10', 'Minimum length of date of birth', 2, 3, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (22, 'E-Mail Address', 'ENTRY_EMAIL_ADDRESS_MIN_LENGTH', '6', 'Minimum length of e-mail address', 2, 4, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (23, 'Street Address', 'ENTRY_STREET_ADDRESS_MIN_LENGTH', '5', 'Minimum length of street address', 2, 5, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (24, 'Company', 'ENTRY_COMPANY_MIN_LENGTH', '2', 'Minimum length of company name', 2, 6, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (25, 'Post Code', 'ENTRY_POSTCODE_MIN_LENGTH', '4', 'Minimum length of post code', 2, 7, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (26, 'City', 'ENTRY_CITY_MIN_LENGTH', '3', 'Minimum length of city', 2, 8, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (27, 'State', 'ENTRY_STATE_MIN_LENGTH', '2', 'Minimum length of state', 2, 9, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (28, 'Telephone Number', 'ENTRY_TELEPHONE_MIN_LENGTH', '3', 'Minimum length of telephone number', 2, 10, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (29, 'Password', 'ENTRY_PASSWORD_MIN_LENGTH', '5', 'Minimum length of password', 2, 11, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (30, 'Credit Card Owner Name', 'CC_OWNER_MIN_LENGTH', '3', 'Minimum length of credit card owner name', 2, 12, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (31, 'Credit Card Number', 'CC_NUMBER_MIN_LENGTH', '10', 'Minimum length of credit card number', 2, 13, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (32, 'Review Text', 'REVIEW_TEXT_MIN_LENGTH', '50', 'Minimum length of review text', 2, 14, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (33, 'Best Sellers', 'MIN_DISPLAY_BESTSELLERS', '1', 'Minimum number of best sellers to display', 2, 15, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (34, 'Also Purchased', 'MIN_DISPLAY_ALSO_PURCHASED', '1', 'Minimum number of products to display in the \'This Customer Also Purchased\' box', 2, 16, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (35, 'Address Book Entries', 'MAX_ADDRESS_BOOK_ENTRIES', '5', 'Maximum address book entries a customer is allowed to have', 3, 1, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (36, 'Search Results', 'MAX_DISPLAY_SEARCH_RESULTS', '20', 'Amount of products to list', 3, 2, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (37, 'Page Links', 'MAX_DISPLAY_PAGE_LINKS', '5', 'Number of \'number\' links use for page-sets', 3, 3, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (38, 'Special Products', 'MAX_DISPLAY_SPECIAL_PRODUCTS', '9', 'Maximum number of products on special to display', 3, 4, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (39, 'New Products Module', 'MAX_DISPLAY_NEW_PRODUCTS', '9', 'Maximum number of new products to display in a category', 3, 5, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (40, 'Products Expected', 'MAX_DISPLAY_UPCOMING_PRODUCTS', '10', 'Maximum number of products expected to display', 3, 6, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (41, 'Manufacturers List', 'MAX_DISPLAY_MANUFACTURERS_IN_A_LIST', '0', 'Used in manufacturers box; when the number of manufacturers exceeds this number, a drop-down list will be displayed instead of the default list', 3, 7, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (42, 'Manufacturers Select Size', 'MAX_MANUFACTURERS_LIST', '1', 'Used in manufacturers box; when this value is \'1\' the classic drop-down list will be used for the manufacturers box. Otherwise, a list-box with the specified number of rows will be displayed.', 3, 7, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (43, 'Length of Manufacturers Name', 'MAX_DISPLAY_MANUFACTURER_NAME_LEN', '15', 'Used in manufacturers box; maximum length of manufacturers name to display', 3, 8, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (44, 'New Reviews', 'MAX_DISPLAY_NEW_REVIEWS', '6', 'Maximum number of new reviews to display', 3, 9, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (45, 'Selection of Random Reviews', 'MAX_RANDOM_SELECT_REVIEWS', '10', 'How many records to select from to choose one random product review', 3, 10, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (46, 'Selection of Random New Products', 'MAX_RANDOM_SELECT_NEW', '10', 'How many records to select from to choose one random new product to display', 3, 11, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (47, 'Selection of Products on Special', 'MAX_RANDOM_SELECT_SPECIALS', '10', 'How many records to select from to choose one random product special to display', 3, 12, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (48, 'Categories To List Per Row', 'MAX_DISPLAY_CATEGORIES_PER_ROW', '3', 'How many categories to list per row', 3, 13, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (49, 'New Products Listing', 'MAX_DISPLAY_PRODUCTS_NEW', '10', 'Maximum number of new products to display in new products page', 3, 14, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (50, 'Best Sellers', 'MAX_DISPLAY_BESTSELLERS', '10', 'Maximum number of best sellers to display', 3, 15, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (51, 'Also Purchased', 'MAX_DISPLAY_ALSO_PURCHASED', '6', 'Maximum number of products to display in the \'This Customer Also Purchased\' box', 3, 16, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (52, 'Customer Order History Box', 'MAX_DISPLAY_PRODUCTS_IN_ORDER_HISTORY_BOX', '6', 'Maximum number of products to display in the customer order history box', 3, 17, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (53, 'Order History', 'MAX_DISPLAY_ORDER_HISTORY', '10', 'Maximum number of orders to display in the order history page', 3, 18, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (54, 'Small Image Width', 'SMALL_IMAGE_WIDTH', '100', 'The pixel width of small images', 4, 1, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (55, 'Small Image Height', 'SMALL_IMAGE_HEIGHT', '80', 'The pixel height of small images', 4, 2, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (56, 'Heading Image Width', 'HEADING_IMAGE_WIDTH', '57', 'The pixel width of heading images', 4, 3, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (57, 'Heading Image Height', 'HEADING_IMAGE_HEIGHT', '40', 'The pixel height of heading images', 4, 4, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (58, 'Subcategory Image Width', 'SUBCATEGORY_IMAGE_WIDTH', '100', 'The pixel width of subcategory images', 4, 5, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (59, 'Subcategory Image Height', 'SUBCATEGORY_IMAGE_HEIGHT', '57', 'The pixel height of subcategory images', 4, 6, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (60, 'Calculate Image Size', 'CONFIG_CALCULATE_IMAGE_SIZE', 'true', 'Calculate the size of images?', 4, 7, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (61, 'Image Required', 'IMAGE_REQUIRED', 'true', 'Enable to display broken images. Good for development.', 4, 8, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (62, 'Gender', 'ACCOUNT_GENDER', 'true', 'Display gender in the customers account', 5, 1, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (63, 'Date of Birth', 'ACCOUNT_DOB', 'true', 'Display date of birth in the customers account', 5, 2, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (64, 'Company', 'ACCOUNT_COMPANY', 'true', 'Display company in the customers account', 5, 3, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (65, 'Suburb', 'ACCOUNT_SUBURB', 'true', 'Display suburb in the customers account', 5, 4, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (66, 'State', 'ACCOUNT_STATE', 'true', 'Display state in the customers account', 5, 5, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (67, 'Installed Modules', 'MODULE_PAYMENT_INSTALLED', 'cc.php;cod.php', 'List of payment module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: cc.php;cod.php;paypal.php)', 6, 0, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (68, 'Installed Modules', 'MODULE_ORDER_TOTAL_INSTALLED', 'ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php', 'List of order_total module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php)', 6, 0, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (69, 'Installed Modules', 'MODULE_SHIPPING_INSTALLED', 'flat.php', 'List of shipping module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ups.php;flat.php;item.php)', 6, 0, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (70, 'Enable Cash On Delivery Module', 'MODULE_PAYMENT_COD_STATUS', 'True', 'Do you want to accept Cash On Delevery payments?', 6, 1, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (71, 'Payment Zone', 'MODULE_PAYMENT_COD_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', 6, 2, NULL, '2005-03-28 17:23:41', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes(');
INSERT INTO configuration VALUES (72, 'Sort order of display.', 'MODULE_PAYMENT_COD_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (73, 'Set Order Status', 'MODULE_PAYMENT_COD_ORDER_STATUS_ID', '0', 'Set the status of orders made with this payment module to this value', 6, 0, NULL, '2005-03-28 17:23:41', 'tep_get_order_status_name', 'tep_cfg_pull_down_order_statuses(');
INSERT INTO configuration VALUES (74, 'Enable Credit Card Module', 'MODULE_PAYMENT_CC_STATUS', 'True', 'Do you want to accept credit card payments?', 6, 0, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (75, 'Split Credit Card E-Mail Address', 'MODULE_PAYMENT_CC_EMAIL', '', 'If an e-mail address is entered, the middle digits of the credit card number will be sent to the e-mail address (the outside digits are stored in the database with the middle digits censored)', 6, 0, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (76, 'Sort order of display.', 'MODULE_PAYMENT_CC_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (77, 'Payment Zone', 'MODULE_PAYMENT_CC_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', 6, 2, NULL, '2005-03-28 17:23:41', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes(');
INSERT INTO configuration VALUES (78, 'Set Order Status', 'MODULE_PAYMENT_CC_ORDER_STATUS_ID', '0', 'Set the status of orders made with this payment module to this value', 6, 0, NULL, '2005-03-28 17:23:41', 'tep_get_order_status_name', 'tep_cfg_pull_down_order_statuses(');
INSERT INTO configuration VALUES (79, 'Enable Flat Shipping', 'MODULE_SHIPPING_FLAT_STATUS', 'True', 'Do you want to offer flat rate shipping?', 6, 0, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (80, 'Shipping Cost', 'MODULE_SHIPPING_FLAT_COST', '5.00', 'The shipping cost for all orders using this shipping method.', 6, 0, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (81, 'Tax Class', 'MODULE_SHIPPING_FLAT_TAX_CLASS', '0', 'Use the following tax class on the shipping fee.', 6, 0, NULL, '2005-03-28 17:23:41', 'tep_get_tax_class_title', 'tep_cfg_pull_down_tax_classes(');
INSERT INTO configuration VALUES (82, 'Shipping Zone', 'MODULE_SHIPPING_FLAT_ZONE', '0', 'If a zone is selected, only enable this shipping method for that zone.', 6, 0, NULL, '2005-03-28 17:23:41', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes(');
INSERT INTO configuration VALUES (83, 'Sort Order', 'MODULE_SHIPPING_FLAT_SORT_ORDER', '0', 'Sort order of display.', 6, 0, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (84, 'Default Currency', 'DEFAULT_CURRENCY', 'USD', 'Default Currency', 6, 0, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (85, 'Default Language', 'DEFAULT_LANGUAGE', 'en', 'Default Language', 6, 0, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (86, 'Default Order Status For New Orders', 'DEFAULT_ORDERS_STATUS_ID', '1', 'When a new order is created, this order status will be assigned to it.', 6, 0, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (87, 'Display Shipping', 'MODULE_ORDER_TOTAL_SHIPPING_STATUS', 'true', 'Do you want to display the order shipping cost?', 6, 1, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (88, 'Sort Order', 'MODULE_ORDER_TOTAL_SHIPPING_SORT_ORDER', '2', 'Sort order of display.', 6, 2, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (89, 'Allow Free Shipping', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING', 'false', 'Do you want to allow free shipping?', 6, 3, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (90, 'Free Shipping For Orders Over', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING_OVER', '50', 'Provide free shipping for orders over the set amount.', 6, 4, NULL, '2005-03-28 17:23:41', 'currencies->format', NULL);
INSERT INTO configuration VALUES (91, 'Provide Free Shipping For Orders Made', 'MODULE_ORDER_TOTAL_SHIPPING_DESTINATION', 'national', 'Provide free shipping for orders sent to the set destination.', 6, 5, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_select_option(array(\'national\', \'international\', \'both\'),');
INSERT INTO configuration VALUES (92, 'Display Sub-Total', 'MODULE_ORDER_TOTAL_SUBTOTAL_STATUS', 'true', 'Do you want to display the order sub-total cost?', 6, 1, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (93, 'Sort Order', 'MODULE_ORDER_TOTAL_SUBTOTAL_SORT_ORDER', '1', 'Sort order of display.', 6, 2, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (94, 'Display Tax', 'MODULE_ORDER_TOTAL_TAX_STATUS', 'true', 'Do you want to display the order tax value?', 6, 1, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (95, 'Sort Order', 'MODULE_ORDER_TOTAL_TAX_SORT_ORDER', '3', 'Sort order of display.', 6, 2, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (96, 'Display Total', 'MODULE_ORDER_TOTAL_TOTAL_STATUS', 'true', 'Do you want to display the total order value?', 6, 1, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (97, 'Sort Order', 'MODULE_ORDER_TOTAL_TOTAL_SORT_ORDER', '4', 'Sort order of display.', 6, 2, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (98, 'Country of Origin', 'SHIPPING_ORIGIN_COUNTRY', '223', 'Select the country of origin to be used in shipping quotes.', 7, 1, NULL, '2005-03-28 17:23:41', 'tep_get_country_name', 'tep_cfg_pull_down_country_list(');
INSERT INTO configuration VALUES (99, 'Postal Code', 'SHIPPING_ORIGIN_ZIP', 'NONE', 'Enter the Postal Code (ZIP) of the Store to be used in shipping quotes.', 7, 2, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (100, 'Enter the Maximum Package Weight you will ship', 'SHIPPING_MAX_WEIGHT', '50', 'Carriers have a max weight limit for a single package. This is a common one for all.', 7, 3, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (101, 'Package Tare weight.', 'SHIPPING_BOX_WEIGHT', '3', 'What is the weight of typical packaging of small to medium packages?', 7, 4, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (102, 'Larger packages - percentage increase.', 'SHIPPING_BOX_PADDING', '10', 'For 10% enter 10', 7, 5, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (103, 'Display Product Image', 'PRODUCT_LIST_IMAGE', '1', 'Do you want to display the Product Image?', 8, 1, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (104, 'Display Product Manufaturer Name', 'PRODUCT_LIST_MANUFACTURER', '0', 'Do you want to display the Product Manufacturer Name?', 8, 2, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (105, 'Display Product Model', 'PRODUCT_LIST_MODEL', '0', 'Do you want to display the Product Model?', 8, 3, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (106, 'Display Product Name', 'PRODUCT_LIST_NAME', '2', 'Do you want to display the Product Name?', 8, 4, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (107, 'Display Product Price', 'PRODUCT_LIST_PRICE', '3', 'Do you want to display the Product Price', 8, 5, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (108, 'Display Product Quantity', 'PRODUCT_LIST_QUANTITY', '0', 'Do you want to display the Product Quantity?', 8, 6, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (109, 'Display Product Weight', 'PRODUCT_LIST_WEIGHT', '0', 'Do you want to display the Product Weight?', 8, 7, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (110, 'Display Buy Now column', 'PRODUCT_LIST_BUY_NOW', '4', 'Do you want to display the Buy Now column?', 8, 8, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (111, 'Display Category/Manufacturer Filter (0=disable; 1=enable)', 'PRODUCT_LIST_FILTER', '1', 'Do you want to display the Category/Manufacturer Filter?', 8, 9, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (112, 'Location of Prev/Next Navigation Bar (1-top, 2-bottom, 3-both)', 'PREV_NEXT_BAR_LOCATION', '2', 'Sets the location of the Prev/Next Navigation Bar (1-top, 2-bottom, 3-both)', 8, 10, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (113, 'Check stock level', 'STOCK_CHECK', 'true', 'Check to see if sufficent stock is available', 9, 1, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (114, 'Subtract stock', 'STOCK_LIMITED', 'true', 'Subtract product in stock by product orders', 9, 2, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (115, 'Allow Checkout', 'STOCK_ALLOW_CHECKOUT', 'true', 'Allow customer to checkout even if there is insufficient stock', 9, 3, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (116, 'Mark product out of stock', 'STOCK_MARK_PRODUCT_OUT_OF_STOCK', '***', 'Display something on screen so customer can see which product has insufficient stock', 9, 4, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (117, 'Stock Re-order level', 'STOCK_REORDER_LEVEL', '5', 'Define when stock needs to be re-ordered', 9, 5, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (118, 'Store Page Parse Time', 'STORE_PAGE_PARSE_TIME', 'false', 'Store the time it takes to parse a page', 10, 1, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (119, 'Log Destination', 'STORE_PAGE_PARSE_TIME_LOG', '/var/log/www/tep/page_parse_time.log', 'Directory and filename of the page parse time log', 10, 2, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (120, 'Log Date Format', 'STORE_PARSE_DATE_TIME_FORMAT', '%d/%m/%Y %H:%M:%S', 'The date format', 10, 3, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (121, 'Display The Page Parse Time', 'DISPLAY_PAGE_PARSE_TIME', 'true', 'Display the page parse time (store page parse time must be enabled)', 10, 4, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (122, 'Store Database Queries', 'STORE_DB_TRANSACTIONS', 'false', 'Store the database queries in the page parse time log (PHP4 only)', 10, 5, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (123, 'Use Cache', 'USE_CACHE', 'false', 'Use caching features', 11, 1, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (124, 'Cache Directory', 'DIR_FS_CACHE', '/tmp/', 'The directory where the cached files are saved', 11, 2, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (125, 'E-Mail Transport Method', 'EMAIL_TRANSPORT', 'sendmail', 'Defines if this server uses a local connection to sendmail or uses an SMTP connection via TCP/IP. Servers running on Windows and MacOS should change this setting to SMTP.', 12, 1, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_select_option(array(\'sendmail\', \'smtp\'),');
INSERT INTO configuration VALUES (126, 'E-Mail Linefeeds', 'EMAIL_LINEFEED', 'LF', 'Defines the character sequence used to separate mail headers.', 12, 2, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_select_option(array(\'LF\', \'CRLF\'),');
INSERT INTO configuration VALUES (127, 'Use MIME HTML When Sending Emails', 'EMAIL_USE_HTML', 'false', 'Send e-mails in HTML format', 12, 3, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (128, 'Verify E-Mail Addresses Through DNS', 'ENTRY_EMAIL_ADDRESS_CHECK', 'false', 'Verify e-mail address through a DNS server', 12, 4, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (129, 'Send E-Mails', 'SEND_EMAILS', 'true', 'Send out e-mails', 12, 5, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (130, 'Enable download', 'DOWNLOAD_ENABLED', 'false', 'Enable the products download functions.', 13, 1, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (131, 'Download by redirect', 'DOWNLOAD_BY_REDIRECT', 'false', 'Use browser redirection for download. Disable on non-Unix systems.', 13, 2, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (132, 'Expiry delay (days)', 'DOWNLOAD_MAX_DAYS', '7', 'Set number of days before the download link expires. 0 means no limit.', 13, 3, NULL, '2005-03-28 17:23:41', NULL, '');
INSERT INTO configuration VALUES (133, 'Maximum number of downloads', 'DOWNLOAD_MAX_COUNT', '5', 'Set the maximum number of downloads. 0 means no download authorized.', 13, 4, NULL, '2005-03-28 17:23:41', NULL, '');
INSERT INTO configuration VALUES (134, 'Enable GZip Compression', 'GZIP_COMPRESSION', 'false', 'Enable HTTP GZip compression.', 14, 1, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (135, 'Compression Level', 'GZIP_LEVEL', '5', 'Use this compression level 0-9 (0 = minimum, 9 = maximum).', 14, 2, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (136, 'Session Directory', 'SESSION_WRITE_DIRECTORY', '/tmp', 'If sessions are file based, store them in this directory.', 15, 1, NULL, '2005-03-28 17:23:41', NULL, NULL);
INSERT INTO configuration VALUES (137, 'Force Cookie Use', 'SESSION_FORCE_COOKIE_USE', 'False', 'Force the use of sessions when cookies are only enabled.', 15, 2, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (138, 'Check SSL Session ID', 'SESSION_CHECK_SSL_SESSION_ID', 'False', 'Validate the SSL_SESSION_ID on every secure HTTPS page request.', 15, 3, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (139, 'Check User Agent', 'SESSION_CHECK_USER_AGENT', 'False', 'Validate the clients browser user agent on every page request.', 15, 4, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (140, 'Check IP Address', 'SESSION_CHECK_IP_ADDRESS', 'False', 'Validate the clients IP address on every page request.', 15, 5, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (141, 'Prevent Spider Sessions', 'SESSION_BLOCK_SPIDERS', 'False', 'Prevent known spiders from starting a session.', 15, 6, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (142, 'Recreate Session', 'SESSION_RECREATE', 'False', 'Recreate the session to generate a new session ID when the customer logs on or creates an account (PHP >=4.1 needed).', 15, 7, NULL, '2005-03-28 17:23:41', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (143, 'Store Name', 'STORE_NAME', 'osCommerce', 'The name of my store', 1, 1, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (144, 'Store Owner', 'STORE_OWNER', 'Harald Ponce de Leon', 'The name of my store owner', 1, 2, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (145, 'E-Mail Address', 'STORE_OWNER_EMAIL_ADDRESS', 'root@localhost', 'The e-mail address of my store owner', 1, 3, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (146, 'E-Mail From', 'EMAIL_FROM', 'osCommerce <root@localhost>', 'The e-mail address used in (sent) e-mails', 1, 4, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (147, 'Country', 'STORE_COUNTRY', '223', 'The country my store is located in <br><br><b>Note: Please remember to update the store zone.</b>', 1, 6, NULL, '2005-04-01 16:41:03', 'tep_get_country_name', 'tep_cfg_pull_down_country_list(');
INSERT INTO configuration VALUES (148, 'Zone', 'STORE_ZONE', '18', 'The zone my store is located in', 1, 7, NULL, '2005-04-01 16:41:03', 'tep_cfg_get_zone_name', 'tep_cfg_pull_down_zone_list(');
INSERT INTO configuration VALUES (149, 'Expected Sort Order', 'EXPECTED_PRODUCTS_SORT', 'desc', 'This is the sort order used in the expected products box.', 1, 8, NULL, '2005-04-01 16:41:03', NULL, 'tep_cfg_select_option(array(\'asc\', \'desc\'),');
INSERT INTO configuration VALUES (150, 'Expected Sort Field', 'EXPECTED_PRODUCTS_FIELD', 'date_expected', 'The column to sort by in the expected products box.', 1, 9, NULL, '2005-04-01 16:41:03', NULL, 'tep_cfg_select_option(array(\'products_name\', \'date_expected\'),');
INSERT INTO configuration VALUES (151, 'Switch To Default Language Currency', 'USE_DEFAULT_LANGUAGE_CURRENCY', 'false', 'Automatically switch to the language\'s currency when it is changed', 1, 10, NULL, '2005-04-01 16:41:03', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (152, 'Send Extra Order Emails To', 'SEND_EXTRA_ORDER_EMAILS_TO', '', 'Send extra order emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 1, 11, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (153, 'Use Search-Engine Safe URLs (still in development)', 'SEARCH_ENGINE_FRIENDLY_URLS', 'false', 'Use search-engine safe urls for all site links', 1, 12, NULL, '2005-04-01 16:41:03', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (154, 'Display Cart After Adding Product', 'DISPLAY_CART', 'true', 'Display the shopping cart after adding a product (or return back to their origin)', 1, 14, NULL, '2005-04-01 16:41:03', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (155, 'Allow Guest To Tell A Friend', 'ALLOW_GUEST_TO_TELL_A_FRIEND', 'false', 'Allow guests to tell a friend about a product', 1, 15, NULL, '2005-04-01 16:41:03', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (156, 'Default Search Operator', 'ADVANCED_SEARCH_DEFAULT_OPERATOR', 'and', 'Default search operators', 1, 17, NULL, '2005-04-01 16:41:03', NULL, 'tep_cfg_select_option(array(\'and\', \'or\'),');
INSERT INTO configuration VALUES (157, 'Store Address and Phone', 'STORE_NAME_ADDRESS', 'Store Name\nAddress\nCountry\nPhone', 'This is the Store Name, Address and Phone used on printable documents and displayed online', 1, 18, NULL, '2005-04-01 16:41:03', NULL, 'tep_cfg_textarea(');
INSERT INTO configuration VALUES (158, 'Show Category Counts', 'SHOW_COUNTS', 'true', 'Count recursively how many products are in each category', 1, 19, NULL, '2005-04-01 16:41:03', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (159, 'Tax Decimal Places', 'TAX_DECIMAL_PLACES', '0', 'Pad the tax value this amount of decimal places', 1, 20, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (160, 'Display Prices with Tax', 'DISPLAY_PRICE_WITH_TAX', 'false', 'Display prices with tax included (true) or add the tax at the end (false)', 1, 21, NULL, '2005-04-01 16:41:03', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (161, 'First Name', 'ENTRY_FIRST_NAME_MIN_LENGTH', '2', 'Minimum length of first name', 2, 1, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (162, 'Last Name', 'ENTRY_LAST_NAME_MIN_LENGTH', '2', 'Minimum length of last name', 2, 2, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (163, 'Date of Birth', 'ENTRY_DOB_MIN_LENGTH', '10', 'Minimum length of date of birth', 2, 3, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (164, 'E-Mail Address', 'ENTRY_EMAIL_ADDRESS_MIN_LENGTH', '6', 'Minimum length of e-mail address', 2, 4, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (165, 'Street Address', 'ENTRY_STREET_ADDRESS_MIN_LENGTH', '5', 'Minimum length of street address', 2, 5, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (166, 'Company', 'ENTRY_COMPANY_MIN_LENGTH', '2', 'Minimum length of company name', 2, 6, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (167, 'Post Code', 'ENTRY_POSTCODE_MIN_LENGTH', '4', 'Minimum length of post code', 2, 7, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (168, 'City', 'ENTRY_CITY_MIN_LENGTH', '3', 'Minimum length of city', 2, 8, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (169, 'State', 'ENTRY_STATE_MIN_LENGTH', '2', 'Minimum length of state', 2, 9, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (170, 'Telephone Number', 'ENTRY_TELEPHONE_MIN_LENGTH', '3', 'Minimum length of telephone number', 2, 10, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (171, 'Password', 'ENTRY_PASSWORD_MIN_LENGTH', '5', 'Minimum length of password', 2, 11, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (172, 'Credit Card Owner Name', 'CC_OWNER_MIN_LENGTH', '3', 'Minimum length of credit card owner name', 2, 12, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (173, 'Credit Card Number', 'CC_NUMBER_MIN_LENGTH', '10', 'Minimum length of credit card number', 2, 13, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (174, 'Review Text', 'REVIEW_TEXT_MIN_LENGTH', '50', 'Minimum length of review text', 2, 14, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (175, 'Best Sellers', 'MIN_DISPLAY_BESTSELLERS', '1', 'Minimum number of best sellers to display', 2, 15, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (176, 'Also Purchased', 'MIN_DISPLAY_ALSO_PURCHASED', '1', 'Minimum number of products to display in the \'This Customer Also Purchased\' box', 2, 16, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (177, 'Address Book Entries', 'MAX_ADDRESS_BOOK_ENTRIES', '5', 'Maximum address book entries a customer is allowed to have', 3, 1, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (178, 'Search Results', 'MAX_DISPLAY_SEARCH_RESULTS', '20', 'Amount of products to list', 3, 2, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (179, 'Page Links', 'MAX_DISPLAY_PAGE_LINKS', '5', 'Number of \'number\' links use for page-sets', 3, 3, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (180, 'Special Products', 'MAX_DISPLAY_SPECIAL_PRODUCTS', '9', 'Maximum number of products on special to display', 3, 4, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (181, 'New Products Module', 'MAX_DISPLAY_NEW_PRODUCTS', '9', 'Maximum number of new products to display in a category', 3, 5, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (182, 'Products Expected', 'MAX_DISPLAY_UPCOMING_PRODUCTS', '10', 'Maximum number of products expected to display', 3, 6, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (183, 'Manufacturers List', 'MAX_DISPLAY_MANUFACTURERS_IN_A_LIST', '0', 'Used in manufacturers box; when the number of manufacturers exceeds this number, a drop-down list will be displayed instead of the default list', 3, 7, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (184, 'Manufacturers Select Size', 'MAX_MANUFACTURERS_LIST', '1', 'Used in manufacturers box; when this value is \'1\' the classic drop-down list will be used for the manufacturers box. Otherwise, a list-box with the specified number of rows will be displayed.', 3, 7, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (185, 'Length of Manufacturers Name', 'MAX_DISPLAY_MANUFACTURER_NAME_LEN', '15', 'Used in manufacturers box; maximum length of manufacturers name to display', 3, 8, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (186, 'New Reviews', 'MAX_DISPLAY_NEW_REVIEWS', '6', 'Maximum number of new reviews to display', 3, 9, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (187, 'Selection of Random Reviews', 'MAX_RANDOM_SELECT_REVIEWS', '10', 'How many records to select from to choose one random product review', 3, 10, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (188, 'Selection of Random New Products', 'MAX_RANDOM_SELECT_NEW', '10', 'How many records to select from to choose one random new product to display', 3, 11, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (189, 'Selection of Products on Special', 'MAX_RANDOM_SELECT_SPECIALS', '10', 'How many records to select from to choose one random product special to display', 3, 12, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (190, 'Categories To List Per Row', 'MAX_DISPLAY_CATEGORIES_PER_ROW', '3', 'How many categories to list per row', 3, 13, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (191, 'New Products Listing', 'MAX_DISPLAY_PRODUCTS_NEW', '10', 'Maximum number of new products to display in new products page', 3, 14, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (192, 'Best Sellers', 'MAX_DISPLAY_BESTSELLERS', '10', 'Maximum number of best sellers to display', 3, 15, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (193, 'Also Purchased', 'MAX_DISPLAY_ALSO_PURCHASED', '6', 'Maximum number of products to display in the \'This Customer Also Purchased\' box', 3, 16, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (194, 'Customer Order History Box', 'MAX_DISPLAY_PRODUCTS_IN_ORDER_HISTORY_BOX', '6', 'Maximum number of products to display in the customer order history box', 3, 17, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (195, 'Order History', 'MAX_DISPLAY_ORDER_HISTORY', '10', 'Maximum number of orders to display in the order history page', 3, 18, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (196, 'Small Image Width', 'SMALL_IMAGE_WIDTH', '100', 'The pixel width of small images', 4, 1, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (197, 'Small Image Height', 'SMALL_IMAGE_HEIGHT', '80', 'The pixel height of small images', 4, 2, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (198, 'Heading Image Width', 'HEADING_IMAGE_WIDTH', '57', 'The pixel width of heading images', 4, 3, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (199, 'Heading Image Height', 'HEADING_IMAGE_HEIGHT', '40', 'The pixel height of heading images', 4, 4, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (200, 'Subcategory Image Width', 'SUBCATEGORY_IMAGE_WIDTH', '100', 'The pixel width of subcategory images', 4, 5, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (201, 'Subcategory Image Height', 'SUBCATEGORY_IMAGE_HEIGHT', '57', 'The pixel height of subcategory images', 4, 6, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (202, 'Calculate Image Size', 'CONFIG_CALCULATE_IMAGE_SIZE', 'true', 'Calculate the size of images?', 4, 7, NULL, '2005-04-01 16:41:03', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (203, 'Image Required', 'IMAGE_REQUIRED', 'true', 'Enable to display broken images. Good for development.', 4, 8, NULL, '2005-04-01 16:41:03', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (204, 'Gender', 'ACCOUNT_GENDER', 'true', 'Display gender in the customers account', 5, 1, NULL, '2005-04-01 16:41:03', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (205, 'Date of Birth', 'ACCOUNT_DOB', 'true', 'Display date of birth in the customers account', 5, 2, NULL, '2005-04-01 16:41:03', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (206, 'Company', 'ACCOUNT_COMPANY', 'true', 'Display company in the customers account', 5, 3, NULL, '2005-04-01 16:41:03', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (207, 'Suburb', 'ACCOUNT_SUBURB', 'true', 'Display suburb in the customers account', 5, 4, NULL, '2005-04-01 16:41:03', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (208, 'State', 'ACCOUNT_STATE', 'true', 'Display state in the customers account', 5, 5, NULL, '2005-04-01 16:41:03', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (209, 'Installed Modules', 'MODULE_PAYMENT_INSTALLED', 'cc.php;cod.php', 'List of payment module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: cc.php;cod.php;paypal.php)', 6, 0, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (210, 'Installed Modules', 'MODULE_ORDER_TOTAL_INSTALLED', 'ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php', 'List of order_total module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php)', 6, 0, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (211, 'Installed Modules', 'MODULE_SHIPPING_INSTALLED', 'flat.php', 'List of shipping module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ups.php;flat.php;item.php)', 6, 0, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (212, 'Enable Cash On Delivery Module', 'MODULE_PAYMENT_COD_STATUS', 'True', 'Do you want to accept Cash On Delevery payments?', 6, 1, NULL, '2005-04-01 16:41:03', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (213, 'Payment Zone', 'MODULE_PAYMENT_COD_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', 6, 2, NULL, '2005-04-01 16:41:03', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes(');
INSERT INTO configuration VALUES (214, 'Sort order of display.', 'MODULE_PAYMENT_COD_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (215, 'Set Order Status', 'MODULE_PAYMENT_COD_ORDER_STATUS_ID', '0', 'Set the status of orders made with this payment module to this value', 6, 0, NULL, '2005-04-01 16:41:03', 'tep_get_order_status_name', 'tep_cfg_pull_down_order_statuses(');
INSERT INTO configuration VALUES (216, 'Enable Credit Card Module', 'MODULE_PAYMENT_CC_STATUS', 'True', 'Do you want to accept credit card payments?', 6, 0, NULL, '2005-04-01 16:41:03', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (217, 'Split Credit Card E-Mail Address', 'MODULE_PAYMENT_CC_EMAIL', '', 'If an e-mail address is entered, the middle digits of the credit card number will be sent to the e-mail address (the outside digits are stored in the database with the middle digits censored)', 6, 0, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (218, 'Sort order of display.', 'MODULE_PAYMENT_CC_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (219, 'Payment Zone', 'MODULE_PAYMENT_CC_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', 6, 2, NULL, '2005-04-01 16:41:03', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes(');
INSERT INTO configuration VALUES (220, 'Set Order Status', 'MODULE_PAYMENT_CC_ORDER_STATUS_ID', '0', 'Set the status of orders made with this payment module to this value', 6, 0, NULL, '2005-04-01 16:41:03', 'tep_get_order_status_name', 'tep_cfg_pull_down_order_statuses(');
INSERT INTO configuration VALUES (221, 'Enable Flat Shipping', 'MODULE_SHIPPING_FLAT_STATUS', 'True', 'Do you want to offer flat rate shipping?', 6, 0, NULL, '2005-04-01 16:41:03', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (222, 'Shipping Cost', 'MODULE_SHIPPING_FLAT_COST', '5.00', 'The shipping cost for all orders using this shipping method.', 6, 0, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (223, 'Tax Class', 'MODULE_SHIPPING_FLAT_TAX_CLASS', '0', 'Use the following tax class on the shipping fee.', 6, 0, NULL, '2005-04-01 16:41:03', 'tep_get_tax_class_title', 'tep_cfg_pull_down_tax_classes(');
INSERT INTO configuration VALUES (224, 'Shipping Zone', 'MODULE_SHIPPING_FLAT_ZONE', '0', 'If a zone is selected, only enable this shipping method for that zone.', 6, 0, NULL, '2005-04-01 16:41:03', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes(');
INSERT INTO configuration VALUES (225, 'Sort Order', 'MODULE_SHIPPING_FLAT_SORT_ORDER', '0', 'Sort order of display.', 6, 0, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (226, 'Default Currency', 'DEFAULT_CURRENCY', 'USD', 'Default Currency', 6, 0, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (227, 'Default Language', 'DEFAULT_LANGUAGE', 'en', 'Default Language', 6, 0, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (228, 'Default Order Status For New Orders', 'DEFAULT_ORDERS_STATUS_ID', '1', 'When a new order is created, this order status will be assigned to it.', 6, 0, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (229, 'Display Shipping', 'MODULE_ORDER_TOTAL_SHIPPING_STATUS', 'true', 'Do you want to display the order shipping cost?', 6, 1, NULL, '2005-04-01 16:41:03', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (230, 'Sort Order', 'MODULE_ORDER_TOTAL_SHIPPING_SORT_ORDER', '2', 'Sort order of display.', 6, 2, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (231, 'Allow Free Shipping', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING', 'false', 'Do you want to allow free shipping?', 6, 3, NULL, '2005-04-01 16:41:03', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (232, 'Free Shipping For Orders Over', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING_OVER', '50', 'Provide free shipping for orders over the set amount.', 6, 4, NULL, '2005-04-01 16:41:03', 'currencies->format', NULL);
INSERT INTO configuration VALUES (233, 'Provide Free Shipping For Orders Made', 'MODULE_ORDER_TOTAL_SHIPPING_DESTINATION', 'national', 'Provide free shipping for orders sent to the set destination.', 6, 5, NULL, '2005-04-01 16:41:03', NULL, 'tep_cfg_select_option(array(\'national\', \'international\', \'both\'),');
INSERT INTO configuration VALUES (234, 'Display Sub-Total', 'MODULE_ORDER_TOTAL_SUBTOTAL_STATUS', 'true', 'Do you want to display the order sub-total cost?', 6, 1, NULL, '2005-04-01 16:41:03', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (235, 'Sort Order', 'MODULE_ORDER_TOTAL_SUBTOTAL_SORT_ORDER', '1', 'Sort order of display.', 6, 2, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (236, 'Display Tax', 'MODULE_ORDER_TOTAL_TAX_STATUS', 'true', 'Do you want to display the order tax value?', 6, 1, NULL, '2005-04-01 16:41:03', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (237, 'Sort Order', 'MODULE_ORDER_TOTAL_TAX_SORT_ORDER', '3', 'Sort order of display.', 6, 2, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (238, 'Display Total', 'MODULE_ORDER_TOTAL_TOTAL_STATUS', 'true', 'Do you want to display the total order value?', 6, 1, NULL, '2005-04-01 16:41:03', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (239, 'Sort Order', 'MODULE_ORDER_TOTAL_TOTAL_SORT_ORDER', '4', 'Sort order of display.', 6, 2, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (240, 'Country of Origin', 'SHIPPING_ORIGIN_COUNTRY', '223', 'Select the country of origin to be used in shipping quotes.', 7, 1, NULL, '2005-04-01 16:41:03', 'tep_get_country_name', 'tep_cfg_pull_down_country_list(');
INSERT INTO configuration VALUES (241, 'Postal Code', 'SHIPPING_ORIGIN_ZIP', 'NONE', 'Enter the Postal Code (ZIP) of the Store to be used in shipping quotes.', 7, 2, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (242, 'Enter the Maximum Package Weight you will ship', 'SHIPPING_MAX_WEIGHT', '50', 'Carriers have a max weight limit for a single package. This is a common one for all.', 7, 3, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (243, 'Package Tare weight.', 'SHIPPING_BOX_WEIGHT', '3', 'What is the weight of typical packaging of small to medium packages?', 7, 4, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (244, 'Larger packages - percentage increase.', 'SHIPPING_BOX_PADDING', '10', 'For 10% enter 10', 7, 5, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (245, 'Display Product Image', 'PRODUCT_LIST_IMAGE', '1', 'Do you want to display the Product Image?', 8, 1, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (246, 'Display Product Manufaturer Name', 'PRODUCT_LIST_MANUFACTURER', '0', 'Do you want to display the Product Manufacturer Name?', 8, 2, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (247, 'Display Product Model', 'PRODUCT_LIST_MODEL', '0', 'Do you want to display the Product Model?', 8, 3, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (248, 'Display Product Name', 'PRODUCT_LIST_NAME', '2', 'Do you want to display the Product Name?', 8, 4, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (249, 'Display Product Price', 'PRODUCT_LIST_PRICE', '3', 'Do you want to display the Product Price', 8, 5, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (250, 'Display Product Quantity', 'PRODUCT_LIST_QUANTITY', '0', 'Do you want to display the Product Quantity?', 8, 6, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (251, 'Display Product Weight', 'PRODUCT_LIST_WEIGHT', '0', 'Do you want to display the Product Weight?', 8, 7, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (252, 'Display Buy Now column', 'PRODUCT_LIST_BUY_NOW', '4', 'Do you want to display the Buy Now column?', 8, 8, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (253, 'Display Category/Manufacturer Filter (0=disable; 1=enable)', 'PRODUCT_LIST_FILTER', '1', 'Do you want to display the Category/Manufacturer Filter?', 8, 9, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (254, 'Location of Prev/Next Navigation Bar (1-top, 2-bottom, 3-both)', 'PREV_NEXT_BAR_LOCATION', '2', 'Sets the location of the Prev/Next Navigation Bar (1-top, 2-bottom, 3-both)', 8, 10, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (255, 'Check stock level', 'STOCK_CHECK', 'true', 'Check to see if sufficent stock is available', 9, 1, NULL, '2005-04-01 16:41:03', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (256, 'Subtract stock', 'STOCK_LIMITED', 'true', 'Subtract product in stock by product orders', 9, 2, NULL, '2005-04-01 16:41:03', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (257, 'Allow Checkout', 'STOCK_ALLOW_CHECKOUT', 'true', 'Allow customer to checkout even if there is insufficient stock', 9, 3, NULL, '2005-04-01 16:41:03', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (258, 'Mark product out of stock', 'STOCK_MARK_PRODUCT_OUT_OF_STOCK', '***', 'Display something on screen so customer can see which product has insufficient stock', 9, 4, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (259, 'Stock Re-order level', 'STOCK_REORDER_LEVEL', '5', 'Define when stock needs to be re-ordered', 9, 5, NULL, '2005-04-01 16:41:03', NULL, NULL);
INSERT INTO configuration VALUES (260, 'Store Page Parse Time', 'STORE_PAGE_PARSE_TIME', 'false', 'Store the time it takes to parse a page', 10, 1, NULL, '2005-04-01 16:41:03', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (261, 'Log Destination', 'STORE_PAGE_PARSE_TIME_LOG', '/var/log/www/tep/page_parse_time.log', 'Directory and filename of the page parse time log', 10, 2, NULL, '2005-04-01 16:41:04', NULL, NULL);
INSERT INTO configuration VALUES (262, 'Log Date Format', 'STORE_PARSE_DATE_TIME_FORMAT', '%d/%m/%Y %H:%M:%S', 'The date format', 10, 3, NULL, '2005-04-01 16:41:04', NULL, NULL);
INSERT INTO configuration VALUES (263, 'Display The Page Parse Time', 'DISPLAY_PAGE_PARSE_TIME', 'true', 'Display the page parse time (store page parse time must be enabled)', 10, 4, NULL, '2005-04-01 16:41:04', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (264, 'Store Database Queries', 'STORE_DB_TRANSACTIONS', 'false', 'Store the database queries in the page parse time log (PHP4 only)', 10, 5, NULL, '2005-04-01 16:41:04', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (265, 'Use Cache', 'USE_CACHE', 'false', 'Use caching features', 11, 1, NULL, '2005-04-01 16:41:04', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (266, 'Cache Directory', 'DIR_FS_CACHE', '/tmp/', 'The directory where the cached files are saved', 11, 2, NULL, '2005-04-01 16:41:04', NULL, NULL);
INSERT INTO configuration VALUES (267, 'E-Mail Transport Method', 'EMAIL_TRANSPORT', 'sendmail', 'Defines if this server uses a local connection to sendmail or uses an SMTP connection via TCP/IP. Servers running on Windows and MacOS should change this setting to SMTP.', 12, 1, NULL, '2005-04-01 16:41:04', NULL, 'tep_cfg_select_option(array(\'sendmail\', \'smtp\'),');
INSERT INTO configuration VALUES (268, 'E-Mail Linefeeds', 'EMAIL_LINEFEED', 'LF', 'Defines the character sequence used to separate mail headers.', 12, 2, NULL, '2005-04-01 16:41:04', NULL, 'tep_cfg_select_option(array(\'LF\', \'CRLF\'),');
INSERT INTO configuration VALUES (269, 'Use MIME HTML When Sending Emails', 'EMAIL_USE_HTML', 'false', 'Send e-mails in HTML format', 12, 3, NULL, '2005-04-01 16:41:04', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (270, 'Verify E-Mail Addresses Through DNS', 'ENTRY_EMAIL_ADDRESS_CHECK', 'false', 'Verify e-mail address through a DNS server', 12, 4, NULL, '2005-04-01 16:41:04', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (271, 'Send E-Mails', 'SEND_EMAILS', 'true', 'Send out e-mails', 12, 5, NULL, '2005-04-01 16:41:04', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (272, 'Enable download', 'DOWNLOAD_ENABLED', 'false', 'Enable the products download functions.', 13, 1, NULL, '2005-04-01 16:41:04', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (273, 'Download by redirect', 'DOWNLOAD_BY_REDIRECT', 'false', 'Use browser redirection for download. Disable on non-Unix systems.', 13, 2, NULL, '2005-04-01 16:41:04', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (274, 'Expiry delay (days)', 'DOWNLOAD_MAX_DAYS', '7', 'Set number of days before the download link expires. 0 means no limit.', 13, 3, NULL, '2005-04-01 16:41:04', NULL, '');
INSERT INTO configuration VALUES (275, 'Maximum number of downloads', 'DOWNLOAD_MAX_COUNT', '5', 'Set the maximum number of downloads. 0 means no download authorized.', 13, 4, NULL, '2005-04-01 16:41:04', NULL, '');
INSERT INTO configuration VALUES (276, 'Enable GZip Compression', 'GZIP_COMPRESSION', 'false', 'Enable HTTP GZip compression.', 14, 1, NULL, '2005-04-01 16:41:04', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (277, 'Compression Level', 'GZIP_LEVEL', '5', 'Use this compression level 0-9 (0 = minimum, 9 = maximum).', 14, 2, NULL, '2005-04-01 16:41:04', NULL, NULL);
INSERT INTO configuration VALUES (278, 'Session Directory', 'SESSION_WRITE_DIRECTORY', '/tmp', 'If sessions are file based, store them in this directory.', 15, 1, NULL, '2005-04-01 16:41:04', NULL, NULL);
INSERT INTO configuration VALUES (279, 'Force Cookie Use', 'SESSION_FORCE_COOKIE_USE', 'False', 'Force the use of sessions when cookies are only enabled.', 15, 2, NULL, '2005-04-01 16:41:04', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (280, 'Check SSL Session ID', 'SESSION_CHECK_SSL_SESSION_ID', 'False', 'Validate the SSL_SESSION_ID on every secure HTTPS page request.', 15, 3, NULL, '2005-04-01 16:41:04', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (281, 'Check User Agent', 'SESSION_CHECK_USER_AGENT', 'False', 'Validate the clients browser user agent on every page request.', 15, 4, NULL, '2005-04-01 16:41:04', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (282, 'Check IP Address', 'SESSION_CHECK_IP_ADDRESS', 'False', 'Validate the clients IP address on every page request.', 15, 5, NULL, '2005-04-01 16:41:04', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (283, 'Prevent Spider Sessions', 'SESSION_BLOCK_SPIDERS', 'False', 'Prevent known spiders from starting a session.', 15, 6, NULL, '2005-04-01 16:41:04', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (284, 'Recreate Session', 'SESSION_RECREATE', 'False', 'Recreate the session to generate a new session ID when the customer logs on or creates an account (PHP >=4.1 needed).', 15, 7, NULL, '2005-04-01 16:41:04', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (285, 'Store Name', 'STORE_NAME', 'osCommerce', 'The name of my store', 1, 1, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (286, 'Store Owner', 'STORE_OWNER', 'Harald Ponce de Leon', 'The name of my store owner', 1, 2, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (287, 'E-Mail Address', 'STORE_OWNER_EMAIL_ADDRESS', 'root@localhost', 'The e-mail address of my store owner', 1, 3, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (288, 'E-Mail From', 'EMAIL_FROM', 'osCommerce <root@localhost>', 'The e-mail address used in (sent) e-mails', 1, 4, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (289, 'Country', 'STORE_COUNTRY', '223', 'The country my store is located in <br><br><b>Note: Please remember to update the store zone.</b>', 1, 6, NULL, '2005-04-01 17:10:36', 'tep_get_country_name', 'tep_cfg_pull_down_country_list(');
INSERT INTO configuration VALUES (290, 'Zone', 'STORE_ZONE', '18', 'The zone my store is located in', 1, 7, NULL, '2005-04-01 17:10:36', 'tep_cfg_get_zone_name', 'tep_cfg_pull_down_zone_list(');
INSERT INTO configuration VALUES (291, 'Expected Sort Order', 'EXPECTED_PRODUCTS_SORT', 'desc', 'This is the sort order used in the expected products box.', 1, 8, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_select_option(array(\'asc\', \'desc\'),');
INSERT INTO configuration VALUES (292, 'Expected Sort Field', 'EXPECTED_PRODUCTS_FIELD', 'date_expected', 'The column to sort by in the expected products box.', 1, 9, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_select_option(array(\'products_name\', \'date_expected\'),');
INSERT INTO configuration VALUES (293, 'Switch To Default Language Currency', 'USE_DEFAULT_LANGUAGE_CURRENCY', 'false', 'Automatically switch to the language\'s currency when it is changed', 1, 10, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (294, 'Send Extra Order Emails To', 'SEND_EXTRA_ORDER_EMAILS_TO', '', 'Send extra order emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 1, 11, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (295, 'Use Search-Engine Safe URLs (still in development)', 'SEARCH_ENGINE_FRIENDLY_URLS', 'false', 'Use search-engine safe urls for all site links', 1, 12, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (296, 'Display Cart After Adding Product', 'DISPLAY_CART', 'true', 'Display the shopping cart after adding a product (or return back to their origin)', 1, 14, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (297, 'Allow Guest To Tell A Friend', 'ALLOW_GUEST_TO_TELL_A_FRIEND', 'false', 'Allow guests to tell a friend about a product', 1, 15, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (298, 'Default Search Operator', 'ADVANCED_SEARCH_DEFAULT_OPERATOR', 'and', 'Default search operators', 1, 17, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_select_option(array(\'and\', \'or\'),');
INSERT INTO configuration VALUES (299, 'Store Address and Phone', 'STORE_NAME_ADDRESS', 'Store Name\nAddress\nCountry\nPhone', 'This is the Store Name, Address and Phone used on printable documents and displayed online', 1, 18, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_textarea(');
INSERT INTO configuration VALUES (300, 'Show Category Counts', 'SHOW_COUNTS', 'true', 'Count recursively how many products are in each category', 1, 19, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (301, 'Tax Decimal Places', 'TAX_DECIMAL_PLACES', '0', 'Pad the tax value this amount of decimal places', 1, 20, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (302, 'Display Prices with Tax', 'DISPLAY_PRICE_WITH_TAX', 'false', 'Display prices with tax included (true) or add the tax at the end (false)', 1, 21, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (303, 'First Name', 'ENTRY_FIRST_NAME_MIN_LENGTH', '2', 'Minimum length of first name', 2, 1, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (304, 'Last Name', 'ENTRY_LAST_NAME_MIN_LENGTH', '2', 'Minimum length of last name', 2, 2, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (305, 'Date of Birth', 'ENTRY_DOB_MIN_LENGTH', '10', 'Minimum length of date of birth', 2, 3, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (306, 'E-Mail Address', 'ENTRY_EMAIL_ADDRESS_MIN_LENGTH', '6', 'Minimum length of e-mail address', 2, 4, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (307, 'Street Address', 'ENTRY_STREET_ADDRESS_MIN_LENGTH', '5', 'Minimum length of street address', 2, 5, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (308, 'Company', 'ENTRY_COMPANY_MIN_LENGTH', '2', 'Minimum length of company name', 2, 6, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (309, 'Post Code', 'ENTRY_POSTCODE_MIN_LENGTH', '4', 'Minimum length of post code', 2, 7, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (310, 'City', 'ENTRY_CITY_MIN_LENGTH', '3', 'Minimum length of city', 2, 8, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (311, 'State', 'ENTRY_STATE_MIN_LENGTH', '2', 'Minimum length of state', 2, 9, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (312, 'Telephone Number', 'ENTRY_TELEPHONE_MIN_LENGTH', '3', 'Minimum length of telephone number', 2, 10, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (313, 'Password', 'ENTRY_PASSWORD_MIN_LENGTH', '5', 'Minimum length of password', 2, 11, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (314, 'Credit Card Owner Name', 'CC_OWNER_MIN_LENGTH', '3', 'Minimum length of credit card owner name', 2, 12, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (315, 'Credit Card Number', 'CC_NUMBER_MIN_LENGTH', '10', 'Minimum length of credit card number', 2, 13, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (316, 'Review Text', 'REVIEW_TEXT_MIN_LENGTH', '50', 'Minimum length of review text', 2, 14, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (317, 'Best Sellers', 'MIN_DISPLAY_BESTSELLERS', '1', 'Minimum number of best sellers to display', 2, 15, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (318, 'Also Purchased', 'MIN_DISPLAY_ALSO_PURCHASED', '1', 'Minimum number of products to display in the \'This Customer Also Purchased\' box', 2, 16, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (319, 'Address Book Entries', 'MAX_ADDRESS_BOOK_ENTRIES', '5', 'Maximum address book entries a customer is allowed to have', 3, 1, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (320, 'Search Results', 'MAX_DISPLAY_SEARCH_RESULTS', '20', 'Amount of products to list', 3, 2, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (321, 'Page Links', 'MAX_DISPLAY_PAGE_LINKS', '5', 'Number of \'number\' links use for page-sets', 3, 3, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (322, 'Special Products', 'MAX_DISPLAY_SPECIAL_PRODUCTS', '9', 'Maximum number of products on special to display', 3, 4, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (323, 'New Products Module', 'MAX_DISPLAY_NEW_PRODUCTS', '9', 'Maximum number of new products to display in a category', 3, 5, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (324, 'Products Expected', 'MAX_DISPLAY_UPCOMING_PRODUCTS', '10', 'Maximum number of products expected to display', 3, 6, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (325, 'Manufacturers List', 'MAX_DISPLAY_MANUFACTURERS_IN_A_LIST', '0', 'Used in manufacturers box; when the number of manufacturers exceeds this number, a drop-down list will be displayed instead of the default list', 3, 7, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (326, 'Manufacturers Select Size', 'MAX_MANUFACTURERS_LIST', '1', 'Used in manufacturers box; when this value is \'1\' the classic drop-down list will be used for the manufacturers box. Otherwise, a list-box with the specified number of rows will be displayed.', 3, 7, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (327, 'Length of Manufacturers Name', 'MAX_DISPLAY_MANUFACTURER_NAME_LEN', '15', 'Used in manufacturers box; maximum length of manufacturers name to display', 3, 8, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (328, 'New Reviews', 'MAX_DISPLAY_NEW_REVIEWS', '6', 'Maximum number of new reviews to display', 3, 9, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (329, 'Selection of Random Reviews', 'MAX_RANDOM_SELECT_REVIEWS', '10', 'How many records to select from to choose one random product review', 3, 10, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (330, 'Selection of Random New Products', 'MAX_RANDOM_SELECT_NEW', '10', 'How many records to select from to choose one random new product to display', 3, 11, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (331, 'Selection of Products on Special', 'MAX_RANDOM_SELECT_SPECIALS', '10', 'How many records to select from to choose one random product special to display', 3, 12, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (332, 'Categories To List Per Row', 'MAX_DISPLAY_CATEGORIES_PER_ROW', '3', 'How many categories to list per row', 3, 13, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (333, 'New Products Listing', 'MAX_DISPLAY_PRODUCTS_NEW', '10', 'Maximum number of new products to display in new products page', 3, 14, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (334, 'Best Sellers', 'MAX_DISPLAY_BESTSELLERS', '10', 'Maximum number of best sellers to display', 3, 15, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (335, 'Also Purchased', 'MAX_DISPLAY_ALSO_PURCHASED', '6', 'Maximum number of products to display in the \'This Customer Also Purchased\' box', 3, 16, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (336, 'Customer Order History Box', 'MAX_DISPLAY_PRODUCTS_IN_ORDER_HISTORY_BOX', '6', 'Maximum number of products to display in the customer order history box', 3, 17, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (337, 'Order History', 'MAX_DISPLAY_ORDER_HISTORY', '10', 'Maximum number of orders to display in the order history page', 3, 18, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (338, 'Small Image Width', 'SMALL_IMAGE_WIDTH', '100', 'The pixel width of small images', 4, 1, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (339, 'Small Image Height', 'SMALL_IMAGE_HEIGHT', '80', 'The pixel height of small images', 4, 2, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (340, 'Heading Image Width', 'HEADING_IMAGE_WIDTH', '57', 'The pixel width of heading images', 4, 3, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (341, 'Heading Image Height', 'HEADING_IMAGE_HEIGHT', '40', 'The pixel height of heading images', 4, 4, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (342, 'Subcategory Image Width', 'SUBCATEGORY_IMAGE_WIDTH', '100', 'The pixel width of subcategory images', 4, 5, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (343, 'Subcategory Image Height', 'SUBCATEGORY_IMAGE_HEIGHT', '57', 'The pixel height of subcategory images', 4, 6, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (344, 'Calculate Image Size', 'CONFIG_CALCULATE_IMAGE_SIZE', 'true', 'Calculate the size of images?', 4, 7, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (345, 'Image Required', 'IMAGE_REQUIRED', 'true', 'Enable to display broken images. Good for development.', 4, 8, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (346, 'Gender', 'ACCOUNT_GENDER', 'true', 'Display gender in the customers account', 5, 1, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (347, 'Date of Birth', 'ACCOUNT_DOB', 'true', 'Display date of birth in the customers account', 5, 2, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (348, 'Company', 'ACCOUNT_COMPANY', 'true', 'Display company in the customers account', 5, 3, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (349, 'Suburb', 'ACCOUNT_SUBURB', 'true', 'Display suburb in the customers account', 5, 4, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (350, 'State', 'ACCOUNT_STATE', 'true', 'Display state in the customers account', 5, 5, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (351, 'Installed Modules', 'MODULE_PAYMENT_INSTALLED', 'cc.php;cod.php', 'List of payment module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: cc.php;cod.php;paypal.php)', 6, 0, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (352, 'Installed Modules', 'MODULE_ORDER_TOTAL_INSTALLED', 'ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php', 'List of order_total module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php)', 6, 0, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (353, 'Installed Modules', 'MODULE_SHIPPING_INSTALLED', 'flat.php', 'List of shipping module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ups.php;flat.php;item.php)', 6, 0, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (354, 'Enable Cash On Delivery Module', 'MODULE_PAYMENT_COD_STATUS', 'True', 'Do you want to accept Cash On Delevery payments?', 6, 1, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (355, 'Payment Zone', 'MODULE_PAYMENT_COD_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', 6, 2, NULL, '2005-04-01 17:10:36', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes(');
INSERT INTO configuration VALUES (356, 'Sort order of display.', 'MODULE_PAYMENT_COD_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (357, 'Set Order Status', 'MODULE_PAYMENT_COD_ORDER_STATUS_ID', '0', 'Set the status of orders made with this payment module to this value', 6, 0, NULL, '2005-04-01 17:10:36', 'tep_get_order_status_name', 'tep_cfg_pull_down_order_statuses(');
INSERT INTO configuration VALUES (358, 'Enable Credit Card Module', 'MODULE_PAYMENT_CC_STATUS', 'True', 'Do you want to accept credit card payments?', 6, 0, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (359, 'Split Credit Card E-Mail Address', 'MODULE_PAYMENT_CC_EMAIL', '', 'If an e-mail address is entered, the middle digits of the credit card number will be sent to the e-mail address (the outside digits are stored in the database with the middle digits censored)', 6, 0, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (360, 'Sort order of display.', 'MODULE_PAYMENT_CC_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (361, 'Payment Zone', 'MODULE_PAYMENT_CC_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', 6, 2, NULL, '2005-04-01 17:10:36', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes(');
INSERT INTO configuration VALUES (362, 'Set Order Status', 'MODULE_PAYMENT_CC_ORDER_STATUS_ID', '0', 'Set the status of orders made with this payment module to this value', 6, 0, NULL, '2005-04-01 17:10:36', 'tep_get_order_status_name', 'tep_cfg_pull_down_order_statuses(');
INSERT INTO configuration VALUES (363, 'Enable Flat Shipping', 'MODULE_SHIPPING_FLAT_STATUS', 'True', 'Do you want to offer flat rate shipping?', 6, 0, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (364, 'Shipping Cost', 'MODULE_SHIPPING_FLAT_COST', '5.00', 'The shipping cost for all orders using this shipping method.', 6, 0, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (365, 'Tax Class', 'MODULE_SHIPPING_FLAT_TAX_CLASS', '0', 'Use the following tax class on the shipping fee.', 6, 0, NULL, '2005-04-01 17:10:36', 'tep_get_tax_class_title', 'tep_cfg_pull_down_tax_classes(');
INSERT INTO configuration VALUES (366, 'Shipping Zone', 'MODULE_SHIPPING_FLAT_ZONE', '0', 'If a zone is selected, only enable this shipping method for that zone.', 6, 0, NULL, '2005-04-01 17:10:36', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes(');
INSERT INTO configuration VALUES (367, 'Sort Order', 'MODULE_SHIPPING_FLAT_SORT_ORDER', '0', 'Sort order of display.', 6, 0, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (368, 'Default Currency', 'DEFAULT_CURRENCY', 'USD', 'Default Currency', 6, 0, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (369, 'Default Language', 'DEFAULT_LANGUAGE', 'en', 'Default Language', 6, 0, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (370, 'Default Order Status For New Orders', 'DEFAULT_ORDERS_STATUS_ID', '1', 'When a new order is created, this order status will be assigned to it.', 6, 0, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (371, 'Display Shipping', 'MODULE_ORDER_TOTAL_SHIPPING_STATUS', 'true', 'Do you want to display the order shipping cost?', 6, 1, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (372, 'Sort Order', 'MODULE_ORDER_TOTAL_SHIPPING_SORT_ORDER', '2', 'Sort order of display.', 6, 2, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (373, 'Allow Free Shipping', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING', 'false', 'Do you want to allow free shipping?', 6, 3, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (374, 'Free Shipping For Orders Over', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING_OVER', '50', 'Provide free shipping for orders over the set amount.', 6, 4, NULL, '2005-04-01 17:10:36', 'currencies->format', NULL);
INSERT INTO configuration VALUES (375, 'Provide Free Shipping For Orders Made', 'MODULE_ORDER_TOTAL_SHIPPING_DESTINATION', 'national', 'Provide free shipping for orders sent to the set destination.', 6, 5, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_select_option(array(\'national\', \'international\', \'both\'),');
INSERT INTO configuration VALUES (376, 'Display Sub-Total', 'MODULE_ORDER_TOTAL_SUBTOTAL_STATUS', 'true', 'Do you want to display the order sub-total cost?', 6, 1, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (377, 'Sort Order', 'MODULE_ORDER_TOTAL_SUBTOTAL_SORT_ORDER', '1', 'Sort order of display.', 6, 2, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (378, 'Display Tax', 'MODULE_ORDER_TOTAL_TAX_STATUS', 'true', 'Do you want to display the order tax value?', 6, 1, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (379, 'Sort Order', 'MODULE_ORDER_TOTAL_TAX_SORT_ORDER', '3', 'Sort order of display.', 6, 2, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (380, 'Display Total', 'MODULE_ORDER_TOTAL_TOTAL_STATUS', 'true', 'Do you want to display the total order value?', 6, 1, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (381, 'Sort Order', 'MODULE_ORDER_TOTAL_TOTAL_SORT_ORDER', '4', 'Sort order of display.', 6, 2, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (382, 'Country of Origin', 'SHIPPING_ORIGIN_COUNTRY', '223', 'Select the country of origin to be used in shipping quotes.', 7, 1, NULL, '2005-04-01 17:10:36', 'tep_get_country_name', 'tep_cfg_pull_down_country_list(');
INSERT INTO configuration VALUES (383, 'Postal Code', 'SHIPPING_ORIGIN_ZIP', 'NONE', 'Enter the Postal Code (ZIP) of the Store to be used in shipping quotes.', 7, 2, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (384, 'Enter the Maximum Package Weight you will ship', 'SHIPPING_MAX_WEIGHT', '50', 'Carriers have a max weight limit for a single package. This is a common one for all.', 7, 3, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (385, 'Package Tare weight.', 'SHIPPING_BOX_WEIGHT', '3', 'What is the weight of typical packaging of small to medium packages?', 7, 4, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (386, 'Larger packages - percentage increase.', 'SHIPPING_BOX_PADDING', '10', 'For 10% enter 10', 7, 5, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (387, 'Display Product Image', 'PRODUCT_LIST_IMAGE', '1', 'Do you want to display the Product Image?', 8, 1, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (388, 'Display Product Manufaturer Name', 'PRODUCT_LIST_MANUFACTURER', '0', 'Do you want to display the Product Manufacturer Name?', 8, 2, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (389, 'Display Product Model', 'PRODUCT_LIST_MODEL', '0', 'Do you want to display the Product Model?', 8, 3, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (390, 'Display Product Name', 'PRODUCT_LIST_NAME', '2', 'Do you want to display the Product Name?', 8, 4, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (391, 'Display Product Price', 'PRODUCT_LIST_PRICE', '3', 'Do you want to display the Product Price', 8, 5, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (392, 'Display Product Quantity', 'PRODUCT_LIST_QUANTITY', '0', 'Do you want to display the Product Quantity?', 8, 6, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (393, 'Display Product Weight', 'PRODUCT_LIST_WEIGHT', '0', 'Do you want to display the Product Weight?', 8, 7, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (394, 'Display Buy Now column', 'PRODUCT_LIST_BUY_NOW', '4', 'Do you want to display the Buy Now column?', 8, 8, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (395, 'Display Category/Manufacturer Filter (0=disable; 1=enable)', 'PRODUCT_LIST_FILTER', '1', 'Do you want to display the Category/Manufacturer Filter?', 8, 9, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (396, 'Location of Prev/Next Navigation Bar (1-top, 2-bottom, 3-both)', 'PREV_NEXT_BAR_LOCATION', '2', 'Sets the location of the Prev/Next Navigation Bar (1-top, 2-bottom, 3-both)', 8, 10, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (397, 'Check stock level', 'STOCK_CHECK', 'true', 'Check to see if sufficent stock is available', 9, 1, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (398, 'Subtract stock', 'STOCK_LIMITED', 'true', 'Subtract product in stock by product orders', 9, 2, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (399, 'Allow Checkout', 'STOCK_ALLOW_CHECKOUT', 'true', 'Allow customer to checkout even if there is insufficient stock', 9, 3, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (400, 'Mark product out of stock', 'STOCK_MARK_PRODUCT_OUT_OF_STOCK', '***', 'Display something on screen so customer can see which product has insufficient stock', 9, 4, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (401, 'Stock Re-order level', 'STOCK_REORDER_LEVEL', '5', 'Define when stock needs to be re-ordered', 9, 5, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (402, 'Store Page Parse Time', 'STORE_PAGE_PARSE_TIME', 'false', 'Store the time it takes to parse a page', 10, 1, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (403, 'Log Destination', 'STORE_PAGE_PARSE_TIME_LOG', '/var/log/www/tep/page_parse_time.log', 'Directory and filename of the page parse time log', 10, 2, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (404, 'Log Date Format', 'STORE_PARSE_DATE_TIME_FORMAT', '%d/%m/%Y %H:%M:%S', 'The date format', 10, 3, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (405, 'Display The Page Parse Time', 'DISPLAY_PAGE_PARSE_TIME', 'true', 'Display the page parse time (store page parse time must be enabled)', 10, 4, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (406, 'Store Database Queries', 'STORE_DB_TRANSACTIONS', 'false', 'Store the database queries in the page parse time log (PHP4 only)', 10, 5, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (407, 'Use Cache', 'USE_CACHE', 'false', 'Use caching features', 11, 1, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (408, 'Cache Directory', 'DIR_FS_CACHE', '/tmp/', 'The directory where the cached files are saved', 11, 2, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (409, 'E-Mail Transport Method', 'EMAIL_TRANSPORT', 'sendmail', 'Defines if this server uses a local connection to sendmail or uses an SMTP connection via TCP/IP. Servers running on Windows and MacOS should change this setting to SMTP.', 12, 1, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_select_option(array(\'sendmail\', \'smtp\'),');
INSERT INTO configuration VALUES (410, 'E-Mail Linefeeds', 'EMAIL_LINEFEED', 'LF', 'Defines the character sequence used to separate mail headers.', 12, 2, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_select_option(array(\'LF\', \'CRLF\'),');
INSERT INTO configuration VALUES (411, 'Use MIME HTML When Sending Emails', 'EMAIL_USE_HTML', 'false', 'Send e-mails in HTML format', 12, 3, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (412, 'Verify E-Mail Addresses Through DNS', 'ENTRY_EMAIL_ADDRESS_CHECK', 'false', 'Verify e-mail address through a DNS server', 12, 4, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (413, 'Send E-Mails', 'SEND_EMAILS', 'true', 'Send out e-mails', 12, 5, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (414, 'Enable download', 'DOWNLOAD_ENABLED', 'false', 'Enable the products download functions.', 13, 1, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (415, 'Download by redirect', 'DOWNLOAD_BY_REDIRECT', 'false', 'Use browser redirection for download. Disable on non-Unix systems.', 13, 2, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (416, 'Expiry delay (days)', 'DOWNLOAD_MAX_DAYS', '7', 'Set number of days before the download link expires. 0 means no limit.', 13, 3, NULL, '2005-04-01 17:10:36', NULL, '');
INSERT INTO configuration VALUES (417, 'Maximum number of downloads', 'DOWNLOAD_MAX_COUNT', '5', 'Set the maximum number of downloads. 0 means no download authorized.', 13, 4, NULL, '2005-04-01 17:10:36', NULL, '');
INSERT INTO configuration VALUES (418, 'Enable GZip Compression', 'GZIP_COMPRESSION', 'false', 'Enable HTTP GZip compression.', 14, 1, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (419, 'Compression Level', 'GZIP_LEVEL', '5', 'Use this compression level 0-9 (0 = minimum, 9 = maximum).', 14, 2, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (420, 'Session Directory', 'SESSION_WRITE_DIRECTORY', '/tmp', 'If sessions are file based, store them in this directory.', 15, 1, NULL, '2005-04-01 17:10:36', NULL, NULL);
INSERT INTO configuration VALUES (421, 'Force Cookie Use', 'SESSION_FORCE_COOKIE_USE', 'False', 'Force the use of sessions when cookies are only enabled.', 15, 2, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (422, 'Check SSL Session ID', 'SESSION_CHECK_SSL_SESSION_ID', 'False', 'Validate the SSL_SESSION_ID on every secure HTTPS page request.', 15, 3, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (423, 'Check User Agent', 'SESSION_CHECK_USER_AGENT', 'False', 'Validate the clients browser user agent on every page request.', 15, 4, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (424, 'Check IP Address', 'SESSION_CHECK_IP_ADDRESS', 'False', 'Validate the clients IP address on every page request.', 15, 5, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (425, 'Prevent Spider Sessions', 'SESSION_BLOCK_SPIDERS', 'False', 'Prevent known spiders from starting a session.', 15, 6, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (426, 'Recreate Session', 'SESSION_RECREATE', 'False', 'Recreate the session to generate a new session ID when the customer logs on or creates an account (PHP >=4.1 needed).', 15, 7, NULL, '2005-04-01 17:10:36', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (427, 'Store Name', 'STORE_NAME', 'osCommerce', 'The name of my store', 1, 1, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (428, 'Store Owner', 'STORE_OWNER', 'Harald Ponce de Leon', 'The name of my store owner', 1, 2, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (429, 'E-Mail Address', 'STORE_OWNER_EMAIL_ADDRESS', 'root@localhost', 'The e-mail address of my store owner', 1, 3, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (430, 'E-Mail From', 'EMAIL_FROM', 'osCommerce <root@localhost>', 'The e-mail address used in (sent) e-mails', 1, 4, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (431, 'Country', 'STORE_COUNTRY', '223', 'The country my store is located in <br><br><b>Note: Please remember to update the store zone.</b>', 1, 6, NULL, '2005-04-01 18:58:00', 'tep_get_country_name', 'tep_cfg_pull_down_country_list(');
INSERT INTO configuration VALUES (432, 'Zone', 'STORE_ZONE', '18', 'The zone my store is located in', 1, 7, NULL, '2005-04-01 18:58:00', 'tep_cfg_get_zone_name', 'tep_cfg_pull_down_zone_list(');
INSERT INTO configuration VALUES (433, 'Expected Sort Order', 'EXPECTED_PRODUCTS_SORT', 'desc', 'This is the sort order used in the expected products box.', 1, 8, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_select_option(array(\'asc\', \'desc\'),');
INSERT INTO configuration VALUES (434, 'Expected Sort Field', 'EXPECTED_PRODUCTS_FIELD', 'date_expected', 'The column to sort by in the expected products box.', 1, 9, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_select_option(array(\'products_name\', \'date_expected\'),');
INSERT INTO configuration VALUES (435, 'Switch To Default Language Currency', 'USE_DEFAULT_LANGUAGE_CURRENCY', 'false', 'Automatically switch to the language\'s currency when it is changed', 1, 10, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (436, 'Send Extra Order Emails To', 'SEND_EXTRA_ORDER_EMAILS_TO', '', 'Send extra order emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 1, 11, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (437, 'Use Search-Engine Safe URLs (still in development)', 'SEARCH_ENGINE_FRIENDLY_URLS', 'false', 'Use search-engine safe urls for all site links', 1, 12, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (438, 'Display Cart After Adding Product', 'DISPLAY_CART', 'true', 'Display the shopping cart after adding a product (or return back to their origin)', 1, 14, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (439, 'Allow Guest To Tell A Friend', 'ALLOW_GUEST_TO_TELL_A_FRIEND', 'false', 'Allow guests to tell a friend about a product', 1, 15, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (440, 'Default Search Operator', 'ADVANCED_SEARCH_DEFAULT_OPERATOR', 'and', 'Default search operators', 1, 17, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_select_option(array(\'and\', \'or\'),');
INSERT INTO configuration VALUES (441, 'Store Address and Phone', 'STORE_NAME_ADDRESS', 'Store Name\nAddress\nCountry\nPhone', 'This is the Store Name, Address and Phone used on printable documents and displayed online', 1, 18, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_textarea(');
INSERT INTO configuration VALUES (442, 'Show Category Counts', 'SHOW_COUNTS', 'true', 'Count recursively how many products are in each category', 1, 19, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (443, 'Tax Decimal Places', 'TAX_DECIMAL_PLACES', '0', 'Pad the tax value this amount of decimal places', 1, 20, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (444, 'Display Prices with Tax', 'DISPLAY_PRICE_WITH_TAX', 'false', 'Display prices with tax included (true) or add the tax at the end (false)', 1, 21, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (445, 'First Name', 'ENTRY_FIRST_NAME_MIN_LENGTH', '2', 'Minimum length of first name', 2, 1, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (446, 'Last Name', 'ENTRY_LAST_NAME_MIN_LENGTH', '2', 'Minimum length of last name', 2, 2, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (447, 'Date of Birth', 'ENTRY_DOB_MIN_LENGTH', '10', 'Minimum length of date of birth', 2, 3, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (448, 'E-Mail Address', 'ENTRY_EMAIL_ADDRESS_MIN_LENGTH', '6', 'Minimum length of e-mail address', 2, 4, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (449, 'Street Address', 'ENTRY_STREET_ADDRESS_MIN_LENGTH', '5', 'Minimum length of street address', 2, 5, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (450, 'Company', 'ENTRY_COMPANY_MIN_LENGTH', '2', 'Minimum length of company name', 2, 6, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (451, 'Post Code', 'ENTRY_POSTCODE_MIN_LENGTH', '4', 'Minimum length of post code', 2, 7, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (452, 'City', 'ENTRY_CITY_MIN_LENGTH', '3', 'Minimum length of city', 2, 8, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (453, 'State', 'ENTRY_STATE_MIN_LENGTH', '2', 'Minimum length of state', 2, 9, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (454, 'Telephone Number', 'ENTRY_TELEPHONE_MIN_LENGTH', '3', 'Minimum length of telephone number', 2, 10, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (455, 'Password', 'ENTRY_PASSWORD_MIN_LENGTH', '5', 'Minimum length of password', 2, 11, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (456, 'Credit Card Owner Name', 'CC_OWNER_MIN_LENGTH', '3', 'Minimum length of credit card owner name', 2, 12, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (457, 'Credit Card Number', 'CC_NUMBER_MIN_LENGTH', '10', 'Minimum length of credit card number', 2, 13, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (458, 'Review Text', 'REVIEW_TEXT_MIN_LENGTH', '50', 'Minimum length of review text', 2, 14, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (459, 'Best Sellers', 'MIN_DISPLAY_BESTSELLERS', '1', 'Minimum number of best sellers to display', 2, 15, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (460, 'Also Purchased', 'MIN_DISPLAY_ALSO_PURCHASED', '1', 'Minimum number of products to display in the \'This Customer Also Purchased\' box', 2, 16, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (461, 'Address Book Entries', 'MAX_ADDRESS_BOOK_ENTRIES', '5', 'Maximum address book entries a customer is allowed to have', 3, 1, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (462, 'Search Results', 'MAX_DISPLAY_SEARCH_RESULTS', '20', 'Amount of products to list', 3, 2, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (463, 'Page Links', 'MAX_DISPLAY_PAGE_LINKS', '5', 'Number of \'number\' links use for page-sets', 3, 3, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (464, 'Special Products', 'MAX_DISPLAY_SPECIAL_PRODUCTS', '9', 'Maximum number of products on special to display', 3, 4, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (465, 'New Products Module', 'MAX_DISPLAY_NEW_PRODUCTS', '9', 'Maximum number of new products to display in a category', 3, 5, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (466, 'Products Expected', 'MAX_DISPLAY_UPCOMING_PRODUCTS', '10', 'Maximum number of products expected to display', 3, 6, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (467, 'Manufacturers List', 'MAX_DISPLAY_MANUFACTURERS_IN_A_LIST', '0', 'Used in manufacturers box; when the number of manufacturers exceeds this number, a drop-down list will be displayed instead of the default list', 3, 7, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (468, 'Manufacturers Select Size', 'MAX_MANUFACTURERS_LIST', '1', 'Used in manufacturers box; when this value is \'1\' the classic drop-down list will be used for the manufacturers box. Otherwise, a list-box with the specified number of rows will be displayed.', 3, 7, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (469, 'Length of Manufacturers Name', 'MAX_DISPLAY_MANUFACTURER_NAME_LEN', '15', 'Used in manufacturers box; maximum length of manufacturers name to display', 3, 8, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (470, 'New Reviews', 'MAX_DISPLAY_NEW_REVIEWS', '6', 'Maximum number of new reviews to display', 3, 9, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (471, 'Selection of Random Reviews', 'MAX_RANDOM_SELECT_REVIEWS', '10', 'How many records to select from to choose one random product review', 3, 10, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (472, 'Selection of Random New Products', 'MAX_RANDOM_SELECT_NEW', '10', 'How many records to select from to choose one random new product to display', 3, 11, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (473, 'Selection of Products on Special', 'MAX_RANDOM_SELECT_SPECIALS', '10', 'How many records to select from to choose one random product special to display', 3, 12, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (474, 'Categories To List Per Row', 'MAX_DISPLAY_CATEGORIES_PER_ROW', '3', 'How many categories to list per row', 3, 13, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (475, 'New Products Listing', 'MAX_DISPLAY_PRODUCTS_NEW', '10', 'Maximum number of new products to display in new products page', 3, 14, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (476, 'Best Sellers', 'MAX_DISPLAY_BESTSELLERS', '10', 'Maximum number of best sellers to display', 3, 15, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (477, 'Also Purchased', 'MAX_DISPLAY_ALSO_PURCHASED', '6', 'Maximum number of products to display in the \'This Customer Also Purchased\' box', 3, 16, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (478, 'Customer Order History Box', 'MAX_DISPLAY_PRODUCTS_IN_ORDER_HISTORY_BOX', '6', 'Maximum number of products to display in the customer order history box', 3, 17, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (479, 'Order History', 'MAX_DISPLAY_ORDER_HISTORY', '10', 'Maximum number of orders to display in the order history page', 3, 18, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (480, 'Small Image Width', 'SMALL_IMAGE_WIDTH', '100', 'The pixel width of small images', 4, 1, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (481, 'Small Image Height', 'SMALL_IMAGE_HEIGHT', '80', 'The pixel height of small images', 4, 2, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (482, 'Heading Image Width', 'HEADING_IMAGE_WIDTH', '57', 'The pixel width of heading images', 4, 3, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (483, 'Heading Image Height', 'HEADING_IMAGE_HEIGHT', '40', 'The pixel height of heading images', 4, 4, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (484, 'Subcategory Image Width', 'SUBCATEGORY_IMAGE_WIDTH', '100', 'The pixel width of subcategory images', 4, 5, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (485, 'Subcategory Image Height', 'SUBCATEGORY_IMAGE_HEIGHT', '57', 'The pixel height of subcategory images', 4, 6, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (486, 'Calculate Image Size', 'CONFIG_CALCULATE_IMAGE_SIZE', 'true', 'Calculate the size of images?', 4, 7, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (487, 'Image Required', 'IMAGE_REQUIRED', 'true', 'Enable to display broken images. Good for development.', 4, 8, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (488, 'Gender', 'ACCOUNT_GENDER', 'true', 'Display gender in the customers account', 5, 1, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (489, 'Date of Birth', 'ACCOUNT_DOB', 'true', 'Display date of birth in the customers account', 5, 2, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (490, 'Company', 'ACCOUNT_COMPANY', 'true', 'Display company in the customers account', 5, 3, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (491, 'Suburb', 'ACCOUNT_SUBURB', 'true', 'Display suburb in the customers account', 5, 4, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (492, 'State', 'ACCOUNT_STATE', 'true', 'Display state in the customers account', 5, 5, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (493, 'Installed Modules', 'MODULE_PAYMENT_INSTALLED', 'cc.php;cod.php', 'List of payment module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: cc.php;cod.php;paypal.php)', 6, 0, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (494, 'Installed Modules', 'MODULE_ORDER_TOTAL_INSTALLED', 'ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php', 'List of order_total module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php)', 6, 0, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (495, 'Installed Modules', 'MODULE_SHIPPING_INSTALLED', 'flat.php', 'List of shipping module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ups.php;flat.php;item.php)', 6, 0, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (496, 'Enable Cash On Delivery Module', 'MODULE_PAYMENT_COD_STATUS', 'True', 'Do you want to accept Cash On Delevery payments?', 6, 1, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (497, 'Payment Zone', 'MODULE_PAYMENT_COD_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', 6, 2, NULL, '2005-04-01 18:58:00', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes(');
INSERT INTO configuration VALUES (498, 'Sort order of display.', 'MODULE_PAYMENT_COD_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (499, 'Set Order Status', 'MODULE_PAYMENT_COD_ORDER_STATUS_ID', '0', 'Set the status of orders made with this payment module to this value', 6, 0, NULL, '2005-04-01 18:58:00', 'tep_get_order_status_name', 'tep_cfg_pull_down_order_statuses(');
INSERT INTO configuration VALUES (500, 'Enable Credit Card Module', 'MODULE_PAYMENT_CC_STATUS', 'True', 'Do you want to accept credit card payments?', 6, 0, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (501, 'Split Credit Card E-Mail Address', 'MODULE_PAYMENT_CC_EMAIL', '', 'If an e-mail address is entered, the middle digits of the credit card number will be sent to the e-mail address (the outside digits are stored in the database with the middle digits censored)', 6, 0, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (502, 'Sort order of display.', 'MODULE_PAYMENT_CC_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (503, 'Payment Zone', 'MODULE_PAYMENT_CC_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', 6, 2, NULL, '2005-04-01 18:58:00', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes(');
INSERT INTO configuration VALUES (504, 'Set Order Status', 'MODULE_PAYMENT_CC_ORDER_STATUS_ID', '0', 'Set the status of orders made with this payment module to this value', 6, 0, NULL, '2005-04-01 18:58:00', 'tep_get_order_status_name', 'tep_cfg_pull_down_order_statuses(');
INSERT INTO configuration VALUES (505, 'Enable Flat Shipping', 'MODULE_SHIPPING_FLAT_STATUS', 'True', 'Do you want to offer flat rate shipping?', 6, 0, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (506, 'Shipping Cost', 'MODULE_SHIPPING_FLAT_COST', '5.00', 'The shipping cost for all orders using this shipping method.', 6, 0, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (507, 'Tax Class', 'MODULE_SHIPPING_FLAT_TAX_CLASS', '0', 'Use the following tax class on the shipping fee.', 6, 0, NULL, '2005-04-01 18:58:00', 'tep_get_tax_class_title', 'tep_cfg_pull_down_tax_classes(');
INSERT INTO configuration VALUES (508, 'Shipping Zone', 'MODULE_SHIPPING_FLAT_ZONE', '0', 'If a zone is selected, only enable this shipping method for that zone.', 6, 0, NULL, '2005-04-01 18:58:00', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes(');
INSERT INTO configuration VALUES (509, 'Sort Order', 'MODULE_SHIPPING_FLAT_SORT_ORDER', '0', 'Sort order of display.', 6, 0, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (510, 'Default Currency', 'DEFAULT_CURRENCY', 'USD', 'Default Currency', 6, 0, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (511, 'Default Language', 'DEFAULT_LANGUAGE', 'en', 'Default Language', 6, 0, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (512, 'Default Order Status For New Orders', 'DEFAULT_ORDERS_STATUS_ID', '1', 'When a new order is created, this order status will be assigned to it.', 6, 0, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (513, 'Display Shipping', 'MODULE_ORDER_TOTAL_SHIPPING_STATUS', 'true', 'Do you want to display the order shipping cost?', 6, 1, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (514, 'Sort Order', 'MODULE_ORDER_TOTAL_SHIPPING_SORT_ORDER', '2', 'Sort order of display.', 6, 2, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (515, 'Allow Free Shipping', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING', 'false', 'Do you want to allow free shipping?', 6, 3, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (516, 'Free Shipping For Orders Over', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING_OVER', '50', 'Provide free shipping for orders over the set amount.', 6, 4, NULL, '2005-04-01 18:58:00', 'currencies->format', NULL);
INSERT INTO configuration VALUES (517, 'Provide Free Shipping For Orders Made', 'MODULE_ORDER_TOTAL_SHIPPING_DESTINATION', 'national', 'Provide free shipping for orders sent to the set destination.', 6, 5, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_select_option(array(\'national\', \'international\', \'both\'),');
INSERT INTO configuration VALUES (518, 'Display Sub-Total', 'MODULE_ORDER_TOTAL_SUBTOTAL_STATUS', 'true', 'Do you want to display the order sub-total cost?', 6, 1, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (519, 'Sort Order', 'MODULE_ORDER_TOTAL_SUBTOTAL_SORT_ORDER', '1', 'Sort order of display.', 6, 2, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (520, 'Display Tax', 'MODULE_ORDER_TOTAL_TAX_STATUS', 'true', 'Do you want to display the order tax value?', 6, 1, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (521, 'Sort Order', 'MODULE_ORDER_TOTAL_TAX_SORT_ORDER', '3', 'Sort order of display.', 6, 2, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (522, 'Display Total', 'MODULE_ORDER_TOTAL_TOTAL_STATUS', 'true', 'Do you want to display the total order value?', 6, 1, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (523, 'Sort Order', 'MODULE_ORDER_TOTAL_TOTAL_SORT_ORDER', '4', 'Sort order of display.', 6, 2, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (524, 'Country of Origin', 'SHIPPING_ORIGIN_COUNTRY', '223', 'Select the country of origin to be used in shipping quotes.', 7, 1, NULL, '2005-04-01 18:58:00', 'tep_get_country_name', 'tep_cfg_pull_down_country_list(');
INSERT INTO configuration VALUES (525, 'Postal Code', 'SHIPPING_ORIGIN_ZIP', 'NONE', 'Enter the Postal Code (ZIP) of the Store to be used in shipping quotes.', 7, 2, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (526, 'Enter the Maximum Package Weight you will ship', 'SHIPPING_MAX_WEIGHT', '50', 'Carriers have a max weight limit for a single package. This is a common one for all.', 7, 3, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (527, 'Package Tare weight.', 'SHIPPING_BOX_WEIGHT', '3', 'What is the weight of typical packaging of small to medium packages?', 7, 4, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (528, 'Larger packages - percentage increase.', 'SHIPPING_BOX_PADDING', '10', 'For 10% enter 10', 7, 5, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (529, 'Display Product Image', 'PRODUCT_LIST_IMAGE', '1', 'Do you want to display the Product Image?', 8, 1, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (530, 'Display Product Manufaturer Name', 'PRODUCT_LIST_MANUFACTURER', '0', 'Do you want to display the Product Manufacturer Name?', 8, 2, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (531, 'Display Product Model', 'PRODUCT_LIST_MODEL', '0', 'Do you want to display the Product Model?', 8, 3, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (532, 'Display Product Name', 'PRODUCT_LIST_NAME', '2', 'Do you want to display the Product Name?', 8, 4, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (533, 'Display Product Price', 'PRODUCT_LIST_PRICE', '3', 'Do you want to display the Product Price', 8, 5, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (534, 'Display Product Quantity', 'PRODUCT_LIST_QUANTITY', '0', 'Do you want to display the Product Quantity?', 8, 6, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (535, 'Display Product Weight', 'PRODUCT_LIST_WEIGHT', '0', 'Do you want to display the Product Weight?', 8, 7, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (536, 'Display Buy Now column', 'PRODUCT_LIST_BUY_NOW', '4', 'Do you want to display the Buy Now column?', 8, 8, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (537, 'Display Category/Manufacturer Filter (0=disable; 1=enable)', 'PRODUCT_LIST_FILTER', '1', 'Do you want to display the Category/Manufacturer Filter?', 8, 9, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (538, 'Location of Prev/Next Navigation Bar (1-top, 2-bottom, 3-both)', 'PREV_NEXT_BAR_LOCATION', '2', 'Sets the location of the Prev/Next Navigation Bar (1-top, 2-bottom, 3-both)', 8, 10, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (539, 'Check stock level', 'STOCK_CHECK', 'true', 'Check to see if sufficent stock is available', 9, 1, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (540, 'Subtract stock', 'STOCK_LIMITED', 'true', 'Subtract product in stock by product orders', 9, 2, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (541, 'Allow Checkout', 'STOCK_ALLOW_CHECKOUT', 'true', 'Allow customer to checkout even if there is insufficient stock', 9, 3, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (542, 'Mark product out of stock', 'STOCK_MARK_PRODUCT_OUT_OF_STOCK', '***', 'Display something on screen so customer can see which product has insufficient stock', 9, 4, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (543, 'Stock Re-order level', 'STOCK_REORDER_LEVEL', '5', 'Define when stock needs to be re-ordered', 9, 5, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (544, 'Store Page Parse Time', 'STORE_PAGE_PARSE_TIME', 'false', 'Store the time it takes to parse a page', 10, 1, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (545, 'Log Destination', 'STORE_PAGE_PARSE_TIME_LOG', '/var/log/www/tep/page_parse_time.log', 'Directory and filename of the page parse time log', 10, 2, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (546, 'Log Date Format', 'STORE_PARSE_DATE_TIME_FORMAT', '%d/%m/%Y %H:%M:%S', 'The date format', 10, 3, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (547, 'Display The Page Parse Time', 'DISPLAY_PAGE_PARSE_TIME', 'true', 'Display the page parse time (store page parse time must be enabled)', 10, 4, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (548, 'Store Database Queries', 'STORE_DB_TRANSACTIONS', 'false', 'Store the database queries in the page parse time log (PHP4 only)', 10, 5, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (549, 'Use Cache', 'USE_CACHE', 'false', 'Use caching features', 11, 1, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (550, 'Cache Directory', 'DIR_FS_CACHE', '/tmp/', 'The directory where the cached files are saved', 11, 2, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (551, 'E-Mail Transport Method', 'EMAIL_TRANSPORT', 'sendmail', 'Defines if this server uses a local connection to sendmail or uses an SMTP connection via TCP/IP. Servers running on Windows and MacOS should change this setting to SMTP.', 12, 1, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_select_option(array(\'sendmail\', \'smtp\'),');
INSERT INTO configuration VALUES (552, 'E-Mail Linefeeds', 'EMAIL_LINEFEED', 'LF', 'Defines the character sequence used to separate mail headers.', 12, 2, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_select_option(array(\'LF\', \'CRLF\'),');
INSERT INTO configuration VALUES (553, 'Use MIME HTML When Sending Emails', 'EMAIL_USE_HTML', 'false', 'Send e-mails in HTML format', 12, 3, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (554, 'Verify E-Mail Addresses Through DNS', 'ENTRY_EMAIL_ADDRESS_CHECK', 'false', 'Verify e-mail address through a DNS server', 12, 4, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (555, 'Send E-Mails', 'SEND_EMAILS', 'true', 'Send out e-mails', 12, 5, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (556, 'Enable download', 'DOWNLOAD_ENABLED', 'false', 'Enable the products download functions.', 13, 1, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (557, 'Download by redirect', 'DOWNLOAD_BY_REDIRECT', 'false', 'Use browser redirection for download. Disable on non-Unix systems.', 13, 2, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (558, 'Expiry delay (days)', 'DOWNLOAD_MAX_DAYS', '7', 'Set number of days before the download link expires. 0 means no limit.', 13, 3, NULL, '2005-04-01 18:58:00', NULL, '');
INSERT INTO configuration VALUES (559, 'Maximum number of downloads', 'DOWNLOAD_MAX_COUNT', '5', 'Set the maximum number of downloads. 0 means no download authorized.', 13, 4, NULL, '2005-04-01 18:58:00', NULL, '');
INSERT INTO configuration VALUES (560, 'Enable GZip Compression', 'GZIP_COMPRESSION', 'false', 'Enable HTTP GZip compression.', 14, 1, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (561, 'Compression Level', 'GZIP_LEVEL', '5', 'Use this compression level 0-9 (0 = minimum, 9 = maximum).', 14, 2, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (562, 'Session Directory', 'SESSION_WRITE_DIRECTORY', '/tmp', 'If sessions are file based, store them in this directory.', 15, 1, NULL, '2005-04-01 18:58:00', NULL, NULL);
INSERT INTO configuration VALUES (563, 'Force Cookie Use', 'SESSION_FORCE_COOKIE_USE', 'False', 'Force the use of sessions when cookies are only enabled.', 15, 2, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (564, 'Check SSL Session ID', 'SESSION_CHECK_SSL_SESSION_ID', 'False', 'Validate the SSL_SESSION_ID on every secure HTTPS page request.', 15, 3, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (565, 'Check User Agent', 'SESSION_CHECK_USER_AGENT', 'False', 'Validate the clients browser user agent on every page request.', 15, 4, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (566, 'Check IP Address', 'SESSION_CHECK_IP_ADDRESS', 'False', 'Validate the clients IP address on every page request.', 15, 5, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (567, 'Prevent Spider Sessions', 'SESSION_BLOCK_SPIDERS', 'False', 'Prevent known spiders from starting a session.', 15, 6, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (568, 'Recreate Session', 'SESSION_RECREATE', 'False', 'Recreate the session to generate a new session ID when the customer logs on or creates an account (PHP >=4.1 needed).', 15, 7, NULL, '2005-04-01 18:58:00', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (569, 'Store Name', 'STORE_NAME', 'osCommerce', 'The name of my store', 1, 1, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (570, 'Store Owner', 'STORE_OWNER', 'Harald Ponce de Leon', 'The name of my store owner', 1, 2, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (571, 'E-Mail Address', 'STORE_OWNER_EMAIL_ADDRESS', 'root@localhost', 'The e-mail address of my store owner', 1, 3, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (572, 'E-Mail From', 'EMAIL_FROM', 'osCommerce <root@localhost>', 'The e-mail address used in (sent) e-mails', 1, 4, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (573, 'Country', 'STORE_COUNTRY', '223', 'The country my store is located in <br><br><b>Note: Please remember to update the store zone.</b>', 1, 6, NULL, '2005-04-01 18:58:43', 'tep_get_country_name', 'tep_cfg_pull_down_country_list(');
INSERT INTO configuration VALUES (574, 'Zone', 'STORE_ZONE', '18', 'The zone my store is located in', 1, 7, NULL, '2005-04-01 18:58:43', 'tep_cfg_get_zone_name', 'tep_cfg_pull_down_zone_list(');
INSERT INTO configuration VALUES (575, 'Expected Sort Order', 'EXPECTED_PRODUCTS_SORT', 'desc', 'This is the sort order used in the expected products box.', 1, 8, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_select_option(array(\'asc\', \'desc\'),');
INSERT INTO configuration VALUES (576, 'Expected Sort Field', 'EXPECTED_PRODUCTS_FIELD', 'date_expected', 'The column to sort by in the expected products box.', 1, 9, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_select_option(array(\'products_name\', \'date_expected\'),');
INSERT INTO configuration VALUES (577, 'Switch To Default Language Currency', 'USE_DEFAULT_LANGUAGE_CURRENCY', 'false', 'Automatically switch to the language\'s currency when it is changed', 1, 10, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (578, 'Send Extra Order Emails To', 'SEND_EXTRA_ORDER_EMAILS_TO', '', 'Send extra order emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 1, 11, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (579, 'Use Search-Engine Safe URLs (still in development)', 'SEARCH_ENGINE_FRIENDLY_URLS', 'false', 'Use search-engine safe urls for all site links', 1, 12, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (580, 'Display Cart After Adding Product', 'DISPLAY_CART', 'true', 'Display the shopping cart after adding a product (or return back to their origin)', 1, 14, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (581, 'Allow Guest To Tell A Friend', 'ALLOW_GUEST_TO_TELL_A_FRIEND', 'false', 'Allow guests to tell a friend about a product', 1, 15, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (582, 'Default Search Operator', 'ADVANCED_SEARCH_DEFAULT_OPERATOR', 'and', 'Default search operators', 1, 17, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_select_option(array(\'and\', \'or\'),');
INSERT INTO configuration VALUES (583, 'Store Address and Phone', 'STORE_NAME_ADDRESS', 'Store Name\nAddress\nCountry\nPhone', 'This is the Store Name, Address and Phone used on printable documents and displayed online', 1, 18, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_textarea(');
INSERT INTO configuration VALUES (584, 'Show Category Counts', 'SHOW_COUNTS', 'true', 'Count recursively how many products are in each category', 1, 19, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (585, 'Tax Decimal Places', 'TAX_DECIMAL_PLACES', '0', 'Pad the tax value this amount of decimal places', 1, 20, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (586, 'Display Prices with Tax', 'DISPLAY_PRICE_WITH_TAX', 'false', 'Display prices with tax included (true) or add the tax at the end (false)', 1, 21, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (587, 'First Name', 'ENTRY_FIRST_NAME_MIN_LENGTH', '2', 'Minimum length of first name', 2, 1, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (588, 'Last Name', 'ENTRY_LAST_NAME_MIN_LENGTH', '2', 'Minimum length of last name', 2, 2, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (589, 'Date of Birth', 'ENTRY_DOB_MIN_LENGTH', '10', 'Minimum length of date of birth', 2, 3, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (590, 'E-Mail Address', 'ENTRY_EMAIL_ADDRESS_MIN_LENGTH', '6', 'Minimum length of e-mail address', 2, 4, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (591, 'Street Address', 'ENTRY_STREET_ADDRESS_MIN_LENGTH', '5', 'Minimum length of street address', 2, 5, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (592, 'Company', 'ENTRY_COMPANY_MIN_LENGTH', '2', 'Minimum length of company name', 2, 6, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (593, 'Post Code', 'ENTRY_POSTCODE_MIN_LENGTH', '4', 'Minimum length of post code', 2, 7, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (594, 'City', 'ENTRY_CITY_MIN_LENGTH', '3', 'Minimum length of city', 2, 8, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (595, 'State', 'ENTRY_STATE_MIN_LENGTH', '2', 'Minimum length of state', 2, 9, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (596, 'Telephone Number', 'ENTRY_TELEPHONE_MIN_LENGTH', '3', 'Minimum length of telephone number', 2, 10, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (597, 'Password', 'ENTRY_PASSWORD_MIN_LENGTH', '5', 'Minimum length of password', 2, 11, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (598, 'Credit Card Owner Name', 'CC_OWNER_MIN_LENGTH', '3', 'Minimum length of credit card owner name', 2, 12, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (599, 'Credit Card Number', 'CC_NUMBER_MIN_LENGTH', '10', 'Minimum length of credit card number', 2, 13, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (600, 'Review Text', 'REVIEW_TEXT_MIN_LENGTH', '50', 'Minimum length of review text', 2, 14, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (601, 'Best Sellers', 'MIN_DISPLAY_BESTSELLERS', '1', 'Minimum number of best sellers to display', 2, 15, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (602, 'Also Purchased', 'MIN_DISPLAY_ALSO_PURCHASED', '1', 'Minimum number of products to display in the \'This Customer Also Purchased\' box', 2, 16, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (603, 'Address Book Entries', 'MAX_ADDRESS_BOOK_ENTRIES', '5', 'Maximum address book entries a customer is allowed to have', 3, 1, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (604, 'Search Results', 'MAX_DISPLAY_SEARCH_RESULTS', '20', 'Amount of products to list', 3, 2, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (605, 'Page Links', 'MAX_DISPLAY_PAGE_LINKS', '5', 'Number of \'number\' links use for page-sets', 3, 3, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (606, 'Special Products', 'MAX_DISPLAY_SPECIAL_PRODUCTS', '9', 'Maximum number of products on special to display', 3, 4, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (607, 'New Products Module', 'MAX_DISPLAY_NEW_PRODUCTS', '9', 'Maximum number of new products to display in a category', 3, 5, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (608, 'Products Expected', 'MAX_DISPLAY_UPCOMING_PRODUCTS', '10', 'Maximum number of products expected to display', 3, 6, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (609, 'Manufacturers List', 'MAX_DISPLAY_MANUFACTURERS_IN_A_LIST', '0', 'Used in manufacturers box; when the number of manufacturers exceeds this number, a drop-down list will be displayed instead of the default list', 3, 7, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (610, 'Manufacturers Select Size', 'MAX_MANUFACTURERS_LIST', '1', 'Used in manufacturers box; when this value is \'1\' the classic drop-down list will be used for the manufacturers box. Otherwise, a list-box with the specified number of rows will be displayed.', 3, 7, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (611, 'Length of Manufacturers Name', 'MAX_DISPLAY_MANUFACTURER_NAME_LEN', '15', 'Used in manufacturers box; maximum length of manufacturers name to display', 3, 8, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (612, 'New Reviews', 'MAX_DISPLAY_NEW_REVIEWS', '6', 'Maximum number of new reviews to display', 3, 9, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (613, 'Selection of Random Reviews', 'MAX_RANDOM_SELECT_REVIEWS', '10', 'How many records to select from to choose one random product review', 3, 10, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (614, 'Selection of Random New Products', 'MAX_RANDOM_SELECT_NEW', '10', 'How many records to select from to choose one random new product to display', 3, 11, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (615, 'Selection of Products on Special', 'MAX_RANDOM_SELECT_SPECIALS', '10', 'How many records to select from to choose one random product special to display', 3, 12, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (616, 'Categories To List Per Row', 'MAX_DISPLAY_CATEGORIES_PER_ROW', '3', 'How many categories to list per row', 3, 13, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (617, 'New Products Listing', 'MAX_DISPLAY_PRODUCTS_NEW', '10', 'Maximum number of new products to display in new products page', 3, 14, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (618, 'Best Sellers', 'MAX_DISPLAY_BESTSELLERS', '10', 'Maximum number of best sellers to display', 3, 15, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (619, 'Also Purchased', 'MAX_DISPLAY_ALSO_PURCHASED', '6', 'Maximum number of products to display in the \'This Customer Also Purchased\' box', 3, 16, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (620, 'Customer Order History Box', 'MAX_DISPLAY_PRODUCTS_IN_ORDER_HISTORY_BOX', '6', 'Maximum number of products to display in the customer order history box', 3, 17, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (621, 'Order History', 'MAX_DISPLAY_ORDER_HISTORY', '10', 'Maximum number of orders to display in the order history page', 3, 18, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (622, 'Small Image Width', 'SMALL_IMAGE_WIDTH', '100', 'The pixel width of small images', 4, 1, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (623, 'Small Image Height', 'SMALL_IMAGE_HEIGHT', '80', 'The pixel height of small images', 4, 2, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (624, 'Heading Image Width', 'HEADING_IMAGE_WIDTH', '57', 'The pixel width of heading images', 4, 3, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (625, 'Heading Image Height', 'HEADING_IMAGE_HEIGHT', '40', 'The pixel height of heading images', 4, 4, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (626, 'Subcategory Image Width', 'SUBCATEGORY_IMAGE_WIDTH', '100', 'The pixel width of subcategory images', 4, 5, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (627, 'Subcategory Image Height', 'SUBCATEGORY_IMAGE_HEIGHT', '57', 'The pixel height of subcategory images', 4, 6, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (628, 'Calculate Image Size', 'CONFIG_CALCULATE_IMAGE_SIZE', 'true', 'Calculate the size of images?', 4, 7, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (629, 'Image Required', 'IMAGE_REQUIRED', 'true', 'Enable to display broken images. Good for development.', 4, 8, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (630, 'Gender', 'ACCOUNT_GENDER', 'true', 'Display gender in the customers account', 5, 1, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (631, 'Date of Birth', 'ACCOUNT_DOB', 'true', 'Display date of birth in the customers account', 5, 2, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (632, 'Company', 'ACCOUNT_COMPANY', 'true', 'Display company in the customers account', 5, 3, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (633, 'Suburb', 'ACCOUNT_SUBURB', 'true', 'Display suburb in the customers account', 5, 4, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (634, 'State', 'ACCOUNT_STATE', 'true', 'Display state in the customers account', 5, 5, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (635, 'Installed Modules', 'MODULE_PAYMENT_INSTALLED', 'cc.php;cod.php', 'List of payment module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: cc.php;cod.php;paypal.php)', 6, 0, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (636, 'Installed Modules', 'MODULE_ORDER_TOTAL_INSTALLED', 'ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php', 'List of order_total module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php)', 6, 0, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (637, 'Installed Modules', 'MODULE_SHIPPING_INSTALLED', 'flat.php', 'List of shipping module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ups.php;flat.php;item.php)', 6, 0, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (638, 'Enable Cash On Delivery Module', 'MODULE_PAYMENT_COD_STATUS', 'True', 'Do you want to accept Cash On Delevery payments?', 6, 1, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (639, 'Payment Zone', 'MODULE_PAYMENT_COD_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', 6, 2, NULL, '2005-04-01 18:58:43', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes(');
INSERT INTO configuration VALUES (640, 'Sort order of display.', 'MODULE_PAYMENT_COD_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (641, 'Set Order Status', 'MODULE_PAYMENT_COD_ORDER_STATUS_ID', '0', 'Set the status of orders made with this payment module to this value', 6, 0, NULL, '2005-04-01 18:58:43', 'tep_get_order_status_name', 'tep_cfg_pull_down_order_statuses(');
INSERT INTO configuration VALUES (642, 'Enable Credit Card Module', 'MODULE_PAYMENT_CC_STATUS', 'True', 'Do you want to accept credit card payments?', 6, 0, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (643, 'Split Credit Card E-Mail Address', 'MODULE_PAYMENT_CC_EMAIL', '', 'If an e-mail address is entered, the middle digits of the credit card number will be sent to the e-mail address (the outside digits are stored in the database with the middle digits censored)', 6, 0, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (644, 'Sort order of display.', 'MODULE_PAYMENT_CC_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (645, 'Payment Zone', 'MODULE_PAYMENT_CC_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', 6, 2, NULL, '2005-04-01 18:58:43', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes(');
INSERT INTO configuration VALUES (646, 'Set Order Status', 'MODULE_PAYMENT_CC_ORDER_STATUS_ID', '0', 'Set the status of orders made with this payment module to this value', 6, 0, NULL, '2005-04-01 18:58:43', 'tep_get_order_status_name', 'tep_cfg_pull_down_order_statuses(');
INSERT INTO configuration VALUES (647, 'Enable Flat Shipping', 'MODULE_SHIPPING_FLAT_STATUS', 'True', 'Do you want to offer flat rate shipping?', 6, 0, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (648, 'Shipping Cost', 'MODULE_SHIPPING_FLAT_COST', '5.00', 'The shipping cost for all orders using this shipping method.', 6, 0, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (649, 'Tax Class', 'MODULE_SHIPPING_FLAT_TAX_CLASS', '0', 'Use the following tax class on the shipping fee.', 6, 0, NULL, '2005-04-01 18:58:43', 'tep_get_tax_class_title', 'tep_cfg_pull_down_tax_classes(');
INSERT INTO configuration VALUES (650, 'Shipping Zone', 'MODULE_SHIPPING_FLAT_ZONE', '0', 'If a zone is selected, only enable this shipping method for that zone.', 6, 0, NULL, '2005-04-01 18:58:43', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes(');
INSERT INTO configuration VALUES (651, 'Sort Order', 'MODULE_SHIPPING_FLAT_SORT_ORDER', '0', 'Sort order of display.', 6, 0, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (652, 'Default Currency', 'DEFAULT_CURRENCY', 'USD', 'Default Currency', 6, 0, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (653, 'Default Language', 'DEFAULT_LANGUAGE', 'en', 'Default Language', 6, 0, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (654, 'Default Order Status For New Orders', 'DEFAULT_ORDERS_STATUS_ID', '1', 'When a new order is created, this order status will be assigned to it.', 6, 0, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (655, 'Display Shipping', 'MODULE_ORDER_TOTAL_SHIPPING_STATUS', 'true', 'Do you want to display the order shipping cost?', 6, 1, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (656, 'Sort Order', 'MODULE_ORDER_TOTAL_SHIPPING_SORT_ORDER', '2', 'Sort order of display.', 6, 2, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (657, 'Allow Free Shipping', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING', 'false', 'Do you want to allow free shipping?', 6, 3, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (658, 'Free Shipping For Orders Over', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING_OVER', '50', 'Provide free shipping for orders over the set amount.', 6, 4, NULL, '2005-04-01 18:58:43', 'currencies->format', NULL);
INSERT INTO configuration VALUES (659, 'Provide Free Shipping For Orders Made', 'MODULE_ORDER_TOTAL_SHIPPING_DESTINATION', 'national', 'Provide free shipping for orders sent to the set destination.', 6, 5, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_select_option(array(\'national\', \'international\', \'both\'),');
INSERT INTO configuration VALUES (660, 'Display Sub-Total', 'MODULE_ORDER_TOTAL_SUBTOTAL_STATUS', 'true', 'Do you want to display the order sub-total cost?', 6, 1, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (661, 'Sort Order', 'MODULE_ORDER_TOTAL_SUBTOTAL_SORT_ORDER', '1', 'Sort order of display.', 6, 2, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (662, 'Display Tax', 'MODULE_ORDER_TOTAL_TAX_STATUS', 'true', 'Do you want to display the order tax value?', 6, 1, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (663, 'Sort Order', 'MODULE_ORDER_TOTAL_TAX_SORT_ORDER', '3', 'Sort order of display.', 6, 2, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (664, 'Display Total', 'MODULE_ORDER_TOTAL_TOTAL_STATUS', 'true', 'Do you want to display the total order value?', 6, 1, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (665, 'Sort Order', 'MODULE_ORDER_TOTAL_TOTAL_SORT_ORDER', '4', 'Sort order of display.', 6, 2, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (666, 'Country of Origin', 'SHIPPING_ORIGIN_COUNTRY', '223', 'Select the country of origin to be used in shipping quotes.', 7, 1, NULL, '2005-04-01 18:58:43', 'tep_get_country_name', 'tep_cfg_pull_down_country_list(');
INSERT INTO configuration VALUES (667, 'Postal Code', 'SHIPPING_ORIGIN_ZIP', 'NONE', 'Enter the Postal Code (ZIP) of the Store to be used in shipping quotes.', 7, 2, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (668, 'Enter the Maximum Package Weight you will ship', 'SHIPPING_MAX_WEIGHT', '50', 'Carriers have a max weight limit for a single package. This is a common one for all.', 7, 3, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (669, 'Package Tare weight.', 'SHIPPING_BOX_WEIGHT', '3', 'What is the weight of typical packaging of small to medium packages?', 7, 4, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (670, 'Larger packages - percentage increase.', 'SHIPPING_BOX_PADDING', '10', 'For 10% enter 10', 7, 5, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (671, 'Display Product Image', 'PRODUCT_LIST_IMAGE', '1', 'Do you want to display the Product Image?', 8, 1, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (672, 'Display Product Manufaturer Name', 'PRODUCT_LIST_MANUFACTURER', '0', 'Do you want to display the Product Manufacturer Name?', 8, 2, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (673, 'Display Product Model', 'PRODUCT_LIST_MODEL', '0', 'Do you want to display the Product Model?', 8, 3, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (674, 'Display Product Name', 'PRODUCT_LIST_NAME', '2', 'Do you want to display the Product Name?', 8, 4, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (675, 'Display Product Price', 'PRODUCT_LIST_PRICE', '3', 'Do you want to display the Product Price', 8, 5, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (676, 'Display Product Quantity', 'PRODUCT_LIST_QUANTITY', '0', 'Do you want to display the Product Quantity?', 8, 6, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (677, 'Display Product Weight', 'PRODUCT_LIST_WEIGHT', '0', 'Do you want to display the Product Weight?', 8, 7, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (678, 'Display Buy Now column', 'PRODUCT_LIST_BUY_NOW', '4', 'Do you want to display the Buy Now column?', 8, 8, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (679, 'Display Category/Manufacturer Filter (0=disable; 1=enable)', 'PRODUCT_LIST_FILTER', '1', 'Do you want to display the Category/Manufacturer Filter?', 8, 9, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (680, 'Location of Prev/Next Navigation Bar (1-top, 2-bottom, 3-both)', 'PREV_NEXT_BAR_LOCATION', '2', 'Sets the location of the Prev/Next Navigation Bar (1-top, 2-bottom, 3-both)', 8, 10, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (681, 'Check stock level', 'STOCK_CHECK', 'true', 'Check to see if sufficent stock is available', 9, 1, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (682, 'Subtract stock', 'STOCK_LIMITED', 'true', 'Subtract product in stock by product orders', 9, 2, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (683, 'Allow Checkout', 'STOCK_ALLOW_CHECKOUT', 'true', 'Allow customer to checkout even if there is insufficient stock', 9, 3, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (684, 'Mark product out of stock', 'STOCK_MARK_PRODUCT_OUT_OF_STOCK', '***', 'Display something on screen so customer can see which product has insufficient stock', 9, 4, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (685, 'Stock Re-order level', 'STOCK_REORDER_LEVEL', '5', 'Define when stock needs to be re-ordered', 9, 5, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (686, 'Store Page Parse Time', 'STORE_PAGE_PARSE_TIME', 'false', 'Store the time it takes to parse a page', 10, 1, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (687, 'Log Destination', 'STORE_PAGE_PARSE_TIME_LOG', '/var/log/www/tep/page_parse_time.log', 'Directory and filename of the page parse time log', 10, 2, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (688, 'Log Date Format', 'STORE_PARSE_DATE_TIME_FORMAT', '%d/%m/%Y %H:%M:%S', 'The date format', 10, 3, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (689, 'Display The Page Parse Time', 'DISPLAY_PAGE_PARSE_TIME', 'true', 'Display the page parse time (store page parse time must be enabled)', 10, 4, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (690, 'Store Database Queries', 'STORE_DB_TRANSACTIONS', 'false', 'Store the database queries in the page parse time log (PHP4 only)', 10, 5, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (691, 'Use Cache', 'USE_CACHE', 'false', 'Use caching features', 11, 1, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (692, 'Cache Directory', 'DIR_FS_CACHE', '/tmp/', 'The directory where the cached files are saved', 11, 2, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (693, 'E-Mail Transport Method', 'EMAIL_TRANSPORT', 'sendmail', 'Defines if this server uses a local connection to sendmail or uses an SMTP connection via TCP/IP. Servers running on Windows and MacOS should change this setting to SMTP.', 12, 1, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_select_option(array(\'sendmail\', \'smtp\'),');
INSERT INTO configuration VALUES (694, 'E-Mail Linefeeds', 'EMAIL_LINEFEED', 'LF', 'Defines the character sequence used to separate mail headers.', 12, 2, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_select_option(array(\'LF\', \'CRLF\'),');
INSERT INTO configuration VALUES (695, 'Use MIME HTML When Sending Emails', 'EMAIL_USE_HTML', 'false', 'Send e-mails in HTML format', 12, 3, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (696, 'Verify E-Mail Addresses Through DNS', 'ENTRY_EMAIL_ADDRESS_CHECK', 'false', 'Verify e-mail address through a DNS server', 12, 4, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (697, 'Send E-Mails', 'SEND_EMAILS', 'true', 'Send out e-mails', 12, 5, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (698, 'Enable download', 'DOWNLOAD_ENABLED', 'false', 'Enable the products download functions.', 13, 1, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (699, 'Download by redirect', 'DOWNLOAD_BY_REDIRECT', 'false', 'Use browser redirection for download. Disable on non-Unix systems.', 13, 2, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (700, 'Expiry delay (days)', 'DOWNLOAD_MAX_DAYS', '7', 'Set number of days before the download link expires. 0 means no limit.', 13, 3, NULL, '2005-04-01 18:58:43', NULL, '');
INSERT INTO configuration VALUES (701, 'Maximum number of downloads', 'DOWNLOAD_MAX_COUNT', '5', 'Set the maximum number of downloads. 0 means no download authorized.', 13, 4, NULL, '2005-04-01 18:58:43', NULL, '');
INSERT INTO configuration VALUES (702, 'Enable GZip Compression', 'GZIP_COMPRESSION', 'false', 'Enable HTTP GZip compression.', 14, 1, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (703, 'Compression Level', 'GZIP_LEVEL', '5', 'Use this compression level 0-9 (0 = minimum, 9 = maximum).', 14, 2, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (704, 'Session Directory', 'SESSION_WRITE_DIRECTORY', '/tmp', 'If sessions are file based, store them in this directory.', 15, 1, NULL, '2005-04-01 18:58:43', NULL, NULL);
INSERT INTO configuration VALUES (705, 'Force Cookie Use', 'SESSION_FORCE_COOKIE_USE', 'False', 'Force the use of sessions when cookies are only enabled.', 15, 2, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (706, 'Check SSL Session ID', 'SESSION_CHECK_SSL_SESSION_ID', 'False', 'Validate the SSL_SESSION_ID on every secure HTTPS page request.', 15, 3, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (707, 'Check User Agent', 'SESSION_CHECK_USER_AGENT', 'False', 'Validate the clients browser user agent on every page request.', 15, 4, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (708, 'Check IP Address', 'SESSION_CHECK_IP_ADDRESS', 'False', 'Validate the clients IP address on every page request.', 15, 5, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (709, 'Prevent Spider Sessions', 'SESSION_BLOCK_SPIDERS', 'False', 'Prevent known spiders from starting a session.', 15, 6, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (710, 'Recreate Session', 'SESSION_RECREATE', 'False', 'Recreate the session to generate a new session ID when the customer logs on or creates an account (PHP >=4.1 needed).', 15, 7, NULL, '2005-04-01 18:58:43', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (711, 'Store Name', 'STORE_NAME', 'osCommerce', 'The name of my store', 1, 1, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (712, 'Store Owner', 'STORE_OWNER', 'Harald Ponce de Leon', 'The name of my store owner', 1, 2, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (713, 'E-Mail Address', 'STORE_OWNER_EMAIL_ADDRESS', 'root@localhost', 'The e-mail address of my store owner', 1, 3, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (714, 'E-Mail From', 'EMAIL_FROM', 'osCommerce <root@localhost>', 'The e-mail address used in (sent) e-mails', 1, 4, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (715, 'Country', 'STORE_COUNTRY', '223', 'The country my store is located in <br><br><b>Note: Please remember to update the store zone.</b>', 1, 6, NULL, '2005-04-01 20:14:29', 'tep_get_country_name', 'tep_cfg_pull_down_country_list(');
INSERT INTO configuration VALUES (716, 'Zone', 'STORE_ZONE', '18', 'The zone my store is located in', 1, 7, NULL, '2005-04-01 20:14:29', 'tep_cfg_get_zone_name', 'tep_cfg_pull_down_zone_list(');
INSERT INTO configuration VALUES (717, 'Expected Sort Order', 'EXPECTED_PRODUCTS_SORT', 'desc', 'This is the sort order used in the expected products box.', 1, 8, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_select_option(array(\'asc\', \'desc\'),');
INSERT INTO configuration VALUES (718, 'Expected Sort Field', 'EXPECTED_PRODUCTS_FIELD', 'date_expected', 'The column to sort by in the expected products box.', 1, 9, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_select_option(array(\'products_name\', \'date_expected\'),');
INSERT INTO configuration VALUES (719, 'Switch To Default Language Currency', 'USE_DEFAULT_LANGUAGE_CURRENCY', 'false', 'Automatically switch to the language\'s currency when it is changed', 1, 10, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (720, 'Send Extra Order Emails To', 'SEND_EXTRA_ORDER_EMAILS_TO', '', 'Send extra order emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 1, 11, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (721, 'Use Search-Engine Safe URLs (still in development)', 'SEARCH_ENGINE_FRIENDLY_URLS', 'false', 'Use search-engine safe urls for all site links', 1, 12, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (722, 'Display Cart After Adding Product', 'DISPLAY_CART', 'true', 'Display the shopping cart after adding a product (or return back to their origin)', 1, 14, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (723, 'Allow Guest To Tell A Friend', 'ALLOW_GUEST_TO_TELL_A_FRIEND', 'false', 'Allow guests to tell a friend about a product', 1, 15, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (724, 'Default Search Operator', 'ADVANCED_SEARCH_DEFAULT_OPERATOR', 'and', 'Default search operators', 1, 17, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_select_option(array(\'and\', \'or\'),');
INSERT INTO configuration VALUES (725, 'Store Address and Phone', 'STORE_NAME_ADDRESS', 'Store Name\nAddress\nCountry\nPhone', 'This is the Store Name, Address and Phone used on printable documents and displayed online', 1, 18, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_textarea(');
INSERT INTO configuration VALUES (726, 'Show Category Counts', 'SHOW_COUNTS', 'true', 'Count recursively how many products are in each category', 1, 19, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (727, 'Tax Decimal Places', 'TAX_DECIMAL_PLACES', '0', 'Pad the tax value this amount of decimal places', 1, 20, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (728, 'Display Prices with Tax', 'DISPLAY_PRICE_WITH_TAX', 'false', 'Display prices with tax included (true) or add the tax at the end (false)', 1, 21, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (729, 'First Name', 'ENTRY_FIRST_NAME_MIN_LENGTH', '2', 'Minimum length of first name', 2, 1, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (730, 'Last Name', 'ENTRY_LAST_NAME_MIN_LENGTH', '2', 'Minimum length of last name', 2, 2, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (731, 'Date of Birth', 'ENTRY_DOB_MIN_LENGTH', '10', 'Minimum length of date of birth', 2, 3, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (732, 'E-Mail Address', 'ENTRY_EMAIL_ADDRESS_MIN_LENGTH', '6', 'Minimum length of e-mail address', 2, 4, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (733, 'Street Address', 'ENTRY_STREET_ADDRESS_MIN_LENGTH', '5', 'Minimum length of street address', 2, 5, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (734, 'Company', 'ENTRY_COMPANY_MIN_LENGTH', '2', 'Minimum length of company name', 2, 6, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (735, 'Post Code', 'ENTRY_POSTCODE_MIN_LENGTH', '4', 'Minimum length of post code', 2, 7, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (736, 'City', 'ENTRY_CITY_MIN_LENGTH', '3', 'Minimum length of city', 2, 8, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (737, 'State', 'ENTRY_STATE_MIN_LENGTH', '2', 'Minimum length of state', 2, 9, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (738, 'Telephone Number', 'ENTRY_TELEPHONE_MIN_LENGTH', '3', 'Minimum length of telephone number', 2, 10, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (739, 'Password', 'ENTRY_PASSWORD_MIN_LENGTH', '5', 'Minimum length of password', 2, 11, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (740, 'Credit Card Owner Name', 'CC_OWNER_MIN_LENGTH', '3', 'Minimum length of credit card owner name', 2, 12, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (741, 'Credit Card Number', 'CC_NUMBER_MIN_LENGTH', '10', 'Minimum length of credit card number', 2, 13, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (742, 'Review Text', 'REVIEW_TEXT_MIN_LENGTH', '50', 'Minimum length of review text', 2, 14, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (743, 'Best Sellers', 'MIN_DISPLAY_BESTSELLERS', '1', 'Minimum number of best sellers to display', 2, 15, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (744, 'Also Purchased', 'MIN_DISPLAY_ALSO_PURCHASED', '1', 'Minimum number of products to display in the \'This Customer Also Purchased\' box', 2, 16, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (745, 'Address Book Entries', 'MAX_ADDRESS_BOOK_ENTRIES', '5', 'Maximum address book entries a customer is allowed to have', 3, 1, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (746, 'Search Results', 'MAX_DISPLAY_SEARCH_RESULTS', '20', 'Amount of products to list', 3, 2, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (747, 'Page Links', 'MAX_DISPLAY_PAGE_LINKS', '5', 'Number of \'number\' links use for page-sets', 3, 3, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (748, 'Special Products', 'MAX_DISPLAY_SPECIAL_PRODUCTS', '9', 'Maximum number of products on special to display', 3, 4, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (749, 'New Products Module', 'MAX_DISPLAY_NEW_PRODUCTS', '9', 'Maximum number of new products to display in a category', 3, 5, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (750, 'Products Expected', 'MAX_DISPLAY_UPCOMING_PRODUCTS', '10', 'Maximum number of products expected to display', 3, 6, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (751, 'Manufacturers List', 'MAX_DISPLAY_MANUFACTURERS_IN_A_LIST', '0', 'Used in manufacturers box; when the number of manufacturers exceeds this number, a drop-down list will be displayed instead of the default list', 3, 7, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (752, 'Manufacturers Select Size', 'MAX_MANUFACTURERS_LIST', '1', 'Used in manufacturers box; when this value is \'1\' the classic drop-down list will be used for the manufacturers box. Otherwise, a list-box with the specified number of rows will be displayed.', 3, 7, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (753, 'Length of Manufacturers Name', 'MAX_DISPLAY_MANUFACTURER_NAME_LEN', '15', 'Used in manufacturers box; maximum length of manufacturers name to display', 3, 8, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (754, 'New Reviews', 'MAX_DISPLAY_NEW_REVIEWS', '6', 'Maximum number of new reviews to display', 3, 9, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (755, 'Selection of Random Reviews', 'MAX_RANDOM_SELECT_REVIEWS', '10', 'How many records to select from to choose one random product review', 3, 10, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (756, 'Selection of Random New Products', 'MAX_RANDOM_SELECT_NEW', '10', 'How many records to select from to choose one random new product to display', 3, 11, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (757, 'Selection of Products on Special', 'MAX_RANDOM_SELECT_SPECIALS', '10', 'How many records to select from to choose one random product special to display', 3, 12, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (758, 'Categories To List Per Row', 'MAX_DISPLAY_CATEGORIES_PER_ROW', '3', 'How many categories to list per row', 3, 13, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (759, 'New Products Listing', 'MAX_DISPLAY_PRODUCTS_NEW', '10', 'Maximum number of new products to display in new products page', 3, 14, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (760, 'Best Sellers', 'MAX_DISPLAY_BESTSELLERS', '10', 'Maximum number of best sellers to display', 3, 15, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (761, 'Also Purchased', 'MAX_DISPLAY_ALSO_PURCHASED', '6', 'Maximum number of products to display in the \'This Customer Also Purchased\' box', 3, 16, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (762, 'Customer Order History Box', 'MAX_DISPLAY_PRODUCTS_IN_ORDER_HISTORY_BOX', '6', 'Maximum number of products to display in the customer order history box', 3, 17, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (763, 'Order History', 'MAX_DISPLAY_ORDER_HISTORY', '10', 'Maximum number of orders to display in the order history page', 3, 18, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (764, 'Small Image Width', 'SMALL_IMAGE_WIDTH', '100', 'The pixel width of small images', 4, 1, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (765, 'Small Image Height', 'SMALL_IMAGE_HEIGHT', '80', 'The pixel height of small images', 4, 2, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (766, 'Heading Image Width', 'HEADING_IMAGE_WIDTH', '57', 'The pixel width of heading images', 4, 3, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (767, 'Heading Image Height', 'HEADING_IMAGE_HEIGHT', '40', 'The pixel height of heading images', 4, 4, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (768, 'Subcategory Image Width', 'SUBCATEGORY_IMAGE_WIDTH', '100', 'The pixel width of subcategory images', 4, 5, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (769, 'Subcategory Image Height', 'SUBCATEGORY_IMAGE_HEIGHT', '57', 'The pixel height of subcategory images', 4, 6, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (770, 'Calculate Image Size', 'CONFIG_CALCULATE_IMAGE_SIZE', 'true', 'Calculate the size of images?', 4, 7, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (771, 'Image Required', 'IMAGE_REQUIRED', 'true', 'Enable to display broken images. Good for development.', 4, 8, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (772, 'Gender', 'ACCOUNT_GENDER', 'true', 'Display gender in the customers account', 5, 1, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (773, 'Date of Birth', 'ACCOUNT_DOB', 'true', 'Display date of birth in the customers account', 5, 2, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (774, 'Company', 'ACCOUNT_COMPANY', 'true', 'Display company in the customers account', 5, 3, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (775, 'Suburb', 'ACCOUNT_SUBURB', 'true', 'Display suburb in the customers account', 5, 4, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (776, 'State', 'ACCOUNT_STATE', 'true', 'Display state in the customers account', 5, 5, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (777, 'Installed Modules', 'MODULE_PAYMENT_INSTALLED', 'cc.php;cod.php', 'List of payment module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: cc.php;cod.php;paypal.php)', 6, 0, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (778, 'Installed Modules', 'MODULE_ORDER_TOTAL_INSTALLED', 'ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php', 'List of order_total module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php)', 6, 0, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (779, 'Installed Modules', 'MODULE_SHIPPING_INSTALLED', 'flat.php', 'List of shipping module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ups.php;flat.php;item.php)', 6, 0, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (780, 'Enable Cash On Delivery Module', 'MODULE_PAYMENT_COD_STATUS', 'True', 'Do you want to accept Cash On Delevery payments?', 6, 1, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (781, 'Payment Zone', 'MODULE_PAYMENT_COD_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', 6, 2, NULL, '2005-04-01 20:14:29', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes(');
INSERT INTO configuration VALUES (782, 'Sort order of display.', 'MODULE_PAYMENT_COD_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (783, 'Set Order Status', 'MODULE_PAYMENT_COD_ORDER_STATUS_ID', '0', 'Set the status of orders made with this payment module to this value', 6, 0, NULL, '2005-04-01 20:14:29', 'tep_get_order_status_name', 'tep_cfg_pull_down_order_statuses(');
INSERT INTO configuration VALUES (784, 'Enable Credit Card Module', 'MODULE_PAYMENT_CC_STATUS', 'True', 'Do you want to accept credit card payments?', 6, 0, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (785, 'Split Credit Card E-Mail Address', 'MODULE_PAYMENT_CC_EMAIL', '', 'If an e-mail address is entered, the middle digits of the credit card number will be sent to the e-mail address (the outside digits are stored in the database with the middle digits censored)', 6, 0, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (786, 'Sort order of display.', 'MODULE_PAYMENT_CC_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (787, 'Payment Zone', 'MODULE_PAYMENT_CC_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', 6, 2, NULL, '2005-04-01 20:14:29', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes(');
INSERT INTO configuration VALUES (788, 'Set Order Status', 'MODULE_PAYMENT_CC_ORDER_STATUS_ID', '0', 'Set the status of orders made with this payment module to this value', 6, 0, NULL, '2005-04-01 20:14:29', 'tep_get_order_status_name', 'tep_cfg_pull_down_order_statuses(');
INSERT INTO configuration VALUES (789, 'Enable Flat Shipping', 'MODULE_SHIPPING_FLAT_STATUS', 'True', 'Do you want to offer flat rate shipping?', 6, 0, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (790, 'Shipping Cost', 'MODULE_SHIPPING_FLAT_COST', '5.00', 'The shipping cost for all orders using this shipping method.', 6, 0, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (791, 'Tax Class', 'MODULE_SHIPPING_FLAT_TAX_CLASS', '0', 'Use the following tax class on the shipping fee.', 6, 0, NULL, '2005-04-01 20:14:29', 'tep_get_tax_class_title', 'tep_cfg_pull_down_tax_classes(');
INSERT INTO configuration VALUES (792, 'Shipping Zone', 'MODULE_SHIPPING_FLAT_ZONE', '0', 'If a zone is selected, only enable this shipping method for that zone.', 6, 0, NULL, '2005-04-01 20:14:29', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes(');
INSERT INTO configuration VALUES (793, 'Sort Order', 'MODULE_SHIPPING_FLAT_SORT_ORDER', '0', 'Sort order of display.', 6, 0, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (794, 'Default Currency', 'DEFAULT_CURRENCY', 'USD', 'Default Currency', 6, 0, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (795, 'Default Language', 'DEFAULT_LANGUAGE', 'en', 'Default Language', 6, 0, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (796, 'Default Order Status For New Orders', 'DEFAULT_ORDERS_STATUS_ID', '1', 'When a new order is created, this order status will be assigned to it.', 6, 0, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (797, 'Display Shipping', 'MODULE_ORDER_TOTAL_SHIPPING_STATUS', 'true', 'Do you want to display the order shipping cost?', 6, 1, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (798, 'Sort Order', 'MODULE_ORDER_TOTAL_SHIPPING_SORT_ORDER', '2', 'Sort order of display.', 6, 2, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (799, 'Allow Free Shipping', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING', 'false', 'Do you want to allow free shipping?', 6, 3, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (800, 'Free Shipping For Orders Over', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING_OVER', '50', 'Provide free shipping for orders over the set amount.', 6, 4, NULL, '2005-04-01 20:14:29', 'currencies->format', NULL);
INSERT INTO configuration VALUES (801, 'Provide Free Shipping For Orders Made', 'MODULE_ORDER_TOTAL_SHIPPING_DESTINATION', 'national', 'Provide free shipping for orders sent to the set destination.', 6, 5, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_select_option(array(\'national\', \'international\', \'both\'),');
INSERT INTO configuration VALUES (802, 'Display Sub-Total', 'MODULE_ORDER_TOTAL_SUBTOTAL_STATUS', 'true', 'Do you want to display the order sub-total cost?', 6, 1, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (803, 'Sort Order', 'MODULE_ORDER_TOTAL_SUBTOTAL_SORT_ORDER', '1', 'Sort order of display.', 6, 2, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (804, 'Display Tax', 'MODULE_ORDER_TOTAL_TAX_STATUS', 'true', 'Do you want to display the order tax value?', 6, 1, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (805, 'Sort Order', 'MODULE_ORDER_TOTAL_TAX_SORT_ORDER', '3', 'Sort order of display.', 6, 2, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (806, 'Display Total', 'MODULE_ORDER_TOTAL_TOTAL_STATUS', 'true', 'Do you want to display the total order value?', 6, 1, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (807, 'Sort Order', 'MODULE_ORDER_TOTAL_TOTAL_SORT_ORDER', '4', 'Sort order of display.', 6, 2, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (808, 'Country of Origin', 'SHIPPING_ORIGIN_COUNTRY', '223', 'Select the country of origin to be used in shipping quotes.', 7, 1, NULL, '2005-04-01 20:14:29', 'tep_get_country_name', 'tep_cfg_pull_down_country_list(');
INSERT INTO configuration VALUES (809, 'Postal Code', 'SHIPPING_ORIGIN_ZIP', 'NONE', 'Enter the Postal Code (ZIP) of the Store to be used in shipping quotes.', 7, 2, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (810, 'Enter the Maximum Package Weight you will ship', 'SHIPPING_MAX_WEIGHT', '50', 'Carriers have a max weight limit for a single package. This is a common one for all.', 7, 3, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (811, 'Package Tare weight.', 'SHIPPING_BOX_WEIGHT', '3', 'What is the weight of typical packaging of small to medium packages?', 7, 4, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (812, 'Larger packages - percentage increase.', 'SHIPPING_BOX_PADDING', '10', 'For 10% enter 10', 7, 5, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (813, 'Display Product Image', 'PRODUCT_LIST_IMAGE', '1', 'Do you want to display the Product Image?', 8, 1, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (814, 'Display Product Manufaturer Name', 'PRODUCT_LIST_MANUFACTURER', '0', 'Do you want to display the Product Manufacturer Name?', 8, 2, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (815, 'Display Product Model', 'PRODUCT_LIST_MODEL', '0', 'Do you want to display the Product Model?', 8, 3, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (816, 'Display Product Name', 'PRODUCT_LIST_NAME', '2', 'Do you want to display the Product Name?', 8, 4, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (817, 'Display Product Price', 'PRODUCT_LIST_PRICE', '3', 'Do you want to display the Product Price', 8, 5, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (818, 'Display Product Quantity', 'PRODUCT_LIST_QUANTITY', '0', 'Do you want to display the Product Quantity?', 8, 6, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (819, 'Display Product Weight', 'PRODUCT_LIST_WEIGHT', '0', 'Do you want to display the Product Weight?', 8, 7, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (820, 'Display Buy Now column', 'PRODUCT_LIST_BUY_NOW', '4', 'Do you want to display the Buy Now column?', 8, 8, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (821, 'Display Category/Manufacturer Filter (0=disable; 1=enable)', 'PRODUCT_LIST_FILTER', '1', 'Do you want to display the Category/Manufacturer Filter?', 8, 9, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (822, 'Location of Prev/Next Navigation Bar (1-top, 2-bottom, 3-both)', 'PREV_NEXT_BAR_LOCATION', '2', 'Sets the location of the Prev/Next Navigation Bar (1-top, 2-bottom, 3-both)', 8, 10, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (823, 'Check stock level', 'STOCK_CHECK', 'true', 'Check to see if sufficent stock is available', 9, 1, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (824, 'Subtract stock', 'STOCK_LIMITED', 'true', 'Subtract product in stock by product orders', 9, 2, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (825, 'Allow Checkout', 'STOCK_ALLOW_CHECKOUT', 'true', 'Allow customer to checkout even if there is insufficient stock', 9, 3, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (826, 'Mark product out of stock', 'STOCK_MARK_PRODUCT_OUT_OF_STOCK', '***', 'Display something on screen so customer can see which product has insufficient stock', 9, 4, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (827, 'Stock Re-order level', 'STOCK_REORDER_LEVEL', '5', 'Define when stock needs to be re-ordered', 9, 5, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (828, 'Store Page Parse Time', 'STORE_PAGE_PARSE_TIME', 'false', 'Store the time it takes to parse a page', 10, 1, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (829, 'Log Destination', 'STORE_PAGE_PARSE_TIME_LOG', '/var/log/www/tep/page_parse_time.log', 'Directory and filename of the page parse time log', 10, 2, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (830, 'Log Date Format', 'STORE_PARSE_DATE_TIME_FORMAT', '%d/%m/%Y %H:%M:%S', 'The date format', 10, 3, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (831, 'Display The Page Parse Time', 'DISPLAY_PAGE_PARSE_TIME', 'true', 'Display the page parse time (store page parse time must be enabled)', 10, 4, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (832, 'Store Database Queries', 'STORE_DB_TRANSACTIONS', 'false', 'Store the database queries in the page parse time log (PHP4 only)', 10, 5, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (833, 'Use Cache', 'USE_CACHE', 'false', 'Use caching features', 11, 1, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (834, 'Cache Directory', 'DIR_FS_CACHE', '/tmp/', 'The directory where the cached files are saved', 11, 2, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (835, 'E-Mail Transport Method', 'EMAIL_TRANSPORT', 'sendmail', 'Defines if this server uses a local connection to sendmail or uses an SMTP connection via TCP/IP. Servers running on Windows and MacOS should change this setting to SMTP.', 12, 1, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_select_option(array(\'sendmail\', \'smtp\'),');
INSERT INTO configuration VALUES (836, 'E-Mail Linefeeds', 'EMAIL_LINEFEED', 'LF', 'Defines the character sequence used to separate mail headers.', 12, 2, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_select_option(array(\'LF\', \'CRLF\'),');
INSERT INTO configuration VALUES (837, 'Use MIME HTML When Sending Emails', 'EMAIL_USE_HTML', 'false', 'Send e-mails in HTML format', 12, 3, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (838, 'Verify E-Mail Addresses Through DNS', 'ENTRY_EMAIL_ADDRESS_CHECK', 'false', 'Verify e-mail address through a DNS server', 12, 4, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (839, 'Send E-Mails', 'SEND_EMAILS', 'true', 'Send out e-mails', 12, 5, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (840, 'Enable download', 'DOWNLOAD_ENABLED', 'false', 'Enable the products download functions.', 13, 1, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (841, 'Download by redirect', 'DOWNLOAD_BY_REDIRECT', 'false', 'Use browser redirection for download. Disable on non-Unix systems.', 13, 2, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (842, 'Expiry delay (days)', 'DOWNLOAD_MAX_DAYS', '7', 'Set number of days before the download link expires. 0 means no limit.', 13, 3, NULL, '2005-04-01 20:14:29', NULL, '');
INSERT INTO configuration VALUES (843, 'Maximum number of downloads', 'DOWNLOAD_MAX_COUNT', '5', 'Set the maximum number of downloads. 0 means no download authorized.', 13, 4, NULL, '2005-04-01 20:14:29', NULL, '');
INSERT INTO configuration VALUES (844, 'Enable GZip Compression', 'GZIP_COMPRESSION', 'false', 'Enable HTTP GZip compression.', 14, 1, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (845, 'Compression Level', 'GZIP_LEVEL', '5', 'Use this compression level 0-9 (0 = minimum, 9 = maximum).', 14, 2, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (846, 'Session Directory', 'SESSION_WRITE_DIRECTORY', '/tmp', 'If sessions are file based, store them in this directory.', 15, 1, NULL, '2005-04-01 20:14:29', NULL, NULL);
INSERT INTO configuration VALUES (847, 'Force Cookie Use', 'SESSION_FORCE_COOKIE_USE', 'False', 'Force the use of sessions when cookies are only enabled.', 15, 2, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (848, 'Check SSL Session ID', 'SESSION_CHECK_SSL_SESSION_ID', 'False', 'Validate the SSL_SESSION_ID on every secure HTTPS page request.', 15, 3, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (849, 'Check User Agent', 'SESSION_CHECK_USER_AGENT', 'False', 'Validate the clients browser user agent on every page request.', 15, 4, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (850, 'Check IP Address', 'SESSION_CHECK_IP_ADDRESS', 'False', 'Validate the clients IP address on every page request.', 15, 5, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (851, 'Prevent Spider Sessions', 'SESSION_BLOCK_SPIDERS', 'False', 'Prevent known spiders from starting a session.', 15, 6, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (852, 'Recreate Session', 'SESSION_RECREATE', 'False', 'Recreate the session to generate a new session ID when the customer logs on or creates an account (PHP >=4.1 needed).', 15, 7, NULL, '2005-04-01 20:14:29', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (853, 'Store Name', 'STORE_NAME', 'osCommerce', 'The name of my store', 1, 1, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (854, 'Store Owner', 'STORE_OWNER', 'Harald Ponce de Leon', 'The name of my store owner', 1, 2, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (855, 'E-Mail Address', 'STORE_OWNER_EMAIL_ADDRESS', 'root@localhost', 'The e-mail address of my store owner', 1, 3, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (856, 'E-Mail From', 'EMAIL_FROM', 'osCommerce <root@localhost>', 'The e-mail address used in (sent) e-mails', 1, 4, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (857, 'Country', 'STORE_COUNTRY', '223', 'The country my store is located in <br><br><b>Note: Please remember to update the store zone.</b>', 1, 6, NULL, '2005-04-01 20:15:26', 'tep_get_country_name', 'tep_cfg_pull_down_country_list(');
INSERT INTO configuration VALUES (858, 'Zone', 'STORE_ZONE', '18', 'The zone my store is located in', 1, 7, NULL, '2005-04-01 20:15:26', 'tep_cfg_get_zone_name', 'tep_cfg_pull_down_zone_list(');
INSERT INTO configuration VALUES (859, 'Expected Sort Order', 'EXPECTED_PRODUCTS_SORT', 'desc', 'This is the sort order used in the expected products box.', 1, 8, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_select_option(array(\'asc\', \'desc\'),');
INSERT INTO configuration VALUES (860, 'Expected Sort Field', 'EXPECTED_PRODUCTS_FIELD', 'date_expected', 'The column to sort by in the expected products box.', 1, 9, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_select_option(array(\'products_name\', \'date_expected\'),');
INSERT INTO configuration VALUES (861, 'Switch To Default Language Currency', 'USE_DEFAULT_LANGUAGE_CURRENCY', 'false', 'Automatically switch to the language\'s currency when it is changed', 1, 10, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (862, 'Send Extra Order Emails To', 'SEND_EXTRA_ORDER_EMAILS_TO', '', 'Send extra order emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 1, 11, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (863, 'Use Search-Engine Safe URLs (still in development)', 'SEARCH_ENGINE_FRIENDLY_URLS', 'false', 'Use search-engine safe urls for all site links', 1, 12, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (864, 'Display Cart After Adding Product', 'DISPLAY_CART', 'true', 'Display the shopping cart after adding a product (or return back to their origin)', 1, 14, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (865, 'Allow Guest To Tell A Friend', 'ALLOW_GUEST_TO_TELL_A_FRIEND', 'false', 'Allow guests to tell a friend about a product', 1, 15, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (866, 'Default Search Operator', 'ADVANCED_SEARCH_DEFAULT_OPERATOR', 'and', 'Default search operators', 1, 17, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_select_option(array(\'and\', \'or\'),');
INSERT INTO configuration VALUES (867, 'Store Address and Phone', 'STORE_NAME_ADDRESS', 'Store Name\nAddress\nCountry\nPhone', 'This is the Store Name, Address and Phone used on printable documents and displayed online', 1, 18, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_textarea(');
INSERT INTO configuration VALUES (868, 'Show Category Counts', 'SHOW_COUNTS', 'true', 'Count recursively how many products are in each category', 1, 19, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (869, 'Tax Decimal Places', 'TAX_DECIMAL_PLACES', '0', 'Pad the tax value this amount of decimal places', 1, 20, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (870, 'Display Prices with Tax', 'DISPLAY_PRICE_WITH_TAX', 'false', 'Display prices with tax included (true) or add the tax at the end (false)', 1, 21, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (871, 'First Name', 'ENTRY_FIRST_NAME_MIN_LENGTH', '2', 'Minimum length of first name', 2, 1, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (872, 'Last Name', 'ENTRY_LAST_NAME_MIN_LENGTH', '2', 'Minimum length of last name', 2, 2, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (873, 'Date of Birth', 'ENTRY_DOB_MIN_LENGTH', '10', 'Minimum length of date of birth', 2, 3, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (874, 'E-Mail Address', 'ENTRY_EMAIL_ADDRESS_MIN_LENGTH', '6', 'Minimum length of e-mail address', 2, 4, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (875, 'Street Address', 'ENTRY_STREET_ADDRESS_MIN_LENGTH', '5', 'Minimum length of street address', 2, 5, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (876, 'Company', 'ENTRY_COMPANY_MIN_LENGTH', '2', 'Minimum length of company name', 2, 6, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (877, 'Post Code', 'ENTRY_POSTCODE_MIN_LENGTH', '4', 'Minimum length of post code', 2, 7, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (878, 'City', 'ENTRY_CITY_MIN_LENGTH', '3', 'Minimum length of city', 2, 8, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (879, 'State', 'ENTRY_STATE_MIN_LENGTH', '2', 'Minimum length of state', 2, 9, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (880, 'Telephone Number', 'ENTRY_TELEPHONE_MIN_LENGTH', '3', 'Minimum length of telephone number', 2, 10, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (881, 'Password', 'ENTRY_PASSWORD_MIN_LENGTH', '5', 'Minimum length of password', 2, 11, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (882, 'Credit Card Owner Name', 'CC_OWNER_MIN_LENGTH', '3', 'Minimum length of credit card owner name', 2, 12, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (883, 'Credit Card Number', 'CC_NUMBER_MIN_LENGTH', '10', 'Minimum length of credit card number', 2, 13, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (884, 'Review Text', 'REVIEW_TEXT_MIN_LENGTH', '50', 'Minimum length of review text', 2, 14, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (885, 'Best Sellers', 'MIN_DISPLAY_BESTSELLERS', '1', 'Minimum number of best sellers to display', 2, 15, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (886, 'Also Purchased', 'MIN_DISPLAY_ALSO_PURCHASED', '1', 'Minimum number of products to display in the \'This Customer Also Purchased\' box', 2, 16, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (887, 'Address Book Entries', 'MAX_ADDRESS_BOOK_ENTRIES', '5', 'Maximum address book entries a customer is allowed to have', 3, 1, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (888, 'Search Results', 'MAX_DISPLAY_SEARCH_RESULTS', '20', 'Amount of products to list', 3, 2, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (889, 'Page Links', 'MAX_DISPLAY_PAGE_LINKS', '5', 'Number of \'number\' links use for page-sets', 3, 3, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (890, 'Special Products', 'MAX_DISPLAY_SPECIAL_PRODUCTS', '9', 'Maximum number of products on special to display', 3, 4, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (891, 'New Products Module', 'MAX_DISPLAY_NEW_PRODUCTS', '9', 'Maximum number of new products to display in a category', 3, 5, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (892, 'Products Expected', 'MAX_DISPLAY_UPCOMING_PRODUCTS', '10', 'Maximum number of products expected to display', 3, 6, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (893, 'Manufacturers List', 'MAX_DISPLAY_MANUFACTURERS_IN_A_LIST', '0', 'Used in manufacturers box; when the number of manufacturers exceeds this number, a drop-down list will be displayed instead of the default list', 3, 7, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (894, 'Manufacturers Select Size', 'MAX_MANUFACTURERS_LIST', '1', 'Used in manufacturers box; when this value is \'1\' the classic drop-down list will be used for the manufacturers box. Otherwise, a list-box with the specified number of rows will be displayed.', 3, 7, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (895, 'Length of Manufacturers Name', 'MAX_DISPLAY_MANUFACTURER_NAME_LEN', '15', 'Used in manufacturers box; maximum length of manufacturers name to display', 3, 8, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (896, 'New Reviews', 'MAX_DISPLAY_NEW_REVIEWS', '6', 'Maximum number of new reviews to display', 3, 9, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (897, 'Selection of Random Reviews', 'MAX_RANDOM_SELECT_REVIEWS', '10', 'How many records to select from to choose one random product review', 3, 10, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (898, 'Selection of Random New Products', 'MAX_RANDOM_SELECT_NEW', '10', 'How many records to select from to choose one random new product to display', 3, 11, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (899, 'Selection of Products on Special', 'MAX_RANDOM_SELECT_SPECIALS', '10', 'How many records to select from to choose one random product special to display', 3, 12, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (900, 'Categories To List Per Row', 'MAX_DISPLAY_CATEGORIES_PER_ROW', '3', 'How many categories to list per row', 3, 13, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (901, 'New Products Listing', 'MAX_DISPLAY_PRODUCTS_NEW', '10', 'Maximum number of new products to display in new products page', 3, 14, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (902, 'Best Sellers', 'MAX_DISPLAY_BESTSELLERS', '10', 'Maximum number of best sellers to display', 3, 15, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (903, 'Also Purchased', 'MAX_DISPLAY_ALSO_PURCHASED', '6', 'Maximum number of products to display in the \'This Customer Also Purchased\' box', 3, 16, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (904, 'Customer Order History Box', 'MAX_DISPLAY_PRODUCTS_IN_ORDER_HISTORY_BOX', '6', 'Maximum number of products to display in the customer order history box', 3, 17, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (905, 'Order History', 'MAX_DISPLAY_ORDER_HISTORY', '10', 'Maximum number of orders to display in the order history page', 3, 18, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (906, 'Small Image Width', 'SMALL_IMAGE_WIDTH', '100', 'The pixel width of small images', 4, 1, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (907, 'Small Image Height', 'SMALL_IMAGE_HEIGHT', '80', 'The pixel height of small images', 4, 2, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (908, 'Heading Image Width', 'HEADING_IMAGE_WIDTH', '57', 'The pixel width of heading images', 4, 3, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (909, 'Heading Image Height', 'HEADING_IMAGE_HEIGHT', '40', 'The pixel height of heading images', 4, 4, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (910, 'Subcategory Image Width', 'SUBCATEGORY_IMAGE_WIDTH', '100', 'The pixel width of subcategory images', 4, 5, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (911, 'Subcategory Image Height', 'SUBCATEGORY_IMAGE_HEIGHT', '57', 'The pixel height of subcategory images', 4, 6, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (912, 'Calculate Image Size', 'CONFIG_CALCULATE_IMAGE_SIZE', 'true', 'Calculate the size of images?', 4, 7, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (913, 'Image Required', 'IMAGE_REQUIRED', 'true', 'Enable to display broken images. Good for development.', 4, 8, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (914, 'Gender', 'ACCOUNT_GENDER', 'true', 'Display gender in the customers account', 5, 1, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (915, 'Date of Birth', 'ACCOUNT_DOB', 'true', 'Display date of birth in the customers account', 5, 2, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (916, 'Company', 'ACCOUNT_COMPANY', 'true', 'Display company in the customers account', 5, 3, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (917, 'Suburb', 'ACCOUNT_SUBURB', 'true', 'Display suburb in the customers account', 5, 4, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (918, 'State', 'ACCOUNT_STATE', 'true', 'Display state in the customers account', 5, 5, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (919, 'Installed Modules', 'MODULE_PAYMENT_INSTALLED', 'cc.php;cod.php', 'List of payment module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: cc.php;cod.php;paypal.php)', 6, 0, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (920, 'Installed Modules', 'MODULE_ORDER_TOTAL_INSTALLED', 'ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php', 'List of order_total module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php)', 6, 0, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (921, 'Installed Modules', 'MODULE_SHIPPING_INSTALLED', 'flat.php', 'List of shipping module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ups.php;flat.php;item.php)', 6, 0, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (922, 'Enable Cash On Delivery Module', 'MODULE_PAYMENT_COD_STATUS', 'True', 'Do you want to accept Cash On Delevery payments?', 6, 1, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (923, 'Payment Zone', 'MODULE_PAYMENT_COD_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', 6, 2, NULL, '2005-04-01 20:15:26', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes(');
INSERT INTO configuration VALUES (924, 'Sort order of display.', 'MODULE_PAYMENT_COD_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (925, 'Set Order Status', 'MODULE_PAYMENT_COD_ORDER_STATUS_ID', '0', 'Set the status of orders made with this payment module to this value', 6, 0, NULL, '2005-04-01 20:15:26', 'tep_get_order_status_name', 'tep_cfg_pull_down_order_statuses(');
INSERT INTO configuration VALUES (926, 'Enable Credit Card Module', 'MODULE_PAYMENT_CC_STATUS', 'True', 'Do you want to accept credit card payments?', 6, 0, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (927, 'Split Credit Card E-Mail Address', 'MODULE_PAYMENT_CC_EMAIL', '', 'If an e-mail address is entered, the middle digits of the credit card number will be sent to the e-mail address (the outside digits are stored in the database with the middle digits censored)', 6, 0, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (928, 'Sort order of display.', 'MODULE_PAYMENT_CC_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (929, 'Payment Zone', 'MODULE_PAYMENT_CC_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', 6, 2, NULL, '2005-04-01 20:15:26', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes(');
INSERT INTO configuration VALUES (930, 'Set Order Status', 'MODULE_PAYMENT_CC_ORDER_STATUS_ID', '0', 'Set the status of orders made with this payment module to this value', 6, 0, NULL, '2005-04-01 20:15:26', 'tep_get_order_status_name', 'tep_cfg_pull_down_order_statuses(');
INSERT INTO configuration VALUES (931, 'Enable Flat Shipping', 'MODULE_SHIPPING_FLAT_STATUS', 'True', 'Do you want to offer flat rate shipping?', 6, 0, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (932, 'Shipping Cost', 'MODULE_SHIPPING_FLAT_COST', '5.00', 'The shipping cost for all orders using this shipping method.', 6, 0, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (933, 'Tax Class', 'MODULE_SHIPPING_FLAT_TAX_CLASS', '0', 'Use the following tax class on the shipping fee.', 6, 0, NULL, '2005-04-01 20:15:26', 'tep_get_tax_class_title', 'tep_cfg_pull_down_tax_classes(');
INSERT INTO configuration VALUES (934, 'Shipping Zone', 'MODULE_SHIPPING_FLAT_ZONE', '0', 'If a zone is selected, only enable this shipping method for that zone.', 6, 0, NULL, '2005-04-01 20:15:26', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes(');
INSERT INTO configuration VALUES (935, 'Sort Order', 'MODULE_SHIPPING_FLAT_SORT_ORDER', '0', 'Sort order of display.', 6, 0, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (936, 'Default Currency', 'DEFAULT_CURRENCY', 'USD', 'Default Currency', 6, 0, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (937, 'Default Language', 'DEFAULT_LANGUAGE', 'en', 'Default Language', 6, 0, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (938, 'Default Order Status For New Orders', 'DEFAULT_ORDERS_STATUS_ID', '1', 'When a new order is created, this order status will be assigned to it.', 6, 0, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (939, 'Display Shipping', 'MODULE_ORDER_TOTAL_SHIPPING_STATUS', 'true', 'Do you want to display the order shipping cost?', 6, 1, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (940, 'Sort Order', 'MODULE_ORDER_TOTAL_SHIPPING_SORT_ORDER', '2', 'Sort order of display.', 6, 2, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (941, 'Allow Free Shipping', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING', 'false', 'Do you want to allow free shipping?', 6, 3, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (942, 'Free Shipping For Orders Over', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING_OVER', '50', 'Provide free shipping for orders over the set amount.', 6, 4, NULL, '2005-04-01 20:15:26', 'currencies->format', NULL);
INSERT INTO configuration VALUES (943, 'Provide Free Shipping For Orders Made', 'MODULE_ORDER_TOTAL_SHIPPING_DESTINATION', 'national', 'Provide free shipping for orders sent to the set destination.', 6, 5, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_select_option(array(\'national\', \'international\', \'both\'),');
INSERT INTO configuration VALUES (944, 'Display Sub-Total', 'MODULE_ORDER_TOTAL_SUBTOTAL_STATUS', 'true', 'Do you want to display the order sub-total cost?', 6, 1, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (945, 'Sort Order', 'MODULE_ORDER_TOTAL_SUBTOTAL_SORT_ORDER', '1', 'Sort order of display.', 6, 2, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (946, 'Display Tax', 'MODULE_ORDER_TOTAL_TAX_STATUS', 'true', 'Do you want to display the order tax value?', 6, 1, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (947, 'Sort Order', 'MODULE_ORDER_TOTAL_TAX_SORT_ORDER', '3', 'Sort order of display.', 6, 2, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (948, 'Display Total', 'MODULE_ORDER_TOTAL_TOTAL_STATUS', 'true', 'Do you want to display the total order value?', 6, 1, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (949, 'Sort Order', 'MODULE_ORDER_TOTAL_TOTAL_SORT_ORDER', '4', 'Sort order of display.', 6, 2, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (950, 'Country of Origin', 'SHIPPING_ORIGIN_COUNTRY', '223', 'Select the country of origin to be used in shipping quotes.', 7, 1, NULL, '2005-04-01 20:15:26', 'tep_get_country_name', 'tep_cfg_pull_down_country_list(');
INSERT INTO configuration VALUES (951, 'Postal Code', 'SHIPPING_ORIGIN_ZIP', 'NONE', 'Enter the Postal Code (ZIP) of the Store to be used in shipping quotes.', 7, 2, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (952, 'Enter the Maximum Package Weight you will ship', 'SHIPPING_MAX_WEIGHT', '50', 'Carriers have a max weight limit for a single package. This is a common one for all.', 7, 3, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (953, 'Package Tare weight.', 'SHIPPING_BOX_WEIGHT', '3', 'What is the weight of typical packaging of small to medium packages?', 7, 4, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (954, 'Larger packages - percentage increase.', 'SHIPPING_BOX_PADDING', '10', 'For 10% enter 10', 7, 5, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (955, 'Display Product Image', 'PRODUCT_LIST_IMAGE', '1', 'Do you want to display the Product Image?', 8, 1, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (956, 'Display Product Manufaturer Name', 'PRODUCT_LIST_MANUFACTURER', '0', 'Do you want to display the Product Manufacturer Name?', 8, 2, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (957, 'Display Product Model', 'PRODUCT_LIST_MODEL', '0', 'Do you want to display the Product Model?', 8, 3, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (958, 'Display Product Name', 'PRODUCT_LIST_NAME', '2', 'Do you want to display the Product Name?', 8, 4, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (959, 'Display Product Price', 'PRODUCT_LIST_PRICE', '3', 'Do you want to display the Product Price', 8, 5, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (960, 'Display Product Quantity', 'PRODUCT_LIST_QUANTITY', '0', 'Do you want to display the Product Quantity?', 8, 6, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (961, 'Display Product Weight', 'PRODUCT_LIST_WEIGHT', '0', 'Do you want to display the Product Weight?', 8, 7, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (962, 'Display Buy Now column', 'PRODUCT_LIST_BUY_NOW', '4', 'Do you want to display the Buy Now column?', 8, 8, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (963, 'Display Category/Manufacturer Filter (0=disable; 1=enable)', 'PRODUCT_LIST_FILTER', '1', 'Do you want to display the Category/Manufacturer Filter?', 8, 9, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (964, 'Location of Prev/Next Navigation Bar (1-top, 2-bottom, 3-both)', 'PREV_NEXT_BAR_LOCATION', '2', 'Sets the location of the Prev/Next Navigation Bar (1-top, 2-bottom, 3-both)', 8, 10, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (965, 'Check stock level', 'STOCK_CHECK', 'true', 'Check to see if sufficent stock is available', 9, 1, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (966, 'Subtract stock', 'STOCK_LIMITED', 'true', 'Subtract product in stock by product orders', 9, 2, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (967, 'Allow Checkout', 'STOCK_ALLOW_CHECKOUT', 'true', 'Allow customer to checkout even if there is insufficient stock', 9, 3, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (968, 'Mark product out of stock', 'STOCK_MARK_PRODUCT_OUT_OF_STOCK', '***', 'Display something on screen so customer can see which product has insufficient stock', 9, 4, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (969, 'Stock Re-order level', 'STOCK_REORDER_LEVEL', '5', 'Define when stock needs to be re-ordered', 9, 5, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (970, 'Store Page Parse Time', 'STORE_PAGE_PARSE_TIME', 'false', 'Store the time it takes to parse a page', 10, 1, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (971, 'Log Destination', 'STORE_PAGE_PARSE_TIME_LOG', '/var/log/www/tep/page_parse_time.log', 'Directory and filename of the page parse time log', 10, 2, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (972, 'Log Date Format', 'STORE_PARSE_DATE_TIME_FORMAT', '%d/%m/%Y %H:%M:%S', 'The date format', 10, 3, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (973, 'Display The Page Parse Time', 'DISPLAY_PAGE_PARSE_TIME', 'true', 'Display the page parse time (store page parse time must be enabled)', 10, 4, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (974, 'Store Database Queries', 'STORE_DB_TRANSACTIONS', 'false', 'Store the database queries in the page parse time log (PHP4 only)', 10, 5, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (975, 'Use Cache', 'USE_CACHE', 'false', 'Use caching features', 11, 1, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (976, 'Cache Directory', 'DIR_FS_CACHE', '/tmp/', 'The directory where the cached files are saved', 11, 2, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (977, 'E-Mail Transport Method', 'EMAIL_TRANSPORT', 'sendmail', 'Defines if this server uses a local connection to sendmail or uses an SMTP connection via TCP/IP. Servers running on Windows and MacOS should change this setting to SMTP.', 12, 1, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_select_option(array(\'sendmail\', \'smtp\'),');
INSERT INTO configuration VALUES (978, 'E-Mail Linefeeds', 'EMAIL_LINEFEED', 'LF', 'Defines the character sequence used to separate mail headers.', 12, 2, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_select_option(array(\'LF\', \'CRLF\'),');
INSERT INTO configuration VALUES (979, 'Use MIME HTML When Sending Emails', 'EMAIL_USE_HTML', 'false', 'Send e-mails in HTML format', 12, 3, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (980, 'Verify E-Mail Addresses Through DNS', 'ENTRY_EMAIL_ADDRESS_CHECK', 'false', 'Verify e-mail address through a DNS server', 12, 4, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (981, 'Send E-Mails', 'SEND_EMAILS', 'true', 'Send out e-mails', 12, 5, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (982, 'Enable download', 'DOWNLOAD_ENABLED', 'false', 'Enable the products download functions.', 13, 1, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (983, 'Download by redirect', 'DOWNLOAD_BY_REDIRECT', 'false', 'Use browser redirection for download. Disable on non-Unix systems.', 13, 2, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (984, 'Expiry delay (days)', 'DOWNLOAD_MAX_DAYS', '7', 'Set number of days before the download link expires. 0 means no limit.', 13, 3, NULL, '2005-04-01 20:15:26', NULL, '');
INSERT INTO configuration VALUES (985, 'Maximum number of downloads', 'DOWNLOAD_MAX_COUNT', '5', 'Set the maximum number of downloads. 0 means no download authorized.', 13, 4, NULL, '2005-04-01 20:15:26', NULL, '');
INSERT INTO configuration VALUES (986, 'Enable GZip Compression', 'GZIP_COMPRESSION', 'false', 'Enable HTTP GZip compression.', 14, 1, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (987, 'Compression Level', 'GZIP_LEVEL', '5', 'Use this compression level 0-9 (0 = minimum, 9 = maximum).', 14, 2, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (988, 'Session Directory', 'SESSION_WRITE_DIRECTORY', '/tmp', 'If sessions are file based, store them in this directory.', 15, 1, NULL, '2005-04-01 20:15:26', NULL, NULL);
INSERT INTO configuration VALUES (989, 'Force Cookie Use', 'SESSION_FORCE_COOKIE_USE', 'False', 'Force the use of sessions when cookies are only enabled.', 15, 2, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (990, 'Check SSL Session ID', 'SESSION_CHECK_SSL_SESSION_ID', 'False', 'Validate the SSL_SESSION_ID on every secure HTTPS page request.', 15, 3, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (991, 'Check User Agent', 'SESSION_CHECK_USER_AGENT', 'False', 'Validate the clients browser user agent on every page request.', 15, 4, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (992, 'Check IP Address', 'SESSION_CHECK_IP_ADDRESS', 'False', 'Validate the clients IP address on every page request.', 15, 5, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (993, 'Prevent Spider Sessions', 'SESSION_BLOCK_SPIDERS', 'False', 'Prevent known spiders from starting a session.', 15, 6, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (994, 'Recreate Session', 'SESSION_RECREATE', 'False', 'Recreate the session to generate a new session ID when the customer logs on or creates an account (PHP >=4.1 needed).', 15, 7, NULL, '2005-04-01 20:15:26', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (995, 'Store Name', 'STORE_NAME', 'osCommerce', 'The name of my store', 1, 1, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (996, 'Store Owner', 'STORE_OWNER', 'Harald Ponce de Leon', 'The name of my store owner', 1, 2, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (997, 'E-Mail Address', 'STORE_OWNER_EMAIL_ADDRESS', 'root@localhost', 'The e-mail address of my store owner', 1, 3, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (998, 'E-Mail From', 'EMAIL_FROM', 'osCommerce <root@localhost>', 'The e-mail address used in (sent) e-mails', 1, 4, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (999, 'Country', 'STORE_COUNTRY', '223', 'The country my store is located in <br><br><b>Note: Please remember to update the store zone.</b>', 1, 6, NULL, '2005-04-01 20:16:55', 'tep_get_country_name', 'tep_cfg_pull_down_country_list(');
INSERT INTO configuration VALUES (1000, 'Zone', 'STORE_ZONE', '18', 'The zone my store is located in', 1, 7, NULL, '2005-04-01 20:16:55', 'tep_cfg_get_zone_name', 'tep_cfg_pull_down_zone_list(');
INSERT INTO configuration VALUES (1001, 'Expected Sort Order', 'EXPECTED_PRODUCTS_SORT', 'desc', 'This is the sort order used in the expected products box.', 1, 8, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_select_option(array(\'asc\', \'desc\'),');
INSERT INTO configuration VALUES (1002, 'Expected Sort Field', 'EXPECTED_PRODUCTS_FIELD', 'date_expected', 'The column to sort by in the expected products box.', 1, 9, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_select_option(array(\'products_name\', \'date_expected\'),');
INSERT INTO configuration VALUES (1003, 'Switch To Default Language Currency', 'USE_DEFAULT_LANGUAGE_CURRENCY', 'false', 'Automatically switch to the language\'s currency when it is changed', 1, 10, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (1004, 'Send Extra Order Emails To', 'SEND_EXTRA_ORDER_EMAILS_TO', '', 'Send extra order emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 1, 11, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1005, 'Use Search-Engine Safe URLs (still in development)', 'SEARCH_ENGINE_FRIENDLY_URLS', 'false', 'Use search-engine safe urls for all site links', 1, 12, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (1006, 'Display Cart After Adding Product', 'DISPLAY_CART', 'true', 'Display the shopping cart after adding a product (or return back to their origin)', 1, 14, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (1007, 'Allow Guest To Tell A Friend', 'ALLOW_GUEST_TO_TELL_A_FRIEND', 'false', 'Allow guests to tell a friend about a product', 1, 15, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (1008, 'Default Search Operator', 'ADVANCED_SEARCH_DEFAULT_OPERATOR', 'and', 'Default search operators', 1, 17, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_select_option(array(\'and\', \'or\'),');
INSERT INTO configuration VALUES (1009, 'Store Address and Phone', 'STORE_NAME_ADDRESS', 'Store Name\nAddress\nCountry\nPhone', 'This is the Store Name, Address and Phone used on printable documents and displayed online', 1, 18, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_textarea(');
INSERT INTO configuration VALUES (1010, 'Show Category Counts', 'SHOW_COUNTS', 'true', 'Count recursively how many products are in each category', 1, 19, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (1011, 'Tax Decimal Places', 'TAX_DECIMAL_PLACES', '0', 'Pad the tax value this amount of decimal places', 1, 20, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1012, 'Display Prices with Tax', 'DISPLAY_PRICE_WITH_TAX', 'false', 'Display prices with tax included (true) or add the tax at the end (false)', 1, 21, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (1013, 'First Name', 'ENTRY_FIRST_NAME_MIN_LENGTH', '2', 'Minimum length of first name', 2, 1, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1014, 'Last Name', 'ENTRY_LAST_NAME_MIN_LENGTH', '2', 'Minimum length of last name', 2, 2, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1015, 'Date of Birth', 'ENTRY_DOB_MIN_LENGTH', '10', 'Minimum length of date of birth', 2, 3, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1016, 'E-Mail Address', 'ENTRY_EMAIL_ADDRESS_MIN_LENGTH', '6', 'Minimum length of e-mail address', 2, 4, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1017, 'Street Address', 'ENTRY_STREET_ADDRESS_MIN_LENGTH', '5', 'Minimum length of street address', 2, 5, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1018, 'Company', 'ENTRY_COMPANY_MIN_LENGTH', '2', 'Minimum length of company name', 2, 6, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1019, 'Post Code', 'ENTRY_POSTCODE_MIN_LENGTH', '4', 'Minimum length of post code', 2, 7, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1020, 'City', 'ENTRY_CITY_MIN_LENGTH', '3', 'Minimum length of city', 2, 8, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1021, 'State', 'ENTRY_STATE_MIN_LENGTH', '2', 'Minimum length of state', 2, 9, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1022, 'Telephone Number', 'ENTRY_TELEPHONE_MIN_LENGTH', '3', 'Minimum length of telephone number', 2, 10, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1023, 'Password', 'ENTRY_PASSWORD_MIN_LENGTH', '5', 'Minimum length of password', 2, 11, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1024, 'Credit Card Owner Name', 'CC_OWNER_MIN_LENGTH', '3', 'Minimum length of credit card owner name', 2, 12, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1025, 'Credit Card Number', 'CC_NUMBER_MIN_LENGTH', '10', 'Minimum length of credit card number', 2, 13, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1026, 'Review Text', 'REVIEW_TEXT_MIN_LENGTH', '50', 'Minimum length of review text', 2, 14, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1027, 'Best Sellers', 'MIN_DISPLAY_BESTSELLERS', '1', 'Minimum number of best sellers to display', 2, 15, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1028, 'Also Purchased', 'MIN_DISPLAY_ALSO_PURCHASED', '1', 'Minimum number of products to display in the \'This Customer Also Purchased\' box', 2, 16, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1029, 'Address Book Entries', 'MAX_ADDRESS_BOOK_ENTRIES', '5', 'Maximum address book entries a customer is allowed to have', 3, 1, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1030, 'Search Results', 'MAX_DISPLAY_SEARCH_RESULTS', '20', 'Amount of products to list', 3, 2, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1031, 'Page Links', 'MAX_DISPLAY_PAGE_LINKS', '5', 'Number of \'number\' links use for page-sets', 3, 3, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1032, 'Special Products', 'MAX_DISPLAY_SPECIAL_PRODUCTS', '9', 'Maximum number of products on special to display', 3, 4, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1033, 'New Products Module', 'MAX_DISPLAY_NEW_PRODUCTS', '9', 'Maximum number of new products to display in a category', 3, 5, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1034, 'Products Expected', 'MAX_DISPLAY_UPCOMING_PRODUCTS', '10', 'Maximum number of products expected to display', 3, 6, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1035, 'Manufacturers List', 'MAX_DISPLAY_MANUFACTURERS_IN_A_LIST', '0', 'Used in manufacturers box; when the number of manufacturers exceeds this number, a drop-down list will be displayed instead of the default list', 3, 7, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1036, 'Manufacturers Select Size', 'MAX_MANUFACTURERS_LIST', '1', 'Used in manufacturers box; when this value is \'1\' the classic drop-down list will be used for the manufacturers box. Otherwise, a list-box with the specified number of rows will be displayed.', 3, 7, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1037, 'Length of Manufacturers Name', 'MAX_DISPLAY_MANUFACTURER_NAME_LEN', '15', 'Used in manufacturers box; maximum length of manufacturers name to display', 3, 8, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1038, 'New Reviews', 'MAX_DISPLAY_NEW_REVIEWS', '6', 'Maximum number of new reviews to display', 3, 9, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1039, 'Selection of Random Reviews', 'MAX_RANDOM_SELECT_REVIEWS', '10', 'How many records to select from to choose one random product review', 3, 10, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1040, 'Selection of Random New Products', 'MAX_RANDOM_SELECT_NEW', '10', 'How many records to select from to choose one random new product to display', 3, 11, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1041, 'Selection of Products on Special', 'MAX_RANDOM_SELECT_SPECIALS', '10', 'How many records to select from to choose one random product special to display', 3, 12, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1042, 'Categories To List Per Row', 'MAX_DISPLAY_CATEGORIES_PER_ROW', '3', 'How many categories to list per row', 3, 13, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1043, 'New Products Listing', 'MAX_DISPLAY_PRODUCTS_NEW', '10', 'Maximum number of new products to display in new products page', 3, 14, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1044, 'Best Sellers', 'MAX_DISPLAY_BESTSELLERS', '10', 'Maximum number of best sellers to display', 3, 15, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1045, 'Also Purchased', 'MAX_DISPLAY_ALSO_PURCHASED', '6', 'Maximum number of products to display in the \'This Customer Also Purchased\' box', 3, 16, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1046, 'Customer Order History Box', 'MAX_DISPLAY_PRODUCTS_IN_ORDER_HISTORY_BOX', '6', 'Maximum number of products to display in the customer order history box', 3, 17, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1047, 'Order History', 'MAX_DISPLAY_ORDER_HISTORY', '10', 'Maximum number of orders to display in the order history page', 3, 18, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1048, 'Small Image Width', 'SMALL_IMAGE_WIDTH', '100', 'The pixel width of small images', 4, 1, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1049, 'Small Image Height', 'SMALL_IMAGE_HEIGHT', '80', 'The pixel height of small images', 4, 2, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1050, 'Heading Image Width', 'HEADING_IMAGE_WIDTH', '57', 'The pixel width of heading images', 4, 3, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1051, 'Heading Image Height', 'HEADING_IMAGE_HEIGHT', '40', 'The pixel height of heading images', 4, 4, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1052, 'Subcategory Image Width', 'SUBCATEGORY_IMAGE_WIDTH', '100', 'The pixel width of subcategory images', 4, 5, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1053, 'Subcategory Image Height', 'SUBCATEGORY_IMAGE_HEIGHT', '57', 'The pixel height of subcategory images', 4, 6, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1054, 'Calculate Image Size', 'CONFIG_CALCULATE_IMAGE_SIZE', 'true', 'Calculate the size of images?', 4, 7, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (1055, 'Image Required', 'IMAGE_REQUIRED', 'true', 'Enable to display broken images. Good for development.', 4, 8, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (1056, 'Gender', 'ACCOUNT_GENDER', 'true', 'Display gender in the customers account', 5, 1, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (1057, 'Date of Birth', 'ACCOUNT_DOB', 'true', 'Display date of birth in the customers account', 5, 2, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (1058, 'Company', 'ACCOUNT_COMPANY', 'true', 'Display company in the customers account', 5, 3, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (1059, 'Suburb', 'ACCOUNT_SUBURB', 'true', 'Display suburb in the customers account', 5, 4, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (1060, 'State', 'ACCOUNT_STATE', 'true', 'Display state in the customers account', 5, 5, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (1061, 'Installed Modules', 'MODULE_PAYMENT_INSTALLED', 'cc.php;cod.php', 'List of payment module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: cc.php;cod.php;paypal.php)', 6, 0, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1062, 'Installed Modules', 'MODULE_ORDER_TOTAL_INSTALLED', 'ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php', 'List of order_total module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php)', 6, 0, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1063, 'Installed Modules', 'MODULE_SHIPPING_INSTALLED', 'flat.php', 'List of shipping module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ups.php;flat.php;item.php)', 6, 0, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1064, 'Enable Cash On Delivery Module', 'MODULE_PAYMENT_COD_STATUS', 'True', 'Do you want to accept Cash On Delevery payments?', 6, 1, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (1065, 'Payment Zone', 'MODULE_PAYMENT_COD_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', 6, 2, NULL, '2005-04-01 20:16:55', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes(');
INSERT INTO configuration VALUES (1066, 'Sort order of display.', 'MODULE_PAYMENT_COD_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1067, 'Set Order Status', 'MODULE_PAYMENT_COD_ORDER_STATUS_ID', '0', 'Set the status of orders made with this payment module to this value', 6, 0, NULL, '2005-04-01 20:16:55', 'tep_get_order_status_name', 'tep_cfg_pull_down_order_statuses(');
INSERT INTO configuration VALUES (1068, 'Enable Credit Card Module', 'MODULE_PAYMENT_CC_STATUS', 'True', 'Do you want to accept credit card payments?', 6, 0, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (1069, 'Split Credit Card E-Mail Address', 'MODULE_PAYMENT_CC_EMAIL', '', 'If an e-mail address is entered, the middle digits of the credit card number will be sent to the e-mail address (the outside digits are stored in the database with the middle digits censored)', 6, 0, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1070, 'Sort order of display.', 'MODULE_PAYMENT_CC_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1071, 'Payment Zone', 'MODULE_PAYMENT_CC_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', 6, 2, NULL, '2005-04-01 20:16:55', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes(');
INSERT INTO configuration VALUES (1072, 'Set Order Status', 'MODULE_PAYMENT_CC_ORDER_STATUS_ID', '0', 'Set the status of orders made with this payment module to this value', 6, 0, NULL, '2005-04-01 20:16:55', 'tep_get_order_status_name', 'tep_cfg_pull_down_order_statuses(');
INSERT INTO configuration VALUES (1073, 'Enable Flat Shipping', 'MODULE_SHIPPING_FLAT_STATUS', 'True', 'Do you want to offer flat rate shipping?', 6, 0, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (1074, 'Shipping Cost', 'MODULE_SHIPPING_FLAT_COST', '5.00', 'The shipping cost for all orders using this shipping method.', 6, 0, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1075, 'Tax Class', 'MODULE_SHIPPING_FLAT_TAX_CLASS', '0', 'Use the following tax class on the shipping fee.', 6, 0, NULL, '2005-04-01 20:16:55', 'tep_get_tax_class_title', 'tep_cfg_pull_down_tax_classes(');
INSERT INTO configuration VALUES (1076, 'Shipping Zone', 'MODULE_SHIPPING_FLAT_ZONE', '0', 'If a zone is selected, only enable this shipping method for that zone.', 6, 0, NULL, '2005-04-01 20:16:55', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes(');
INSERT INTO configuration VALUES (1077, 'Sort Order', 'MODULE_SHIPPING_FLAT_SORT_ORDER', '0', 'Sort order of display.', 6, 0, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1078, 'Default Currency', 'DEFAULT_CURRENCY', 'USD', 'Default Currency', 6, 0, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1079, 'Default Language', 'DEFAULT_LANGUAGE', 'en', 'Default Language', 6, 0, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1080, 'Default Order Status For New Orders', 'DEFAULT_ORDERS_STATUS_ID', '1', 'When a new order is created, this order status will be assigned to it.', 6, 0, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1081, 'Display Shipping', 'MODULE_ORDER_TOTAL_SHIPPING_STATUS', 'true', 'Do you want to display the order shipping cost?', 6, 1, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (1082, 'Sort Order', 'MODULE_ORDER_TOTAL_SHIPPING_SORT_ORDER', '2', 'Sort order of display.', 6, 2, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1083, 'Allow Free Shipping', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING', 'false', 'Do you want to allow free shipping?', 6, 3, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (1084, 'Free Shipping For Orders Over', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING_OVER', '50', 'Provide free shipping for orders over the set amount.', 6, 4, NULL, '2005-04-01 20:16:55', 'currencies->format', NULL);
INSERT INTO configuration VALUES (1085, 'Provide Free Shipping For Orders Made', 'MODULE_ORDER_TOTAL_SHIPPING_DESTINATION', 'national', 'Provide free shipping for orders sent to the set destination.', 6, 5, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_select_option(array(\'national\', \'international\', \'both\'),');
INSERT INTO configuration VALUES (1086, 'Display Sub-Total', 'MODULE_ORDER_TOTAL_SUBTOTAL_STATUS', 'true', 'Do you want to display the order sub-total cost?', 6, 1, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (1087, 'Sort Order', 'MODULE_ORDER_TOTAL_SUBTOTAL_SORT_ORDER', '1', 'Sort order of display.', 6, 2, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1088, 'Display Tax', 'MODULE_ORDER_TOTAL_TAX_STATUS', 'true', 'Do you want to display the order tax value?', 6, 1, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (1089, 'Sort Order', 'MODULE_ORDER_TOTAL_TAX_SORT_ORDER', '3', 'Sort order of display.', 6, 2, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1090, 'Display Total', 'MODULE_ORDER_TOTAL_TOTAL_STATUS', 'true', 'Do you want to display the total order value?', 6, 1, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (1091, 'Sort Order', 'MODULE_ORDER_TOTAL_TOTAL_SORT_ORDER', '4', 'Sort order of display.', 6, 2, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1092, 'Country of Origin', 'SHIPPING_ORIGIN_COUNTRY', '223', 'Select the country of origin to be used in shipping quotes.', 7, 1, NULL, '2005-04-01 20:16:55', 'tep_get_country_name', 'tep_cfg_pull_down_country_list(');
INSERT INTO configuration VALUES (1093, 'Postal Code', 'SHIPPING_ORIGIN_ZIP', 'NONE', 'Enter the Postal Code (ZIP) of the Store to be used in shipping quotes.', 7, 2, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1094, 'Enter the Maximum Package Weight you will ship', 'SHIPPING_MAX_WEIGHT', '50', 'Carriers have a max weight limit for a single package. This is a common one for all.', 7, 3, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1095, 'Package Tare weight.', 'SHIPPING_BOX_WEIGHT', '3', 'What is the weight of typical packaging of small to medium packages?', 7, 4, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1096, 'Larger packages - percentage increase.', 'SHIPPING_BOX_PADDING', '10', 'For 10% enter 10', 7, 5, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1097, 'Display Product Image', 'PRODUCT_LIST_IMAGE', '1', 'Do you want to display the Product Image?', 8, 1, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1098, 'Display Product Manufaturer Name', 'PRODUCT_LIST_MANUFACTURER', '0', 'Do you want to display the Product Manufacturer Name?', 8, 2, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1099, 'Display Product Model', 'PRODUCT_LIST_MODEL', '0', 'Do you want to display the Product Model?', 8, 3, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1100, 'Display Product Name', 'PRODUCT_LIST_NAME', '2', 'Do you want to display the Product Name?', 8, 4, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1101, 'Display Product Price', 'PRODUCT_LIST_PRICE', '3', 'Do you want to display the Product Price', 8, 5, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1102, 'Display Product Quantity', 'PRODUCT_LIST_QUANTITY', '0', 'Do you want to display the Product Quantity?', 8, 6, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1103, 'Display Product Weight', 'PRODUCT_LIST_WEIGHT', '0', 'Do you want to display the Product Weight?', 8, 7, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1104, 'Display Buy Now column', 'PRODUCT_LIST_BUY_NOW', '4', 'Do you want to display the Buy Now column?', 8, 8, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1105, 'Display Category/Manufacturer Filter (0=disable; 1=enable)', 'PRODUCT_LIST_FILTER', '1', 'Do you want to display the Category/Manufacturer Filter?', 8, 9, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1106, 'Location of Prev/Next Navigation Bar (1-top, 2-bottom, 3-both)', 'PREV_NEXT_BAR_LOCATION', '2', 'Sets the location of the Prev/Next Navigation Bar (1-top, 2-bottom, 3-both)', 8, 10, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1107, 'Check stock level', 'STOCK_CHECK', 'true', 'Check to see if sufficent stock is available', 9, 1, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (1108, 'Subtract stock', 'STOCK_LIMITED', 'true', 'Subtract product in stock by product orders', 9, 2, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (1109, 'Allow Checkout', 'STOCK_ALLOW_CHECKOUT', 'true', 'Allow customer to checkout even if there is insufficient stock', 9, 3, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (1110, 'Mark product out of stock', 'STOCK_MARK_PRODUCT_OUT_OF_STOCK', '***', 'Display something on screen so customer can see which product has insufficient stock', 9, 4, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1111, 'Stock Re-order level', 'STOCK_REORDER_LEVEL', '5', 'Define when stock needs to be re-ordered', 9, 5, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1112, 'Store Page Parse Time', 'STORE_PAGE_PARSE_TIME', 'false', 'Store the time it takes to parse a page', 10, 1, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (1113, 'Log Destination', 'STORE_PAGE_PARSE_TIME_LOG', '/var/log/www/tep/page_parse_time.log', 'Directory and filename of the page parse time log', 10, 2, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1114, 'Log Date Format', 'STORE_PARSE_DATE_TIME_FORMAT', '%d/%m/%Y %H:%M:%S', 'The date format', 10, 3, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1115, 'Display The Page Parse Time', 'DISPLAY_PAGE_PARSE_TIME', 'true', 'Display the page parse time (store page parse time must be enabled)', 10, 4, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (1116, 'Store Database Queries', 'STORE_DB_TRANSACTIONS', 'false', 'Store the database queries in the page parse time log (PHP4 only)', 10, 5, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (1117, 'Use Cache', 'USE_CACHE', 'false', 'Use caching features', 11, 1, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (1118, 'Cache Directory', 'DIR_FS_CACHE', '/tmp/', 'The directory where the cached files are saved', 11, 2, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1119, 'E-Mail Transport Method', 'EMAIL_TRANSPORT', 'sendmail', 'Defines if this server uses a local connection to sendmail or uses an SMTP connection via TCP/IP. Servers running on Windows and MacOS should change this setting to SMTP.', 12, 1, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_select_option(array(\'sendmail\', \'smtp\'),');
INSERT INTO configuration VALUES (1120, 'E-Mail Linefeeds', 'EMAIL_LINEFEED', 'LF', 'Defines the character sequence used to separate mail headers.', 12, 2, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_select_option(array(\'LF\', \'CRLF\'),');
INSERT INTO configuration VALUES (1121, 'Use MIME HTML When Sending Emails', 'EMAIL_USE_HTML', 'false', 'Send e-mails in HTML format', 12, 3, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (1122, 'Verify E-Mail Addresses Through DNS', 'ENTRY_EMAIL_ADDRESS_CHECK', 'false', 'Verify e-mail address through a DNS server', 12, 4, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (1123, 'Send E-Mails', 'SEND_EMAILS', 'true', 'Send out e-mails', 12, 5, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (1124, 'Enable download', 'DOWNLOAD_ENABLED', 'false', 'Enable the products download functions.', 13, 1, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (1125, 'Download by redirect', 'DOWNLOAD_BY_REDIRECT', 'false', 'Use browser redirection for download. Disable on non-Unix systems.', 13, 2, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (1126, 'Expiry delay (days)', 'DOWNLOAD_MAX_DAYS', '7', 'Set number of days before the download link expires. 0 means no limit.', 13, 3, NULL, '2005-04-01 20:16:55', NULL, '');
INSERT INTO configuration VALUES (1127, 'Maximum number of downloads', 'DOWNLOAD_MAX_COUNT', '5', 'Set the maximum number of downloads. 0 means no download authorized.', 13, 4, NULL, '2005-04-01 20:16:55', NULL, '');
INSERT INTO configuration VALUES (1128, 'Enable GZip Compression', 'GZIP_COMPRESSION', 'false', 'Enable HTTP GZip compression.', 14, 1, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO configuration VALUES (1129, 'Compression Level', 'GZIP_LEVEL', '5', 'Use this compression level 0-9 (0 = minimum, 9 = maximum).', 14, 2, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1130, 'Session Directory', 'SESSION_WRITE_DIRECTORY', '/tmp', 'If sessions are file based, store them in this directory.', 15, 1, NULL, '2005-04-01 20:16:55', NULL, NULL);
INSERT INTO configuration VALUES (1131, 'Force Cookie Use', 'SESSION_FORCE_COOKIE_USE', 'False', 'Force the use of sessions when cookies are only enabled.', 15, 2, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (1132, 'Check SSL Session ID', 'SESSION_CHECK_SSL_SESSION_ID', 'False', 'Validate the SSL_SESSION_ID on every secure HTTPS page request.', 15, 3, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (1133, 'Check User Agent', 'SESSION_CHECK_USER_AGENT', 'False', 'Validate the clients browser user agent on every page request.', 15, 4, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (1134, 'Check IP Address', 'SESSION_CHECK_IP_ADDRESS', 'False', 'Validate the clients IP address on every page request.', 15, 5, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (1135, 'Prevent Spider Sessions', 'SESSION_BLOCK_SPIDERS', 'False', 'Prevent known spiders from starting a session.', 15, 6, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
INSERT INTO configuration VALUES (1136, 'Recreate Session', 'SESSION_RECREATE', 'False', 'Recreate the session to generate a new session ID when the customer logs on or creates an account (PHP >=4.1 needed).', 15, 7, NULL, '2005-04-01 20:16:55', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'),');
# --------------------------------------------------------

#
# Table structure for table `configuration_group`
#

CREATE TABLE configuration_group (
  configuration_group_id int(11) NOT NULL auto_increment,
  configuration_group_title varchar(64) NOT NULL default '',
  configuration_group_description varchar(255) NOT NULL default '',
  sort_order int(5) default NULL,
  visible int(1) default '1',
  PRIMARY KEY  (configuration_group_id)
) TYPE=MyISAM;

#
# Dumping data for table `configuration_group`
#

INSERT INTO configuration_group VALUES (1, 'My Store', 'General information about my store', 1, 1);
INSERT INTO configuration_group VALUES (2, 'Minimum Values', 'The minimum values for functions / data', 2, 1);
INSERT INTO configuration_group VALUES (3, 'Maximum Values', 'The maximum values for functions / data', 3, 1);
INSERT INTO configuration_group VALUES (4, 'Images', 'Image parameters', 4, 1);
INSERT INTO configuration_group VALUES (5, 'Customer Details', 'Customer account configuration', 5, 1);
INSERT INTO configuration_group VALUES (6, 'Module Options', 'Hidden from configuration', 6, 0);
INSERT INTO configuration_group VALUES (7, 'Shipping/Packaging', 'Shipping options available at my store', 7, 1);
INSERT INTO configuration_group VALUES (8, 'Product Listing', 'Product Listing    configuration options', 8, 1);
INSERT INTO configuration_group VALUES (9, 'Stock', 'Stock configuration options', 9, 1);
INSERT INTO configuration_group VALUES (10, 'Logging', 'Logging configuration options', 10, 1);
INSERT INTO configuration_group VALUES (11, 'Cache', 'Caching configuration options', 11, 1);
INSERT INTO configuration_group VALUES (12, 'E-Mail Options', 'General setting for E-Mail transport and HTML E-Mails', 12, 1);
INSERT INTO configuration_group VALUES (13, 'Download', 'Downloadable products options', 13, 1);
INSERT INTO configuration_group VALUES (14, 'GZip Compression', 'GZip compression options', 14, 1);
INSERT INTO configuration_group VALUES (15, 'Sessions', 'Session options', 15, 1);
# --------------------------------------------------------

#
# Table structure for table `counter`
#

CREATE TABLE counter (
  startdate char(8) default NULL,
  counter int(12) default NULL
) TYPE=MyISAM;

#
# Dumping data for table `counter`
#

INSERT INTO counter VALUES ('20050328', 222);
# --------------------------------------------------------

#
# Table structure for table `counter_history`
#

CREATE TABLE counter_history (
  month char(8) default NULL,
  counter int(12) default NULL
) TYPE=MyISAM;

#
# Dumping data for table `counter_history`
#

# --------------------------------------------------------

#
# Table structure for table `countries`
#

CREATE TABLE countries (
  countries_id int(11) NOT NULL auto_increment,
  countries_name varchar(64) NOT NULL default '',
  countries_iso_code_2 char(2) NOT NULL default '',
  countries_iso_code_3 char(3) NOT NULL default '',
  address_format_id int(11) NOT NULL default '0',
  PRIMARY KEY  (countries_id),
  KEY IDX_COUNTRIES_NAME (countries_name)
) TYPE=MyISAM;

#
# Dumping data for table `countries`
#

INSERT INTO countries VALUES (1, 'Afghanistan', 'AF', 'AFG', 1);
INSERT INTO countries VALUES (2, 'Albania', 'AL', 'ALB', 1);
INSERT INTO countries VALUES (3, 'Algeria', 'DZ', 'DZA', 1);
INSERT INTO countries VALUES (4, 'American Samoa', 'AS', 'ASM', 1);
INSERT INTO countries VALUES (5, 'Andorra', 'AD', 'AND', 1);
INSERT INTO countries VALUES (6, 'Angola', 'AO', 'AGO', 1);
INSERT INTO countries VALUES (7, 'Anguilla', 'AI', 'AIA', 1);
INSERT INTO countries VALUES (8, 'Antarctica', 'AQ', 'ATA', 1);
INSERT INTO countries VALUES (9, 'Antigua and Barbuda', 'AG', 'ATG', 1);
INSERT INTO countries VALUES (10, 'Argentina', 'AR', 'ARG', 1);
INSERT INTO countries VALUES (11, 'Armenia', 'AM', 'ARM', 1);
INSERT INTO countries VALUES (12, 'Aruba', 'AW', 'ABW', 1);
INSERT INTO countries VALUES (13, 'Australia', 'AU', 'AUS', 1);
INSERT INTO countries VALUES (14, 'Austria', 'AT', 'AUT', 5);
INSERT INTO countries VALUES (15, 'Azerbaijan', 'AZ', 'AZE', 1);
INSERT INTO countries VALUES (16, 'Bahamas', 'BS', 'BHS', 1);
INSERT INTO countries VALUES (17, 'Bahrain', 'BH', 'BHR', 1);
INSERT INTO countries VALUES (18, 'Bangladesh', 'BD', 'BGD', 1);
INSERT INTO countries VALUES (19, 'Barbados', 'BB', 'BRB', 1);
INSERT INTO countries VALUES (20, 'Belarus', 'BY', 'BLR', 1);
INSERT INTO countries VALUES (21, 'Belgium', 'BE', 'BEL', 1);
INSERT INTO countries VALUES (22, 'Belize', 'BZ', 'BLZ', 1);
INSERT INTO countries VALUES (23, 'Benin', 'BJ', 'BEN', 1);
INSERT INTO countries VALUES (24, 'Bermuda', 'BM', 'BMU', 1);
INSERT INTO countries VALUES (25, 'Bhutan', 'BT', 'BTN', 1);
INSERT INTO countries VALUES (26, 'Bolivia', 'BO', 'BOL', 1);
INSERT INTO countries VALUES (27, 'Bosnia and Herzegowina', 'BA', 'BIH', 1);
INSERT INTO countries VALUES (28, 'Botswana', 'BW', 'BWA', 1);
INSERT INTO countries VALUES (29, 'Bouvet Island', 'BV', 'BVT', 1);
INSERT INTO countries VALUES (30, 'Brazil', 'BR', 'BRA', 1);
INSERT INTO countries VALUES (31, 'British Indian Ocean Territory', 'IO', 'IOT', 1);
INSERT INTO countries VALUES (32, 'Brunei Darussalam', 'BN', 'BRN', 1);
INSERT INTO countries VALUES (33, 'Bulgaria', 'BG', 'BGR', 1);
INSERT INTO countries VALUES (34, 'Burkina Faso', 'BF', 'BFA', 1);
INSERT INTO countries VALUES (35, 'Burundi', 'BI', 'BDI', 1);
INSERT INTO countries VALUES (36, 'Cambodia', 'KH', 'KHM', 1);
INSERT INTO countries VALUES (37, 'Cameroon', 'CM', 'CMR', 1);
INSERT INTO countries VALUES (38, 'Canada', 'CA', 'CAN', 1);
INSERT INTO countries VALUES (39, 'Cape Verde', 'CV', 'CPV', 1);
INSERT INTO countries VALUES (40, 'Cayman Islands', 'KY', 'CYM', 1);
INSERT INTO countries VALUES (41, 'Central African Republic', 'CF', 'CAF', 1);
INSERT INTO countries VALUES (42, 'Chad', 'TD', 'TCD', 1);
INSERT INTO countries VALUES (43, 'Chile', 'CL', 'CHL', 1);
INSERT INTO countries VALUES (44, 'China', 'CN', 'CHN', 1);
INSERT INTO countries VALUES (45, 'Christmas Island', 'CX', 'CXR', 1);
INSERT INTO countries VALUES (46, 'Cocos (Keeling) Islands', 'CC', 'CCK', 1);
INSERT INTO countries VALUES (47, 'Colombia', 'CO', 'COL', 1);
INSERT INTO countries VALUES (48, 'Comoros', 'KM', 'COM', 1);
INSERT INTO countries VALUES (49, 'Congo', 'CG', 'COG', 1);
INSERT INTO countries VALUES (50, 'Cook Islands', 'CK', 'COK', 1);
INSERT INTO countries VALUES (51, 'Costa Rica', 'CR', 'CRI', 1);
INSERT INTO countries VALUES (52, 'Cote D\'Ivoire', 'CI', 'CIV', 1);
INSERT INTO countries VALUES (53, 'Croatia', 'HR', 'HRV', 1);
INSERT INTO countries VALUES (54, 'Cuba', 'CU', 'CUB', 1);
INSERT INTO countries VALUES (55, 'Cyprus', 'CY', 'CYP', 1);
INSERT INTO countries VALUES (56, 'Czech Republic', 'CZ', 'CZE', 1);
INSERT INTO countries VALUES (57, 'Denmark', 'DK', 'DNK', 1);
INSERT INTO countries VALUES (58, 'Djibouti', 'DJ', 'DJI', 1);
INSERT INTO countries VALUES (59, 'Dominica', 'DM', 'DMA', 1);
INSERT INTO countries VALUES (60, 'Dominican Republic', 'DO', 'DOM', 1);
INSERT INTO countries VALUES (61, 'East Timor', 'TP', 'TMP', 1);
INSERT INTO countries VALUES (62, 'Ecuador', 'EC', 'ECU', 1);
INSERT INTO countries VALUES (63, 'Egypt', 'EG', 'EGY', 1);
INSERT INTO countries VALUES (64, 'El Salvador', 'SV', 'SLV', 1);
INSERT INTO countries VALUES (65, 'Equatorial Guinea', 'GQ', 'GNQ', 1);
INSERT INTO countries VALUES (66, 'Eritrea', 'ER', 'ERI', 1);
INSERT INTO countries VALUES (67, 'Estonia', 'EE', 'EST', 1);
INSERT INTO countries VALUES (68, 'Ethiopia', 'ET', 'ETH', 1);
INSERT INTO countries VALUES (69, 'Falkland Islands (Malvinas)', 'FK', 'FLK', 1);
INSERT INTO countries VALUES (70, 'Faroe Islands', 'FO', 'FRO', 1);
INSERT INTO countries VALUES (71, 'Fiji', 'FJ', 'FJI', 1);
INSERT INTO countries VALUES (72, 'Finland', 'FI', 'FIN', 1);
INSERT INTO countries VALUES (73, 'France', 'FR', 'FRA', 1);
INSERT INTO countries VALUES (74, 'France, Metropolitan', 'FX', 'FXX', 1);
INSERT INTO countries VALUES (75, 'French Guiana', 'GF', 'GUF', 1);
INSERT INTO countries VALUES (76, 'French Polynesia', 'PF', 'PYF', 1);
INSERT INTO countries VALUES (77, 'French Southern Territories', 'TF', 'ATF', 1);
INSERT INTO countries VALUES (78, 'Gabon', 'GA', 'GAB', 1);
INSERT INTO countries VALUES (79, 'Gambia', 'GM', 'GMB', 1);
INSERT INTO countries VALUES (80, 'Georgia', 'GE', 'GEO', 1);
INSERT INTO countries VALUES (81, 'Germany', 'DE', 'DEU', 5);
INSERT INTO countries VALUES (82, 'Ghana', 'GH', 'GHA', 1);
INSERT INTO countries VALUES (83, 'Gibraltar', 'GI', 'GIB', 1);
INSERT INTO countries VALUES (84, 'Greece', 'GR', 'GRC', 1);
INSERT INTO countries VALUES (85, 'Greenland', 'GL', 'GRL', 1);
INSERT INTO countries VALUES (86, 'Grenada', 'GD', 'GRD', 1);
INSERT INTO countries VALUES (87, 'Guadeloupe', 'GP', 'GLP', 1);
INSERT INTO countries VALUES (88, 'Guam', 'GU', 'GUM', 1);
INSERT INTO countries VALUES (89, 'Guatemala', 'GT', 'GTM', 1);
INSERT INTO countries VALUES (90, 'Guinea', 'GN', 'GIN', 1);
INSERT INTO countries VALUES (91, 'Guinea-bissau', 'GW', 'GNB', 1);
INSERT INTO countries VALUES (92, 'Guyana', 'GY', 'GUY', 1);
INSERT INTO countries VALUES (93, 'Haiti', 'HT', 'HTI', 1);
INSERT INTO countries VALUES (94, 'Heard and Mc Donald Islands', 'HM', 'HMD', 1);
INSERT INTO countries VALUES (95, 'Honduras', 'HN', 'HND', 1);
INSERT INTO countries VALUES (96, 'Hong Kong', 'HK', 'HKG', 1);
INSERT INTO countries VALUES (97, 'Hungary', 'HU', 'HUN', 1);
INSERT INTO countries VALUES (98, 'Iceland', 'IS', 'ISL', 1);
INSERT INTO countries VALUES (99, 'India', 'IN', 'IND', 1);
INSERT INTO countries VALUES (100, 'Indonesia', 'ID', 'IDN', 1);
INSERT INTO countries VALUES (101, 'Iran (Islamic Republic of)', 'IR', 'IRN', 1);
INSERT INTO countries VALUES (102, 'Iraq', 'IQ', 'IRQ', 1);
INSERT INTO countries VALUES (103, 'Ireland', 'IE', 'IRL', 1);
INSERT INTO countries VALUES (104, 'Israel', 'IL', 'ISR', 1);
INSERT INTO countries VALUES (105, 'Italy', 'IT', 'ITA', 1);
INSERT INTO countries VALUES (106, 'Jamaica', 'JM', 'JAM', 1);
INSERT INTO countries VALUES (107, 'Japan', 'JP', 'JPN', 1);
INSERT INTO countries VALUES (108, 'Jordan', 'JO', 'JOR', 1);
INSERT INTO countries VALUES (109, 'Kazakhstan', 'KZ', 'KAZ', 1);
INSERT INTO countries VALUES (110, 'Kenya', 'KE', 'KEN', 1);
INSERT INTO countries VALUES (111, 'Kiribati', 'KI', 'KIR', 1);
INSERT INTO countries VALUES (112, 'Korea, Democratic People\'s Republic of', 'KP', 'PRK', 1);
INSERT INTO countries VALUES (113, 'Korea, Republic of', 'KR', 'KOR', 1);
INSERT INTO countries VALUES (114, 'Kuwait', 'KW', 'KWT', 1);
INSERT INTO countries VALUES (115, 'Kyrgyzstan', 'KG', 'KGZ', 1);
INSERT INTO countries VALUES (116, 'Lao People\'s Democratic Republic', 'LA', 'LAO', 1);
INSERT INTO countries VALUES (117, 'Latvia', 'LV', 'LVA', 1);
INSERT INTO countries VALUES (118, 'Lebanon', 'LB', 'LBN', 1);
INSERT INTO countries VALUES (119, 'Lesotho', 'LS', 'LSO', 1);
INSERT INTO countries VALUES (120, 'Liberia', 'LR', 'LBR', 1);
INSERT INTO countries VALUES (121, 'Libyan Arab Jamahiriya', 'LY', 'LBY', 1);
INSERT INTO countries VALUES (122, 'Liechtenstein', 'LI', 'LIE', 1);
INSERT INTO countries VALUES (123, 'Lithuania', 'LT', 'LTU', 1);
INSERT INTO countries VALUES (124, 'Luxembourg', 'LU', 'LUX', 1);
INSERT INTO countries VALUES (125, 'Macau', 'MO', 'MAC', 1);
INSERT INTO countries VALUES (126, 'Macedonia, The Former Yugoslav Republic of', 'MK', 'MKD', 1);
INSERT INTO countries VALUES (127, 'Madagascar', 'MG', 'MDG', 1);
INSERT INTO countries VALUES (128, 'Malawi', 'MW', 'MWI', 1);
INSERT INTO countries VALUES (129, 'Malaysia', 'MY', 'MYS', 1);
INSERT INTO countries VALUES (130, 'Maldives', 'MV', 'MDV', 1);
INSERT INTO countries VALUES (131, 'Mali', 'ML', 'MLI', 1);
INSERT INTO countries VALUES (132, 'Malta', 'MT', 'MLT', 1);
INSERT INTO countries VALUES (133, 'Marshall Islands', 'MH', 'MHL', 1);
INSERT INTO countries VALUES (134, 'Martinique', 'MQ', 'MTQ', 1);
INSERT INTO countries VALUES (135, 'Mauritania', 'MR', 'MRT', 1);
INSERT INTO countries VALUES (136, 'Mauritius', 'MU', 'MUS', 1);
INSERT INTO countries VALUES (137, 'Mayotte', 'YT', 'MYT', 1);
INSERT INTO countries VALUES (138, 'Mexico', 'MX', 'MEX', 1);
INSERT INTO countries VALUES (139, 'Micronesia, Federated States of', 'FM', 'FSM', 1);
INSERT INTO countries VALUES (140, 'Moldova, Republic of', 'MD', 'MDA', 1);
INSERT INTO countries VALUES (141, 'Monaco', 'MC', 'MCO', 1);
INSERT INTO countries VALUES (142, 'Mongolia', 'MN', 'MNG', 1);
INSERT INTO countries VALUES (143, 'Montserrat', 'MS', 'MSR', 1);
INSERT INTO countries VALUES (144, 'Morocco', 'MA', 'MAR', 1);
INSERT INTO countries VALUES (145, 'Mozambique', 'MZ', 'MOZ', 1);
INSERT INTO countries VALUES (146, 'Myanmar', 'MM', 'MMR', 1);
INSERT INTO countries VALUES (147, 'Namibia', 'NA', 'NAM', 1);
INSERT INTO countries VALUES (148, 'Nauru', 'NR', 'NRU', 1);
INSERT INTO countries VALUES (149, 'Nepal', 'NP', 'NPL', 1);
INSERT INTO countries VALUES (150, 'Netherlands', 'NL', 'NLD', 1);
INSERT INTO countries VALUES (151, 'Netherlands Antilles', 'AN', 'ANT', 1);
INSERT INTO countries VALUES (152, 'New Caledonia', 'NC', 'NCL', 1);
INSERT INTO countries VALUES (153, 'New Zealand', 'NZ', 'NZL', 1);
INSERT INTO countries VALUES (154, 'Nicaragua', 'NI', 'NIC', 1);
INSERT INTO countries VALUES (155, 'Niger', 'NE', 'NER', 1);
INSERT INTO countries VALUES (156, 'Nigeria', 'NG', 'NGA', 1);
INSERT INTO countries VALUES (157, 'Niue', 'NU', 'NIU', 1);
INSERT INTO countries VALUES (158, 'Norfolk Island', 'NF', 'NFK', 1);
INSERT INTO countries VALUES (159, 'Northern Mariana Islands', 'MP', 'MNP', 1);
INSERT INTO countries VALUES (160, 'Norway', 'NO', 'NOR', 1);
INSERT INTO countries VALUES (161, 'Oman', 'OM', 'OMN', 1);
INSERT INTO countries VALUES (162, 'Pakistan', 'PK', 'PAK', 1);
INSERT INTO countries VALUES (163, 'Palau', 'PW', 'PLW', 1);
INSERT INTO countries VALUES (164, 'Panama', 'PA', 'PAN', 1);
INSERT INTO countries VALUES (165, 'Papua New Guinea', 'PG', 'PNG', 1);
INSERT INTO countries VALUES (166, 'Paraguay', 'PY', 'PRY', 1);
INSERT INTO countries VALUES (167, 'Peru', 'PE', 'PER', 1);
INSERT INTO countries VALUES (168, 'Philippines', 'PH', 'PHL', 1);
INSERT INTO countries VALUES (169, 'Pitcairn', 'PN', 'PCN', 1);
INSERT INTO countries VALUES (170, 'Poland', 'PL', 'POL', 1);
INSERT INTO countries VALUES (171, 'Portugal', 'PT', 'PRT', 1);
INSERT INTO countries VALUES (172, 'Puerto Rico', 'PR', 'PRI', 1);
INSERT INTO countries VALUES (173, 'Qatar', 'QA', 'QAT', 1);
INSERT INTO countries VALUES (174, 'Reunion', 'RE', 'REU', 1);
INSERT INTO countries VALUES (175, 'Romania', 'RO', 'ROM', 1);
INSERT INTO countries VALUES (176, 'Russian Federation', 'RU', 'RUS', 1);
INSERT INTO countries VALUES (177, 'Rwanda', 'RW', 'RWA', 1);
INSERT INTO countries VALUES (178, 'Saint Kitts and Nevis', 'KN', 'KNA', 1);
INSERT INTO countries VALUES (179, 'Saint Lucia', 'LC', 'LCA', 1);
INSERT INTO countries VALUES (180, 'Saint Vincent and the Grenadines', 'VC', 'VCT', 1);
INSERT INTO countries VALUES (181, 'Samoa', 'WS', 'WSM', 1);
INSERT INTO countries VALUES (182, 'San Marino', 'SM', 'SMR', 1);
INSERT INTO countries VALUES (183, 'Sao Tome and Principe', 'ST', 'STP', 1);
INSERT INTO countries VALUES (184, 'Saudi Arabia', 'SA', 'SAU', 1);
INSERT INTO countries VALUES (185, 'Senegal', 'SN', 'SEN', 1);
INSERT INTO countries VALUES (186, 'Seychelles', 'SC', 'SYC', 1);
INSERT INTO countries VALUES (187, 'Sierra Leone', 'SL', 'SLE', 1);
INSERT INTO countries VALUES (188, 'Singapore', 'SG', 'SGP', 4);
INSERT INTO countries VALUES (189, 'Slovakia (Slovak Republic)', 'SK', 'SVK', 1);
INSERT INTO countries VALUES (190, 'Slovenia', 'SI', 'SVN', 1);
INSERT INTO countries VALUES (191, 'Solomon Islands', 'SB', 'SLB', 1);
INSERT INTO countries VALUES (192, 'Somalia', 'SO', 'SOM', 1);
INSERT INTO countries VALUES (193, 'South Africa', 'ZA', 'ZAF', 1);
INSERT INTO countries VALUES (194, 'South Georgia and the South Sandwich Islands', 'GS', 'SGS', 1);
INSERT INTO countries VALUES (195, 'Spain', 'ES', 'ESP', 3);
INSERT INTO countries VALUES (196, 'Sri Lanka', 'LK', 'LKA', 1);
INSERT INTO countries VALUES (197, 'St. Helena', 'SH', 'SHN', 1);
INSERT INTO countries VALUES (198, 'St. Pierre and Miquelon', 'PM', 'SPM', 1);
INSERT INTO countries VALUES (199, 'Sudan', 'SD', 'SDN', 1);
INSERT INTO countries VALUES (200, 'Suriname', 'SR', 'SUR', 1);
INSERT INTO countries VALUES (201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', 1);
INSERT INTO countries VALUES (202, 'Swaziland', 'SZ', 'SWZ', 1);
INSERT INTO countries VALUES (203, 'Sweden', 'SE', 'SWE', 1);
INSERT INTO countries VALUES (204, 'Switzerland', 'CH', 'CHE', 1);
INSERT INTO countries VALUES (205, 'Syrian Arab Republic', 'SY', 'SYR', 1);
INSERT INTO countries VALUES (206, 'Taiwan', 'TW', 'TWN', 1);
INSERT INTO countries VALUES (207, 'Tajikistan', 'TJ', 'TJK', 1);
INSERT INTO countries VALUES (208, 'Tanzania, United Republic of', 'TZ', 'TZA', 1);
INSERT INTO countries VALUES (209, 'Thailand', 'TH', 'THA', 1);
INSERT INTO countries VALUES (210, 'Togo', 'TG', 'TGO', 1);
INSERT INTO countries VALUES (211, 'Tokelau', 'TK', 'TKL', 1);
INSERT INTO countries VALUES (212, 'Tonga', 'TO', 'TON', 1);
INSERT INTO countries VALUES (213, 'Trinidad and Tobago', 'TT', 'TTO', 1);
INSERT INTO countries VALUES (214, 'Tunisia', 'TN', 'TUN', 1);
INSERT INTO countries VALUES (215, 'Turkey', 'TR', 'TUR', 1);
INSERT INTO countries VALUES (216, 'Turkmenistan', 'TM', 'TKM', 1);
INSERT INTO countries VALUES (217, 'Turks and Caicos Islands', 'TC', 'TCA', 1);
INSERT INTO countries VALUES (218, 'Tuvalu', 'TV', 'TUV', 1);
INSERT INTO countries VALUES (219, 'Uganda', 'UG', 'UGA', 1);
INSERT INTO countries VALUES (220, 'Ukraine', 'UA', 'UKR', 1);
INSERT INTO countries VALUES (221, 'United Arab Emirates', 'AE', 'ARE', 1);
INSERT INTO countries VALUES (222, 'United Kingdom', 'GB', 'GBR', 1);
INSERT INTO countries VALUES (223, 'United States', 'US', 'USA', 2);
INSERT INTO countries VALUES (224, 'United States Minor Outlying Islands', 'UM', 'UMI', 1);
INSERT INTO countries VALUES (225, 'Uruguay', 'UY', 'URY', 1);
INSERT INTO countries VALUES (226, 'Uzbekistan', 'UZ', 'UZB', 1);
INSERT INTO countries VALUES (227, 'Vanuatu', 'VU', 'VUT', 1);
INSERT INTO countries VALUES (228, 'Vatican City State (Holy See)', 'VA', 'VAT', 1);
INSERT INTO countries VALUES (229, 'Venezuela', 'VE', 'VEN', 1);
INSERT INTO countries VALUES (230, 'Viet Nam', 'VN', 'VNM', 1);
INSERT INTO countries VALUES (231, 'Virgin Islands (British)', 'VG', 'VGB', 1);
INSERT INTO countries VALUES (232, 'Virgin Islands (U.S.)', 'VI', 'VIR', 1);
INSERT INTO countries VALUES (233, 'Wallis and Futuna Islands', 'WF', 'WLF', 1);
INSERT INTO countries VALUES (234, 'Western Sahara', 'EH', 'ESH', 1);
INSERT INTO countries VALUES (235, 'Yemen', 'YE', 'YEM', 1);
INSERT INTO countries VALUES (236, 'Yugoslavia', 'YU', 'YUG', 1);
INSERT INTO countries VALUES (237, 'Zaire', 'ZR', 'ZAR', 1);
INSERT INTO countries VALUES (238, 'Zambia', 'ZM', 'ZMB', 1);
INSERT INTO countries VALUES (239, 'Zimbabwe', 'ZW', 'ZWE', 1);
# --------------------------------------------------------

#
# Table structure for table `currencies`
#

CREATE TABLE currencies (
  currencies_id int(11) NOT NULL auto_increment,
  title varchar(32) NOT NULL default '',
  code char(3) NOT NULL default '',
  symbol_left varchar(12) default NULL,
  symbol_right varchar(12) default NULL,
  decimal_point char(1) default NULL,
  thousands_point char(1) default NULL,
  decimal_places char(1) default NULL,
  value float(13,8) default NULL,
  last_updated datetime default NULL,
  PRIMARY KEY  (currencies_id)
) TYPE=MyISAM;

#
# Dumping data for table `currencies`
#

INSERT INTO currencies VALUES (1, 'US Dollar', 'USD', '$', '', '.', ',', '2', '1.00000000', '2005-03-28 17:23:41');
INSERT INTO currencies VALUES (2, 'Euro', 'EUR', '', 'EUR', '.', ',', '2', '1.10360003', '2005-03-28 17:23:41');
# --------------------------------------------------------

#
# Table structure for table `customers`
#

CREATE TABLE customers (
  customers_id int(11) NOT NULL auto_increment,
  customers_gender char(1) NOT NULL default '',
  customers_firstname varchar(32) NOT NULL default '',
  customers_lastname varchar(32) NOT NULL default '',
  customers_dob datetime NOT NULL default '0000-00-00 00:00:00',
  customers_email_address varchar(96) NOT NULL default '',
  customers_default_address_id int(11) NOT NULL default '0',
  customers_telephone varchar(32) NOT NULL default '',
  customers_fax varchar(32) default NULL,
  customers_password varchar(40) NOT NULL default '',
  customers_newsletter char(1) default NULL,
  PRIMARY KEY  (customers_id)
) TYPE=MyISAM;

#
# Dumping data for table `customers`
#

INSERT INTO customers VALUES (1, 'm', 'John', 'doe', '2001-01-01 00:00:00', 'root@localhost', 1, '12345', '', 'd95e8fa7f20a009372eb3477473fcd34:1c', '0');
# --------------------------------------------------------

#
# Table structure for table `customers_basket`
#

CREATE TABLE customers_basket (
  customers_basket_id int(11) NOT NULL auto_increment,
  customers_id int(11) NOT NULL default '0',
  products_id tinytext NOT NULL,
  customers_basket_quantity int(2) NOT NULL default '0',
  final_price decimal(15,4) NOT NULL default '0.0000',
  customers_basket_date_added varchar(8) default NULL,
  PRIMARY KEY  (customers_basket_id)
) TYPE=MyISAM;

#
# Dumping data for table `customers_basket`
#

# --------------------------------------------------------

#
# Table structure for table `customers_basket_attributes`
#

CREATE TABLE customers_basket_attributes (
  customers_basket_attributes_id int(11) NOT NULL auto_increment,
  customers_id int(11) NOT NULL default '0',
  products_id tinytext NOT NULL,
  products_options_id int(11) NOT NULL default '0',
  products_options_value_id int(11) NOT NULL default '0',
  PRIMARY KEY  (customers_basket_attributes_id)
) TYPE=MyISAM;

#
# Dumping data for table `customers_basket_attributes`
#

# --------------------------------------------------------

#
# Table structure for table `customers_info`
#

CREATE TABLE customers_info (
  customers_info_id int(11) NOT NULL default '0',
  customers_info_date_of_last_logon datetime default NULL,
  customers_info_number_of_logons int(5) default NULL,
  customers_info_date_account_created datetime default NULL,
  customers_info_date_account_last_modified datetime default NULL,
  global_product_notifications int(1) default '0',
  PRIMARY KEY  (customers_info_id)
) TYPE=MyISAM;

#
# Dumping data for table `customers_info`
#

INSERT INTO customers_info VALUES (1, '0000-00-00 00:00:00', 0, '2005-04-01 20:16:55', '0000-00-00 00:00:00', 0);
# --------------------------------------------------------

#
# Table structure for table `geo_zones`
#

CREATE TABLE geo_zones (
  geo_zone_id int(11) NOT NULL auto_increment,
  geo_zone_name varchar(32) NOT NULL default '',
  geo_zone_description varchar(255) NOT NULL default '',
  last_modified datetime default NULL,
  date_added datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (geo_zone_id)
) TYPE=MyISAM;

#
# Dumping data for table `geo_zones`
#

INSERT INTO geo_zones VALUES (1, 'Florida', 'Florida local sales tax zone', NULL, '2005-03-28 17:23:41');
# --------------------------------------------------------

#
# Table structure for table `languages`
#

CREATE TABLE languages (
  languages_id int(11) NOT NULL auto_increment,
  name varchar(32) NOT NULL default '',
  code char(2) NOT NULL default '',
  image varchar(64) default NULL,
  directory varchar(32) default NULL,
  sort_order int(3) default NULL,
  PRIMARY KEY  (languages_id),
  KEY IDX_LANGUAGES_NAME (name)
) TYPE=MyISAM;

#
# Dumping data for table `languages`
#

INSERT INTO languages VALUES (1, 'English', 'en', 'icon.gif', 'english', 1);
INSERT INTO languages VALUES (2, 'Deutsch', 'de', 'icon.gif', 'german', 2);
INSERT INTO languages VALUES (3, 'Español', 'es', 'icon.gif', 'espanol', 3);
# --------------------------------------------------------

#
# Table structure for table `manufacturers`
#

CREATE TABLE manufacturers (
  manufacturers_id int(11) NOT NULL auto_increment,
  manufacturers_name varchar(32) NOT NULL default '',
  manufacturers_image varchar(64) default NULL,
  date_added datetime default NULL,
  last_modified datetime default NULL,
  PRIMARY KEY  (manufacturers_id),
  KEY IDX_MANUFACTURERS_NAME (manufacturers_name)
) TYPE=MyISAM;

#
# Dumping data for table `manufacturers`
#

INSERT INTO manufacturers VALUES (1, 'Matrox', 'manufacturer_matrox.gif', '2005-04-01 20:15:26', NULL);
INSERT INTO manufacturers VALUES (2, 'Microsoft', 'manufacturer_microsoft.gif', '2005-04-01 20:15:26', NULL);
INSERT INTO manufacturers VALUES (3, 'Warner', 'manufacturer_warner.gif', '2005-04-01 20:15:26', NULL);
INSERT INTO manufacturers VALUES (4, 'Fox', 'manufacturer_fox.gif', '2005-04-01 20:15:26', NULL);
INSERT INTO manufacturers VALUES (5, 'Logitech', 'manufacturer_logitech.gif', '2005-04-01 20:15:26', NULL);
INSERT INTO manufacturers VALUES (6, 'Canon', 'manufacturer_canon.gif', '2005-04-01 20:15:26', NULL);
INSERT INTO manufacturers VALUES (7, 'Sierra', 'manufacturer_sierra.gif', '2005-04-01 20:15:26', NULL);
INSERT INTO manufacturers VALUES (8, 'GT Interactive', 'manufacturer_gt_interactive.gif', '2005-04-01 20:15:26', NULL);
INSERT INTO manufacturers VALUES (9, 'Hewlett Packard', 'manufacturer_hewlett_packard.gif', '2005-04-01 20:15:26', NULL);
INSERT INTO manufacturers VALUES (10, 'Asus', 'manufacturer_asus.gif', '2005-04-12 12:51:26', NULL);
INSERT INTO manufacturers VALUES (11, 'Dell', 'manufacturer_dell.gif', '2005-04-12 13:12:08', NULL);
# --------------------------------------------------------

#
# Table structure for table `manufacturers_info`
#

CREATE TABLE manufacturers_info (
  manufacturers_id int(11) NOT NULL default '0',
  languages_id int(11) NOT NULL default '0',
  manufacturers_url varchar(255) NOT NULL default '',
  url_clicked int(5) NOT NULL default '0',
  date_last_click datetime default NULL,
  PRIMARY KEY  (manufacturers_id,languages_id)
) TYPE=MyISAM;

#
# Dumping data for table `manufacturers_info`
#

INSERT INTO manufacturers_info VALUES (1, 1, 'http://www.matrox.com', 0, NULL);
INSERT INTO manufacturers_info VALUES (1, 2, 'http://www.matrox.de', 0, NULL);
INSERT INTO manufacturers_info VALUES (1, 3, 'http://www.matrox.com', 0, NULL);
INSERT INTO manufacturers_info VALUES (2, 1, 'http://www.microsoft.com', 0, NULL);
INSERT INTO manufacturers_info VALUES (2, 2, 'http://www.microsoft.de', 0, NULL);
INSERT INTO manufacturers_info VALUES (2, 3, 'http://www.microsoft.es', 0, NULL);
INSERT INTO manufacturers_info VALUES (3, 1, 'http://www.warner.com', 0, NULL);
INSERT INTO manufacturers_info VALUES (3, 2, 'http://www.warner.de', 0, NULL);
INSERT INTO manufacturers_info VALUES (3, 3, 'http://www.warner.com', 0, NULL);
INSERT INTO manufacturers_info VALUES (4, 1, 'http://www.fox.com', 0, NULL);
INSERT INTO manufacturers_info VALUES (4, 2, 'http://www.fox.de', 0, NULL);
INSERT INTO manufacturers_info VALUES (4, 3, 'http://www.fox.com', 0, NULL);
INSERT INTO manufacturers_info VALUES (5, 1, 'http://www.logitech.com', 0, NULL);
INSERT INTO manufacturers_info VALUES (5, 2, 'http://www.logitech.com', 0, NULL);
INSERT INTO manufacturers_info VALUES (5, 3, 'http://www.logitech.com', 0, NULL);
INSERT INTO manufacturers_info VALUES (6, 1, 'http://www.canon.com', 0, NULL);
INSERT INTO manufacturers_info VALUES (6, 2, 'http://www.canon.de', 0, NULL);
INSERT INTO manufacturers_info VALUES (6, 3, 'http://www.canon.es', 0, NULL);
INSERT INTO manufacturers_info VALUES (7, 1, 'http://www.sierra.com', 0, NULL);
INSERT INTO manufacturers_info VALUES (7, 2, 'http://www.sierra.de', 0, NULL);
INSERT INTO manufacturers_info VALUES (7, 3, 'http://www.sierra.com', 0, NULL);
INSERT INTO manufacturers_info VALUES (8, 1, 'http://www.infogrames.com', 0, NULL);
INSERT INTO manufacturers_info VALUES (8, 2, 'http://www.infogrames.de', 0, NULL);
INSERT INTO manufacturers_info VALUES (8, 3, 'http://www.infogrames.com', 0, NULL);
INSERT INTO manufacturers_info VALUES (9, 1, 'http://www.hewlettpackard.com', 0, NULL);
INSERT INTO manufacturers_info VALUES (9, 2, 'http://www.hewlettpackard.de', 0, NULL);
INSERT INTO manufacturers_info VALUES (9, 3, 'http://welcome.hp.com/country/es/spa/welcome.htm', 0, NULL);
INSERT INTO manufacturers_info VALUES (10, 1, 'www.company.com', 0, NULL);
INSERT INTO manufacturers_info VALUES (10, 2, 'www.company.com', 0, NULL);
INSERT INTO manufacturers_info VALUES (10, 3, 'www.company.com', 0, NULL);
INSERT INTO manufacturers_info VALUES (11, 1, 'Dell', 0, NULL);
INSERT INTO manufacturers_info VALUES (11, 2, 'Dell', 0, NULL);
INSERT INTO manufacturers_info VALUES (11, 3, 'Dell', 0, NULL);
# --------------------------------------------------------

#
# Table structure for table `newsletters`
#

CREATE TABLE newsletters (
  newsletters_id int(11) NOT NULL auto_increment,
  title varchar(255) NOT NULL default '',
  content text NOT NULL,
  module varchar(255) NOT NULL default '',
  date_added datetime NOT NULL default '0000-00-00 00:00:00',
  date_sent datetime default NULL,
  status int(1) default NULL,
  locked int(1) default '0',
  PRIMARY KEY  (newsletters_id)
) TYPE=MyISAM;

#
# Dumping data for table `newsletters`
#

# --------------------------------------------------------

#
# Table structure for table `orders`
#

CREATE TABLE orders (
  orders_id int(11) NOT NULL auto_increment,
  customers_id int(11) NOT NULL default '0',
  customers_name varchar(64) NOT NULL default '',
  customers_company varchar(32) default NULL,
  customers_street_address varchar(64) NOT NULL default '',
  customers_suburb varchar(32) default NULL,
  customers_city varchar(32) NOT NULL default '',
  customers_postcode varchar(10) NOT NULL default '',
  customers_state varchar(32) default NULL,
  customers_country varchar(32) NOT NULL default '',
  customers_telephone varchar(32) NOT NULL default '',
  customers_email_address varchar(96) NOT NULL default '',
  customers_address_format_id int(5) NOT NULL default '0',
  delivery_name varchar(64) NOT NULL default '',
  delivery_company varchar(32) default NULL,
  delivery_street_address varchar(64) NOT NULL default '',
  delivery_suburb varchar(32) default NULL,
  delivery_city varchar(32) NOT NULL default '',
  delivery_postcode varchar(10) NOT NULL default '',
  delivery_state varchar(32) default NULL,
  delivery_country varchar(32) NOT NULL default '',
  delivery_address_format_id int(5) NOT NULL default '0',
  billing_name varchar(64) NOT NULL default '',
  billing_company varchar(32) default NULL,
  billing_street_address varchar(64) NOT NULL default '',
  billing_suburb varchar(32) default NULL,
  billing_city varchar(32) NOT NULL default '',
  billing_postcode varchar(10) NOT NULL default '',
  billing_state varchar(32) default NULL,
  billing_country varchar(32) NOT NULL default '',
  billing_address_format_id int(5) NOT NULL default '0',
  payment_method varchar(32) NOT NULL default '',
  cc_type varchar(20) default NULL,
  cc_owner varchar(64) default NULL,
  cc_number varchar(32) default NULL,
  cc_expires varchar(4) default NULL,
  last_modified datetime default NULL,
  date_purchased datetime default NULL,
  orders_status int(5) NOT NULL default '0',
  orders_date_finished datetime default NULL,
  currency char(3) default NULL,
  currency_value decimal(14,6) default NULL,
  PRIMARY KEY  (orders_id)
) TYPE=MyISAM;

#
# Dumping data for table `orders`
#

# --------------------------------------------------------

#
# Table structure for table `orders_products`
#

CREATE TABLE orders_products (
  orders_products_id int(11) NOT NULL auto_increment,
  orders_id int(11) NOT NULL default '0',
  products_id int(11) NOT NULL default '0',
  products_model varchar(12) default NULL,
  products_name varchar(64) NOT NULL default '',
  products_price decimal(15,4) NOT NULL default '0.0000',
  final_price decimal(15,4) NOT NULL default '0.0000',
  products_tax decimal(7,4) NOT NULL default '0.0000',
  products_quantity int(2) NOT NULL default '0',
  PRIMARY KEY  (orders_products_id)
) TYPE=MyISAM;

#
# Dumping data for table `orders_products`
#

# --------------------------------------------------------

#
# Table structure for table `orders_products_attributes`
#

CREATE TABLE orders_products_attributes (
  orders_products_attributes_id int(11) NOT NULL auto_increment,
  orders_id int(11) NOT NULL default '0',
  orders_products_id int(11) NOT NULL default '0',
  products_options varchar(32) NOT NULL default '',
  products_options_values varchar(32) NOT NULL default '',
  options_values_price decimal(15,4) NOT NULL default '0.0000',
  price_prefix char(1) NOT NULL default '',
  PRIMARY KEY  (orders_products_attributes_id)
) TYPE=MyISAM;

#
# Dumping data for table `orders_products_attributes`
#

# --------------------------------------------------------

#
# Table structure for table `orders_products_download`
#

CREATE TABLE orders_products_download (
  orders_products_download_id int(11) NOT NULL auto_increment,
  orders_id int(11) NOT NULL default '0',
  orders_products_id int(11) NOT NULL default '0',
  orders_products_filename varchar(255) NOT NULL default '',
  download_maxdays int(2) NOT NULL default '0',
  download_count int(2) NOT NULL default '0',
  PRIMARY KEY  (orders_products_download_id)
) TYPE=MyISAM;

#
# Dumping data for table `orders_products_download`
#

# --------------------------------------------------------

#
# Table structure for table `orders_status`
#

CREATE TABLE orders_status (
  orders_status_id int(11) NOT NULL default '0',
  language_id int(11) NOT NULL default '1',
  orders_status_name varchar(32) NOT NULL default '',
  PRIMARY KEY  (orders_status_id,language_id),
  KEY idx_orders_status_name (orders_status_name)
) TYPE=MyISAM;

#
# Dumping data for table `orders_status`
#

INSERT INTO orders_status VALUES (1, 1, 'Pending');
INSERT INTO orders_status VALUES (1, 2, 'Offen');
INSERT INTO orders_status VALUES (1, 3, 'Pendiente');
INSERT INTO orders_status VALUES (2, 1, 'Processing');
INSERT INTO orders_status VALUES (2, 2, 'In Bearbeitung');
INSERT INTO orders_status VALUES (2, 3, 'Proceso');
INSERT INTO orders_status VALUES (3, 1, 'Delivered');
INSERT INTO orders_status VALUES (3, 2, 'Versendet');
INSERT INTO orders_status VALUES (3, 3, 'Entregado');
# --------------------------------------------------------

#
# Table structure for table `orders_status_history`
#

CREATE TABLE orders_status_history (
  orders_status_history_id int(11) NOT NULL auto_increment,
  orders_id int(11) NOT NULL default '0',
  orders_status_id int(5) NOT NULL default '0',
  date_added datetime NOT NULL default '0000-00-00 00:00:00',
  customer_notified int(1) default '0',
  comments text,
  PRIMARY KEY  (orders_status_history_id)
) TYPE=MyISAM;

#
# Dumping data for table `orders_status_history`
#

# --------------------------------------------------------

#
# Table structure for table `orders_total`
#

CREATE TABLE orders_total (
  orders_total_id int(10) unsigned NOT NULL auto_increment,
  orders_id int(11) NOT NULL default '0',
  title varchar(255) NOT NULL default '',
  text varchar(255) NOT NULL default '',
  value decimal(15,4) NOT NULL default '0.0000',
  class varchar(32) NOT NULL default '',
  sort_order int(11) NOT NULL default '0',
  PRIMARY KEY  (orders_total_id),
  KEY idx_orders_total_orders_id (orders_id)
) TYPE=MyISAM;

#
# Dumping data for table `orders_total`
#

# --------------------------------------------------------

#
# Table structure for table `products`
#

CREATE TABLE products (
  products_id int(11) NOT NULL auto_increment,
  products_quantity int(4) NOT NULL default '0',
  products_model varchar(12) default NULL,
  products_image varchar(64) default NULL,
  products_price decimal(15,4) NOT NULL default '0.0000',
  products_date_added datetime NOT NULL default '0000-00-00 00:00:00',
  products_last_modified datetime default NULL,
  products_date_available datetime default NULL,
  products_weight decimal(5,2) NOT NULL default '0.00',
  products_status tinyint(1) NOT NULL default '0',
  products_tax_class_id int(11) NOT NULL default '0',
  manufacturers_id int(11) default NULL,
  products_ordered int(11) NOT NULL default '0',
  PRIMARY KEY  (products_id),
  KEY idx_products_date_added (products_date_added)
) TYPE=MyISAM;

#
# Dumping data for table `products`
#

INSERT INTO products VALUES (1, 32, 'MG200MMS', 'matrox/mg200mms.gif', '299.9900', '2005-03-28 17:23:41', NULL, '0000-00-00 00:00:00', '23.00', 1, 1, 1, 0);
INSERT INTO products VALUES (2, 32, 'MG400-32MB', 'matrox/mg400-32mb.gif', '499.9900', '2005-03-28 17:23:41', NULL, '0000-00-00 00:00:00', '23.00', 1, 1, 1, 0);
INSERT INTO products VALUES (3, 2, 'MSIMPRO', 'microsoft/msimpro.gif', '49.9900', '2005-03-28 17:23:41', NULL, '0000-00-00 00:00:00', '7.00', 1, 1, 3, 0);
INSERT INTO products VALUES (4, 13, 'DVD-RPMK', 'dvd/replacement_killers.gif', '42.0000', '2005-03-28 17:23:41', '2005-04-12 12:35:04', NULL, '23.00', 1, 1, 2, 0);
INSERT INTO products VALUES (5, 17, 'DVD-BLDRNDC', 'dvd/blade_runner.gif', '35.9900', '2005-03-28 17:23:41', '2005-04-12 12:54:37', NULL, '7.00', 1, 1, 10, 0);
INSERT INTO products VALUES (6, 10, 'DVD-MATR', 'dvd/the_matrix.gif', '39.9900', '2005-03-28 17:23:41', '2005-04-12 13:34:13', NULL, '7.00', 1, 1, 5, 0);
INSERT INTO products VALUES (7, 10, 'DVD-YGEM', 'dvd/youve_got_mail.gif', '34.9900', '2005-03-28 17:23:41', '2005-04-12 12:41:05', NULL, '7.00', 1, 1, 1, 0);
INSERT INTO products VALUES (8, 10, 'DVD-ABUG', 'dvd/a_bugs_life.gif', '35.9900', '2005-03-28 17:23:41', '2005-04-12 13:31:27', NULL, '7.00', 1, 1, 11, 0);
INSERT INTO products VALUES (9, 10, 'DVD-UNSG', 'dvd/under_siege.gif', '29.9900', '2005-03-28 17:23:41', '2005-04-12 12:40:57', NULL, '7.00', 1, 1, 2, 0);
INSERT INTO products VALUES (10, 10, 'DVD-UNSG2', 'dvd/under_siege2.gif', '29.9900', '2005-03-28 17:23:41', '2005-04-12 12:40:15', NULL, '7.00', 1, 1, 2, 0);
INSERT INTO products VALUES (11, 10, 'DVD-FDBL', 'dvd/fire_down_below.gif', '29.9900', '2005-03-28 17:23:41', '2005-04-12 13:33:20', NULL, '7.00', 1, 1, 11, 0);
INSERT INTO products VALUES (12, 10, 'DVD-DHWV', 'dvd/die_hard_3.gif', '39.9900', '2005-03-28 17:23:41', '2005-04-12 13:35:36', NULL, '7.00', 1, 1, 5, 0);
INSERT INTO products VALUES (13, 10, 'DVD-LTWP', 'dvd/lethal_weapon.gif', '34.9900', '2005-03-28 17:23:41', '2005-04-12 13:27:03', NULL, '7.00', 1, 1, 11, 0);
INSERT INTO products VALUES (14, 10, 'DVD-REDC', 'dvd/red_corner.gif', '32.0000', '2005-03-28 17:23:41', '2005-04-12 13:29:23', NULL, '7.00', 1, 1, 9, 0);
INSERT INTO products VALUES (15, 10, 'DVD-FRAN', 'dvd/frantic.gif', '35.0000', '2005-03-28 17:23:41', '2005-04-12 12:55:31', NULL, '7.00', 1, 1, 3, 0);
INSERT INTO products VALUES (16, 10, 'DVD-CUFI', 'dvd/courage_under_fire.gif', '38.9900', '2005-03-28 17:23:41', '2005-04-12 12:41:39', NULL, '7.00', 1, 1, 2, 0);
INSERT INTO products VALUES (17, 10, 'DVD-SPEED', 'dvd/speed.gif', '39.9900', '2005-03-28 17:23:41', '2005-04-12 13:45:27', NULL, '7.00', 1, 1, 11, 0);
INSERT INTO products VALUES (18, 10, 'DVD-SPEED2', 'dvd/speed_2.gif', '42.0000', '2005-03-28 17:23:41', '2005-04-12 12:42:04', NULL, '7.00', 1, 1, 2, 0);
INSERT INTO products VALUES (19, 10, 'DVD-TSAB', 'dvd/theres_something_about_mary.gif', '49.9900', '2005-03-28 17:23:41', '2005-04-12 12:41:55', NULL, '7.00', 1, 1, 2, 0);
INSERT INTO products VALUES (20, 10, 'DVD-BELOVED', 'dvd/beloved.gif', '54.9900', '2005-03-28 17:23:41', '2005-04-12 13:17:01', NULL, '7.00', 1, 1, 11, 0);
INSERT INTO products VALUES (21, 16, 'PC-SWAT3', 'sierra/swat_3.gif', '79.9900', '2005-03-28 17:23:41', '2005-04-12 12:41:45', NULL, '7.00', 1, 1, 2, 0);
INSERT INTO products VALUES (22, 13, 'PC-UNTM', 'gt_interactive/unreal_tournament.gif', '89.9900', '2005-03-28 17:23:41', '2005-04-12 13:58:11', NULL, '7.00', 1, 1, 8, 0);
INSERT INTO products VALUES (23, 16, 'PC-TWOF', 'gt_interactive/wheel_of_time.gif', '99.9900', '2005-03-28 17:23:41', '2005-04-12 13:27:41', NULL, '10.00', 1, 1, 11, 0);
INSERT INTO products VALUES (24, 17, 'PC-DISC', 'gt_interactive/disciples.gif', '90.0000', '2005-03-28 17:23:41', '2005-04-12 12:41:21', NULL, '8.00', 1, 1, 5, 0);
INSERT INTO products VALUES (25, 16, 'MSINTKB', 'microsoft/intkeyboardps2.gif', '69.9900', '2005-03-28 17:23:41', NULL, '0000-00-00 00:00:00', '8.00', 1, 1, 2, 0);
INSERT INTO products VALUES (26, 10, 'MSIMEXP', 'microsoft/imexplorer.gif', '64.9500', '2005-03-28 17:23:41', NULL, '0000-00-00 00:00:00', '8.00', 1, 1, 2, 0);
INSERT INTO products VALUES (27, 8, 'HPLJ1100XI', 'hewlett_packard/lj1100xi.gif', '499.9900', '2005-03-28 17:23:41', '2005-04-12 13:28:19', NULL, '45.00', 1, 1, 9, 0);
# --------------------------------------------------------

#
# Table structure for table `products_attributes`
#

CREATE TABLE products_attributes (
  products_attributes_id int(11) NOT NULL auto_increment,
  products_id int(11) NOT NULL default '0',
  options_id int(11) NOT NULL default '0',
  options_values_id int(11) NOT NULL default '0',
  options_values_price decimal(15,4) NOT NULL default '0.0000',
  price_prefix char(1) NOT NULL default '',
  PRIMARY KEY  (products_attributes_id)
) TYPE=MyISAM;

#
# Dumping data for table `products_attributes`
#

INSERT INTO products_attributes VALUES (1, 1, 4, 1, '0.0000', '+');
INSERT INTO products_attributes VALUES (2, 1, 4, 2, '50.0000', '+');
INSERT INTO products_attributes VALUES (3, 1, 4, 3, '70.0000', '+');
INSERT INTO products_attributes VALUES (4, 1, 3, 5, '0.0000', '+');
INSERT INTO products_attributes VALUES (5, 1, 3, 6, '100.0000', '+');
INSERT INTO products_attributes VALUES (6, 2, 4, 3, '10.0000', '-');
INSERT INTO products_attributes VALUES (7, 2, 4, 4, '0.0000', '+');
INSERT INTO products_attributes VALUES (8, 2, 3, 6, '0.0000', '+');
INSERT INTO products_attributes VALUES (9, 2, 3, 7, '120.0000', '+');
INSERT INTO products_attributes VALUES (10, 26, 3, 8, '0.0000', '+');
INSERT INTO products_attributes VALUES (11, 26, 3, 9, '6.0000', '+');
INSERT INTO products_attributes VALUES (26, 22, 5, 10, '0.0000', '+');
INSERT INTO products_attributes VALUES (27, 22, 5, 13, '0.0000', '+');
# --------------------------------------------------------

#
# Table structure for table `products_attributes_download`
#

CREATE TABLE products_attributes_download (
  products_attributes_id int(11) NOT NULL default '0',
  products_attributes_filename varchar(255) NOT NULL default '',
  products_attributes_maxdays int(2) default '0',
  products_attributes_maxcount int(2) default '0',
  PRIMARY KEY  (products_attributes_id)
) TYPE=MyISAM;

#
# Dumping data for table `products_attributes_download`
#

INSERT INTO products_attributes_download VALUES (26, 'unreal.zip', 7, 3);
# --------------------------------------------------------

#
# Table structure for table `products_description`
#

CREATE TABLE products_description (
  products_id int(11) NOT NULL auto_increment,
  language_id int(11) NOT NULL default '1',
  products_name varchar(64) NOT NULL default '',
  products_description text,
  products_url varchar(255) default NULL,
  products_viewed int(5) default '0',
  PRIMARY KEY  (products_id,language_id),
  KEY products_name (products_name)
) TYPE=MyISAM;

#
# Dumping data for table `products_description`
#

INSERT INTO products_description VALUES (1, 1, 'Matrox G200 MMS', 'Reinforcing its position as a multi-monitor trailblazer, Matrox Graphics Inc. has once again developed the most flexible and highly advanced solution in the industry. Introducing the new Matrox G200 Multi-Monitor Series; the first graphics card ever to support up to four DVI digital flat panel displays on a single 8&quot; PCI board.<br><br>With continuing demand for digital flat panels in the financial workplace, the Matrox G200 MMS is the ultimate in flexible solutions. The Matrox G200 MMS also supports the new digital video interface (DVI) created by the Digital Display Working Group (DDWG) designed to ease the adoption of digital flat panels. Other configurations include composite video capture ability and onboard TV tuner, making the Matrox G200 MMS the complete solution for business needs.<br><br>Based on the award-winning MGA-G200 graphics chip, the Matrox G200 Multi-Monitor Series provides superior 2D/3D graphics acceleration to meet the demanding needs of business applications such as real-time stock quotes (Versus), live video feeds (Reuters & Bloombergs), multiple windows applications, word processing, spreadsheets and CAD.', 'www.matrox.com/mga/products/g200_mms/home.cfm', 1);
INSERT INTO products_description VALUES (2, 1, 'Matrox G400 32MB', '<b>Dramatically Different High Performance Graphics</b><br><br>Introducing the Millennium G400 Series - a dramatically different, high performance graphics experience. Armed with the industry\'s fastest graphics chip, the Millennium G400 Series takes explosive acceleration two steps further by adding unprecedented image quality, along with the most versatile display options for all your 3D, 2D and DVD applications. As the most powerful and innovative tools in your PC\'s arsenal, the Millennium G400 Series will not only change the way you see graphics, but will revolutionize the way you use your computer.<br><br><b>Key features:</b><ul><li>New Matrox G400 256-bit DualBus graphics chip</li><li>Explosive 3D, 2D and DVD performance</li><li>DualHead Display</li><li>Superior DVD and TV output</li><li>3D Environment-Mapped Bump Mapping</li><li>Vibrant Color Quality rendering </li><li>UltraSharp DAC of up to 360 MHz</li><li>3D Rendering Array Processor</li><li>Support for 16 or 32 MB of memory</li></ul>', 'www.matrox.com/mga/products/mill_g400/home.htm', 0);
INSERT INTO products_description VALUES (3, 1, 'Microsoft IntelliMouse Pro', 'Every element of IntelliMouse Pro - from its unique arched shape to the texture of the rubber grip around its base - is the product of extensive customer and ergonomic research. Microsoft\'s popular wheel control, which now allows zooming and universal scrolling functions, gives IntelliMouse Pro outstanding comfort and efficiency.', 'www.microsoft.com/hardware/mouse/intellimouse.asp', 1);
INSERT INTO products_description VALUES (4, 1, 'GeForce MX 4000 AGP Graphics Card', 'The Asylum GeForce MX 4000 AGP Graphics Card from BFG™ is a high-end graphics card designed to deliver excellent visual quality in high intensity gaming and graphics applications. With 128 MB DDR onboard memory and NVIDIA® GeForce™ MX 4000 graphics processor, this card provides 3D games and applications with enhanced speed and look. The 350 MHz Dual RAMDAC and 275 MHz Core Clock both ensure you of true-to-life gaming experience. This card offers compatibility with DirectX® and OpenGL®, and provides VGA™ and S-Video-Out connectors. To add to this, the Asylum GeForce MX 4000 comes bundled with NVIDIA® Unified drivers, NVIDIA® GeForce™ FX and GeForce4 Demos, NVIDIA® NVDVD™ 2.0 multimedia software and Windowblinds™ BFG / Asylum™ / NIVIDIA® skins.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (5, 1, 'Asus A7N8X-X - Mainboard', '<b>Specifications: </b><br>\r\n<li>Supported CPU: Socket A AMD Athlon/Athlon XP/Duron Processors</li> \r\n<li>Chipset: NVIDIA nForce2 400 + MCP </li>\r\n<li>FSB: 400/333/266/200MHz </li>\r\n<li>RAM: 3x DIMM for DDR400/333/266/200(Non-ECC,unbuffered) Max 3GB </li>\r\n<li>IDE: 2x UltraDMA 133 up to 4 Devices </li>\r\n<li>Slots: 1x AGP 8X, 5x PCI </li>\r\n<li>Ports: 2xPS2, 1xCOM, 1xLPT,6xUSB2.0(Rear 4), 1xLAN, Audio Ports </li>\r\n<li>Onboard Audio: Realtek ALC650 6CH w/ built in HP amplifier </li>\r\n<li>Onboard LAN: Integrated NVIDIA MAC + Realtek 8201BL PHY 10/100Mbps </li>\r\n<li>Form Factor: ATX</li>', 'www.companyname.com', 1);
INSERT INTO products_description VALUES (6, 1, 'HN-505 Noise Canceling Headphones', 'The new Dell™ 20 GB Digital Jukebox MP3 Player promises the ease of use and value of the original DJ with an enhanced form factor and capacity options. Weighing just 6.8 Oz, the Dell™ DJ 20 delivers high-quality, hard-drive based audio. The second-generation Digital Jukebox with 20 GB3 capacity lets you carry up to 99001 songs at any given time and offers up to 12 hours of battery life2 to play them. In addition to supporting the WMA audio format, the multifunctional music player plays high-fidelity MP3 audio files, and also provides a way to back up critical data from your PC. It features a 1.92-inch blue back-lit liquid crystal display, three-way scroll barrel navigation and an USB 2.0 interface for PC synchronization and alternative battery charging. The DJ comes with MDR-NC6 noise canceling headphones that sport a slim swivel folding style for easy storage, and feature neodymium magnets to deliver powerful sound. Made from premium villus neoprene and with reinforced, vulcanized rubber sides, the included blue action jacket provides enhanced protection for your Dell DJ. The device also includes earphones, Music Match Jukebox version 9 Software for music library management and a 1-Year Advanced Exchange Service.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (7, 1, 'The FireGL™ Graphics Card', 'The FireGL™ X2-256t from ATI Technologies is a high performance Workstation Graphics Accelerator, delivering fast 3D performance and enhanced quality graphics for professional applications. Based on the FGL™ 9800XT Visual Processing Unit (VPU), the FireGL X2-256t offers an ideal solution for the computer-aided design (CAD) and digital content creation (DCC) applications. Combining SMOOTHVISION™ and SMARTSHADER™, the X2-256t enables realistic interactive imagery and lets you experience the sharp texts without sacrificing frame rates. With 256 MB of graphics memory and hardware accelerated rendering using OpenGL® Shading Language and DirectX® 9, it empowers 3D professionals to realize an enhancement in productivity and a reduction in design cycle times.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (8, 1, '5650 5.1 Surround Sound Speakers', 'This bundle has been tested and validated on Dell™ systems to ensure it will work with your computer. It is supported by Dell™ Technical Support when used with a Dell system. This bundle includes the following product:<br>\r\n<b>5650 5.1 Surround Sound Speakers with Subwoofer</b><br>\r\n\r\nExperience superb audio performance for gaming, multimedia presentations and DVD playback with the Dell™ 5650 5.1 Surround Sound Speakers. This system is composed of four Satellites, one 5.25\\" Subwoofer and Center Channel that are engineered to deliver powerful sound – a total of 100 Watts. The 5650 system provides clear surround sound that lets you enjoy multi-channel listening while seated in front of your computer.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (9, 1, 'RADEON X300SE Graphics Card', 'The Stealth RADEON X300SE Graphics Card from Diamond Multimedia incorporates the 0.11 micron technology to bring you fast performing programmable shaders for an excellent combination of power and performance. Powered by the RADEON X300SE engine, this card boasts 128 MB memory to deliver a dazzling visual experience. It is designed with support for the native x16 PCI Express interface that allows it to communicate directly with the PCI Express bus at high speeds. This card supports Microsoft® DirectX® 9.0, allowing for high-quality graphics and 3D textures that add a natural look to your games.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (10, 1, 'LCD Monitor', 'An excellent combination of looks and performance, the P1230 22-inch Color CRT Monitor from Dell™ is aimed at highly visual users such as graphic designers, video editors and gamers. A 98% color gamut and resolutions up to 1600x1200 pixels (UXGA) mean that the P1230 can accurately reproduce vivid colors and details on screen. Using the Diamondtron Natural flat technology, it offers an enhanced aperture grille that delivers a perfectly flat image with excellent alignment and focus. The monitor\\\'s dual VGA™ inputs allow two systems to be connected at once. This product has been tested and validated on Dell™ systems to ensure it will work with your computer. It is supported by Dell™ Technical Support when used with a Dell system.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (11, 1, 'Action Jacket and MDR-NC6 Noise Canceling Headphones', 'The new Dell™ 20 GB Digital Jukebox MP3 Player promises the ease of use and value of the original DJ with an enhanced form factor and capacity options. Weighing just 6.8 Oz, the Dell™ DJ 20 delivers high-quality, hard-drive based audio. The second-generation Digital Jukebox with 20 GB3 capacity lets you carry up to 99001 songs at any given time and offers up to 12 hours of battery life2 to play them. In addition to supporting the WMA audio format, the multifunctional music player plays high-fidelity MP3 audio files, and also provides a way to back up critical data from your PC. It features a 1.92-inch blue back-lit liquid crystal display, three-way scroll barrel navigation and an USB 2.0 interface for PC synchronization and alternative battery charging. The DJ comes with MDR-NC6 noise canceling headphones that sport a slim swivel folding style for easy storage, and feature neodymium magnets to deliver powerful sound. Made from premium villus neoprene and with reinforced, vulcanized rubber sides, the included blue action jacket provides enhanced protection for your Dell DJ. The device also includes earphones, Music Match Jukebox version 9 Software for music library management and a 1-Year Advanced Exchange Service.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (12, 1, 'Audio 10 PC Microphone', 'The Plantronics .Audio™ 10 analog PC Microphone aids in turning your desktop PC into a complete Internet chat system. The device uses a noise-canceling, unidirectional microphone to capture and transmit your voice as accurately as possible, while filtering out background noise. It is compatible with many PC sound cards for Windows® and features an adjustable boom, a monitor attachment, and a weighted base for increased stability. The .Audio™ 10 PC Microphone is ideal for Internet phone calling and voice-enabled multiplayer games.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (13, 1, 'Notebook', '<b>Key Features<br><br>Mobility & Performance</b>\r\nThe InspironTM  600m is designed for motion, with long battery life and easy-to-carry style. It starts at just under 5 pounds and only 1.29 inches thin when closed. Integrated wireless connectivity is standard, with Intel®  Centrino®  Mobile Technology, so you can compute and stay connected anywhere, anytime where wireless access is available.3 Explosive ATITM  MobilityTM  RADEON 9000 graphics propel the 600m to a performance level coveted by students, small business owners, and mobile workers alike.<br>\r\n<b>Processor:</b> <br>Intel®  Pentium® M Processors at 1.50GHz, 1.60 GHz, and 1.70GHz with optional Intel CentrinoTM  Mobile Technology.<br><b>Operating System:</b>Microsoft Windows XP Home Edition.<br><b>Display:</b>Choice of 14.1 Super XGA + or 14.1" XGA TFT high resolution displays to make the most of multimedia. Upgrading your display increases clarity, impact and viewing space.<br>\r\n<b>Video Graphics:</b> DDR ATI MOBILITYTM RADEONTM  9000 AGP 4X video graphics at 32MB and 64MB for crisp, realistic images on our high-resolution displays.<br><b>Storage:</b> Hard drives up to 60GB to meet present and potential storage requirements.<br><b>Memory:</b> Up to 1GB of memory gives you excellent overall performance.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (14, 1, 'Hewlett Packard LaserJet 2200Xi', 'HP has always set the pace in laser printing technology. The new generation HP LaserJet 1100 series sets another impressive pace, delivering a stunning 8 pages per minute print speed. The 600 dpi print resolution with HP\'s Resolution Enhancement technology (REt) makes every document more professional.<br><br>Enhanced print speed and laser quality results are just the beginning. With 2MB standard memory, HP LaserJet 1100xi users will be able to print increasingly complex pages. Memory can be increased to 18MB to tackle even more complex documents with ease. The HP LaserJet 1100xi supports key operating systems including Windows 3.1, 3.11, 95, 98, NT 4.0, OS/2 and DOS. Network compatibility available via the optional HP JetDirect External Print Servers.<br><br>HP LaserJet 1100xi also features The Document Builder for the Web Era from Trellix Corp. (featuring software to create Web documents).', 'www.companyname.com', 1);
INSERT INTO products_description VALUES (15, 1, 'Asus A2N6 - Mainboard', '<b>Specifications: </b><br>\r\n<li>Supported CPU: Socket A AMD Athlon/Athlon XP/Duron Processors</li> \r\n<li>Chipset: NVIDIA nForce2 400 + MCP </li>\r\n<li>FSB: 400/333/266/200MHz </li>\r\n<li>RAM: 3x DIMM for DDR400/333/266/200(Non-ECC,unbuffered) Max 3GB </li>\r\n<li>IDE: 2x UltraDMA 133 up to 4 Devices </li>\r\n<li>Slots: 1x AGP 8X, 5x PCI </li>\r\n<li>Ports: 2xPS2, 1xCOM, 1xLPT,6xUSB2.0(Rear 4), 1xLAN, Audio Ports </li>\r\n<li>Onboard Audio: Realtek ALC650 6CH w/ built in HP amplifier </li>\r\n<li>Onboard LAN: Integrated NVIDIA MAC + Realtek 8201BL PHY 10/100Mbps </li>\r\n<li>Form Factor: ATX</li>', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (16, 1, 'Data cable', '<b>Product Highlights</b><br>\r\n<LI>7 feet long KVM cable</LI><LI>Connect multiple systems to a KVM switch using these cables</LI><LI>Tested and validated on Dell systems to ensure it will work with your computer</LI><br>\r\n<b>Tech Specs</b><br>\r\n<li>Features:Carries KVM signals</li><li>Cable: KVM</li><li>Included Qty: 1 set</LI><li>Length: 7 feet</li><li>Package Type:Retail</li><br>\r\nUse this cable to connect multiple systems to a single KVM switch. This product has been tested and validated with Dell™ systems to ensure it will work with your computer. Supported by Dell™ Tech Support when used with a Dell™ system.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (17, 1, 'Cooler', 'Gone are the days when PC CPUs could get away with just a little aluminium heat sink stuck on top of them, or no cooler at all. When any Intel or AMD CPU on the shelves today is going full blast, it\'s pumping out heat - less than 20 watts for current Celerons, less than 30 for current P-IIIs, something around the 40 watt mark for current Durons, and better than 70 watts for top-of-the-line Athlons.', 'www.companyname.com', 1);
INSERT INTO products_description VALUES (18, 1, 'Data cable', '<b>Product Highlights</b><br>\r\n<LI>7 feet long KVM cable</LI><LI>Connect multiple systems to a KVM switch using these cables</LI><LI>Tested and validated on Dell systems to ensure it will work with your computer</LI><br>\r\n<b>Tech Specs</b><br>\r\n<li>Features:Carries KVM signals</li><li>Cable: KVM</li><li>Included Qty: 1 set</LI><li>Length: 7 feet</li><li>Package Type:Retail</li><br>\r\nUse this cable to connect multiple systems to a single KVM switch. This product has been tested and validated with Dell™ systems to ensure it will work with your computer. Supported by Dell™ Tech Support when used with a Dell™ system.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (19, 1, 'Data cable', '<b>Product Highlights</b><br>\r\n<LI>7 feet long KVM cable</LI><LI>Connect multiple systems to a KVM switch using these cables</LI><LI>Tested and validated on Dell systems to ensure it will work with your computer</LI><br>\r\n<b>Tech Specs</b><br>\r\n<li>Features:Carries KVM signals</li><li>Cable: KVM</li><li>Included Qty: 1 set</LI><li>Length: 7 feet</li><li>Package Type:Retail</li><br>\r\nUse this cable to connect multiple systems to a single KVM switch. This product has been tested and validated with Dell™ systems to ensure it will work with your computer. Supported by Dell™ Tech Support when used with a Dell™ system.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (20, 1, 'Inspiron Notebook', '<b>Key Features<br><br>Mobility & Performance</b>\r\nThe InspironTM  600m is designed for motion, with long battery life and easy-to-carry style. It starts at just under 5 pounds and only 1.29 inches thin when closed. Integrated wireless connectivity is standard, with Intel®  Centrino®  Mobile Technology, so you can compute and stay connected anywhere, anytime where wireless access is available.3 Explosive ATITM  MobilityTM  RADEON 9000 graphics propel the 600m to a performance level coveted by students, small business owners, and mobile workers alike.<br>\r\n<b>Processor:</b> <br>Intel®  Pentium® M Processors at 1.50GHz, 1.60 GHz, and 1.70GHz with optional Intel CentrinoTM  Mobile Technology.<br><b>Operating System:</b>Microsoft Windows XP Home Edition.<br><b>Display:</b>Choice of 14.1 Super XGA + or 14.1" XGA TFT high resolution displays to make the most of multimedia. Upgrading your display increases clarity, impact and viewing space.<br>\r\n<b>Video Graphics:</b> DDR ATI MOBILITYTM RADEONTM  9000 AGP 4X video graphics at 32MB and 64MB for crisp, realistic images on our high-resolution displays.<br><b>Storage:</b> Hard drives up to 60GB to meet present and potential storage requirements.<br><b>Memory:</b> Up to 1GB of memory gives you excellent overall performance.', 'www.companyname.com', 1);
INSERT INTO products_description VALUES (21, 1, 'Data cable', 'The Video 2 Component Video Cable from Monster Cable is a high-resolution cable that offers sharp, detailed images and bright, vivid and natural color renditions. It features high-purity, high-density copper stranding for low signal loss and protection from \'video noise\'. This cable provides heavy-duty double shielding which guards against outside EMI and RF interference. A low-loss insulator transfers signals more efficiently so your satellite receiver, DVD player and high resolution camcorder can bring you superb pictures.', 'www.companyname.com', 1);
INSERT INTO products_description VALUES (22, 1, 'CDROM Drive', 'Weighing less than one pound, the Targus USB 2.0 DVD/CD-ROM Slim External Drive lets you record music and backup data on CD-R and CD-RW discs, as well as play DVD movies. The drive reads CDs at 24X speeds as well as DVDs at speeds of 8X. Easily connect the external drive through your USB port and enjoy instant access to DVDs and CDs. As an added benefit it features a pass-through connector so you can use a second USB device with your notebook, Tablet PC or desktop PC. Sleek and lightweight, this slim drive also eliminates carrying around additional AC adapters since it is powered directly by your USB port.', 'www.companyname.com', 1);
INSERT INTO products_description VALUES (23, 1, 'Notebook Essentials', '<b>Key Features<br><br>Mobility & Performance</b>\r\nThe InspironTM  600m is designed for motion, with long battery life and easy-to-carry style. It starts at just under 5 pounds and only 1.29 inches thin when closed. Integrated wireless connectivity is standard, with Intel®  Centrino®  Mobile Technology, so you can compute and stay connected anywhere, anytime where wireless access is available.3 Explosive ATITM  MobilityTM  RADEON 9000 graphics propel the 600m to a performance level coveted by students, small business owners, and mobile workers alike.<br>\r\n<b>Processor:</b> <br>Intel®  Pentium® M Processors at 1.50GHz, 1.60 GHz, and 1.70GHz with optional Intel CentrinoTM  Mobile Technology.<br><b>Operating System:</b>Microsoft Windows XP Home Edition.<br><b>Display:</b>Choice of 14.1 Super XGA + or 14.1" XGA TFT high resolution displays to make the most of multimedia. Upgrading your display increases clarity, impact and viewing space.<br>\r\n<b>Video Graphics:</b> DDR ATI MOBILITYTM RADEONTM  9000 AGP 4X video graphics at 32MB and 64MB for crisp, realistic images on our high-resolution displays.<br><b>Storage:</b> Hard drives up to 60GB to meet present and potential storage requirements.<br><b>Memory:</b> Up to 1GB of memory gives you excellent overall performance.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (24, 1, 'Floppy Disk Drive', '<b>Product Highlights</b><br>\r\n<li>Reads/writes standard 1.44 MB floppy disks</Li> \r\n<li>Powered through the USB port — no AC adapter is neede</LI><br>\r\n<b>Tech Spec</b><br>\r\n<li>Device Type: External USB Floppy Disk Drive</li> 	\r\n<li>Interface Type: USB</li> 	\r\n<li>Power: USB powered</li> 	\r\n<li>Supported Media Types: 1.44 MB Floppy disks</li> 	\r\n<li>Compatibility: PC and Mac</li>\r\nThe Titanium USB Floppy Disk Drive from Smartdisk brings more functionality and versatility to your USB equipped Macintosh or PC computer. The drive reads/writes standard 1.44 MB floppy disks and is powered through the USB port, so no AC adapter is needed.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (25, 1, 'Microsoft Internet Keyboard PS/2', 'The Internet Keyboard has 10 Hot Keys on a comfortable standard keyboard design that also includes a detachable palm rest. The Hot Keys allow you to browse the web, or check e-mail directly from your keyboard. The IntelliType Pro software also allows you to customize your hot keys - make the Internet Keyboard work the way you want it to!', '', 0);
INSERT INTO products_description VALUES (26, 1, 'Microsoft IntelliMouse Explorer', 'Microsoft introduces its most advanced mouse, the IntelliMouse Explorer! IntelliMouse Explorer features a sleek design, an industrial-silver finish, a glowing red underside and taillight, creating a style and look unlike any other mouse. IntelliMouse Explorer combines the accuracy and reliability of Microsoft IntelliEye optical tracking technology, the convenience of two new customizable function buttons, the efficiency of the scrolling wheel and the comfort of expert ergonomic design. All these great features make this the best mouse for the PC!', 'www.microsoft.com/hardware/mouse/explorer.asp', 0);
INSERT INTO products_description VALUES (27, 1, 'Hewlett Packard LaserJet 1100Xi', 'HP has always set the pace in laser printing technology. The new generation HP LaserJet 1100 series sets another impressive pace, delivering a stunning 8 pages per minute print speed. The 600 dpi print resolution with HP\'s Resolution Enhancement technology (REt) makes every document more professional.<br><br>Enhanced print speed and laser quality results are just the beginning. With 2MB standard memory, HP LaserJet 1100xi users will be able to print increasingly complex pages. Memory can be increased to 18MB to tackle even more complex documents with ease. The HP LaserJet 1100xi supports key operating systems including Windows 3.1, 3.11, 95, 98, NT 4.0, OS/2 and DOS. Network compatibility available via the optional HP JetDirect External Print Servers.<br><br>HP LaserJet 1100xi also features The Document Builder for the Web Era from Trellix Corp. (featuring software to create Web documents).', 'www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100', 4);
INSERT INTO products_description VALUES (1, 2, 'Matrox G200 MMS', '<b>Unterstützung für zwei bzw. vier analoge oder digitale Monitore</b><br><br>\r\nDie Matrox G200 Multi-Monitor-Serie führt die bewährte Matrox Tradition im Multi-Monitor- Bereich fort und bietet flexible und fortschrittliche Lösungen.Matrox stellt als erstes Unternehmen einen vierfachen digitalen PanelLink® DVI Flachbildschirm Ausgang zur Verfügung. Mit den optional erhältlichen TV Tuner und Video-Capture Möglichkeiten stellt die Matrox G200 MMS eine alles umfassende Mehrschirm-Lösung dar.<br><br>\r\n<b>Leistungsmerkmale:</b>\r\n<ul>\r\n<li>Preisgekrönter Matrox G200 128-Bit Grafikchip</li>\r\n<li>Schneller 8 MB SGRAM-Speicher pro Kanal</li>\r\n<li>Integrierter, leistungsstarker 250 MHz RAMDAC</li>\r\n<li>Unterstützung für bis zu 16 Bildschirme über 4 Quad-Karten (unter Win NT,ab Treiber 4.40)</li>\r\n<li>Unterstützung von 9 Monitoren unter Win 98</li>\r\n<li>2 bzw. 4 analoge oder digitale Ausgabekanäle pro PCI-Karte</li>\r\n<li>Desktop-Darstellung von 1800 x 1440 oder 1920 x 1200 pro Chip</li>\r\n<li>Anschlußmöglichkeit an einen 15-poligen VGA-Monitor oder an einen 30-poligen digitalen DVI-Flachbildschirm plus integriertem Composite-Video-Eingang (bei der TV-Version)</li>\r\n<li>PCI Grafikkarte, kurze Baulänge</li>\r\n<li>Treiberunterstützung: Windows® 2000, Windows NT® und Windows® 98</li>\r\n<li>Anwendungsbereiche: Börsenumgebung mit zeitgleich großem Visualisierungsbedarf, Videoüberwachung, Video-Conferencing</li>\r\n</ul>', 'www.matrox.com/mga/deutsch/products/g200_mms/home.cfm', 0);
INSERT INTO products_description VALUES (2, 2, 'Matrox G400 32 MB', '<b>Neu! Matrox G400 &quot;all inclusive&quot; und vieles mehr...</b><br><br>\r\nDie neue Millennium G400-Serie - Hochleistungsgrafik mit dem sensationellen Unterschied. Ausgestattet mit dem neu eingeführten Matrox G400 Grafikchip, bietet die Millennium G400-Serie eine überragende Beschleunigung inklusive bisher nie dagewesener Bildqualitat und enorm flexibler Darstellungsoptionen bei allen Ihren 3D-, 2D- und DVD-Anwendungen.<br><br>\r\n<ul>\r\n<li>DualHead Display und TV-Ausgang</li>\r\n<li>Environment Mapped Bump Mapping</li>\r\n<li>Matrox G400 256-Bit DualBus</li>\r\n<li>3D Rendering Array Prozessor</li>\r\n<li>Vibrant Color Quality² (VCQ²)</li>\r\n<li>UltraSharp DAC</li>\r\n</ul>\r\n<i>&quot;Bleibt abschließend festzustellen, daß die Matrox Millennium G400 Max als Allroundkarte für den Highend-PC derzeit unerreicht ist. Das ergibt den Testsieg und unsere wärmste Empfehlung.&quot;</i><br>\r\n<b>GameStar 8/99 (S.184)</b>', 'www.matrox.com/mga/deutsch/products/mill_g400/home.cfm', 0);
INSERT INTO products_description VALUES (3, 2, 'Microsoft IntelliMouse Pro', 'Die IntelliMouse Pro hat mit der IntelliRad-Technologie einen neuen Standard gesetzt. Anwenderfreundliche Handhabung und produktiveres Arbeiten am PC zeichnen die IntelliMouse aus. Die gewölbte Oberseite paßt sich natürlich in die Handfläche ein, die geschwungene Form erleichtert das Bedienen der Maus. Sie ist sowohl für Rechts- wie auch für Linkshänder geeignet. Mit dem Rad der IntelliMouse kann der Anwender einfach und komfortabel durch Dokumente navigieren.<br><br>\r\n<b>Eigenschaften:</b>\r\n<ul>\r\n<li><b>ANSCHLUSS:</b> PS/2</li>\r\n<li><b>FARBE:</b> weiß</li>\r\n<li><b>TECHNIK:</b> Mauskugel</li>\r\n<li><b>TASTEN:</b> 3 (incl. Scrollrad)</li>\r\n<li><b>SCROLLRAD:</b> Ja</li>\r\n</ul>', '', 0);
INSERT INTO products_description VALUES (4, 2, 'GeForce MX 4000 AGP Graphics Card', 'The Asylum GeForce MX 4000 AGP Graphics Card from BFG™ is a high-end graphics card designed to deliver excellent visual quality in high intensity gaming and graphics applications. With 128 MB DDR onboard memory and NVIDIA® GeForce™ MX 4000 graphics processor, this card provides 3D games and applications with enhanced speed and look. The 350 MHz Dual RAMDAC and 275 MHz Core Clock both ensure you of true-to-life gaming experience. This card offers compatibility with DirectX® and OpenGL®, and provides VGA™ and S-Video-Out connectors. To add to this, the Asylum GeForce MX 4000 comes bundled with NVIDIA® Unified drivers, NVIDIA® GeForce™ FX and GeForce4 Demos, NVIDIA® NVDVD™ 2.0 multimedia software and Windowblinds™ BFG / Asylum™ / NIVIDIA® skins.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (5, 2, 'Asus A7N8X-X - Mainboard', '<b>Specifications: </b><br>\r\n<li>Supported CPU: Socket A AMD Athlon/Athlon XP/Duron Processors</li> \r\n<li>Chipset: NVIDIA nForce2 400 + MCP </li>\r\n<li>FSB: 400/333/266/200MHz </li>\r\n<li>RAM: 3x DIMM for DDR400/333/266/200(Non-ECC,unbuffered) Max 3GB </li>\r\n<li>IDE: 2x UltraDMA 133 up to 4 Devices </li>\r\n<li>Slots: 1x AGP 8X, 5x PCI </li>\r\n<li>Ports: 2xPS2, 1xCOM, 1xLPT,6xUSB2.0(Rear 4), 1xLAN, Audio Ports </li>\r\n<li>Onboard Audio: Realtek ALC650 6CH w/ built in HP amplifier </li>\r\n<li>Onboard LAN: Integrated NVIDIA MAC + Realtek 8201BL PHY 10/100Mbps </li>\r\n<li>Form Factor: ATX</li>', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (6, 2, 'HN-505 Noise Canceling Headphones', 'The new Dell™ 20 GB Digital Jukebox MP3 Player promises the ease of use and value of the original DJ with an enhanced form factor and capacity options. Weighing just 6.8 Oz, the Dell™ DJ 20 delivers high-quality, hard-drive based audio. The second-generation Digital Jukebox with 20 GB3 capacity lets you carry up to 99001 songs at any given time and offers up to 12 hours of battery life2 to play them. In addition to supporting the WMA audio format, the multifunctional music player plays high-fidelity MP3 audio files, and also provides a way to back up critical data from your PC. It features a 1.92-inch blue back-lit liquid crystal display, three-way scroll barrel navigation and an USB 2.0 interface for PC synchronization and alternative battery charging. The DJ comes with MDR-NC6 noise canceling headphones that sport a slim swivel folding style for easy storage, and feature neodymium magnets to deliver powerful sound. Made from premium villus neoprene and with reinforced, vulcanized rubber sides, the included blue action jacket provides enhanced protection for your Dell DJ. The device also includes earphones, Music Match Jukebox version 9 Software for music library management and a 1-Year Advanced Exchange Service.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (7, 2, 'The FireGL™ Graphics Card', 'The FireGL™ X2-256t from ATI Technologies is a high performance Workstation Graphics Accelerator, delivering fast 3D performance and enhanced quality graphics for professional applications. Based on the FGL™ 9800XT Visual Processing Unit (VPU), the FireGL X2-256t offers an ideal solution for the computer-aided design (CAD) and digital content creation (DCC) applications. Combining SMOOTHVISION™ and SMARTSHADER™, the X2-256t enables realistic interactive imagery and lets you experience the sharp texts without sacrificing frame rates. With 256 MB of graphics memory and hardware accelerated rendering using OpenGL® Shading Language and DirectX® 9, it empowers 3D professionals to realize an enhancement in productivity and a reduction in design cycle times.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (8, 2, '5650 5.1 Surround Sound Speakers', 'This bundle has been tested and validated on Dell™ systems to ensure it will work with your computer. It is supported by Dell™ Technical Support when used with a Dell system. This bundle includes the following product:<br>\r\n<b>5650 5.1 Surround Sound Speakers with Subwoofer</b><br>\r\n\r\nExperience superb audio performance for gaming, multimedia presentations and DVD playback with the Dell™ 5650 5.1 Surround Sound Speakers. This system is composed of four Satellites, one 5.25\\" Subwoofer and Center Channel that are engineered to deliver powerful sound – a total of 100 Watts. The 5650 system provides clear surround sound that lets you enjoy multi-channel listening while seated in front of your computer.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (9, 2, 'RADEON X300SE Graphics Card', 'The Stealth RADEON X300SE Graphics Card from Diamond Multimedia incorporates the 0.11 micron technology to bring you fast performing programmable shaders for an excellent combination of power and performance. Powered by the RADEON X300SE engine, this card boasts 128 MB memory to deliver a dazzling visual experience. It is designed with support for the native x16 PCI Express interface that allows it to communicate directly with the PCI Express bus at high speeds. This card supports Microsoft® DirectX® 9.0, allowing for high-quality graphics and 3D textures that add a natural look to your games.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (10, 2, 'LCD Monitor', 'An excellent combination of looks and performance, the P1230 22-inch Color CRT Monitor from Dell™ is aimed at highly visual users such as graphic designers, video editors and gamers. A 98% color gamut and resolutions up to 1600x1200 pixels (UXGA) mean that the P1230 can accurately reproduce vivid colors and details on screen. Using the Diamondtron Natural flat technology, it offers an enhanced aperture grille that delivers a perfectly flat image with excellent alignment and focus. The monitor\\\'s dual VGA™ inputs allow two systems to be connected at once. This product has been tested and validated on Dell™ systems to ensure it will work with your computer. It is supported by Dell™ Technical Support when used with a Dell system.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (11, 2, 'Action Jacket and MDR-NC6 Noise Canceling Headphones', 'The new Dell™ 20 GB Digital Jukebox MP3 Player promises the ease of use and value of the original DJ with an enhanced form factor and capacity options. Weighing just 6.8 Oz, the Dell™ DJ 20 delivers high-quality, hard-drive based audio. The second-generation Digital Jukebox with 20 GB3 capacity lets you carry up to 99001 songs at any given time and offers up to 12 hours of battery life2 to play them. In addition to supporting the WMA audio format, the multifunctional music player plays high-fidelity MP3 audio files, and also provides a way to back up critical data from your PC. It features a 1.92-inch blue back-lit liquid crystal display, three-way scroll barrel navigation and an USB 2.0 interface for PC synchronization and alternative battery charging. The DJ comes with MDR-NC6 noise canceling headphones that sport a slim swivel folding style for easy storage, and feature neodymium magnets to deliver powerful sound. Made from premium villus neoprene and with reinforced, vulcanized rubber sides, the included blue action jacket provides enhanced protection for your Dell DJ. The device also includes earphones, Music Match Jukebox version 9 Software for music library management and a 1-Year Advanced Exchange Service.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (12, 2, 'Audio 10 PC Microphone', 'The Plantronics .Audio™ 10 analog PC Microphone aids in turning your desktop PC into a complete Internet chat system. The device uses a noise-canceling, unidirectional microphone to capture and transmit your voice as accurately as possible, while filtering out background noise. It is compatible with many PC sound cards for Windows® and features an adjustable boom, a monitor attachment, and a weighted base for increased stability. The .Audio™ 10 PC Microphone is ideal for Internet phone calling and voice-enabled multiplayer games.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (13, 2, 'Notebook', '<b>Key Features<br><br>Mobility & Performance</b>\r\nThe InspironTM  600m is designed for motion, with long battery life and easy-to-carry style. It starts at just under 5 pounds and only 1.29 inches thin when closed. Integrated wireless connectivity is standard, with Intel®  Centrino®  Mobile Technology, so you can compute and stay connected anywhere, anytime where wireless access is available.3 Explosive ATITM  MobilityTM  RADEON 9000 graphics propel the 600m to a performance level coveted by students, small business owners, and mobile workers alike.<br>\r\n<b>Processor:</b> <br>Intel®  Pentium® M Processors at 1.50GHz, 1.60 GHz, and 1.70GHz with optional Intel CentrinoTM  Mobile Technology.<br><b>Operating System:</b>Microsoft Windows XP Home Edition.<br><b>Display:</b>Choice of 14.1 Super XGA + or 14.1" XGA TFT high resolution displays to make the most of multimedia. Upgrading your display increases clarity, impact and viewing space.<br>\r\n<b>Video Graphics:</b> DDR ATI MOBILITYTM RADEONTM  9000 AGP 4X video graphics at 32MB and 64MB for crisp, realistic images on our high-resolution displays.<br><b>Storage:</b> Hard drives up to 60GB to meet present and potential storage requirements.<br><b>Memory:</b> Up to 1GB of memory gives you excellent overall performance.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (14, 2, 'Hewlett Packard LaserJet 2200Xi', 'HP has always set the pace in laser printing technology. The new generation HP LaserJet 1100 series sets another impressive pace, delivering a stunning 8 pages per minute print speed. The 600 dpi print resolution with HP\'s Resolution Enhancement technology (REt) makes every document more professional.<br><br>Enhanced print speed and laser quality results are just the beginning. With 2MB standard memory, HP LaserJet 1100xi users will be able to print increasingly complex pages. Memory can be increased to 18MB to tackle even more complex documents with ease. The HP LaserJet 1100xi supports key operating systems including Windows 3.1, 3.11, 95, 98, NT 4.0, OS/2 and DOS. Network compatibility available via the optional HP JetDirect External Print Servers.<br><br>HP LaserJet 1100xi also features The Document Builder for the Web Era from Trellix Corp. (featuring software to create Web documents).', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (15, 2, 'Asus A2N6 - Mainboard', '<b>Specifications: </b><br>\r\n<li>Supported CPU: Socket A AMD Athlon/Athlon XP/Duron Processors</li> \r\n<li>Chipset: NVIDIA nForce2 400 + MCP </li>\r\n<li>FSB: 400/333/266/200MHz </li>\r\n<li>RAM: 3x DIMM for DDR400/333/266/200(Non-ECC,unbuffered) Max 3GB </li>\r\n<li>IDE: 2x UltraDMA 133 up to 4 Devices </li>\r\n<li>Slots: 1x AGP 8X, 5x PCI </li>\r\n<li>Ports: 2xPS2, 1xCOM, 1xLPT,6xUSB2.0(Rear 4), 1xLAN, Audio Ports </li>\r\n<li>Onboard Audio: Realtek ALC650 6CH w/ built in HP amplifier </li>\r\n<li>Onboard LAN: Integrated NVIDIA MAC + Realtek 8201BL PHY 10/100Mbps </li>\r\n<li>Form Factor: ATX</li>', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (16, 2, 'Data cable', '<b>Product Highlights</b><br>\r\n<LI>7 feet long KVM cable</LI><LI>Connect multiple systems to a KVM switch using these cables</LI><LI>Tested and validated on Dell systems to ensure it will work with your computer</LI><br>\r\n<b>Tech Specs</b><br>\r\n<li>Features:Carries KVM signals</li><li>Cable: KVM</li><li>Included Qty: 1 set</LI><li>Length: 7 feet</li><li>Package Type:Retail</li><br>\r\nUse this cable to connect multiple systems to a single KVM switch. This product has been tested and validated with Dell™ systems to ensure it will work with your computer. Supported by Dell™ Tech Support when used with a Dell™ system.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (17, 2, 'Cooler', 'Gone are the days when PC CPUs could get away with just a little aluminium heat sink stuck on top of them, or no cooler at all. When any Intel or AMD CPU on the shelves today is going full blast, it\'s pumping out heat - less than 20 watts for current Celerons, less than 30 for current P-IIIs, something around the 40 watt mark for current Durons, and better than 70 watts for top-of-the-line Athlons.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (18, 2, 'Data cable', '<b>Product Highlights</b><br>\r\n<LI>7 feet long KVM cable</LI><LI>Connect multiple systems to a KVM switch using these cables</LI><LI>Tested and validated on Dell systems to ensure it will work with your computer</LI><br>\r\n<b>Tech Specs</b><br>\r\n<li>Features:Carries KVM signals</li><li>Cable: KVM</li><li>Included Qty: 1 set</LI><li>Length: 7 feet</li><li>Package Type:Retail</li><br>\r\nUse this cable to connect multiple systems to a single KVM switch. This product has been tested and validated with Dell™ systems to ensure it will work with your computer. Supported by Dell™ Tech Support when used with a Dell™ system.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (19, 2, 'Data cable', '<b>Product Highlights</b><br>\r\n<LI>7 feet long KVM cable</LI><LI>Connect multiple systems to a KVM switch using these cables</LI><LI>Tested and validated on Dell systems to ensure it will work with your computer</LI><br>\r\n<b>Tech Specs</b><br>\r\n<li>Features:Carries KVM signals</li><li>Cable: KVM</li><li>Included Qty: 1 set</LI><li>Length: 7 feet</li><li>Package Type:Retail</li><br>\r\nUse this cable to connect multiple systems to a single KVM switch. This product has been tested and validated with Dell™ systems to ensure it will work with your computer. Supported by Dell™ Tech Support when used with a Dell™ system.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (20, 2, 'Inspiron Notebook', '<b>Key Features<br><br>Mobility & Performance</b>\r\nThe InspironTM  600m is designed for motion, with long battery life and easy-to-carry style. It starts at just under 5 pounds and only 1.29 inches thin when closed. Integrated wireless connectivity is standard, with Intel®  Centrino®  Mobile Technology, so you can compute and stay connected anywhere, anytime where wireless access is available.3 Explosive ATITM  MobilityTM  RADEON 9000 graphics propel the 600m to a performance level coveted by students, small business owners, and mobile workers alike.<br>\r\n<b>Processor:</b> <br>Intel®  Pentium® M Processors at 1.50GHz, 1.60 GHz, and 1.70GHz with optional Intel CentrinoTM  Mobile Technology.<br><b>Operating System:</b>Microsoft Windows XP Home Edition.<br><b>Display:</b>Choice of 14.1 Super XGA + or 14.1" XGA TFT high resolution displays to make the most of multimedia. Upgrading your display increases clarity, impact and viewing space.<br>\r\n<b>Video Graphics:</b> DDR ATI MOBILITYTM RADEONTM  9000 AGP 4X video graphics at 32MB and 64MB for crisp, realistic images on our high-resolution displays.<br><b>Storage:</b> Hard drives up to 60GB to meet present and potential storage requirements.<br><b>Memory:</b> Up to 1GB of memory gives you excellent overall performance.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (21, 2, 'Data Cabel', 'The Video 2 Component Video Cable from Monster Cable is a high-resolution cable that offers sharp, detailed images and bright, vivid and natural color renditions. It features high-purity, high-density copper stranding for low signal loss and protection from \'video noise\'. This cable provides heavy-duty double shielding which guards against outside EMI and RF interference. A low-loss insulator transfers signals more efficiently so your satellite receiver, DVD player and high resolution camcorder can bring you superb pictures.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (22, 2, 'CDROM Drive', 'Weighing less than one pound, the Targus USB 2.0 DVD/CD-ROM Slim External Drive lets you record music and backup data on CD-R and CD-RW discs, as well as play DVD movies. The drive reads CDs at 24X speeds as well as DVDs at speeds of 8X. Easily connect the external drive through your USB port and enjoy instant access to DVDs and CDs. As an added benefit it features a pass-through connector so you can use a second USB device with your notebook, Tablet PC or desktop PC. Sleek and lightweight, this slim drive also eliminates carrying around additional AC adapters since it is powered directly by your USB port.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (23, 2, 'Notebook Essentials', '<b>Key Features<br><br>Mobility & Performance</b>\r\nThe InspironTM  600m is designed for motion, with long battery life and easy-to-carry style. It starts at just under 5 pounds and only 1.29 inches thin when closed. Integrated wireless connectivity is standard, with Intel®  Centrino®  Mobile Technology, so you can compute and stay connected anywhere, anytime where wireless access is available.3 Explosive ATITM  MobilityTM  RADEON 9000 graphics propel the 600m to a performance level coveted by students, small business owners, and mobile workers alike.<br>\r\n<b>Processor:</b> <br>Intel®  Pentium® M Processors at 1.50GHz, 1.60 GHz, and 1.70GHz with optional Intel CentrinoTM  Mobile Technology.<br><b>Operating System:</b>Microsoft Windows XP Home Edition.<br><b>Display:</b>Choice of 14.1 Super XGA + or 14.1" XGA TFT high resolution displays to make the most of multimedia. Upgrading your display increases clarity, impact and viewing space.<br>\r\n<b>Video Graphics:</b> DDR ATI MOBILITYTM RADEONTM  9000 AGP 4X video graphics at 32MB and 64MB for crisp, realistic images on our high-resolution displays.<br><b>Storage:</b> Hard drives up to 60GB to meet present and potential storage requirements.<br><b>Memory:</b> Up to 1GB of memory gives you excellent overall performance.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (24, 2, 'Floppy Disk Drive', '<b>Product Highlights</b><br>\r\n<li>Reads/writes standard 1.44 MB floppy disks</Li> \r\n<li>Powered through the USB port — no AC adapter is neede</LI><br>\r\n<b>Tech Spec</b><br>\r\n<li>Device Type: External USB Floppy Disk Drive</li> 	\r\n<li>Interface Type: USB</li> 	\r\n<li>Power: USB powered</li> 	\r\n<li>Supported Media Types: 1.44 MB Floppy disks</li> 	\r\n<li>Compatibility: PC and Mac</li>\r\nThe Titanium USB Floppy Disk Drive from Smartdisk brings more functionality and versatility to your USB equipped Macintosh or PC computer. The drive reads/writes standard 1.44 MB floppy disks and is powered through the USB port, so no AC adapter is needed.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (25, 2, 'Microsoft Internet Tastatur PS/2', '<i>Microsoft Internet Keyboard,Windows-Tastatur mit 10 zusätzl. Tasten,2 selbst programmierbar, abnehmbareHandgelenkauflage. Treiber im Lieferumfang.</i><br><br>\r\nEin-Klick-Zugriff auf das Internet und vieles mehr! Das Internet Keyboard verfügt über 10 zusätzliche Abkürzungstasten auf einer benutzerfreundlichen Standardtastatur, die darüber hinaus eine abnehmbare Handballenauflage aufweist. Über die Abkürzungstasten können Sie durch das Internet surfen oder direkt von der Tastatur aus auf E-Mails zugreifen. Die IntelliType Pro-Software ermöglicht außerdem das individuelle Belegen der Tasten.', '', 0);
INSERT INTO products_description VALUES (26, 2, 'Microsof IntelliMouse Explorer', 'Die IntelliMouse Explorer überzeugt durch ihr modernes Design mit silberfarbenem Gehäuse, sowie rot schimmernder Unter- und Rückseite. Die neuartige IntelliEye-Technologie sorgt für eine noch nie dagewesene Präzision, da statt der beweglichen Teile (zum Abtasten der Bewegungsänderungen an der Unterseite der Maus) ein optischer Sensor die Bewegungen der Maus erfaßt. Das Herzstück der Microsoft IntelliEye-Technologie ist ein kleiner Chip, der einen optischen Sensor und einen digitalen Signalprozessor (DSP) enthält.<br><br>\r\nDa auf bewegliche Teile, die Staub, Schmutz und Fett aufnehmen können, verzichtet wurde, muß die IntelliMouse Explorer nicht mehr gereinigt werden. Darüber hinaus arbeitet die IntelliMouse Explorer auf nahezu jeder Arbeitsoberfläche, so daß kein Mauspad mehr erforderlich ist. Mit dem Rad und zwei neuen zusätzlichen Maustasten ermöglicht sie effizientes und komfortables Arbeiten am PC.<br><br>\r\n<b>Eigenschaften:</b>\r\n<ul>\r\n<li><b>ANSCHLUSS:</b> USB (PS/2-Adapter enthalten)</li>\r\n<li><b>FARBE:</b> metallic-grau</li>\r\n<li><b>TECHNIK:</b> Optisch (Akt.: ca. 1500 Bilder/s)</li>\r\n<li><b>TASTEN:</b> 5 (incl. Scrollrad)</li>\r\n<li><b>SCROLLRAD:</b> Ja</li>\r\n</ul>\r\n<i><b>BEMERKUNG:</b><br>Keine Reinigung bewegter Teile mehr notwendig, da statt der Mauskugel ein Fotoempfänger benutzt wird.</i>', '', 0);
INSERT INTO products_description VALUES (27, 2, 'Hewlett-Packard LaserJet 1100Xi', 'HP has always set the pace in laser printing technology. The new generation HP LaserJet 1100 series sets another impressive pace, delivering a stunning 8 pages per minute print speed. The 600 dpi print resolution with HP\'s Resolution Enhancement technology (REt) makes every document more professional.<br><br>Enhanced print speed and laser quality results are just the beginning. With 2MB standard memory, HP LaserJet 1100xi users will be able to print increasingly complex pages. Memory can be increased to 18MB to tackle even more complex documents with ease. The HP LaserJet 1100xi supports key operating systems including Windows 3.1, 3.11, 95, 98, NT 4.0, OS/2 and DOS. Network compatibility available via the optional HP JetDirect External Print Servers.<br><br>HP LaserJet 1100xi also features The Document Builder for the Web Era from Trellix Corp. (featuring software to create Web documents).', 'www.hp.com', 0);
INSERT INTO products_description VALUES (1, 3, 'Matrox G200 MMS', 'Reinforcing its position as a multi-monitor trailblazer, Matrox Graphics Inc. has once again developed the most flexible and highly advanced solution in the industry. Introducing the new Matrox G200 Multi-Monitor Series; the first graphics card ever to support up to four DVI digital flat panel displays on a single 8&quot; PCI board.<br><br>With continuing demand for digital flat panels in the financial workplace, the Matrox G200 MMS is the ultimate in flexible solutions. The Matrox G200 MMS also supports the new digital video interface (DVI) created by the Digital Display Working Group (DDWG) designed to ease the adoption of digital flat panels. Other configurations include composite video capture ability and onboard TV tuner, making the Matrox G200 MMS the complete solution for business needs.<br><br>Based on the award-winning MGA-G200 graphics chip, the Matrox G200 Multi-Monitor Series provides superior 2D/3D graphics acceleration to meet the demanding needs of business applications such as real-time stock quotes (Versus), live video feeds (Reuters & Bloombergs), multiple windows applications, word processing, spreadsheets and CAD.', 'www.matrox.com/mga/products/g200_mms/home.cfm', 0);
INSERT INTO products_description VALUES (2, 3, 'Matrox G400 32MB', '<b>Dramatically Different High Performance Graphics</b><br><br>Introducing the Millennium G400 Series - a dramatically different, high performance graphics experience. Armed with the industry\'s fastest graphics chip, the Millennium G400 Series takes explosive acceleration two steps further by adding unprecedented image quality, along with the most versatile display options for all your 3D, 2D and DVD applications. As the most powerful and innovative tools in your PC\'s arsenal, the Millennium G400 Series will not only change the way you see graphics, but will revolutionize the way you use your computer.<br><br><b>Key features:</b><ul><li>New Matrox G400 256-bit DualBus graphics chip</li><li>Explosive 3D, 2D and DVD performance</li><li>DualHead Display</li><li>Superior DVD and TV output</li><li>3D Environment-Mapped Bump Mapping</li><li>Vibrant Color Quality rendering </li><li>UltraSharp DAC of up to 360 MHz</li><li>3D Rendering Array Processor</li><li>Support for 16 or 32 MB of memory</li></ul>', 'www.matrox.com/mga/products/mill_g400/home.htm', 0);
INSERT INTO products_description VALUES (3, 3, 'Microsoft IntelliMouse Pro', 'Every element of IntelliMouse Pro - from its unique arched shape to the texture of the rubber grip around its base - is the product of extensive customer and ergonomic research. Microsoft\'s popular wheel control, which now allows zooming and universal scrolling functions, gives IntelliMouse Pro outstanding comfort and efficiency.', 'www.microsoft.com/hardware/mouse/intellimouse.asp', 0);
INSERT INTO products_description VALUES (4, 3, 'GeForce MX 4000 AGP Graphics Card', 'The Asylum GeForce MX 4000 AGP Graphics Card from BFG™ is a high-end graphics card designed to deliver excellent visual quality in high intensity gaming and graphics applications. With 128 MB DDR onboard memory and NVIDIA® GeForce™ MX 4000 graphics processor, this card provides 3D games and applications with enhanced speed and look. The 350 MHz Dual RAMDAC and 275 MHz Core Clock both ensure you of true-to-life gaming experience. This card offers compatibility with DirectX® and OpenGL®, and provides VGA™ and S-Video-Out connectors. To add to this, the Asylum GeForce MX 4000 comes bundled with NVIDIA® Unified drivers, NVIDIA® GeForce™ FX and GeForce4 Demos, NVIDIA® NVDVD™ 2.0 multimedia software and Windowblinds™ BFG / Asylum™ / NIVIDIA® skins.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (5, 3, 'Asus A7N8X-X - Mainboard', '<b>Specifications: </b><br>\r\n<li>Supported CPU: Socket A AMD Athlon/Athlon XP/Duron Processors</li> \r\n<li>Chipset: NVIDIA nForce2 400 + MCP </li>\r\n<li>FSB: 400/333/266/200MHz </li>\r\n<li>RAM: 3x DIMM for DDR400/333/266/200(Non-ECC,unbuffered) Max 3GB </li>\r\n<li>IDE: 2x UltraDMA 133 up to 4 Devices </li>\r\n<li>Slots: 1x AGP 8X, 5x PCI </li>\r\n<li>Ports: 2xPS2, 1xCOM, 1xLPT,6xUSB2.0(Rear 4), 1xLAN, Audio Ports </li>\r\n<li>Onboard Audio: Realtek ALC650 6CH w/ built in HP amplifier </li>\r\n<li>Onboard LAN: Integrated NVIDIA MAC + Realtek 8201BL PHY 10/100Mbps </li>\r\n<li>Form Factor: ATX</li>', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (6, 3, 'HN-505 Noise Canceling Headphones', 'The new Dell™ 20 GB Digital Jukebox MP3 Player promises the ease of use and value of the original DJ with an enhanced form factor and capacity options. Weighing just 6.8 Oz, the Dell™ DJ 20 delivers high-quality, hard-drive based audio. The second-generation Digital Jukebox with 20 GB3 capacity lets you carry up to 99001 songs at any given time and offers up to 12 hours of battery life2 to play them. In addition to supporting the WMA audio format, the multifunctional music player plays high-fidelity MP3 audio files, and also provides a way to back up critical data from your PC. It features a 1.92-inch blue back-lit liquid crystal display, three-way scroll barrel navigation and an USB 2.0 interface for PC synchronization and alternative battery charging. The DJ comes with MDR-NC6 noise canceling headphones that sport a slim swivel folding style for easy storage, and feature neodymium magnets to deliver powerful sound. Made from premium villus neoprene and with reinforced, vulcanized rubber sides, the included blue action jacket provides enhanced protection for your Dell DJ. The device also includes earphones, Music Match Jukebox version 9 Software for music library management and a 1-Year Advanced Exchange Service.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (7, 3, 'The FireGL™ Graphics Card', 'The FireGL™ X2-256t from ATI Technologies is a high performance Workstation Graphics Accelerator, delivering fast 3D performance and enhanced quality graphics for professional applications. Based on the FGL™ 9800XT Visual Processing Unit (VPU), the FireGL X2-256t offers an ideal solution for the computer-aided design (CAD) and digital content creation (DCC) applications. Combining SMOOTHVISION™ and SMARTSHADER™, the X2-256t enables realistic interactive imagery and lets you experience the sharp texts without sacrificing frame rates. With 256 MB of graphics memory and hardware accelerated rendering using OpenGL® Shading Language and DirectX® 9, it empowers 3D professionals to realize an enhancement in productivity and a reduction in design cycle times.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (8, 3, '5650 5.1 Surround Sound Speakers', 'This bundle has been tested and validated on Dell™ systems to ensure it will work with your computer. It is supported by Dell™ Technical Support when used with a Dell system. This bundle includes the following product:<br>\r\n<b>5650 5.1 Surround Sound Speakers with Subwoofer</b><br>\r\n\r\nExperience superb audio performance for gaming, multimedia presentations and DVD playback with the Dell™ 5650 5.1 Surround Sound Speakers. This system is composed of four Satellites, one 5.25\\" Subwoofer and Center Channel that are engineered to deliver powerful sound – a total of 100 Watts. The 5650 system provides clear surround sound that lets you enjoy multi-channel listening while seated in front of your computer.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (9, 3, 'RADEON X300SE Graphics Card', 'The Stealth RADEON X300SE Graphics Card from Diamond Multimedia incorporates the 0.11 micron technology to bring you fast performing programmable shaders for an excellent combination of power and performance. Powered by the RADEON X300SE engine, this card boasts 128 MB memory to deliver a dazzling visual experience. It is designed with support for the native x16 PCI Express interface that allows it to communicate directly with the PCI Express bus at high speeds. This card supports Microsoft® DirectX® 9.0, allowing for high-quality graphics and 3D textures that add a natural look to your games.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (10, 3, 'LCD Monitor', 'An excellent combination of looks and performance, the P1230 22-inch Color CRT Monitor from Dell™ is aimed at highly visual users such as graphic designers, video editors and gamers. A 98% color gamut and resolutions up to 1600x1200 pixels (UXGA) mean that the P1230 can accurately reproduce vivid colors and details on screen. Using the Diamondtron Natural flat technology, it offers an enhanced aperture grille that delivers a perfectly flat image with excellent alignment and focus. The monitor\\\'s dual VGA™ inputs allow two systems to be connected at once. This product has been tested and validated on Dell™ systems to ensure it will work with your computer. It is supported by Dell™ Technical Support when used with a Dell system.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (11, 3, 'Action Jacket and MDR-NC6 Noise Canceling Headphones', 'The new Dell™ 20 GB Digital Jukebox MP3 Player promises the ease of use and value of the original DJ with an enhanced form factor and capacity options. Weighing just 6.8 Oz, the Dell™ DJ 20 delivers high-quality, hard-drive based audio. The second-generation Digital Jukebox with 20 GB3 capacity lets you carry up to 99001 songs at any given time and offers up to 12 hours of battery life2 to play them. In addition to supporting the WMA audio format, the multifunctional music player plays high-fidelity MP3 audio files, and also provides a way to back up critical data from your PC. It features a 1.92-inch blue back-lit liquid crystal display, three-way scroll barrel navigation and an USB 2.0 interface for PC synchronization and alternative battery charging. The DJ comes with MDR-NC6 noise canceling headphones that sport a slim swivel folding style for easy storage, and feature neodymium magnets to deliver powerful sound. Made from premium villus neoprene and with reinforced, vulcanized rubber sides, the included blue action jacket provides enhanced protection for your Dell DJ. The device also includes earphones, Music Match Jukebox version 9 Software for music library management and a 1-Year Advanced Exchange Service.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (12, 3, 'Audio 10 PC Microphone', 'The Plantronics .Audio™ 10 analog PC Microphone aids in turning your desktop PC into a complete Internet chat system. The device uses a noise-canceling, unidirectional microphone to capture and transmit your voice as accurately as possible, while filtering out background noise. It is compatible with many PC sound cards for Windows® and features an adjustable boom, a monitor attachment, and a weighted base for increased stability. The .Audio™ 10 PC Microphone is ideal for Internet phone calling and voice-enabled multiplayer games.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (13, 3, 'Notebook', '<b>Key Features<br><br>Mobility & Performance</b>\r\nThe InspironTM  600m is designed for motion, with long battery life and easy-to-carry style. It starts at just under 5 pounds and only 1.29 inches thin when closed. Integrated wireless connectivity is standard, with Intel®  Centrino®  Mobile Technology, so you can compute and stay connected anywhere, anytime where wireless access is available.3 Explosive ATITM  MobilityTM  RADEON 9000 graphics propel the 600m to a performance level coveted by students, small business owners, and mobile workers alike.<br>\r\n<b>Processor:</b> <br>Intel®  Pentium® M Processors at 1.50GHz, 1.60 GHz, and 1.70GHz with optional Intel CentrinoTM  Mobile Technology.<br><b>Operating System:</b>Microsoft Windows XP Home Edition.<br><b>Display:</b>Choice of 14.1 Super XGA + or 14.1" XGA TFT high resolution displays to make the most of multimedia. Upgrading your display increases clarity, impact and viewing space.<br>\r\n<b>Video Graphics:</b> DDR ATI MOBILITYTM RADEONTM  9000 AGP 4X video graphics at 32MB and 64MB for crisp, realistic images on our high-resolution displays.<br><b>Storage:</b> Hard drives up to 60GB to meet present and potential storage requirements.<br><b>Memory:</b> Up to 1GB of memory gives you excellent overall performance.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (14, 3, 'Hewlett Packard LaserJet 2200Xi', 'HP has always set the pace in laser printing technology. The new generation HP LaserJet 1100 series sets another impressive pace, delivering a stunning 8 pages per minute print speed. The 600 dpi print resolution with HP\'s Resolution Enhancement technology (REt) makes every document more professional.<br><br>Enhanced print speed and laser quality results are just the beginning. With 2MB standard memory, HP LaserJet 1100xi users will be able to print increasingly complex pages. Memory can be increased to 18MB to tackle even more complex documents with ease. The HP LaserJet 1100xi supports key operating systems including Windows 3.1, 3.11, 95, 98, NT 4.0, OS/2 and DOS. Network compatibility available via the optional HP JetDirect External Print Servers.<br><br>HP LaserJet 1100xi also features The Document Builder for the Web Era from Trellix Corp. (featuring software to create Web documents).', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (15, 3, 'Asus A2N6 - Mainboard', '<b>Specifications: </b><br>\r\n<li>Supported CPU: Socket A AMD Athlon/Athlon XP/Duron Processors</li> \r\n<li>Chipset: NVIDIA nForce2 400 + MCP </li>\r\n<li>FSB: 400/333/266/200MHz </li>\r\n<li>RAM: 3x DIMM for DDR400/333/266/200(Non-ECC,unbuffered) Max 3GB </li>\r\n<li>IDE: 2x UltraDMA 133 up to 4 Devices </li>\r\n<li>Slots: 1x AGP 8X, 5x PCI </li>\r\n<li>Ports: 2xPS2, 1xCOM, 1xLPT,6xUSB2.0(Rear 4), 1xLAN, Audio Ports </li>\r\n<li>Onboard Audio: Realtek ALC650 6CH w/ built in HP amplifier </li>\r\n<li>Onboard LAN: Integrated NVIDIA MAC + Realtek 8201BL PHY 10/100Mbps </li>\r\n<li>Form Factor: ATX</li>', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (16, 3, 'Data cable', '<b>Product Highlights</b><br>\r\n<LI>7 feet long KVM cable</LI><LI>Connect multiple systems to a KVM switch using these cables</LI><LI>Tested and validated on Dell systems to ensure it will work with your computer</LI><br>\r\n<b>Tech Specs</b><br>\r\n<li>Features:Carries KVM signals</li><li>Cable: KVM</li><li>Included Qty: 1 set</LI><li>Length: 7 feet</li><li>Package Type:Retail</li><br>\r\nUse this cable to connect multiple systems to a single KVM switch. This product has been tested and validated with Dell™ systems to ensure it will work with your computer. Supported by Dell™ Tech Support when used with a Dell™ system.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (17, 3, 'Cooler', 'Gone are the days when PC CPUs could get away with just a little aluminium heat sink stuck on top of them, or no cooler at all. When any Intel or AMD CPU on the shelves today is going full blast, it\'s pumping out heat - less than 20 watts for current Celerons, less than 30 for current P-IIIs, something around the 40 watt mark for current Durons, and better than 70 watts for top-of-the-line Athlons.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (18, 3, 'Data cable', '<b>Product Highlights</b><br>\r\n<LI>7 feet long KVM cable</LI><LI>Connect multiple systems to a KVM switch using these cables</LI><LI>Tested and validated on Dell systems to ensure it will work with your computer</LI><br>\r\n<b>Tech Specs</b><br>\r\n<li>Features:Carries KVM signals</li><li>Cable: KVM</li><li>Included Qty: 1 set</LI><li>Length: 7 feet</li><li>Package Type:Retail</li><br>\r\nUse this cable to connect multiple systems to a single KVM switch. This product has been tested and validated with Dell™ systems to ensure it will work with your computer. Supported by Dell™ Tech Support when used with a Dell™ system.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (19, 3, 'Data cable', '<b>Product Highlights</b><br>\r\n<LI>7 feet long KVM cable</LI><LI>Connect multiple systems to a KVM switch using these cables</LI><LI>Tested and validated on Dell systems to ensure it will work with your computer</LI><br>\r\n<b>Tech Specs</b><br>\r\n<li>Features:Carries KVM signals</li><li>Cable: KVM</li><li>Included Qty: 1 set</LI><li>Length: 7 feet</li><li>Package Type:Retail</li><br>\r\nUse this cable to connect multiple systems to a single KVM switch. This product has been tested and validated with Dell™ systems to ensure it will work with your computer. Supported by Dell™ Tech Support when used with a Dell™ system.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (20, 3, 'Inspiron Notebook', '<b>Key Features<br><br>Mobility & Performance</b>\r\nThe InspironTM  600m is designed for motion, with long battery life and easy-to-carry style. It starts at just under 5 pounds and only 1.29 inches thin when closed. Integrated wireless connectivity is standard, with Intel®  Centrino®  Mobile Technology, so you can compute and stay connected anywhere, anytime where wireless access is available.3 Explosive ATITM  MobilityTM  RADEON 9000 graphics propel the 600m to a performance level coveted by students, small business owners, and mobile workers alike.<br>\r\n<b>Processor:</b> <br>Intel®  Pentium® M Processors at 1.50GHz, 1.60 GHz, and 1.70GHz with optional Intel CentrinoTM  Mobile Technology.<br><b>Operating System:</b>Microsoft Windows XP Home Edition.<br><b>Display:</b>Choice of 14.1 Super XGA + or 14.1" XGA TFT high resolution displays to make the most of multimedia. Upgrading your display increases clarity, impact and viewing space.<br>\r\n<b>Video Graphics:</b> DDR ATI MOBILITYTM RADEONTM  9000 AGP 4X video graphics at 32MB and 64MB for crisp, realistic images on our high-resolution displays.<br><b>Storage:</b> Hard drives up to 60GB to meet present and potential storage requirements.<br><b>Memory:</b> Up to 1GB of memory gives you excellent overall performance.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (21, 3, 'Data Cabel', 'The Video 2 Component Video Cable from Monster Cable is a high-resolution cable that offers sharp, detailed images and bright, vivid and natural color renditions. It features high-purity, high-density copper stranding for low signal loss and protection from \'video noise\'. This cable provides heavy-duty double shielding which guards against outside EMI and RF interference. A low-loss insulator transfers signals more efficiently so your satellite receiver, DVD player and high resolution camcorder can bring you superb pictures.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (22, 3, 'CDROM Drive', 'Weighing less than one pound, the Targus USB 2.0 DVD/CD-ROM Slim External Drive lets you record music and backup data on CD-R and CD-RW discs, as well as play DVD movies. The drive reads CDs at 24X speeds as well as DVDs at speeds of 8X. Easily connect the external drive through your USB port and enjoy instant access to DVDs and CDs. As an added benefit it features a pass-through connector so you can use a second USB device with your notebook, Tablet PC or desktop PC. Sleek and lightweight, this slim drive also eliminates carrying around additional AC adapters since it is powered directly by your USB port.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (23, 3, 'Notebook Essentials', '<b>Key Features<br><br>Mobility & Performance</b>\r\nThe InspironTM  600m is designed for motion, with long battery life and easy-to-carry style. It starts at just under 5 pounds and only 1.29 inches thin when closed. Integrated wireless connectivity is standard, with Intel®  Centrino®  Mobile Technology, so you can compute and stay connected anywhere, anytime where wireless access is available.3 Explosive ATITM  MobilityTM  RADEON 9000 graphics propel the 600m to a performance level coveted by students, small business owners, and mobile workers alike.<br>\r\n<b>Processor:</b> <br>Intel®  Pentium® M Processors at 1.50GHz, 1.60 GHz, and 1.70GHz with optional Intel CentrinoTM  Mobile Technology.<br><b>Operating System:</b>Microsoft Windows XP Home Edition.<br><b>Display:</b>Choice of 14.1 Super XGA + or 14.1" XGA TFT high resolution displays to make the most of multimedia. Upgrading your display increases clarity, impact and viewing space.<br>\r\n<b>Video Graphics:</b> DDR ATI MOBILITYTM RADEONTM  9000 AGP 4X video graphics at 32MB and 64MB for crisp, realistic images on our high-resolution displays.<br><b>Storage:</b> Hard drives up to 60GB to meet present and potential storage requirements.<br><b>Memory:</b> Up to 1GB of memory gives you excellent overall performance.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (24, 3, 'Floppy Disk Drive', '<b>Product Highlights</b><br>\r\n<li>Reads/writes standard 1.44 MB floppy disks</Li> \r\n<li>Powered through the USB port — no AC adapter is neede</LI><br>\r\n<b>Tech Spec</b><br>\r\n<li>Device Type: External USB Floppy Disk Drive</li> 	\r\n<li>Interface Type: USB</li> 	\r\n<li>Power: USB powered</li> 	\r\n<li>Supported Media Types: 1.44 MB Floppy disks</li> 	\r\n<li>Compatibility: PC and Mac</li>\r\nThe Titanium USB Floppy Disk Drive from Smartdisk brings more functionality and versatility to your USB equipped Macintosh or PC computer. The drive reads/writes standard 1.44 MB floppy disks and is powered through the USB port, so no AC adapter is needed.', 'www.companyname.com', 0);
INSERT INTO products_description VALUES (25, 3, 'Microsoft Internet Keyboard PS/2', 'The Internet Keyboard has 10 Hot Keys on a comfortable standard keyboard design that also includes a detachable palm rest. The Hot Keys allow you to browse the web, or check e-mail directly from your keyboard. The IntelliType Pro software also allows you to customize your hot keys - make the Internet Keyboard work the way you want it to!', '', 0);
INSERT INTO products_description VALUES (26, 3, 'Microsoft IntelliMouse Explorer', 'Microsoft introduces its most advanced mouse, the IntelliMouse Explorer! IntelliMouse Explorer features a sleek design, an industrial-silver finish, a glowing red underside and taillight, creating a style and look unlike any other mouse. IntelliMouse Explorer combines the accuracy and reliability of Microsoft IntelliEye optical tracking technology, the convenience of two new customizable function buttons, the efficiency of the scrolling wheel and the comfort of expert ergonomic design. All these great features make this the best mouse for the PC!', 'www.microsoft.com/hardware/mouse/explorer.asp', 0);
INSERT INTO products_description VALUES (27, 3, 'Hewlett Packard LaserJet 1100Xi', 'HP has always set the pace in laser printing technology. The new generation HP LaserJet 1100 series sets another impressive pace, delivering a stunning 8 pages per minute print speed. The 600 dpi print resolution with HP\'s Resolution Enhancement technology (REt) makes every document more professional.<br><br>Enhanced print speed and laser quality results are just the beginning. With 2MB standard memory, HP LaserJet 1100xi users will be able to print increasingly complex pages. Memory can be increased to 18MB to tackle even more complex documents with ease. The HP LaserJet 1100xi supports key operating systems including Windows 3.1, 3.11, 95, 98, NT 4.0, OS/2 and DOS. Network compatibility available via the optional HP JetDirect External Print Servers.<br><br>HP LaserJet 1100xi also features The Document Builder for the Web Era from Trellix Corp. (featuring software to create Web documents).', 'www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100', 0);
# --------------------------------------------------------

#
# Table structure for table `products_notifications`
#

CREATE TABLE products_notifications (
  products_id int(11) NOT NULL default '0',
  customers_id int(11) NOT NULL default '0',
  date_added datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (products_id,customers_id)
) TYPE=MyISAM;

#
# Dumping data for table `products_notifications`
#

# --------------------------------------------------------

#
# Table structure for table `products_options`
#

CREATE TABLE products_options (
  products_options_id int(11) NOT NULL default '0',
  language_id int(11) NOT NULL default '1',
  products_options_name varchar(32) NOT NULL default '',
  PRIMARY KEY  (products_options_id,language_id)
) TYPE=MyISAM;

#
# Dumping data for table `products_options`
#

INSERT INTO products_options VALUES (1, 1, 'Color');
INSERT INTO products_options VALUES (2, 1, 'Size');
INSERT INTO products_options VALUES (3, 1, 'Model');
INSERT INTO products_options VALUES (4, 1, 'Memory');
INSERT INTO products_options VALUES (1, 2, 'Farbe');
INSERT INTO products_options VALUES (2, 2, 'Größe');
INSERT INTO products_options VALUES (3, 2, 'Modell');
INSERT INTO products_options VALUES (4, 2, 'Speicher');
INSERT INTO products_options VALUES (1, 3, 'Color');
INSERT INTO products_options VALUES (2, 3, 'Talla');
INSERT INTO products_options VALUES (3, 3, 'Modelo');
INSERT INTO products_options VALUES (4, 3, 'Memoria');
INSERT INTO products_options VALUES (5, 3, 'Version');
INSERT INTO products_options VALUES (5, 2, 'Version');
INSERT INTO products_options VALUES (5, 1, 'Version');
# --------------------------------------------------------

#
# Table structure for table `products_options_values`
#

CREATE TABLE products_options_values (
  products_options_values_id int(11) NOT NULL default '0',
  language_id int(11) NOT NULL default '1',
  products_options_values_name varchar(64) NOT NULL default '',
  PRIMARY KEY  (products_options_values_id,language_id)
) TYPE=MyISAM;

#
# Dumping data for table `products_options_values`
#

INSERT INTO products_options_values VALUES (1, 1, '4 mb');
INSERT INTO products_options_values VALUES (2, 1, '8 mb');
INSERT INTO products_options_values VALUES (3, 1, '16 mb');
INSERT INTO products_options_values VALUES (4, 1, '32 mb');
INSERT INTO products_options_values VALUES (5, 1, 'Value');
INSERT INTO products_options_values VALUES (6, 1, 'Premium');
INSERT INTO products_options_values VALUES (7, 1, 'Deluxe');
INSERT INTO products_options_values VALUES (8, 1, 'PS/2');
INSERT INTO products_options_values VALUES (9, 1, 'USB');
INSERT INTO products_options_values VALUES (1, 2, '4 MB');
INSERT INTO products_options_values VALUES (2, 2, '8 MB');
INSERT INTO products_options_values VALUES (3, 2, '16 MB');
INSERT INTO products_options_values VALUES (4, 2, '32 MB');
INSERT INTO products_options_values VALUES (5, 2, 'Value Ausgabe');
INSERT INTO products_options_values VALUES (6, 2, 'Premium Ausgabe');
INSERT INTO products_options_values VALUES (7, 2, 'Deluxe Ausgabe');
INSERT INTO products_options_values VALUES (8, 2, 'PS/2 Anschluss');
INSERT INTO products_options_values VALUES (9, 2, 'USB Anschluss');
INSERT INTO products_options_values VALUES (1, 3, '4 mb');
INSERT INTO products_options_values VALUES (2, 3, '8 mb');
INSERT INTO products_options_values VALUES (3, 3, '16 mb');
INSERT INTO products_options_values VALUES (4, 3, '32 mb');
INSERT INTO products_options_values VALUES (5, 3, 'Value');
INSERT INTO products_options_values VALUES (6, 3, 'Premium');
INSERT INTO products_options_values VALUES (7, 3, 'Deluxe');
INSERT INTO products_options_values VALUES (8, 3, 'PS/2');
INSERT INTO products_options_values VALUES (9, 3, 'USB');
INSERT INTO products_options_values VALUES (10, 1, 'Download: Windows - English');
INSERT INTO products_options_values VALUES (10, 2, 'Download: Windows - Englisch');
INSERT INTO products_options_values VALUES (10, 3, 'Download: Windows - Inglese');
INSERT INTO products_options_values VALUES (13, 1, 'Box: Windows - English');
INSERT INTO products_options_values VALUES (13, 2, 'Box: Windows - Englisch');
INSERT INTO products_options_values VALUES (13, 3, 'Box: Windows - Inglese');
# --------------------------------------------------------

#
# Table structure for table `products_options_values_to_products_options`
#

CREATE TABLE products_options_values_to_products_options (
  products_options_values_to_products_options_id int(11) NOT NULL auto_increment,
  products_options_id int(11) NOT NULL default '0',
  products_options_values_id int(11) NOT NULL default '0',
  PRIMARY KEY  (products_options_values_to_products_options_id)
) TYPE=MyISAM;

#
# Dumping data for table `products_options_values_to_products_options`
#

INSERT INTO products_options_values_to_products_options VALUES (1, 4, 1);
INSERT INTO products_options_values_to_products_options VALUES (2, 4, 2);
INSERT INTO products_options_values_to_products_options VALUES (3, 4, 3);
INSERT INTO products_options_values_to_products_options VALUES (4, 4, 4);
INSERT INTO products_options_values_to_products_options VALUES (5, 3, 5);
INSERT INTO products_options_values_to_products_options VALUES (6, 3, 6);
INSERT INTO products_options_values_to_products_options VALUES (7, 3, 7);
INSERT INTO products_options_values_to_products_options VALUES (8, 3, 8);
INSERT INTO products_options_values_to_products_options VALUES (9, 3, 9);
INSERT INTO products_options_values_to_products_options VALUES (10, 5, 10);
INSERT INTO products_options_values_to_products_options VALUES (13, 5, 13);
# --------------------------------------------------------

#
# Table structure for table `products_to_categories`
#

CREATE TABLE products_to_categories (
  products_id int(11) NOT NULL default '0',
  categories_id int(11) NOT NULL default '0',
  PRIMARY KEY  (products_id,categories_id)
) TYPE=MyISAM;

#
# Dumping data for table `products_to_categories`
#

INSERT INTO products_to_categories VALUES (1, 4);
INSERT INTO products_to_categories VALUES (2, 4);
INSERT INTO products_to_categories VALUES (3, 9);
INSERT INTO products_to_categories VALUES (4, 4);
INSERT INTO products_to_categories VALUES (5, 24);
INSERT INTO products_to_categories VALUES (6, 7);
INSERT INTO products_to_categories VALUES (7, 4);
INSERT INTO products_to_categories VALUES (8, 7);
INSERT INTO products_to_categories VALUES (9, 4);
INSERT INTO products_to_categories VALUES (10, 6);
INSERT INTO products_to_categories VALUES (11, 7);
INSERT INTO products_to_categories VALUES (12, 7);
INSERT INTO products_to_categories VALUES (13, 23);
INSERT INTO products_to_categories VALUES (14, 5);
INSERT INTO products_to_categories VALUES (15, 24);
INSERT INTO products_to_categories VALUES (16, 21);
INSERT INTO products_to_categories VALUES (17, 25);
INSERT INTO products_to_categories VALUES (18, 21);
INSERT INTO products_to_categories VALUES (19, 21);
INSERT INTO products_to_categories VALUES (20, 23);
INSERT INTO products_to_categories VALUES (21, 21);
INSERT INTO products_to_categories VALUES (22, 17);
INSERT INTO products_to_categories VALUES (23, 23);
INSERT INTO products_to_categories VALUES (24, 22);
INSERT INTO products_to_categories VALUES (25, 8);
INSERT INTO products_to_categories VALUES (26, 9);
INSERT INTO products_to_categories VALUES (27, 5);
# --------------------------------------------------------

#
# Table structure for table `reviews`
#

CREATE TABLE reviews (
  reviews_id int(11) NOT NULL auto_increment,
  products_id int(11) NOT NULL default '0',
  customers_id int(11) default NULL,
  customers_name varchar(64) NOT NULL default '',
  reviews_rating int(1) default NULL,
  date_added datetime default NULL,
  last_modified datetime default NULL,
  reviews_read int(5) NOT NULL default '0',
  PRIMARY KEY  (reviews_id)
) TYPE=MyISAM;

#
# Dumping data for table `reviews`
#

INSERT INTO reviews VALUES (1, 19, 1, 'John doe', 5, '2005-04-01 18:58:00', '0000-00-00 00:00:00', 1);
# --------------------------------------------------------

#
# Table structure for table `reviews_description`
#

CREATE TABLE reviews_description (
  reviews_id int(11) NOT NULL default '0',
  languages_id int(11) NOT NULL default '0',
  reviews_text text NOT NULL,
  PRIMARY KEY  (reviews_id,languages_id)
) TYPE=MyISAM;

#
# Dumping data for table `reviews_description`
#

INSERT INTO reviews_description VALUES (1, 1, 'this has to be one of the funniest movies released for 1999!');
# --------------------------------------------------------

#
# Table structure for table `sessions`
#

CREATE TABLE sessions (
  sesskey varchar(32) NOT NULL default '',
  expiry int(11) unsigned NOT NULL default '0',
  value text NOT NULL,
  PRIMARY KEY  (sesskey)
) TYPE=MyISAM;

#
# Dumping data for table `sessions`
#

# --------------------------------------------------------

#
# Table structure for table `specials`
#

CREATE TABLE specials (
  specials_id int(11) NOT NULL auto_increment,
  products_id int(11) NOT NULL default '0',
  specials_new_products_price decimal(15,4) NOT NULL default '0.0000',
  specials_date_added datetime default NULL,
  specials_last_modified datetime default NULL,
  expires_date datetime default NULL,
  date_status_change datetime default NULL,
  status int(1) NOT NULL default '1',
  PRIMARY KEY  (specials_id)
) TYPE=MyISAM;

#
# Dumping data for table `specials`
#

INSERT INTO specials VALUES (1, 3, '39.9900', '2005-03-28 17:23:41', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1);
INSERT INTO specials VALUES (2, 5, '30.0000', '2005-03-28 17:23:41', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1);
INSERT INTO specials VALUES (3, 6, '30.0000', '2005-03-28 17:23:41', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1);
INSERT INTO specials VALUES (4, 16, '29.9900', '2005-03-28 17:23:41', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1);
# --------------------------------------------------------

#
# Table structure for table `tax_class`
#

CREATE TABLE tax_class (
  tax_class_id int(11) NOT NULL auto_increment,
  tax_class_title varchar(32) NOT NULL default '',
  tax_class_description varchar(255) NOT NULL default '',
  last_modified datetime default NULL,
  date_added datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (tax_class_id)
) TYPE=MyISAM;

#
# Dumping data for table `tax_class`
#

INSERT INTO tax_class VALUES (1, 'Taxable Goods', 'The following types of products are included non-food, services, etc', '2005-04-01 20:16:55', '2005-04-01 20:16:55');
# --------------------------------------------------------

#
# Table structure for table `tax_rates`
#

CREATE TABLE tax_rates (
  tax_rates_id int(11) NOT NULL auto_increment,
  tax_zone_id int(11) NOT NULL default '0',
  tax_class_id int(11) NOT NULL default '0',
  tax_priority int(5) default '1',
  tax_rate decimal(7,4) NOT NULL default '0.0000',
  tax_description varchar(255) NOT NULL default '',
  last_modified datetime default NULL,
  date_added datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (tax_rates_id)
) TYPE=MyISAM;

#
# Dumping data for table `tax_rates`
#

INSERT INTO tax_rates VALUES (1, 1, 1, 1, '7.0000', 'FL TAX 7.0%', '2005-03-28 17:23:41', '2005-03-28 17:23:41');
# --------------------------------------------------------

#
# Table structure for table `whos_online`
#

CREATE TABLE whos_online (
  customer_id int(11) default NULL,
  full_name varchar(64) NOT NULL default '',
  session_id varchar(128) NOT NULL default '',
  ip_address varchar(15) NOT NULL default '',
  time_entry varchar(14) NOT NULL default '',
  time_last_click varchar(14) NOT NULL default '',
  last_page_url varchar(64) NOT NULL default ''
) TYPE=MyISAM;

#
# Dumping data for table `whos_online`
#

INSERT INTO whos_online VALUES (0, 'Guest', '', '127.0.0.1', '1113302586', '1113302613', '/5689/index.php?currency=USD&cPath=1_5&sort=2a');
# --------------------------------------------------------

#
# Table structure for table `zones`
#

CREATE TABLE zones (
  zone_id int(11) NOT NULL auto_increment,
  zone_country_id int(11) NOT NULL default '0',
  zone_code varchar(32) NOT NULL default '',
  zone_name varchar(32) NOT NULL default '',
  PRIMARY KEY  (zone_id)
) TYPE=MyISAM;

#
# Dumping data for table `zones`
#

INSERT INTO zones VALUES (1, 223, 'AL', 'Alabama');
INSERT INTO zones VALUES (2, 223, 'AK', 'Alaska');
INSERT INTO zones VALUES (3, 223, 'AS', 'American Samoa');
INSERT INTO zones VALUES (4, 223, 'AZ', 'Arizona');
INSERT INTO zones VALUES (5, 223, 'AR', 'Arkansas');
INSERT INTO zones VALUES (6, 223, 'AF', 'Armed Forces Africa');
INSERT INTO zones VALUES (7, 223, 'AA', 'Armed Forces Americas');
INSERT INTO zones VALUES (8, 223, 'AC', 'Armed Forces Canada');
INSERT INTO zones VALUES (9, 223, 'AE', 'Armed Forces Europe');
INSERT INTO zones VALUES (10, 223, 'AM', 'Armed Forces Middle East');
INSERT INTO zones VALUES (11, 223, 'AP', 'Armed Forces Pacific');
INSERT INTO zones VALUES (12, 223, 'CA', 'California');
INSERT INTO zones VALUES (13, 223, 'CO', 'Colorado');
INSERT INTO zones VALUES (14, 223, 'CT', 'Connecticut');
INSERT INTO zones VALUES (15, 223, 'DE', 'Delaware');
INSERT INTO zones VALUES (16, 223, 'DC', 'District of Columbia');
INSERT INTO zones VALUES (17, 223, 'FM', 'Federated States Of Micronesia');
INSERT INTO zones VALUES (18, 223, 'FL', 'Florida');
INSERT INTO zones VALUES (19, 223, 'GA', 'Georgia');
INSERT INTO zones VALUES (20, 223, 'GU', 'Guam');
INSERT INTO zones VALUES (21, 223, 'HI', 'Hawaii');
INSERT INTO zones VALUES (22, 223, 'ID', 'Idaho');
INSERT INTO zones VALUES (23, 223, 'IL', 'Illinois');
INSERT INTO zones VALUES (24, 223, 'IN', 'Indiana');
INSERT INTO zones VALUES (25, 223, 'IA', 'Iowa');
INSERT INTO zones VALUES (26, 223, 'KS', 'Kansas');
INSERT INTO zones VALUES (27, 223, 'KY', 'Kentucky');
INSERT INTO zones VALUES (28, 223, 'LA', 'Louisiana');
INSERT INTO zones VALUES (29, 223, 'ME', 'Maine');
INSERT INTO zones VALUES (30, 223, 'MH', 'Marshall Islands');
INSERT INTO zones VALUES (31, 223, 'MD', 'Maryland');
INSERT INTO zones VALUES (32, 223, 'MA', 'Massachusetts');
INSERT INTO zones VALUES (33, 223, 'MI', 'Michigan');
INSERT INTO zones VALUES (34, 223, 'MN', 'Minnesota');
INSERT INTO zones VALUES (35, 223, 'MS', 'Mississippi');
INSERT INTO zones VALUES (36, 223, 'MO', 'Missouri');
INSERT INTO zones VALUES (37, 223, 'MT', 'Montana');
INSERT INTO zones VALUES (38, 223, 'NE', 'Nebraska');
INSERT INTO zones VALUES (39, 223, 'NV', 'Nevada');
INSERT INTO zones VALUES (40, 223, 'NH', 'New Hampshire');
INSERT INTO zones VALUES (41, 223, 'NJ', 'New Jersey');
INSERT INTO zones VALUES (42, 223, 'NM', 'New Mexico');
INSERT INTO zones VALUES (43, 223, 'NY', 'New York');
INSERT INTO zones VALUES (44, 223, 'NC', 'North Carolina');
INSERT INTO zones VALUES (45, 223, 'ND', 'North Dakota');
INSERT INTO zones VALUES (46, 223, 'MP', 'Northern Mariana Islands');
INSERT INTO zones VALUES (47, 223, 'OH', 'Ohio');
INSERT INTO zones VALUES (48, 223, 'OK', 'Oklahoma');
INSERT INTO zones VALUES (49, 223, 'OR', 'Oregon');
INSERT INTO zones VALUES (50, 223, 'PW', 'Palau');
INSERT INTO zones VALUES (51, 223, 'PA', 'Pennsylvania');
INSERT INTO zones VALUES (52, 223, 'PR', 'Puerto Rico');
INSERT INTO zones VALUES (53, 223, 'RI', 'Rhode Island');
INSERT INTO zones VALUES (54, 223, 'SC', 'South Carolina');
INSERT INTO zones VALUES (55, 223, 'SD', 'South Dakota');
INSERT INTO zones VALUES (56, 223, 'TN', 'Tennessee');
INSERT INTO zones VALUES (57, 223, 'TX', 'Texas');
INSERT INTO zones VALUES (58, 223, 'UT', 'Utah');
INSERT INTO zones VALUES (59, 223, 'VT', 'Vermont');
INSERT INTO zones VALUES (60, 223, 'VI', 'Virgin Islands');
INSERT INTO zones VALUES (61, 223, 'VA', 'Virginia');
INSERT INTO zones VALUES (62, 223, 'WA', 'Washington');
INSERT INTO zones VALUES (63, 223, 'WV', 'West Virginia');
INSERT INTO zones VALUES (64, 223, 'WI', 'Wisconsin');
INSERT INTO zones VALUES (65, 223, 'WY', 'Wyoming');
INSERT INTO zones VALUES (66, 38, 'AB', 'Alberta');
INSERT INTO zones VALUES (67, 38, 'BC', 'British Columbia');
INSERT INTO zones VALUES (68, 38, 'MB', 'Manitoba');
INSERT INTO zones VALUES (69, 38, 'NF', 'Newfoundland');
INSERT INTO zones VALUES (70, 38, 'NB', 'New Brunswick');
INSERT INTO zones VALUES (71, 38, 'NS', 'Nova Scotia');
INSERT INTO zones VALUES (72, 38, 'NT', 'Northwest Territories');
INSERT INTO zones VALUES (73, 38, 'NU', 'Nunavut');
INSERT INTO zones VALUES (74, 38, 'ON', 'Ontario');
INSERT INTO zones VALUES (75, 38, 'PE', 'Prince Edward Island');
INSERT INTO zones VALUES (76, 38, 'QC', 'Quebec');
INSERT INTO zones VALUES (77, 38, 'SK', 'Saskatchewan');
INSERT INTO zones VALUES (78, 38, 'YT', 'Yukon Territory');
INSERT INTO zones VALUES (79, 81, 'NDS', 'Niedersachsen');
INSERT INTO zones VALUES (80, 81, 'BAW', 'Baden-Württemberg');
INSERT INTO zones VALUES (81, 81, 'BAY', 'Bayern');
INSERT INTO zones VALUES (82, 81, 'BER', 'Berlin');
INSERT INTO zones VALUES (83, 81, 'BRG', 'Brandenburg');
INSERT INTO zones VALUES (84, 81, 'BRE', 'Bremen');
INSERT INTO zones VALUES (85, 81, 'HAM', 'Hamburg');
INSERT INTO zones VALUES (86, 81, 'HES', 'Hessen');
INSERT INTO zones VALUES (87, 81, 'MEC', 'Mecklenburg-Vorpommern');
INSERT INTO zones VALUES (88, 81, 'NRW', 'Nordrhein-Westfalen');
INSERT INTO zones VALUES (89, 81, 'RHE', 'Rheinland-Pfalz');
INSERT INTO zones VALUES (90, 81, 'SAR', 'Saarland');
INSERT INTO zones VALUES (91, 81, 'SAS', 'Sachsen');
INSERT INTO zones VALUES (92, 81, 'SAC', 'Sachsen-Anhalt');
INSERT INTO zones VALUES (93, 81, 'SCN', 'Schleswig-Holstein');
INSERT INTO zones VALUES (94, 81, 'THE', 'Thüringen');
INSERT INTO zones VALUES (95, 14, 'WI', 'Wien');
INSERT INTO zones VALUES (96, 14, 'NO', 'Niederösterreich');
INSERT INTO zones VALUES (97, 14, 'OO', 'Oberösterreich');
INSERT INTO zones VALUES (98, 14, 'SB', 'Salzburg');
INSERT INTO zones VALUES (99, 14, 'KN', 'Kärnten');
INSERT INTO zones VALUES (100, 14, 'ST', 'Steiermark');
INSERT INTO zones VALUES (101, 14, 'TI', 'Tirol');
INSERT INTO zones VALUES (102, 14, 'BL', 'Burgenland');
INSERT INTO zones VALUES (103, 14, 'VB', 'Voralberg');
INSERT INTO zones VALUES (104, 204, 'AG', 'Aargau');
INSERT INTO zones VALUES (105, 204, 'AI', 'Appenzell Innerrhoden');
INSERT INTO zones VALUES (106, 204, 'AR', 'Appenzell Ausserrhoden');
INSERT INTO zones VALUES (107, 204, 'BE', 'Bern');
INSERT INTO zones VALUES (108, 204, 'BL', 'Basel-Landschaft');
INSERT INTO zones VALUES (109, 204, 'BS', 'Basel-Stadt');
INSERT INTO zones VALUES (110, 204, 'FR', 'Freiburg');
INSERT INTO zones VALUES (111, 204, 'GE', 'Genf');
INSERT INTO zones VALUES (112, 204, 'GL', 'Glarus');
INSERT INTO zones VALUES (113, 204, 'JU', 'Graubünden');
INSERT INTO zones VALUES (114, 204, 'JU', 'Jura');
INSERT INTO zones VALUES (115, 204, 'LU', 'Luzern');
INSERT INTO zones VALUES (116, 204, 'NE', 'Neuenburg');
INSERT INTO zones VALUES (117, 204, 'NW', 'Nidwalden');
INSERT INTO zones VALUES (118, 204, 'OW', 'Obwalden');
INSERT INTO zones VALUES (119, 204, 'SG', 'St. Gallen');
INSERT INTO zones VALUES (120, 204, 'SH', 'Schaffhausen');
INSERT INTO zones VALUES (121, 204, 'SO', 'Solothurn');
INSERT INTO zones VALUES (122, 204, 'SZ', 'Schwyz');
INSERT INTO zones VALUES (123, 204, 'TG', 'Thurgau');
INSERT INTO zones VALUES (124, 204, 'TI', 'Tessin');
INSERT INTO zones VALUES (125, 204, 'UR', 'Uri');
INSERT INTO zones VALUES (126, 204, 'VD', 'Waadt');
INSERT INTO zones VALUES (127, 204, 'VS', 'Wallis');
INSERT INTO zones VALUES (128, 204, 'ZG', 'Zug');
INSERT INTO zones VALUES (129, 204, 'ZH', 'Zürich');
INSERT INTO zones VALUES (130, 195, 'A Coruña', 'A Coruña');
INSERT INTO zones VALUES (131, 195, 'Alava', 'Alava');
INSERT INTO zones VALUES (132, 195, 'Albacete', 'Albacete');
INSERT INTO zones VALUES (133, 195, 'Alicante', 'Alicante');
INSERT INTO zones VALUES (134, 195, 'Almeria', 'Almeria');
INSERT INTO zones VALUES (135, 195, 'Asturias', 'Asturias');
INSERT INTO zones VALUES (136, 195, 'Avila', 'Avila');
INSERT INTO zones VALUES (137, 195, 'Badajoz', 'Badajoz');
INSERT INTO zones VALUES (138, 195, 'Baleares', 'Baleares');
INSERT INTO zones VALUES (139, 195, 'Barcelona', 'Barcelona');
INSERT INTO zones VALUES (140, 195, 'Burgos', 'Burgos');
INSERT INTO zones VALUES (141, 195, 'Caceres', 'Caceres');
INSERT INTO zones VALUES (142, 195, 'Cadiz', 'Cadiz');
INSERT INTO zones VALUES (143, 195, 'Cantabria', 'Cantabria');
INSERT INTO zones VALUES (144, 195, 'Castellon', 'Castellon');
INSERT INTO zones VALUES (145, 195, 'Ceuta', 'Ceuta');
INSERT INTO zones VALUES (146, 195, 'Ciudad Real', 'Ciudad Real');
INSERT INTO zones VALUES (147, 195, 'Cordoba', 'Cordoba');
INSERT INTO zones VALUES (148, 195, 'Cuenca', 'Cuenca');
INSERT INTO zones VALUES (149, 195, 'Girona', 'Girona');
INSERT INTO zones VALUES (150, 195, 'Granada', 'Granada');
INSERT INTO zones VALUES (151, 195, 'Guadalajara', 'Guadalajara');
INSERT INTO zones VALUES (152, 195, 'Guipuzcoa', 'Guipuzcoa');
INSERT INTO zones VALUES (153, 195, 'Huelva', 'Huelva');
INSERT INTO zones VALUES (154, 195, 'Huesca', 'Huesca');
INSERT INTO zones VALUES (155, 195, 'Jaen', 'Jaen');
INSERT INTO zones VALUES (156, 195, 'La Rioja', 'La Rioja');
INSERT INTO zones VALUES (157, 195, 'Las Palmas', 'Las Palmas');
INSERT INTO zones VALUES (158, 195, 'Leon', 'Leon');
INSERT INTO zones VALUES (159, 195, 'Lleida', 'Lleida');
INSERT INTO zones VALUES (160, 195, 'Lugo', 'Lugo');
INSERT INTO zones VALUES (161, 195, 'Madrid', 'Madrid');
INSERT INTO zones VALUES (162, 195, 'Malaga', 'Malaga');
INSERT INTO zones VALUES (163, 195, 'Melilla', 'Melilla');
INSERT INTO zones VALUES (164, 195, 'Murcia', 'Murcia');
INSERT INTO zones VALUES (165, 195, 'Navarra', 'Navarra');
INSERT INTO zones VALUES (166, 195, 'Ourense', 'Ourense');
INSERT INTO zones VALUES (167, 195, 'Palencia', 'Palencia');
INSERT INTO zones VALUES (168, 195, 'Pontevedra', 'Pontevedra');
INSERT INTO zones VALUES (169, 195, 'Salamanca', 'Salamanca');
INSERT INTO zones VALUES (170, 195, 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife');
INSERT INTO zones VALUES (171, 195, 'Segovia', 'Segovia');
INSERT INTO zones VALUES (172, 195, 'Sevilla', 'Sevilla');
INSERT INTO zones VALUES (173, 195, 'Soria', 'Soria');
INSERT INTO zones VALUES (174, 195, 'Tarragona', 'Tarragona');
INSERT INTO zones VALUES (175, 195, 'Teruel', 'Teruel');
INSERT INTO zones VALUES (176, 195, 'Toledo', 'Toledo');
INSERT INTO zones VALUES (177, 195, 'Valencia', 'Valencia');
INSERT INTO zones VALUES (178, 195, 'Valladolid', 'Valladolid');
INSERT INTO zones VALUES (179, 195, 'Vizcaya', 'Vizcaya');
INSERT INTO zones VALUES (180, 195, 'Zamora', 'Zamora');
INSERT INTO zones VALUES (181, 195, 'Zaragoza', 'Zaragoza');
# --------------------------------------------------------

#
# Table structure for table `zones_to_geo_zones`
#

CREATE TABLE zones_to_geo_zones (
  association_id int(11) NOT NULL auto_increment,
  zone_country_id int(11) NOT NULL default '0',
  zone_id int(11) default NULL,
  geo_zone_id int(11) default NULL,
  last_modified datetime default NULL,
  date_added datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (association_id)
) TYPE=MyISAM;

#
# Dumping data for table `zones_to_geo_zones`
#

INSERT INTO zones_to_geo_zones VALUES (1, 223, 18, 1, NULL, '2005-03-28 17:23:41');

