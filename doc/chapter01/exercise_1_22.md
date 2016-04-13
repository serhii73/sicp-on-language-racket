# [Глава 1. Построение абстракций с помощью процедур](index.md#Глава-1-Построение-абстракций-с-помощью-процедур)
## [1.2. Процедуры и порождаемые ими процессы](index.md#12-Процедуры-и-порождаемые-ими-процессы)

### Упражнение 1.22
Большая часть реализаций Лиспа содержат элементарную процедуру `runtime`,
которая возвращает целое число, показывающее, как долго работала система
(например, в миллисекундах). Следующая процедура `timed-prime-test`, будучи
вызвана с целым числом _n_, печатает _n_ и проверяет, простое ли оно. Если _n_
простое, процедура печатает три звездочки и количество времени, затраченное на
проверку.

```racket
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))
      false))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))
```

Используя эту процедуру, напишите процедуру `search-for-primes`, которая
проверяет на простоту все нечетные числа в заданном диапазоне. С помощью этой
процедуры найдите наименьшие три простых числа после `1000`; после `10 000`;
после `100 000`; после `1 000 000`. Посмотрите, сколько времени затрачивается
на каждое простое число.Поскольку алгоритм проверки имеет порядок роста _Θ(√n)_,
Вам следовало бы ожидать, что проверка на простоту чисел, близких к `10 000`,
занимает в _√10_ раз больше времени, чем для чисел, близких к `1000`.
Подтверждают ли это Ваши замеры времени? Хорошо ли поддерживают предсказание
_√n_ данные для `100 000` и `1 000 000`? Совместим ли Ваш результат с
предположением, что программы на Вашей машине затрачивают на выполнение задач
время, пропорциональное числу шагов?

#### Решение
Первое, на что стоит обратить внимание - в диалекте Лиспа Racket процедура
`runtime` не поддерживается. Вместо неё будем использовать процедуру
`current-inexact-milliseconds`, которая обладает нужной нам функциональностью.

Второе, немного изменим вывод процедур. В зависимости от того, простое исходное
число или нет, будем выводить:
  - если число простое, то выводим `Number n is simple. Time compute: %ms.`,
  - иначе процедура возвращает `#f` (false).

Для поиска простых чисел после тех, которые указаны в задаче, требуется очень
малое время - тысячные доли миллисекунд. В этом заслуга увеличения
вычислительной мощности комьютеров, которыми мы пользуемся сейчас, по сравнению
с теми компьютерами, на которых выполнялось это задание в 80-х годах. И на таких
выходных данных мы не можем объективно оценить пропорциональное время поиска
простых чисел. Для более точных данных, увеличим исходные числа: `10 000 000 000`,
`100 000 000 000`, `1 000 000 000 000` и `10 000 000 000 000`, соответственно.

Запустим программу поиска простых чисел для обновленных входных данных.

```racket
(search-for-primes 10000000000 3)
Number 10000000019 is simple. Time compute: 3.755126953125ms.
Number 10000000033 is simple. Time compute: 4.160888671875ms.
Number 10000000061 is simple. Time compute: 4.18603515625ms.

(search-for-primes 100000000000 3)
Number 100000000003 is simple. Time compute: 12.697998046875ms.
Number 100000000019 is simple. Time compute: 12.589111328125ms.
Number 100000000057 is simple. Time compute: 12.364990234375ms.

(search-for-primes 1000000000000 3)
Number 1000000000039 is simple. Time compute: 40.683837890625ms.
Number 1000000000061 is simple. Time compute: 44.906982421875ms.
Number 1000000000063 is simple. Time compute: 59.60986328125ms.

(search-for-primes 10000000000000 3)
Number 10000000000037 is simple. Time compute: 133.6240234375ms.
Number 10000000000051 is simple. Time compute: 168.553955078125ms.
Number 10000000000099 is simple. Time compute: 124.240966796875ms.
```

По выводу результатов работы программы можно подтвердить ожидание того, что для
поиска простых чисел после числа, большего на порядок предыдущего числа, время
будет увеличиваться в _√10_ раз. И этот результат совместим  с предположением,
что программа затрачивает на выполнение задач время, пропорциональное числу
шагов.

[Код](../../src/chapter01/exercise_1_22.rkt) |
---|