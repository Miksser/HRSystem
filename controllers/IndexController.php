<?php
/**
 * формирование главной страницы
 * @param $smarty Шаблонизатор
 */

function indexAction($smarty, $db)
{
    $rsCandidates = $db->select(candidates);

    $smarty->assign('pageTitle', 'Главная страница сайта');
    $smarty->assign('rsCandidates', $rsCandidates);

    loadTemplate($smarty, 'header');
    loadTemplate($smarty, 'index');
    loadTemplate($smarty, 'footer');

}