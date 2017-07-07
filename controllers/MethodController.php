<?php

function removepositionAction($smarty, $db)
{
    $vac_id = isset($_POST['vac_id']) ? intval($_POST['vac_id']) : null;
    $can_id = isset($_POST['can_id']) ? intval($_POST['can_id']) : null;

    if (!$vac_id || !$can_id) exit();

    $where = "vac_id = $vac_id AND can_id = $can_id";
    $db->delete(comb_vac_cand, $where);

    return true;
}

function addpositionAction($smarty, $db)
{
    $info = $_POST;
    $db->insert($info);
}

function createpositionAction($smarty, $db)
{
    $info = $_POST;

    $cvc = $info['cvc'];

    unset($info['cvc']);

    $insert = $db->insert($info);

    addPosition($info, $cvc, $db);
}

function updatepositionAction($smarty, $db)
{
    $info = $_POST;
    $id = isset($info['can_id']) ? intval($info['can_id']) : intval($info['vac_id']);
    if (!$id) exit();

    if (isset($info['can_id'])) {
        unset($info['can_id']);
    } else {
        unset($info['vac_id']);
    };

    $cvc = $info['cvc'];

    unset($info['cvc']);

    $db->update($info, "id = $id");

    addPosition($info, $cvc, $db);
}