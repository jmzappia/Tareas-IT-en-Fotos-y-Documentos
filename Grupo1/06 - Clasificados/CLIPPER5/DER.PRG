clear
v1=0.09
ac=0.00
use julio
do while .not. e0f()
v1=stock_act*precio
ac=ac+v1
skip
enddo
?ac


