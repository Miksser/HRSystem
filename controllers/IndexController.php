<?php
/**
 * формирование главной страницы
 * @param $smarty Шаблонизатор
 */
include_once '../library/class/templateSelect.php';

function indexAction($smarty, $db)
{
    $ts = new templateSelect();

    $rsCandidates = $db->select(candidates);
    $rsVacancy = $db->select(Vacancy);
    $rsCombVacCand = $ts->select_join(['cvc.can_id', 'cvc.vac_id', 'v.v_name', 'v.status'],['comb_vac_cand as cvc'],
        ['vacancy as v'], ['cvc.vac_id = v.id']);

    $smarty->assign('pageTitle', 'Главная страница сайта');
    $smarty->assign('rsCandidates', $rsCandidates);
    $smarty->assign('rsVacancy', $rsVacancy);
    $smarty->assign('rsCombVacCand', $rsCombVacCand);

    loadTemplate($smarty, 'header');
    loadTemplate($smarty, 'index');
    loadTemplate($smarty, 'footer');

}