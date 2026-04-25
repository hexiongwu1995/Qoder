
#import "@preview/numty:0.1.0" as nt
#import "@preview/lilaq:0.6.0" as lq
#import "@preview/statastic:1.0.0" as st

#let raw = csv("/data/尼龙6-拉伸测试-5mm每min-标距100mm-宽度10mm-厚度4mm.csv")

#let sample = raw.slice(1).filter(row => calc.rem(int(row.at(0)), 10) == 0).filter(row => float(row.at(2)) > 0)

#let time_s = sample.map(row => row.at(1)).map(value => float(value))

#let deform_mm = sample.map(row => row.at(2)).map(value => float(value))

#let force_kgf = sample.map(row => row.at(3)).map(value => float(value))



