# [Глава 2. Построение абстракций с помощью данных](index.md#Глава-2-Построение-абстракций-с-помощью-данных)
## [2.1 Введение в абстракцию данных](index.md#21-Введение-в-абстракцию-данных)

### Упражнение 2.1
Определите улучшенную версию `mul-rat`, которая принимала бы как положительные,
так и отрицательные аргументы. `Make-rat` должна нормализовывать знак так, чтобы
в случае, если рациональное число положительно, то и его числитель, и знаменатель
были бы положительны, а если оно отрицательно, то чтобы только его числитель был
отрицателен.

#### Решение
В тексте задания опечатка. Необходимо определить улучшенную процедуру `make-rat`.

[Код](../../src/chapter02/exercise_2_01.rkt) |
---|