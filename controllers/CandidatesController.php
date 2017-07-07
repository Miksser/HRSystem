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
    //Delete last OR
    $where = preg_replace('/(OR )$/', ' ', $where);

    //Sorting check
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

    //Need refactor
    $NameFilter = ["surname" => 'ФИО', "email" => 'email', "phone" => 'Телефон', "status" => "Статус"];

    $ts = new templateSelect();

    $rsFilter = $db->select('candidates', 'DISTINCT status', 'status NOTNULL', 'status ASC');
    $rsCandidates = $db->select('candidates', '*', $where, $order);
    $rsCombVacCand = $ts->select_join('candidates',null );

    $smarty->assign('pageTitle', 'Список кандидатов');
    $smarty->assign('rsCandidates', $rsCandidates);
    $smarty->assign('rsCombVacCand', $rsCombVacCand);
    $smarty->assign('rsFilter', $rsFilter);
    $smarty->assign('sort', $sort);
    $smarty->assign('NameFilter', $NameFilter);
    $smarty->assign('CheckedStatus', $CheckedStatus);

    loadTemplate($smarty, 'header');
    loadTemplate($smarty, 'AllCandidates');
    loadTemplate($smarty, 'footer');

}