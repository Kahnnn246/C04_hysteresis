# M2 - RTL va Verification C04

## RTL

C04 su dung always_ff tai canh len cua clk.
Tin hieu alert duoc luu bang Flip-Flop va cung la state cua mach.

## Verification

Su dung:

low_th = 50
high_th = 100

Cac truong hop chinh:

- 99 khi OFF -> alert = 0
- 100 khi OFF -> alert = 1
- 90 trong vung tre -> alert giu 1
- 60 trong vung tre -> alert giu 1
- 50 khi ON -> alert = 0

## Test tu them 1

51 khi ON -> alert = 1

50 khi ON -> alert = 0

Muc dich la kiem tra dung dieu kien bien low_th.

## Test tu them 2

low_th = 100
high_th = 50

Day la truong hop low_th >= high_th.

Theo RTL hien tai, alert giu nguyen trang thai.

## Waveform

File waveform:

c04_wave.vcd

Cac tin hieu quan sat:

clk
rst_n
sample_in
low_th
high_th
alert
