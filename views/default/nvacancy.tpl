<form id="createForm" >
    <input type="hidden" name="table" value="vacancy">
    <div>
        <label>
            Название <input type="text" name="v_name">
        </label>
    </div>
    <div>
        <label>
            Условия <textarea type="text" name="v_conditions"></textarea>
        </label>
    </div>
    <div>
        <label>
            Обязанности <textarea type="text" name="v_respons"></textarea>
        </label>
    </div>
    <div>
        <label>
            Требования <textarea type="number" min="0" step="1" name="demands"></textarea>
        </label>
    </div>
    <div>
        <label>
            Оплата <input type="number" min="0" step="1" name="salary">
        </label>
    </div>
    <select name="status">
        <option value="1">Открыта</option>
        <option value="2">Закрыта</option>
    </select>

</form>
Прикрепить Кандидата: <br>
<select id = 'cvc' name="cvc" multiple size="7">
    {foreach $rsCandidates as $item}
        <option value="{$item['id']}">{$item['surname']} {$item['first_name']} {$item['middle_name']}</option>
    {/foreach}
</select>
<br>

<button id="create">Отправить</button>
