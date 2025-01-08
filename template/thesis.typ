#import "@preview/modern-ecnu-thesis:0.3.4": documentclass, indent

// 你首先应该安装 https://github.com/jtchen2k/modern-ecnu-thesis/tree/main/fonts/FangZheng 里的所有字体，
// 如果是 Web App 上编辑，你应该手动上传这些字体文件，否则不能正常使用「楷体」和「仿宋」。

#let (
  // 布局函数
  twoside, doc, preface, mainmatter, mainmatter-end, appendix,
  // 页面函数
  fonts-display-page, cover, decl-page, committee, abstract, abstract-en, bilingual-bibliography,
  outline-page, list-of-figures, list-of-tables, notation, acknowledgement,
) = documentclass(
  // doctype: "bachelor",  // "bachelor" | "master" | "doctor", 文档类型，默认为硕士生 master
  doctype: "master",
  // degree: "academic",  // "academic" | "professional", 学位类型，默认为学术型 academic
  degree: "professional",
  // anonymous: true,  // 盲审模式
  twoside: false,  // 双面模式，会加入空白页，便于打印
  // 可自定义字体，先英文字体后中文字体，应传入「宋体」、「黑体」、「楷体」、「仿宋」、「等宽」
  // fonts: (楷体: ("Times New Roman", "FZKai-Z03S")),
  info: (
    // title 与 department 均支持多行。可以使用 \n 分行或使用列表。
    title: ("基于 Typst 的", "华东师范大学学位论文"),
    title-en: "Typst Thesis Template for\nEast China Normal University",
    grade: "20XX",
    student-id: "31415926536",
    author: "张三",
    author-en: "Ming Xing",
    department: ("信息学部", "计算机科学与技术学院"),
    department-en: "School of Computer Science and Technology\nFaculty of Information",
    // 专业 / 专业学位类别
    major: "某专业",
    major-en: "Computer Science",
    // 研究方向 / 专业学位领域
    field: "某方向",
    field-en: "XX Field",
    supervisor: ("李四", "教授"),
    supervisor-en: ("Prof.", "Si Li"),
    supervisor-ii: ("王五", "副教授"),
    // supervisor-ii-en: ("Assoc. Prof.", "Wu Wang"),
    submit-date: datetime.today(),
    // 密级与分类号，按照教务要求，可留白
    secret-level: "",
    clc: "",
  ),
  // 参考文献源
  bibliography: bibliography.with("ref.bib"),

)

// 文稿设置
#show: doc

// 字体展示测试页
// #fonts-display-page()

// 封面页
#cover(
  // 这里的可选参数可以用于调整封面各个字段每一行的长度
  title-line-length: 320pt,
  title-line-length-en: 300pt,
  meta-info-line-length: 200pt,
  meta-info-line-length-en: 230pt,
)

// 声明页
#decl-page()

// 答辩委员会页（仅研究生）
#committee()

// 前言
#show: preface

// 中文摘要
#abstract(
  keywords: ("天行健", "君子以", "自强", "不息")
)[
  滚滚长江东逝水，浪花淘尽英雄。是非成败转头空。青山依旧在，几度夕阳红。白发渔樵江渚上，惯看秋月春风。一壶浊酒喜相逢。古今多少事，都付笑谈中。
]

// 英文摘要
#abstract-en(
  keywords: ("To", "be", "or", "not", "to", "be")
)[
  #lorem(100)
]

// 目录。preface 中的项目均可以通过可选的 outlined 属性控制是否在目录中显示
#outline-page(outlined: false)

// 插图目录
#list-of-figures()

// 表格目录
#list-of-tables()

// 符号表
#notation[
  / DFT: 密度泛函理论 (Density functional theory)
  / DMRG: 密度矩阵重正化群密度矩阵重正化群密度矩阵重正化群 (Density-Matrix Reformation-Group)
  / RAII: 资源获取即初始化 (Resource Acquisition Is Initialization)
]
// 正文
#show: mainmatter

= 导　论

== 列表

=== 无序列表

- 无序列表项一
- 无序列表项二
  - 无序子列表项一
  - 无序子列表项二

=== 有序列表

+ 有序列表项一
+ 有序列表项二
  + 有序子列表项一
  + 有序子列表项二

=== 术语列表

/ 术语一: 术语解释
/ 术语二: 术语解释

== 图表

引用@tbl:timing，引用@tbl:timing-tlt，以及@fig:ecnu-logo。引用图表时，表格和图片分别需要加上 `tbl:`和`fig:` 前缀才能正常显示编号。

#align(center, (stack(dir: ltr)[
  #figure(
    table(
      align: center + horizon,
      columns: 4,
      [t], [1], [2], [3],
      [y], [0.3s], [0.4s], [0.8s],
    ),
    caption: [常规表],
  ) <timing>
][
  #h(50pt)
][
  #figure(
    table(
      columns: 4,
      stroke: none,
      table.hline(),
      [t], [1], [2], [3],
      table.hline(stroke: .5pt),
      [y], [0.3s], [0.4s], [0.8s],
      table.hline(),
    ),
    caption: [三线表],
  ) <timing-tlt>
]))

#figure(
  image("images/ecnu-emblem.svg", width: 20%),
  caption: [这里是图片说明文字。This is the caption for the figure.],
) <ecnu-logo>

== 数学公式

可以像 Markdown 一样写行内公式 $x + y$，以及带编号的行间公式：

$ phi.alt := (1 + sqrt(5)) / 2 $ <ratio>

引用数学公式需要加上 `eqt:` 前缀，则由@eqt:ratio，我们有：

$ F_n = floor(1 / sqrt(5) phi.alt^n) $

我们也可以通过 `<->` 标签来标识该行间公式不需要编号

$ y = integral_1^2 x^2 dif x $ <->

而后续数学公式仍然能正常编号。

$ F_n = floor(1 / sqrt(5) phi.alt^n) $

== 参考文献

可以像这样引用参考文献：图书 #[@蒋有绪1998] 和会议 #[@中国力学学会1990].

== 代码块

代码块支持语法高亮。引用时需要加上 `lst:` @lst:code

#figure(
  ```py
  def add(x, y):
    return x + y
  ```,
  caption:[代码块],
) <code>


= 正　文

// 用于生成占位符。可删除。
#import "@preview/kouhu:0.1.0": kouhu
#kouhu(builtin-text: "zhufu", length: 1348)

== 正文子标题

=== 正文子子标题

// 手动分页示例
#if twoside {
  pagebreak() + " "
}

// 中英双语参考文献
// 默认使用修改后的 gb-7714-2015-numeric-nosup.csl 样式（引用文字非上标格式）。该文件嵌入在模板内。如需使用上标格式，使用 Typst 自带的 gb-t-7714-2015-numeric 即可。
#bilingual-bibliography(full: true, style: "./gb-t-7714-2015-numeric-nosup.csl")

// 致谢
#acknowledgement[
  感谢 #link("https://github.com/nju-lug/modern-nju-thesis")[modern-nju-thesis] 模板。
]

// 手动分页
#if twoside {
  pagebreak() + " "
}

// 附录。可选地，可以重置标题 counter
#show: appendix.with(reset-counter: false)

= 附录

== 附录子标题

=== 附录子子标题

附录内容，这里也可以加入图片，例如@fig:appendix-img。

#figure(
  image("images/ecnu-emblem.svg", width: 20%),
  caption: [图片测试],
) <appendix-img>

= 作者简历及在学期间所取得的科研成果