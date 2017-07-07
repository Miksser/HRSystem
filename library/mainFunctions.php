<?php

/**
 * @param $controlleName
 * @param string $actionName
 *
 */

function loadPage($smarty, $db, $controlleName, $actionName = 'index')
{
    include_once PathPrefix . $controlleName . PathPostfix;

    $function = $actionName . 'Action';
    $function($smarty, $db);
}

/**
 * Загрузка шаблона
 * @param $smarty
 * @param $templateName
 */

function loadTemplate($smarty, $templateName)
{
    $smarty->display($templateName . TemplatePostfix);
}

/**
 * Дебаггер, останавливает сайт при die = 1
 * @param null $value переменная которую надо проверить
 * @param int $die остановить работу сайта 1 да 0 нет
 */
function d($value = null, $die = 1)
{
    echo 'Debug: </br></pre>';
    print_r($value);
    echo '</pre>';

    if ($die) die;
}

/**
 * Attachment of candidates and vacancies
 * @param $arr
 * @param $cvc
 * @param $db
 * @return bool
 */
function addPosition($arr, $cvc, $db)
{

    if (count($cvc) > 0) {

        if ($arr['table'] == 'candidates') {

            $getEmail = "email = '" . $arr['email'] . "'";

            $getId = $db->select(candidates, '*', $getEmail);

            foreach ($cvc as $item) {

                $info = ["table" => "comb_vac_cand", "vac_id" => $item, "can_id" => $getId[0]['id']];
                $db->insert($info);

            }
            return true;

        } elseif ($arr['table'] == 'vacancy') {

            $getName = "v_name = '" . $arr['v_name'] . "'";

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