<?php
/**
 * Основные параметры WordPress.
 *
 * Скрипт для создания wp-config.php использует этот файл в процессе
 * установки. Необязательно использовать веб-интерфейс, можно
 * скопировать файл в "wp-config.php" и заполнить значения вручную.
 *
 * Этот файл содержит следующие параметры:
 *
 * * Настройки MySQL
 * * Секретные ключи
 * * Префикс таблиц базы данных
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** Параметры MySQL: Эту информацию можно получить у вашего хостинг-провайдера ** //
/** Имя базы данных для WordPress */
define( 'DB_NAME', 'video' );

/** Имя пользователя MySQL */
define( 'DB_USER', 'root' );

/** Пароль к базе данных MySQL */
define( 'DB_PASSWORD', 'lika1780-Q' );

/** Имя сервера MySQL */
define( 'DB_HOST', 'localhost' );

/** Кодировка базы данных для создания таблиц. */
define( 'DB_CHARSET', 'utf8mb4' );

/** Схема сопоставления. Не меняйте, если не уверены. */
define( 'DB_COLLATE', '' );

/**#@+
 * Уникальные ключи и соли для аутентификации.
 *
 * Смените значение каждой константы на уникальную фразу.
 * Можно сгенерировать их с помощью {@link https://api.wordpress.org/secret-key/1.1/salt/ сервиса ключей на WordPress.org}
 * Можно изменить их, чтобы сделать существующие файлы cookies недействительными. Пользователям потребуется авторизоваться снова.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'ealv! |F=AwL$yOgXY=MRE*>Ty}<-^C&9EH=G9$.-N(ebMdx%@r`7BBZ~tzU%7b2' );
define( 'SECURE_AUTH_KEY',  '@:t45_M^J-d6o-3IYHGU*/{03qkSY]/ET&[/#c%:vigUoG#uujF*p;uV[mBSwNrF' );
define( 'LOGGED_IN_KEY',    'v?1oQ5=BdrYOOQcIcE$]de?>][[;TQV5:;6@&]{8O!aY|?,%#AI2lu$u+z!q;:_!' );
define( 'NONCE_KEY',        'lhzTC]{P$3}&fIe@`h2Zz3Qhw|8 Q%E<]n{V`X YKS)i/bN^@ol&c qEWCGB9FGU' );
define( 'AUTH_SALT',        ')%vXD0LF}m$l<&f.l-}k ]/TQb-(]7zK`DCCnnEs4]9?}PT MW:h2SLvNgIW0;xl' );
define( 'SECURE_AUTH_SALT', '#6>cf(Ab!#.|`alQx`,ua(d.T%?sH-,^J!q3a%gp=LCNuM8Kx}]<a.5viw7aTDfj' );
define( 'LOGGED_IN_SALT',   'C*qPVNAEz|byR=J/H9P;o9d8a%fq$}3Jdbv?nqwE+).Xt8}k*7{`n0Z(Itmh!dx[' );
define( 'NONCE_SALT',       '7ObN.NoWegzqP9`n/yMIAcB|M[&PW%5Bto,kedJ)WS0tBHw<5rig&.1~^#r>q*M6' );
define('FS_METHOD','direct');
/**#@-*/

/**
 * Префикс таблиц в базе данных WordPress.
 *
 * Можно установить несколько сайтов в одну базу данных, если использовать
 * разные префиксы. Пожалуйста, указывайте только цифры, буквы и знак подчеркивания.
 */
$table_prefix = 'wp_';

/**
 * Для разработчиков: Режим отладки WordPress.
 *
 * Измените это значение на true, чтобы включить отображение уведомлений при разработке.
 * Разработчикам плагинов и тем настоятельно рекомендуется использовать WP_DEBUG
 * в своём рабочем окружении.
 *
 * Информацию о других отладочных константах можно найти в Кодексе.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* Это всё, дальше не редактируем. Успехов! */

/** Абсолютный путь к директории WordPress. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Инициализирует переменные WordPress и подключает файлы. */
require_once( ABSPATH . 'wp-settings.php' );
