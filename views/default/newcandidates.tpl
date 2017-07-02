<form id="createCandidates" action="javascript:void(null);" onsubmit="call()">
    <input type="hidden" name="table" value="candidates">
    <div>
        <label>
            Имя <input type="text" name="first_name">
        </label>
    </div>
    <div>
        <label>
            Фамилия <input type="text" name="surname">
        </label>
    </div>
    <div>
        <label>
            Отчество <input type="text" name="middle_name">
        </label>
    </div>
    <div>
        <label>
            Телефон <input type="text" name="phone">
        </label>
    </div>
    <div>
        <label>
            Email <input type="text" name="email">
        </label>
    </div>
    <div>
        <label>
            Дата Контакта <input type="date" name="contact_date">
        </label>
    </div>
    <select name="status">
        <option value="1">Новый</option>
        <option value="2" name="2">Приглашен</option>
        <option value="3">Принят</option>
        <option value="4">Отложен</option>
        <option value="5">Отклонен</option>
        <option value="6">Отказался</option>
    </select>
    <input type="submit">
</form>

Прикрепить вакансию: <br>
<select id = 'vac' name="comb_vac_cand" multiple size="7">
    {foreach $rsVacancy as $item}
        <option value="{$item['id']}">{$item['v_name']}</option>
    {/foreach}
</select>

