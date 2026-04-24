#import "@preview/numty:0.1.0" as nt
#import "@preview/lilaq:0.6.0" as lq
#import "@preview/statastic:1.0.0" as st


#let raw=csv("尼龙6-拉伸测试-5mm每min-标距100mm-宽度10mm-厚度4mm.csv")


// English aliases for the original Chinese CSV headers
#let new_header = (("No.", "time_s", "deform_mm", "force_kgf"),)

#let first_100 = raw.slice(1, 101) 

#let first_100_exclude_deform_zeros = first_100.filter(it => float(it.at(2) ) > 0 )

#let sampled_data = raw.slice(1).filter( it => {
  let n = int(it.at(0))
  let divisor = 100
  n - calc.floor(n / divisor) * divisor == 0
})

#let sample = new_header + first_100_exclude_deform_zeros + sampled_data

#let time_s = sample.map(it => it.at(1)).slice(1).map(it => float(it))

#let deform_mm = sample.map(it => it.at(2)).slice(1).map(it => float(it))

#let force_kgf = sample.map(it => it.at(3)).slice(1).map(it => float(it))



#lq.diagram(
  width:50%, 
  height: 6cm,
  lq.plot(
    time_s, force_kgf,
  )
)



