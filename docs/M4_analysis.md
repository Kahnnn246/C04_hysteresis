## 2. Ket qua synthesis

Nguon:
06-yosys-synthesis/yosys-synthesis.log

Ket qua:

- Tong so cell sau synthesis: 57
- So Flip-Flop: 1
- Dien tich logic: 464.1952 um2
- Dien tich sequential: 21.2704 um2

Du doan 1 Flip-Flop khop voi ket qua synthesis.

Ly do la FSM cua C04 chi co hai trang thai OFF va ON, nen chi can mot bit state. Tin hieu alert chinh la bit state do.

Ngoai Flip-Flop, cac cell con lai dung de thuc hien cac phep so sanh 8 bit va logic quyet dinh trang thai tiep theo.

Sau physical design tong so instance tang len 209. So nay khong nen nham voi 57 cell sau synthesis, vi flow physical design bo sung them buffer, tap cell, fill cell va cac cell phuc vu layout.# M4 - Phan tich bao cao C04

## 1. Du doan truoc khi doc report

C04 la mach tuan tu co 2 trang thai OFF va ON.

State duoc luu trong tin hieu alert.

Vi chi co 2 trang thai nen du doan c04_core can 1 Flip-Flop.

Ngoai Flip-Flop, mach can logic to hop de thuc hien cac phep so sanh:

- sample_in >= high_th
- sample_in <= low_th
- low_th < high_th

Du doan duong timing quan trong se di tu cac input sample_in, low_th hoac high_th qua logic so sanh va logic dieu khien den Flip-Flop alert.

Sau physical design, so cell du kien lon hon sau synthesis vi flow co the them buffer, tap cell, fill cell va cac cell phuc vu routing/timing.
## 3. Phan tich Timing

Nguon:
55-openroad-stapostpnr/*/sta.log

Lenh tao bao cao:
librelane config.json

Clock period su dung la 10 ns.

Ket qua sau PnR:

- Worst setup slack: 5.329 ns
- Worst hold slack: 0.307 ns
- Setup violation: 0
- Hold violation: 0

Worst setup slack xuat hien tai corner max_ss_100C_1v60.

Duong setup quan trong di tu high_th[1] qua cac cell logic so sanh va logic dieu khien den chan D cua Flip-Flop alert.

Data arrival time cua duong nay la 4.380 ns va data required time la 9.709 ns, tao ra setup slack khoang 5.329 ns.

Worst hold slack xuat hien tai corner min_ff_n40C_1v95.

Duong hold quan trong di tu Q cua Flip-Flop alert qua logic to hop va quay lai D cua chinh Flip-Flop.

Ca setup va hold slack deu duong va khong co timing violation.

Trong metrics.json, WNS bang 0 khong co nghia worst slack bang 0. WNS chi tinh phan slack am. Do khong co violation nen WNS = 0, trong khi worst slack duong van duoc ghi trong STA report.

Khong dung cac ket qua nay de khang dinh chip chay duoc o mot tan so toi da cu the.

## 4. Phan tich Power

Nguon:
final/metrics.json

Lenh tao bao cao:
librelane config.json

Ket qua:

- Internal power: 2.5690e-05 W
- Switching power: 1.3729e-05 W
- Leakage power: 1.0443e-09 W
- Total power: 3.9420e-05 W

Tong cong suat uoc tinh tu flow khoang 39.42 uW.

Internal power va switching power chiem phan lon tong cong suat, trong khi leakage power rat nho.

Day la ket qua uoc tinh cua cong cu voi cac dieu kien va mo hinh trong flow, khong phai ket qua do tren chip vat ly.

## 5. Physical Design

Nguon:
final/metrics.json

Lenh tao bao cao:
librelane config.json

Ket qua:

- Die area: 2517.99 um2
- Core area: 1111.07 um2
- Standard-cell area: 741.962 um2
- Instance utilization: 66.78 %
- Tong instance: 209
- Standard-cell instance: 97
- Sequential cell: 1
- Fill cell: 112
- Tap cell: 14
- Timing-repair buffer: 26
- Routing wire length: 1230 um

So instance sau physical design lon hon so cell sau synthesis vi flow bo sung cac cell can thiet cho layout, routing va timing.

Sequential cell van bang 1, phu hop voi kien truc C04 chi can mot Flip-Flop luu trang thai alert.

## 6. DRC va LVS

Nguon:

- 64-magic-drc/magic-drc.log
- 65-klayout-drc/klayout-drc.log
- 70-netgen-lvs/netgen-lvs.log
- final/metrics.json

Lenh tao bao cao:
librelane config.json

Ket qua:

- Magic DRC errors: 0
- KLayout DRC errors: 0
- LVS errors: 0
- Antenna violations: 0

Magic DRC bao "No errors found".

Netgen LVS bao "Circuits match uniquely".

DRC kiem tra layout co vi pham cac quy tac hinh hoc cua cong nghe hay khong.

LVS so sanh layout voi netlist de kiem tra ket noi cua layout co phu hop voi mach logic hay khong.

Ket qua nay cho thay flow khong bao loi DRC va LVS trong cac phep kiem tra da chay.

Khong su dung ket qua nay de khang dinh da tape-out hoac da che tao chip.

## 7. Layout

Nguon:

- final/gds/c04_core.gds
- final/render/c04_core.png

Lenh tao:
librelane config.json

Flow da sinh file GDS cuoi cung cua c04_core.

File GDS mo ta layout vat ly cua thiet ke sau cac buoc placement, routing va signoff checks trong flow.

Anh render cua layout co the dung lam bang chung trong bao cao M4/M5.
