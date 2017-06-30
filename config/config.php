<?php
/**
 * В файле:
 * константы с путями.
 * Подключение бд.
 * Подключение Smarty.
 * Выбор шаблона.
 */

//подключение к бд
require_once '../library/db.class.php';
$db = new DataBase();
$db->connect();


//константы для контроллеров
define('PathPrefix', '../controllers/');
define('PathPostfix', 'Controller.php');


// имя шаблона
$template = 'default';

//путь к файлам шаблонов (.tpl)
define('TemplatePrefix', "../views/{$template}/");
define('TemplatePostfix', '.tpl');

//пути к файлам шаблонов в вебпространстве
define('TemplateWebPath', "/templates/{$template}/");


//подключение Smarty
require('../library/Smarty/libs/Smarty.class.php');
$smarty = new Smarty();

$smarty->setTemplateDir(TemplatePrefix);
$smarty->setCompileDir('../tmp/smarty/templates_c');
$smarty->setCacheDir('../tmp/smarty/cache');
$smarty->setConfigDir('../library/Smarty/configs');
$smarty->assign('templateWebPath', TemplateWebPath);