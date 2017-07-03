<?php

include_once '../library/class/templateSelect.php';

function indexAction($smarty, $db)
{
    $itemId = isset($_GET['id']) ? $_GET['id'] : null;
    $checkId = $db->select(candidates, '*', "id = $itemId");

    if (!$itemId || count($checkId) == 0) exit();


    $ts = new templateSelect();

    $rsProfile = $db->select(candidates, '*', "id = $itemId");
    $rsVacancy = $ts->select_not_attached(vacancy, $itemId);
    $getId = $rsProfile[0]['id'];
    $rsCombVacCand = $ts->select_join(['cvc.can_id', 'cvc.vac_id', 'v.v_name', 'v.status'], ['comb_vac_cand as cvc'],
        ['vacancy as v'], ['cvc.vac_id = v.id'], ["cvc.can_id = $getId"]);

    $smarty->assign('pageTitle', '');
    $smarty->assign('rsProfile', $rsProfile);
    $smarty->assign('rsCombVacCand', $rsCombVacCand);
    $smarty->assign('rsVacancy', $rsVacancy);

    loadTemplate($smarty, 'header');
    loadTemplate($smarty, 'newcandidates');
    loadTemplate($smarty, 'footer');

}

function addvacancyAction($smarty, $db)
{
    $info = $_POST;
    $db->insert($info);

}

function updatevacancyAction($smarty, $db)
{
    $info = $_POST;
    $id = isset($info['can_id']) ? intval($info['can_id']) : null;
    unset($info['can_id']);

    if (!$id) exit();

    $cvc = $info['cvc'];
    unset($info['cvc']);

    $db->update($info, "id = $id");
    addPosition($info, $cvc, $db);
}

function removevacancyAction($smarty, $db)
{
    $vac_id = isset($_POST['vac_id']) ? intval($_POST['vac_id']) : null;
    $can_id = isset($_POST['can_id']) ? intval($_POST['can_id']) : null;
    $where = "vac_id = $vac_id AND can_id = $can_id";

    if (!$vac_id && $can_id) exit();

    $db->delete(comb_vac_cand, $where);

    return true;
}

