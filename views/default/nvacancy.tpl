<form id="createForm">
    <input type="hidden" id="table" name="table" value="vacancy">
    {if isset($rsVacancy[0]['id'])}
        <input type="hidden" id="position" name="vac_id" value="{$rsVacancy[0]['id']}">
    {/if}
    <div>
        <label>
            Название <input type="text" name="v_name"
                            value="{if isset($rsVacancy[0]['v_name'])}{$rsVacancy[0]['v_name']}{/if}">
        </label>
    </div>
    <div>
        <label>
            Условия <textarea type="text"
                              name="v_conditions">{if isset($rsVacancy[0]['v_conditions'])}{$rsVacancy[0]['v_conditions']}{/if}</textarea>
        </label>
    </div>
    <div>
        <label>
            Обязанности <textarea type="text"
                                  name="v_respons">{if isset($rsVacancy[0]['v_respons'])}{$rsVacancy[0]['v_respons']}{/if}</textarea>
        </label>
    </div>
    <div>
        <label>
            Требования <textarea
                    name="demands">{if isset($rsVacancy[0]['demands'])}{$rsVacancy[0]['demands']}{/if}</textarea>
        </label>
    </div>
    <div>
        <label>
            Оплата <input type="number" min="0" step="1" name="salary"
                          value="{if isset($rsVacancy[0]['salary'])}{$rsVacancy[0]['salary']}{/if}">
        </label>
    </div>
    <select name="status">
        {$status = ['Открыта', 'Закрыта']}
        {for $i=0 to count($status)-1}
            <option value="{$status[$i]}"
                    {if (isset($rsVacancy[0]['status']) && $rsVacancy[0]['status'] == $status[$i])}selected{/if}>{$status[$i]}</option>
        {/for}
    </select>
</form>

{if isset($rsCombVacCand)}
    <span>Прикрепленные Кандидаты:</span>
{/if}
<div style="display: table;">
    {if isset($rsCombVacCand)}
        {foreach $rsCombVacCand as $item}
            <div style="display: table-row">
                <div style="display: table-cell">
                    <a href="/candidates/{$item['can_id']}/">{$item['sfm']}</a>
                </div>
                <div style="display: table-cell">
                    <a href="#" style="display: none" id="addInfo_{$item['can_id']}"
                       onclick="addFromPosition({$item['can_id']}, 'vac_id');
                               return false;">
                        <button>Добавить</button>
                    </a>
                    <a href="#" id="removeInfo_{$item['can_id']}"
                       onclick="removeFromPosition({$item['can_id']}, 'vac_id');
                               return false;">
                        <button>Удалить</button>
                    </a>
                </div>
            </div>
        {/foreach}
    {/if}
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