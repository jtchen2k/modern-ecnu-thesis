/*
 * master-committe.typ
 *
 * @project: modern-ecnu-thesis
 * @author: Juntong Chen (dev@jtchen.io)
 * @created: 2025-01-05 01:36:20
 * @modified: 2025-01-07 03:00:51
 *
 * Copyright (c) 2025 Juntong Chen. All rights reserved.
 */
#import "../utils/style.typ": 字号, 字体

#let master-committee(doctype: "master", anonymous: false, twoside: false, fonts: (:), info: (:)) = {
  info = (committee-members: (("赵六", "教授", "华东师范大学", "主席"),)) + info

  fonts = 字体 + fonts

  pagebreak(weak: true)

  set align(center)

  text(
    font: 字体.黑体,
    size: 字号.三号,
    weight: "bold",
    [#info.author#if doctype == "master" { "硕士" } else { "博士" }学位论文答辩委员会成员名单],
  )

  v(3em)

  set text(font: 字体.宋体, size: 字号.小四)

  table(
    columns: (1fr, 1fr, 2.5fr, 1fr),
    inset: (x: 0.25em, y: 0.85em),
    stroke: 0.5pt + black,
    [*姓名*],
    [*职称*],
    [*华东师范大学*],
    [*备注*],
    ..info.committee-members.flatten(),
  )

  if twoside {
    pagebreak() + " "
  }

}