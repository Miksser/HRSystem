<div>
    Фильтр <br>
    Статус <br>
    <form action="?/order=status:asc" method="get">
        <input type="hidden" name="where[]" value="status">
        {if (isset($sort['order']))}
            <input type="hidden" name="order" value="{$sort['order']}:{$sort['value']}">
        {/if}

        {foreach $rsFilter as $item}
            <input type="checkbox" name="status[]" value="{$item['status']}" {if isset($CheckedStatus) &&
        in_array($item['status'], $CheckedStatus)}checked{/if}>{$item['status']}
            <br>
        {/foreach}
        <input type="submit">
    </form>
</div>
<div>
    <table name='candidates' id='candidates'>
        <thead>
        <tr>
            <th>№1</th>

            {foreach array_keys($NameFilter) as $th}
                <th>
                    {if (isset($sort) && in_array($th, $sort))}
                        <a href='?order={$th}:{$sort['value']}'>{$NameFilter[$th]}</a>
                    {else}
                        <a href='?order={$th}:asc'>{$NameFilter[$th]}</a>
                    {/if}

                </th>
            {/foreach}
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
                <td>
                    {$flag = true}
                </td>
            </tr>
            {foreach $rsCombVacCand as $item_vac}
                {if $item['id'] == $item_vac['can_id']}
                    <tr>
                        <td></td>
                        <td>
                            {if $flag == true}
                                {$flag = false}
                                <span class="AttachedInfo">Показать вакансии:</span>
                            {/if}
                        </td>
                    </tr>
                    <tr class="showInfo">
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