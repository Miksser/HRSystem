<form id="createForm">
    <input type="hidden" id="table" name="table" value="candidates">
    {if isset($rsProfile[0]['id'])}
        <input type="hidden" id="candidate" name="can_id" value="{$rsProfile[0]['id']}">
    {/if}
    <div>
        <label>
            Имя <input type="text" name="first_name" value="{$rsProfile[0]['first_name']}">
        </label>
    </div>
    <div>
        <label>
            Фамилия <input type="text" name="surname" value="{$rsProfile[0]['surname']}">
        </label>
    </div>
    <div>
        <label>
            Отчество <input type="text" name="middle_name" value="{$rsProfile[0]['middle_name']}">
        </label>
    </div>
    <div>
        <label>
            Телефон <input type="text" name="phone" value="{$rsProfile[0]['phone']}">
        </label>
    </div>
    <div>
        <label>
            Email <input type="text" name="email" value="{$rsProfile[0]['email']}">
        </label>
    </div>
    <div>
        <label>
            Дата Контакта <input type="date" name="contact_date" value="{$rsProfile[0]['contact_date']}">
        </label>
    </div>
    <select name="status">
        {$status = ['Новый', 'Приглашен', 'Принят', 'Отложен','Отклонен','Отказался']}
        {for $i=1 to count($status)}
            <option value="{$i}" {if ($rsProfile[0]['status'] == $i)}selected{/if}>{$status[$i-1]}</option>
        {/for}
    </select>
</form>

{if isset($rsCombVacCand)}
    <span>Прикрепленные вакансии:</span>
{/if}
<div style="display: table;">
    {foreach $rsCombVacCand as $item}
        <div style="display: table-row">
            <div style="display: table-cell">
                <a href="/vacancy/{$item['vac_id']}/">{$item['v_name']}</a>
            </div>
            <div style="display: table-cell">
                <a href="#" style="display: none" id="addVacancy_{$item['vac_id']}"
                   onclick="addFromProfile({$item['vac_id']});
                           return false;">
                    <button>Добавить</button>
                </a>
                <a href="#" id="removeVacancy_{$item['vac_id']}" onclick="removeFromProfile({$item['vac_id']});
                        return false;">
                    <button>Удалить</button>
                </a>
            </div>
        </div>
    {/foreach}
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


