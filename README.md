Текущий даг
![Alt text](https://sun1-92.userapi.com/s/v1/ig2/QJYflAqNNgraMw4zNLtHWskFaAzoHKBYyGbnqWQFBNuI2LkJCQKwCaPB46FIh3LRY6vBUzjL3tdMfLaiwh_t2qoU.jpg?size=624x260&quality=96&type=album?raw=true "Title")

Результаты: 
1) [Q 2.1](https://disk.yandex.ru/i/cHbMnwprR1Uekw)
2) [Q 3.3](https://disk.yandex.ru/i/ayZrXs1U9nfF3w)
3) [Q 4.2](https://disk.yandex.ru/i/LIho_jqWVHVI-Q)

В процессе работы над ДЗ выполнил опциональные пункты 5,6, создал таблицы на основе данных из S3 с помощью цикла в dbt.
Итоговые запросы сделал в виде таблиц, т.к. время на создание view/table на таком размере данных отличается не сильно (1-10 сек), но дальнейшее получение данных из view происходит гораздо дольше.
Единственное, что не удалось реализовать на данном этапе – выполнение операции 
dbt run-operation generate_source --args '{"schema_name": "dbt", "generate_columns": True, "include_descriptions": True}'
Решил пока обойтись ручным описанием источников.
