<?php
/**
 * Add new candidates or vacancy
 */

function candidatesAction($smarty, $db)
{
    $rsVacancy = $db->select('vacancy');

    $smarty->assign('pageTitle', 'Добавить нового кандидата');
    $smarty->assign('rsVacancy', $rsVacancy);

    loadTemplate($smarty, 'header');
    loadTemplate($smarty, 'newcandidates');
    loadTemplate($smarty, 'footer');
}

function vacancyAction($smarty, $db)
{
    $rsCandidates = $db->select('candidates', 'id, concat(surname, \' \', first_name, \' \', middle_name)sfm');

    $smarty->assign('pageTitle', 'Добавить нового кандидата');
    $smarty->assign('rsCandidates', $rsCandidates);

    loadTemplate($smarty, 'header');
    loadTemplate($smarty, 'nvacancy');
    loadTemplate($smarty, 'footer');
}
