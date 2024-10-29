# README

Выполнил задание:
https://gist.github.com/wwwermishel/fd2c7973520c270c508720ba3a20e09c

Пройду по пунктам:
1. Раньше не работал с ActiveInteraction, классы-сервисы писали вручную. Делал по инструкции.

2. Исправил опечатку Skil 3 способами. Выделил исправления в отдельные ветки:
  - 1. good_skill_fix. Исправил опечатку на Skill, заменил во всех местах употребления.
       Где-то на этапе создания изначальных миграций я не допустил ошибку и создал правильную таблицу,
       но в другом случае переименовал бы таблицу и колонки с помощью отдельных миграций. Эту версию я
       смёрджил в main.

  - 2. bad_skill_fix. Пошёл в другую сторону и исправил Skills на Skils. Такой способ тоже работает, хоть
       и выглядит странно. Главное, что весь код консистентный.

  - 3. cursed_skill_fix. Добавил в config/initializers/inflections иррегулярную плюрализацию, чтобы Skills
       считалось множественной формой Skil. Способ рабочий, но проклятый, вызывает путаницу.

3. Исправил связи. Не люблю использовать has_and_belongs_to_many, поэтому создал промежуточные таблицы.

4. Поднял Rails приложение, настроил некоторые удобства под себя. CI/CD и Docker настроены немного криво, 
   создавать Skills и Interactions нельзя, контроллеры не покрыты тестами. Надеюсь, что для демонстрации
   хватит.

5. Добавил RSpec на проект и написал минимум тестов. Покрыл Users::Create и связи в моделях.

6. Провёл рефакторинг кода.
