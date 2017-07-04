<form id="createForm" >
    <input type="hidden" id="table" name="table" value="vacancy">
    {if isset($rsVacancy[0]['id'])}
        <input type="hidden" id="position" name="vac_id" value="{$rsVacancy[0]['id']}">
    {/if}
    <div>
        <label>
            Название <input type="text" name="v_name" value="{$rsVacancy[0]['v_name']}">
        </label>
    </div>
    <div>
        <label>
            Условия <textarea type="text" name="v_conditions" placeholder="{$rsVacancy[0]['v_conditions']}"></textarea>
        </label>
    </div>
    <div>
        <label>
            Обязанности <textarea type="text" name="v_respons" placeholder="{$rsVacancy[0]['v_respons']}"></textarea>
        </label>
    </div>
    <div>
        <label>
            Требования <textarea type="number" min="0" step="1" name="demands" placeholder="{$rsVacancy[0]['demands']}"></textarea>
        </label>
    </div>
    <div>
        <label>
            Оплата <input type="number" min="0" step="1" name="salary" value="{$rsVacancy[0]['salary']}">
        </label>
    </div>
    <select name="status">
        {$status = ['Открыта', 'Закрыта']}
        {for $i=1 to count($status)}
            <option value="{$i}" {if ($rsVacancy[0]['status'] == $i)}selected{/if}>{$status[$i-1]}</option>
        {/for}
    </select>

</form>

{if isset($rsCombVacCand)}
    <span>Прикрепленные Кандидаты:</span>
{/if}
<div style="display: table;">
    {foreach $rsCombVacCand as $item}
        <div style="display: table-row">
            <div style="display: table-cell">
                <a href="/candidates/{$item['can_id']}/">{$item['sfm']}</a>
            </div>
            <div style="display: table-cell">
                <a href="#" style="display: none" id="addInfo_{$item['can_id']}"
                   onclick="addFromPosition({$item['can_id']});
                           return false;">
                    <button>Добавить</button>
                </a>
                <a href="#" id="removeInfo_{$item['can_id']}" onclick="removeFromPosition({$item['can_id']});
                        return false;">
                    <button>Удалить</button>
                </a>
            </div>
        </div>
    {/foreach}
</div>
Прикрепить кандидата: <br>
<select id='cvc' name="cvc" multiple size="7">
    {foreach $rsCandidates as $item}
        <option value="{$item['id']}">{$item['sfm']}</option>
    {/foreach}
</select>
<br>
{if isset($rsVacancy[0]['id'])}
    <button id="update">Обновить</button>
{else}
    <button id="create">Отправить</button>
{/if}