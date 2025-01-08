#import "@preview/anti-matter:0.1.1": anti-matter

// 前言，重置页面计数器
#let preface(
  // documentclass 传入的参数
  twoside: false,
  // 其他参数
  numbering: ("I", "1", "I"),
  ..args,
  it,
) = {
  // // 分页
  // if (twoside) {
  //   pagebreak() + " "
  // }
  anti-matter(numbering: numbering, ..args, it)
}