<?php

include_once '../library/class/templateSelect.php';

function indexAction($smarty, $db)
{
    $itemId = isset($_GET['id']) ? $_GET['id'] : null;
    $checkId = $db->select('candidates', '*', "id = $itemId");

    if (!$itemId || count($checkId) == 0) exit();

    $ts = new templateSelect();

    $rsProfile = $db->select('candidates', '*', "id = $itemId");
    $rsVacancy = $ts->select_not_attached('vacancy', $itemId);
    $getId = $rsProfile[0]['id'];
    $rsCombVacCand = $ts->select_join('candidates',"cvc.can_id = $getId");

    $smarty->assign('pageTitle', '');
    $smarty->assign('rsProfile', $rsProfile);
    $smarty->assign('rsCombVacCand', $rsCombVacCand);
    $smarty->assign('rsVacancy', $rsVacancy);

    loadTemplate($smarty, 'header');
    loadTemplate($smarty, 'newcandidates');
    loadTemplate($smarty, 'footer');

}




