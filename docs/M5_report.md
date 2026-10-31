# BAO CAO C04
## Bo canh bao hai nguong co vung tre Hysteresis

## 1. Gioi thieu

- Ten de tai: Bo canh bao hai nguong co vung tre
- Ma de: C04
- Cong nghe: Sky130
- Flow: LibreLane
- RTL: SystemVerilog

GitHub Repository:
https://github.com/Kahnnn246/C04_hysteresis

GitHub Actions:
https://github.com/Kahnnn246/C04_hysteresis/actions/runs/41166273351

## 2. Dac ta he thong

He thong nhan gia tri sample_in va hai nguong low_th, high_th.

Quy tac:

- sample_in >= high_th khi OFF -> alert = 1
- sample_in <= low_th khi ON -> alert = 0
- low_th < sample_in < high_th -> giu trang thai alert
- low_th >= high_th -> giu trang thai theo RTL hien tai

## 3. Kien truc

C04 la FSM gom hai trang thai:

- OFF: alert = 0
- ON: alert = 1

Tin hieu alert dong thoi la output va bit state.

Vi chi co hai trang thai nen mach chi can mot Flip-Flop luu state.

## 4. RTL

RTL su dung always_ff tai canh len cua clk.

Reset rst_n la synchronous active-low reset.

Logic chuyen trang thai dua tren cac phep so sanh:

- sample_in >= high_th
- sample_in <= low_th
- low_th < high_th

## 5. Verification

Testbench kiem tra cac truong hop:

- Bat alert tai high_th
- Tat alert tai low_th
- Giu alert trong vung hysteresis
- Kiem tra bien 51/50
- Kiem tra low_th >= high_th

Testbench su dung assertion va reference model.

Ket qua:

C04 core verification PASS

### Waveform

![Waveform C04](images/waveform.png)

Waveform cho thay alert bat khi sample_in dat high_th = 100,
giu trang thai trong vung hysteresis va tat khi sample_in dat low_th = 50.

## 6. RTL-to-GDSII

Flow duoc chay bang LibreLane tren GitHub Actions.

Ket qua:

- RTL simulation: PASS
- RTL-to-GDSII: PASS
- Sinh duoc GDS
- Sinh duoc metrics.json

### GitHub Actions

![CI PASS](images/ci_pass.png)

Ca hai job mo phong RTL va RTL-to-GDSII deu PASS tren GitHub Actions.

## 7. Synthesis

Ket qua:

- Tong cell sau synthesis: 57
- Flip-Flop: 1
- Logic area: 464.1952 um2
- Sequential area: 21.2704 um2

Ket qua 1 Flip-Flop phu hop voi du doan vi FSM chi co hai trang thai.

Nguon:
06-yosys-synthesis/yosys-synthesis.log

Lenh tao:
librelane config.json

## 8. Timing

Clock period: 10 ns

Ket qua:

- Worst setup slack: 5.329 ns
- Worst hold slack: 0.307 ns
- Setup violation: 0
- Hold violation: 0

Ca setup va hold slack deu duong nen flow khong bao timing violation.

Nguon:
55-openroad-stapostpnr/*/sta.log

Lenh tao:
librelane config.json

## 9. Power

Ket qua:

- Internal power: 2.5690e-05 W
- Switching power: 1.3729e-05 W
- Leakage power: 1.0443e-09 W
- Total power: 3.9420e-05 W

Tong power uoc tinh khoang 39.42 uW.

Nguon:
final/metrics.json

Lenh tao:
librelane config.json

## 10. Physical Design

Ket qua:

- Die area: 2517.99 um2
- Core area: 1111.07 um2
- Standard-cell area: 741.962 um2
- Tong instance: 209
- Standard-cell instance: 97
- Sequential cell: 1
- Routing wire length: 1230 um

Nguon:
final/metrics.json

Lenh tao:
librelane config.json

## 11. DRC va LVS

Ket qua:

- Magic DRC errors: 0
- KLayout DRC errors: 0
- LVS errors: 0
- Antenna violations: 0

Magic DRC bao khong co loi.

Netgen LVS cho ket qua circuits match uniquely.

Nguon:
64-magic-drc/magic-drc.log
65-klayout-drc/klayout-drc.log
70-netgen-lvs/netgen-lvs.log
final/metrics.json

Lenh tao:
librelane config.json

## 12. Layout

Flow sinh file:

final/gds/c04_core.gds

Layout render duoc luu tai:

final/render/c04_core.png

![Layout C04](images/layout.png)

Hinh tren la anh render layout cuoi cung cua c04_core sau flow RTL-to-GDSII.

## 13. Ket luan

C04 da duoc thiet ke tu RTL, kiem chung bang testbench va chay qua flow RTL-to-GDSII.

Ket qua synthesis phu hop voi du doan mot Flip-Flop.

Flow khong bao setup violation, hold violation, DRC error hay LVS error.

Ket qua nay la ket qua cua flow thiet ke va khong duoc dung de khang dinh chip da duoc che tao hay tape-out.

## Phu luc - Reproducibility

Compile va mo phong:

iverilog -g2012 -Wall -o sim.vvp rtl/*.sv tb/*.sv
vvp sim.vvp

Chay LibreLane:

librelane config.json

Cac file dau vao chinh:

- rtl/c04_core.sv
- tb/c04_core_tb.sv
- tb/c04_reference.sv
- constraints/design.sdc
- config.json

Cac file ket qua chinh:

- simulation.log
- c04_wave.vcd
- final/metrics.json
- final/gds/c04_core.gds
