



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

#"何雄武he何雄武".position(regex("[雄h]"))

#"何雄武he何雄武".position("h")





// 定义原始文本
#let text = "Typset is a great tool. I love Typset!"

// 将所有的 "Typset" 替换为 "Typst"
// 注意：这里没有传入 count 参数，所以会替换所有出现的次数
#text.replace("Typset", "Typst")


// 定义包含数字的文本
#let text = "I have 2 apples and 10 oranges."

// 使用正则表达式匹配数字 \d+，并用函数进行替换
// m 是一个包含匹配信息的字典，m.text 是实际匹配到的文本（如 "2" 或 "10"）
#text.replace(regex("\d+"), m => "(" + m.text + ")")

#let raw = csv("/data/尼龙6-拉伸测试-5mm每min-标距100mm-宽度10mm-厚度4mm.csv")

#let header = raw.slice(0, 1)

#let new_header = header.map(row => row.map(value => value
  .replace("时间( s) ", "time_s")
  .replace("变形( mm) ", "deform_mm")
  .replace("力( kgf) ", "force_kgf")))



// 原始字符串包含首尾空格和引号
#let text = "  \"Hello Typst!\"  "

// 1. 默认用法：去除首尾空白（pattern = none）
#text.trim()
// 结果: "\"Hello Typst!\""

// 2. 指定去除引号：只去除首尾的引号
// 这里设置 at: "both" (默认值) 表示两边都去，repeat: true (默认值) 表示重复去除
#text.trim("\"", repeat: true)
// 结果: "Hello Typst!"


#("hello world example".split())

#("ab".split(""))

#"hexiongwu".rev()

#"何雄武".rev()


