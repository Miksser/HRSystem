<form id="createForm">
    <input type="hidden" id="table" name="table" value="candidates">
    {if isset($rsProfile[0]['id'])}
        <input type="hidden" id="position" name="can_id" value="{$rsProfile[0]['id']}">
    {/if}
    <div>
        <label>
            Имя <input type="text" name="first_name"
                       value="{if isset($rsProfile[0]['first_name'])}{$rsProfile[0]['first_name']}{/if}">
        </label>
    </div>
    <div>
        <label>
            Фамилия <input type="text" name="surname"
                           value="{if isset($rsProfile[0]['surname'])}{$rsProfile[0]['surname']}{/if}">
        </label>
    </div>
    <div>
        <label>
            Отчество <input type="text" name="middle_name"
                            value="{if isset($rsProfile[0]['surname'])}{$rsProfile[0]['surname']}{/if}">
        </label>
    </div>
    <div>
        <label>
            Телефон <input type="text" name="phone"
                           value="{if isset($rsProfile[0]['phone'])}{$rsProfile[0]['phone']}{/if}">
        </label>
    </div>
    <div>
        <label>
            Email <input type="email" name="email" required
                         value="{if isset($rsProfile[0]['email'])}{$rsProfile[0]['email']}{/if}">
        </label>
    </div>
    <div>
        <label>
            Дата Контакта <input type="date" name="contact_date"
                                 value="{if isset($rsProfile[0]['contact_date'])}{$rsProfile[0]['contact_date']}{/if}">
        </label>
    </div>
    <select name="status">
        {$status = ['Новый', 'Приглашен', 'Принят', 'Отложен','Отклонен','Отказался']}
        {for $i=0 to count($status)-1}
            <option value="{$status[$i]}"
                    {if (isset($rsProfile[0]['status']) && $rsProfile[0]['status'] == $status[$i])}selected{/if}>{$status[$i]}</option>
        {/for}
    </select>
</form>

{if isset($rsCombVacCand)}
    <span>Прикрепленные вакансии:</span>
{/if}
<div style="display: table;">
    {if isset($rsCombVacCand)}
        {foreach $rsCombVacCand as $item}
            <div style="display: table-row">
                <div style="display: table-cell">
                    <a href="/vacancy/{$item['vac_id']}/">{$item['v_name']}</a>
                </div>
                <div style="display: table-cell">
                    <a href="#" style="display: none" id="addInfo_{$item['vac_id']}"
                       onclick="addFromPosition({$item['vac_id']}, 'can_id');
                               return false;">
                        <button>Добавить</button>
                    </a>
                    <a href="#" id="removeInfo_{$item['vac_id']}"
                       onclick="removeFromPosition({$item['vac_id']}, 'can_id');
                               return false;">
                        <button>Удалить</button>
                    </a>
                </div>
            </div>
        {/foreach}
    {/if}
</div>

Прикрепить вакансию: <br>
<select id='cvc' name="cvc" multiple size="7">
    {foreach $rsVacancy as $item}
        <option value="{$item['id']}">{$item['v_name']}</option>
    {/foreach}
</select>
<br>
{if isset($rsProfile[0]['id'])}
    <button id="update">Обновить</button>
{else}
    <button id="create">Отправить</button>
{/if}


