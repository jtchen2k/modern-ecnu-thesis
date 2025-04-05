#import "../utils/style.typ": 字号, 字体

// 中英双语图片标题函数（支持手动编号）
#let bilingual-figure(
  body,
  caption: none,
  caption-en: none,
  kind: "figure",
  supplement: auto,
  numbering: "1.1",
  gap: 0.65em,
  manual-number: none,
) = context {
  let sup = if supplement == auto {
    if kind == "figure" { "图" }
    else if kind == "table" { "表" }
    else { kind }
  } else { supplement }
  
  let sup-en = if supplement == auto {
    if kind == "figure" { "Figure" }
    else if kind == "table" { "Table" }
    else { kind }
  } else { supplement }
  
  let display-number = if manual-number != none {
    manual-number
  } else {
    counter(kind).display(numbering)
  }
  
  figure(
    body,
    caption: if caption != none {
      [
        #set text(font: 字体.宋体, size: 字号.小四, weight: "regular")
        #set align(center)
        #sup #display-number #caption
        
        #if caption-en != none {
          [
            #set text(font: 字体.宋体, size: 字号.五号, weight: "regular")
            #set align(center)
            #sup-en #display-number #caption-en
          ]
        }
      ]
    },
    kind: kind,
    gap: gap,
    supplement: "", 
    numbering: none,
  )
}