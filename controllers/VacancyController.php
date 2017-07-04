<?php

include_once '../library/class/templateSelect.php';

function indexAction($smarty, $db)
{
    $itemId = isset($_GET['id']) ? $_GET['id'] : null;

    $checkId = $db->select(vacancy, '*', "id = $itemId");

    if (!$itemId || count($checkId) == 0) exit();


    $ts = new templateSelect();

    $rsVacancy = $db->select(vacancy, '*', "id = $itemId");
    $rsCandidates = $ts->select_not_attached(candidates, $itemId);
    $getId = $rsVacancy[0]['id'];
    $rsCombVacCand = $ts->select_join(vacancy,"cvc.vac_id = $getId");

    $smarty->assign('pageTitle', '');
    $smarty->assign('rsCandidates', $rsCandidates);
    $smarty->assign('rsCombVacCand', $rsCombVacCand);
    $smarty->assign('rsVacancy', $rsVacancy);

    loadTemplate($smarty, 'header');
    loadTemplate($smarty, 'nvacancy');
    loadTemplate($smarty, 'footer');

}