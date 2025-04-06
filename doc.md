## 双语图片标题使用说明

本模板支持两种图片标题格式：普通图片标题和双语图片标题。需要注意的是，目前这两种格式**不能同时使用**，请根据需求选择其中一种。

### 1. 普通图片标题

使用 Typst 原生的 `figure` 语法:

```typst
#figure(
  placement: top,  // 控制图片位置
  caption: [图片标题],
)[
  #image("path/to/image.png", width: 80%)
] <fig:label>
```

### 2. 双语图片标题

使用模板提供的 `bilingual-figure` 函数:

```typst
#bilingual-figure(
  image("path/to/image.png", width: 80%),
  caption: "中文标题",
  caption-en: "English Caption",
  manual-number: "1.1"  // 需要手动指定编号
)
```

### 3. 切换图表标题格式

要在普通图表标题和双语图表标题之间切换，需要修改 `mainmatter.typ` 中的相关代码:

```typst
// 显示带编号的普通图表标题(默认被注释)
show figure.caption: c => block(inset: (top: figure-caption-spacing, bottom: figure-caption-spacing))[
  #set align(left)
  #text(font: fonts.宋体, weight: "regular", style: "normal")[
    #c.supplement #context c.counter.display(c.numbering)
  ]
  #h(0.3em)#c.body
]

// 显示不带编号的双语图表标题(默认启用)
show figure.caption: c => block(inset: (top: figure-caption-spacing, bottom: figure-caption-spacing))[
  #set align(left)
  #c.body
]
```

使用普通图表标题时:
1. 注释掉双语图表标题的代码块
2. 取消注释普通图表标题的代码块

使用双语图表标题时:
1. 注释掉普通图表标题的代码块
2. 取消注释双语图表标题的代码块

注意：两种格式不要同时启用,否则会导致图表编号混乱。

### ⚠️ 注意事项

1. 两种格式不能混用，否则会导致图片编号出现问题
2. 使用双语图片标题时，需要手动维护 `manual-number` 参数以确保编号的正确性
3. 目前双语图片标题不支持引用功能

### 选择建议

- 如果论文全程只需要单语言标题，建议使用普通图片标题格式
- 如果需要中英双语标题，则使用 `bilingual-figure`，但需要手动管理编号
