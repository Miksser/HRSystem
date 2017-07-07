<?php
include_once '../library/class/templateSelect.php';

function indexAction($smarty, $db)
{
    $order = null;
    $where = null;
    $sort = null;
    $CheckedStatus = null;

    if (isset($_GET['order'])) {
        $sort = $_GET['order'];
    };

    if (isset($_GET['status'])) {
        $CheckedStatus = $_GET['status'];
        $GetWhereArray = $_GET['where'];

        //Для разных фильтров в гет
        foreach ($GetWhereArray as $WhereRow) {
            foreach ($_GET[$WhereRow] as $t) {
                $where .= "$WhereRow = '$t' OR ";
            };
        };
    };

    $where = preg_replace('/(OR )$/', ' ', $where);

    if (isset($sort)) {

        preg_match('/(.*):/', $sort, $keyOrder);
        preg_match('/:(.*)/', $sort, $valueOrder);
        $sort = ['order' => $keyOrder[1], 'value' => $valueOrder[1]];

        if ($sort['value'] == 'asc') {
            $sort['value'] = 'desc';
        } else {
            $sort['value'] = 'asc';
        }
        $order = "{$sort['order']} {$sort['value']}";
    }

    $NameFilter = ["v_name" => 'Название', "salary" => 'Оплата', "status" => "Статус"];

    $ts = new templateSelect();

    $rsFilter = $db->select('vacancy', 'DISTINCT status', 'status NOTNULL', 'status ASC');
    $rsVacancy = $db->select('vacancy', '*', $where, $order);

    $rsCombVacCand = $ts->select_join('vacancy', null);

    $smarty->assign('pageTitle', 'Список кандидатов');
    $smarty->assign('rsVacancy', $rsVacancy);
    $smarty->assign('rsCombVacCand', $rsCombVacCand);
    $smarty->assign('rsFilter', $rsFilter);
    $smarty->assign('sort', $sort);
    $smarty->assign('NameFilter', $NameFilter);
    $smarty->assign('CheckedStatus', $CheckedStatus);

    loadTemplate($smarty, 'header');
    loadTemplate($smarty, 'Jobs');
    loadTemplate($smarty, 'footer');

}