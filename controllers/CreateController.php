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
    $cvc = $_POST['cvc'];

    unset($_POST['cvc']);

    $db->insert($_POST);

    if (count($cvc) > 0) {

        if ($_POST['table'] == 'candidates') {

            $getEmail = "email = '" . $_POST['email'] . "'";

            $getId = $db->select(candidates, '*', $getEmail);

            foreach ($cvc as $item) {

                $info = ["table" => "comb_vac_cand", "vac_id" => $item, "can_id" => $getId[0]['id']];
                $db->insert($info);

            }
            return true;

        } else if ($_POST['table'] == 'vacancy') {

            $getName = "v_name = '" . $_POST['v_name'] . "'";

            $getId = $db->select(vacancy, '*', $getName);

            foreach ($cvc as $item) {

                $info = ["table" => "comb_vac_cand", "can_id" => $item, "vac_id" => $getId[0]['id']];
                $db->insert($info);
            }
            return true;
        }
    } else {
        return false;
    }
}