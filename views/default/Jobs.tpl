<div>
    Фильтр <br>
    Статус <br>
    <form action="?/order=status:asc" method="get">
        <input type="hidden" name="where[]" value="status">
        {if (isset($sort['order']))}
            <input type="hidden" name="order" value="{$sort['order']}:{$sort['value']}">
        {/if}

        {foreach $rsFilter as $item}
            <input type="checkbox" name="status[]" value="{$item['status']}" {if (isset($CheckedStatus) &&
        in_array($item['status'], $CheckedStatus))}checked{/if}>{$item['status']}
            <br>
        {/foreach}
        <input type="submit">
    </form>
</div>
<div>
    <table name='vacancy' id='vacancy'>
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
        {foreach $rsVacancy as $item name = vac}
            <tr>
                <td>
                    {$smarty.foreach.vac.iteration}
                </td>
                <td class="name">
                    <a href="/vacancy/{$item['id']}/">
                        {$item['v_name']}
                    </a>
                </td>
                <td>
                    {$item['salary']}
                </td>
                <td>
                    {$item['status']}
                </td>
                <td>
                    {$flag = true}
                </td>
            </tr>
            {foreach $rsCombVacCand as $item_vac}
                {if $item['id'] == $item_vac['vac_id']}
                    <tr>
                        <td></td>
                        <td>
                            {if $flag == true}
                                {$flag = false}
                                <span class="AttachedInfo">Показать кандидатов:</span>
                            {/if}
                        </td>
                    </tr>
                    <tr class="showInfo">
                        <td></td>
                        <td>
                            <a href="/candidates/{$item_vac['can_id']}/">{$item_vac['sfm']}</a>
                        </td>
                    </tr>
                {/if}
            {/foreach}
        {/foreach}
        </tbody>
    </table>
</div>