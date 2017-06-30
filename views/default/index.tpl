<div>
    <table>
        <thead>
        <tr>
            <th>№</th>
            <th>ФИО</th>
            <th>Email</th>
            <th>Телефон</th>
            <th>Статус</th>
        </tr>
        </thead>
        <tbody>
        {foreach $rsCandidates as $item name = cand}
            <tr>
                <td>
                    {$smarty.foreach.cand.iteration}
                </td>
                <td class="name">
                    <a href="/profile/{$item['id']}/">
                        {$item['surname']} {$item['first_name']} {$item['middle_name']}
                    </a>
                </td>
                <td>
                    {$item['email']}
                </td>
                <td>
                    {$item['phone']}
                </td>
                <td>
                    {$item['status']}
                </td>
            </tr>
            {$flag = true}
            {foreach $rsCombVacCand as $item_vac name = cvc}
                {if $item['id'] == $item_vac['can_id']}
                    <tr>
                        <td></td>
                        <td>
                            {if $flag == true}
                                {$flag = false}
                                <span>Показать вакансии:</span>
                            {/if}
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <a href="/vacancy/{$item_vac['vac_id']}/">{$item_vac['v_name']}</a>
                        </td>
                    </tr>
                {/if}
            {/foreach}
        {/foreach}
        </tbody>
    </table>
</div>

