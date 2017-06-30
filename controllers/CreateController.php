<?php
/**
 * Add new candidates or vacancy
 */

function candidatesAction($smarty, $db)
{

    $smarty->assign('pageTitle', 'Добавить нового кандидата');
    loadTemplate($smarty, 'header');
    loadTemplate($smarty, 'newcandidates');
    loadTemplate($smarty, 'footer');
}
