#language: ru
@tree

Функционал: Проверка документа Заказ покупателя

Как Тестироващик я хочу
ПРоверить правильность заполнения полей документа
чтобы документ правильно вводился

Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: Проверка заполнения полей Партнер и Соглашение
* Ввод документа Заказ покупателя
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы покупателей'
	Тогда открылось окно 'Заказы покупателей'
	И я нажимаю на кнопку с именем 'FormCreate'
	Тогда открылось окно 'Заказ покупателя (создание)'
	И я нажимаю кнопку выбора у поля с именем "Partner"
	Тогда открылось окно 'Партнеры'
	И в таблице "List" я перехожу к строке:
		| 'Код' | 'Наименование'            |
		| '1'   | 'Клиент 1 (1 соглашение)' |
	И в таблице "List" я выбираю текущую строку
	И я нажимаю кнопку выбора у поля с именем "Agreement"
	Тогда открылось окно 'Соглашения'
	И в таблице "List" я перехожу к строке:
		| 'Код' | 'Наименование'                                                    |
		| '1'   | 'Соглашение с клиентами (расчет по документам + кредитный лимит)' |
	И в таблице "List" я выбираю текущую строку
	Тогда открылось окно 'Табличная часть товаров будет обновлена'
	И я нажимаю на кнопку с именем 'FormOK'
* Запись документа и запоминание номера
	И я нажимаю на кнопку с именем 'FormWrite'
	И я запоминаю значение поля с именем "Number" как "DocNumber"
	И я нажимаю на кнопку с именем 'FormPostAndClose'
	И я жду закрытия окна 'Заказ покупателя * от *' в течение 20 секунд
* Открытие документа и проверка значения полей
	И в таблице "List" я перехожу к строке:
		| 'Номер' |
		| '$DocNumber$'|
	И в таблице "List" я выбираю текущую строку
	И элемент формы с именем "Partner" стал равен 'Клиент 1 (1 соглашение)'
	И элемент формы с именем "Agreement" стал равен 'Соглашение с клиентами (расчет по документам + кредитный лимит)'
* Завершение
	И я закрываю все окна клиентского приложения

Сценарий: Проверка недоступности поля Контрагент при невыбранном партнере
И В командном интерфейсе я выбираю 'Продажи' 'Заказы покупателей'
Тогда открылось окно 'Заказы покупателей'
И я нажимаю на кнопку с именем 'FormCreate'
И элемент формы "Контрагент" не доступен
И я закрываю все окна клиентского приложения