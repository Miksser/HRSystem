<?php
/**
 * Add new candidates or vacancy
 */


function candidatesAction($smarty, $db)
{
    $rsVacancy = $db->select(vacancy);

    $smarty->assign('pageTitle', 'Добавить нового кандидата');
    $smarty->assign('rsVacancy', $rsVacancy);

    loadTemplate($smarty, 'header');
    loadTemplate($smarty, 'newcandidates');
    loadTemplate($smarty, 'footer');
}

function addAction($smarty, $db)
{
 $arrInfo = $db->insert($_POST);

 if ($arrInfo) {
     return true;
 } else {
     return false;
 }
}