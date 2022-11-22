## Prosedur Reset Password Dell Switch S-Series

1. Dapatkan session serial control dari switch

```
screen /dev/ttyUSB0 <baud rate>
```

2. Nyalakan Dell Switch S-Series
3. Ketika muncul '"Hit Esc key to interrupt autoboot:" atau "Hit any key to stop autoboot:" Tekan tombol ESC
4. Lalu akan diarahkah ke U-boot prom (=>)
5. Masukan command

```
=> setenv stconfigignore true
=> saveenv
=> reset
```

6. Hapus Startup Config

```
Privillage mode
#check file pada flash
dir flash:

#hapus file staturtup-config
delele flash://startup-config
delele flash://startup-config.bak

reload
```
