# C04 - Bo canh bao hai nguong co vung tre Hysteresis

Mon: EEE703128 - Nhap mon Thiet ke Vi mach Tich hop

## Chuc nang

- Bat canh bao khi sample_in >= high_th
- Tat canh bao khi sample_in <= low_th
- Khi low_th < sample_in < high_th thi giu trang thai truoc

## Cau truc

- rtl/: ma RTL
- tb/: testbench va reference model
- constraints/: rang buoc timing
- config.json: cau hinh LibreLane
- .github/workflows/: CI GitHub Actions
