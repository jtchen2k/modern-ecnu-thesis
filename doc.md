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

### ⚠️ 注意事项

1. 两种格式不能混用，否则会导致图片编号出现问题
2. 使用双语图片标题时，需要手动维护 `manual-number` 参数以确保编号的正确性
3. 目前双语图片标题不支持引用功能

### 选择建议

- 如果论文全程只需要单语言标题，建议使用普通图片标题格式
- 如果需要中英双语标题，则使用 `bilingual-figure`，但需要手动管理编号
