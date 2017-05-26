#lang racket

; Процедура получения n-ного элемента списка
(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))

; Процедура вычисления длины списка
; (итеративная версия)
(define (length items)
  (define (length-iter a count)
    (if (null? a)
        count
        (length-iter (cdr a) (+ count 1))))
  (length-iter items 0))

; Процедура присоединения списка list2 к списку list1
(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

; Экспорт процедур
(provide list-ref
         length
         append)