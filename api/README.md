# API
## Stack
```
1. Open Server  v5.3.7;
2. PHP v7.1;
3. PostgreSQL v11.7.
```
## Project setup
1. В папке `domains` Open server выгрузите данное API;
2. Настройте конфигурацию в `Настройках` Open server согласно `Stack` указанному выше;
3. Восстановите резервную копию базы данных (`dumpBD` -> `dumpBD.sql`);
4. Для подключение к БД необходимо создать файл `parametrs.ini` в папке `config` (пример заполнения приведет в этом же файле);
5. Создайте домен в OpenServer с именем домена `api`.
