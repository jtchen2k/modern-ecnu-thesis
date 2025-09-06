#import "../utils/invisible-heading.typ": invisible-heading
#import "../utils/style.typ": 字号, 字体
#import "../utils/custom-heading.typ": heading-content
#import "../utils/pagebreak-from-odd.typ": pagebreak-from-odd

// 研究生目录生成
#let master-outline-page(
  // documentclass 传入参数
  doctype: "master",
  show-heading: false,
  twoside: false,
  fonts: (:),
  // 其他参数
  depth: 4,
  title: "目　　录",
  heading-title: "目录",
  outlined: false,
  title-vspace: 0pt,
  title-text-args: auto,
  // 引用页数的字体，这里用于显示 Times New Roman
  reference-font: auto,
  reference-size: 字号.小四,
  // 字体与字号
  font: auto,
  size: (字号.四号, 字号.小四),
  weight: ("bold", "bold", "regular"),
  // 垂直间距
  above: (14pt, 14pt),
  below: (14pt, 14pt),
  indent: (0pt, 18pt, 28pt),
  // 全都显示点号
  fill: (repeat([.], gap: 0.15em),),
  gap: .3em,
  ..args,
) = {
  // 1.  默认参数
  fonts = 字体 + fonts
  if title-text-args == auto {
    title-text-args = (font: fonts.黑体, size: 字号.三号, weight: "bold")
  }
  // 引用页数的字体，这里用于显示 Times New Roman
  if reference-font == auto {
    reference-font = fonts.宋体
  }
  // 字体与字号
  if font == auto {
    font = (fonts.黑体, fonts.黑体, fonts.宋体)
  }

  // 2.  正式渲染
  pagebreak(weak: true, to: if twoside { "odd" })

  // 设置页眉
  set page(..(if show-heading {
    (header: {
      heading-content(doctype: doctype, twoside: twoside, fonts: fonts)
    })
  } else { () }))

  // 默认显示的字体
  set text(font: reference-font, size: reference-size)

  {
    set align(center)
    // 标记一个不可见的标题用于目录生成
    invisible-heading(level: 1, outlined: outlined, heading-title)
    text(..title-text-args, title)
  }

  v(title-vspace)

  // 目录样式
  set outline(title: "test", indent: level => indent.slice(0, calc.min(level + 1, indent.len())).sum())
  show outline.entry: entry => block(
    above: above.at(entry.level - 1, default: above.last()),
    below: below.at(entry.level - 1, default: below.last()),
    link(
      entry.element.location(),
      entry.indented(
        none,
        {
          text(
            font: font.at(entry.level - 1, default: font.last()),
            size: size.at(entry.level - 1, default: size.last()),
            weight: weight.at(entry.level - 1, default: weight.last()),
            {
              if entry.prefix() not in (none, []) {
                entry.prefix()
                h(gap)
              }
              entry.body()
            },
          )
          box(width: 1fr, inset: (x: .25em), fill.at(entry.level - 1, default: fill.last()))
          entry.page()
        },
        gap: 0pt,
      ),
    ),
  )

  // 显示目录
  outline(title: none, depth: depth)
}