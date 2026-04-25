
#import "@preview/numty:0.1.0" as nt
#import "@preview/lilaq:0.6.0" as lq
#import "@preview/statastic:1.0.0" as st

#let raw = csv("/data/尼龙6-拉伸测试-5mm每min-标距100mm-宽度10mm-厚度4mm.csv")

#let sample = raw.slice(1).filter(row => calc.rem(int(row.at(0)), 10) == 0).filter(row => float(row.at(2)) > 0)

#let time_s = sample.map(row => row.at(1)).map(value => float(value))

#let deform_mm = sample.map(row => row.at(2)).map(value => float(value))

#let force_kgf = sample.map(row => row.at(3)).map(value => float(value))


#"he何雄武".len()

#"he何雄武".first()

#"何雄武he何雄武".first()

#"何雄武he何雄武".last()

#"何雄武he何雄武".at(9)

#"何雄武he何雄武".slice(0, 6)


#"何雄武he何雄武".clusters()

#"何雄武he何雄武".codepoints()

#"何雄武he何雄武".codepoints().map(it => it.to-unicode())


#"何雄武he何雄武".codepoints().map(str.to-unicode)

#str.from-unicode(20309)

#"何雄武he何雄武".contains("何")

#("雄武" in "何雄武he何雄武")

#{ "雄武" in "何雄武he何雄武" }

#"何雄武he何雄武".find("何")

#"何雄武he何雄武".find(regex("[雄, 何]"))
