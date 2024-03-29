#lang racket

; oyunun oynandığı tablo oluşturuldu. Random doldurmak için yöntem düşün.
(define oyunAlani (list (list -1 0 -1 )
                  (list -1 -1 1)
                  (list -1 1 0 )))

;(define oyunAlani (list (list 'X 'O 'X )
;                  (list 'X 'O 'X)
;                  (list 'X 'O 'X)))




;yatay , dikey ve çapraz oyunun kazananları belirlenicek.


;tek bir list için bulunuyor, map edilecek. (-1 0 -1)
(define (yatayKazanan teklist)   (cond[(  =  1   (first teklist)       ;  X in kazanma durumu
                                                 (second teklist)
                                                 (third teklist)) 1]
                                      [(  = -1   (first teklist)      ; O nun kazanma durumu 
                                                 (second teklist)
                                                 (third teklist)) -1]
                                        [else 0]))

;dikey kazanan için transpoze alınıp yatayKazanan 'a sokarız.(list (list( , ,)list( , ,)list( , ,)))
(define (transpoze oyunAlani) ( list (map first oyunAlani)   ;tüm listelerde firstleri aldı 
                                     (map second oyunAlani)  ;             ''
                                     (map third oyunAlani))) ;             ''
                               


;Bulunan listelerde kazanan liste değil tek bir sonuç olarak çıkmalıdır.
(define (kazananVarsa kazanmalist) (cond[( = 1 (first kazanmalist))  1]
                                        [( = 1 (second kazanmalist)) 1]
                                        [( = 1 (third kazanmalist))  1]
                                        [( = -1 (first kazanmalist))  -1]
                                        [( = -1 (second kazanmalist)) -1]
                                        [( = -1 (third kazanmalist))  -1]
                                        [else 0]))

;çapraz kazanananın belirlenmesi yapılmaktadır.
(define (caprazKazanan oyunAlani)(cond[(= 1  (car(first oyunAlani))        ;sol çapraz için
                                             (second (second oyunAlani))
                                             (third (third oyunAlani))) 1]
                                      [(= 1  (third(first oyunAlani))      ;sağ çapraz için
                                             (second(second oyunAlani))
                                             (first(third oyunAlani))) 1]
                                      [(= -1  (car(first oyunAlani))        ;O için
                                             (second (second oyunAlani))
                                             (third (third oyunAlani))) -1]
                                      [(= -1  (third(first oyunAlani))      ;O için
                                             (second(second oyunAlani))
                                             (first(third oyunAlani))) -1]
                                      [else 0]))
                                    
;(setq nokta (getpoint))
                                                                     
; 1 ise X kazanır , -1 ise O kazanır.
(define kazanan (list  (kazananVarsa(map yatayKazanan oyunAlani))                  ;yatayda kazanan belirleniyor.
                       (kazananVarsa(map yatayKazanan (transpoze oyunAlani)))      ;dikeyde kazanan belirleniyor.
                       (caprazKazanan oyunAlani)                                   ;çapraz kazanma durumu (kazananVarsa ya da map uygulanmaz zaten ağaca uygulanıyor ve tek sonuç veriyor)
))


kazanan
                

