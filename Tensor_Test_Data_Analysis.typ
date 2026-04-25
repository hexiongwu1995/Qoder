
// 对尼龙-6的拉伸测试数据文件进行处理，绘制应力-应变曲线图。注意：拉伸测试被提前终止，实验数据不全。
// 在线弹性区间拟合直线，计算杨氏模量E。同时提取屈服强度 sigma_y, 抗拉强度 sigma_UTS，及断裂伸长率 delta 。

#import "@preview/numty:0.1.0" as nt
#import "@preview/lilaq:0.6.0" as lq
#import "@preview/statastic:1.0.0" as st

#let raw = csv("/data/尼龙6-拉伸测试-5mm每min-标距100mm-宽度10mm-厚度4mm.csv")

#let sample = raw.slice(1).filter(row => calc.rem(int(row.at(0)), 10) == 0).filter(row => float(row.at(2)) > 0)

#let time_s = sample.map(row => row.at(1)).map(value => float(value))

#let deform_mm = sample.map(row => row.at(2)).map(value => float(value))

#let force_kgf = sample.map(row => row.at(3)).map(value => float(value))


#let (gauge, width, thickness) = (100, 10, 4)

#let area_m2 = width * thickness / 1e6

#let stress_Mpa = nt.div(force_kgf, area_m2 * 1e6)

#let strain_perc = nt.div(deform_mm, gauge)

// 由于拉伸测试被提前终止，我无法确定线弹性区间在什么范围，所以随意取了前 20% 的范围。
#let linear_range = calc.ceil(strain_perc.len() * 0.2)

#let (slope, intercept, r_squared) = st.arrayLinearRegression(
  strain_perc.slice(0, linear_range),
  stress_Mpa.slice(0, linear_range),
)

#let x_linReg = strain_perc.slice(0, linear_range * 2)
#let y_linReg = (
  nt.add(nt.mult(strain_perc.slice(0, linear_range * 2), slope), intercept).map(it => calc.round(it, digits: 3))
)

#lq.diagram(
  width: 60%,
  height: 5cm,
  legend: (position: (0%, 0%)),
  lq.plot(
    strain_perc,
    stress_Mpa,
    mark: none,
    label: [#text(size: 8pt)[Original data]],
  ),
  lq.plot(
    x_linReg,
    y_linReg,
    mark: none,
    label: [#text(size: 8pt)[Linear Regression,  $R^2 = #calc.round(r_squared, digits: 3)$]],
  ),
)






