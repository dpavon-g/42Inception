<?php
/**
 * Custom WordPress configurations on "wp-config.php" file.
 *
 * This file has the following configurations: MySQL settings, Table Prefix, Secret Keys, WordPress Language, ABSPATH and more.
 * For more information visit {@link https://codex.wordpress.org/Editing_wp-config.php Editing wp-config.php} Codex page.
 * Created using {@link http://generatewp.com/wp-config/ wp-config.php File Generator} on GenerateWP.com.
 *
 * @package WordPress
 * @generator GenerateWP.com
 */


/* MySQL settings */
define( 'DB_NAME',     'database' );
define( 'DB_USER',     'user' );
define( 'DB_PASSWORD', 'password' );
define( 'DB_HOST',     'localhost' );
define( 'DB_CHARSET',  'utf8mb4' );


/* MySQL database table prefix. */
$table_prefix = 'wp_';


/* Authentication Unique Keys and Salts. */
/* https://api.wordpress.org/secret-key/1.1/salt/ */
define('AUTH_KEY',         '$]d][Xc$>sD`i0UBe~.GG28-tTN;V;)6-vS,_&Q-6p~^7z;7J y/}DdDuqS3;@s3');
define('SECURE_AUTH_KEY',  'd5ULnZsygqmD|hobOz?x>mBQ2D60p hfK 0}&kJfQwof/,D>#etTu&&x-E/$(2^C');
define('LOGGED_IN_KEY',    '$b3]v&I~eY;RC)yz;$LiQhJfO!Zh/]P%%7s,qoeU RUkBfCbx6tDRn[|6IYb}Uy1');
define('NONCE_KEY',        'TpQ|,>{||YRal*y={bJ7L|i~e%jlM:pRVU`+}<=Q>f!ti%`#YA%>Ag_+?HXp]0@Y');
define('AUTH_SALT',        'l`i5}%s2#ys+G^^t=H WGKpF@OQTi?B>GS?hR1{K3.cI,B3/&C87,;DhjcUDB:FT');
define('SECURE_AUTH_SALT', 'p/%YLz (v-qAuM-9]jXMNJw#b#jf*.RzL=}}Pf%ml$Lo3PyS8=8d_HoAVO~>XG Q');
define('LOGGED_IN_SALT',   'J]Y*-<nVZnAYuV2TLu+?2S];j$uKH~t-vo2em)A=g<y+6Ey[]o8^#Y5IVJe)Z7^O');
define('NONCE_SALT',       '9  Ws|fjB_2V#-R8MZ8L+TH2^eQ!YXws;^l-7W3N<iqtqa ,v|N+SaynL5bN]tBg');


/* Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/* Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');