// 华东师范大学学位论文模板 modern-ecnu-thesis
// Authors: OrangeX4, jtchen2k
// Repo: https://github.com/jtchen2k/modern-ecnu-thesis
// 在线模板可能不会更新得很及时，如果需要最新版本，请关注 Repo

#import "@preview/anti-matter:0.1.1": fence as mainmatter-end
#import "layouts/doc.typ": doc
#import "layouts/preface.typ": preface
#import "layouts/mainmatter.typ": mainmatter
#import "layouts/appendix.typ": appendix
#import "pages/fonts-display-page.typ": fonts-display-page
#import "pages/bachelor-cover.typ": bachelor-cover
#import "pages/master-cover.typ": master-cover
#import "pages/bachelor-decl-page.typ": bachelor-decl-page
#import "pages/master-decl-page.typ": master-decl-page
#import "pages/master-committee.typ": master-committee
#import "pages/bachelor-abstract.typ": bachelor-abstract
#import "pages/master-abstract.typ": master-abstract
#import "pages/bachelor-abstract-en.typ": bachelor-abstract-en
#import "pages/master-abstract-en.typ": master-abstract-en
#import "pages/bachelor-outline-page.typ": bachelor-outline-page
#import "pages/list-of-figures.typ": list-of-figures
#import "pages/list-of-tables.typ": list-of-tables
#import "pages/notation.typ": notation
#import "pages/acknowledgement.typ": acknowledgement
#import "utils/custom-cuti.typ": *
#import "utils/bilingual-bibliography.typ": bilingual-bibliography
#import "utils/custom-numbering.typ": custom-numbering
#import "utils/custom-heading.typ": heading-display, active-heading, current-heading
#import "utils/indent.typ": indent, fake-par
#import "utils/panic-page.typ": panic-page
#import "@preview/i-figured:0.2.4": show-figure, show-equation
#import "utils/style.typ": 字体, 字号

// 使用函数闭包特性，通过 `documentclass` 函数类进行全局信息配置，然后暴露出拥有了全局配置的、具体的 `layouts` 和 `templates` 内部函数。
#let documentclass(
  doctype: "bachelor", // "bachelor" | "master" | "doctor"，文档类型，默认为本科生 bachelor
  degree: "academic", // "academic" | "professional"，学位类型，默认为学术型 academic
  nl-cover: false, // TODO: 是否使用国家图书馆封面，默认关闭
  twoside: false, // 双面模式，会加入空白页，便于打印
  anonymous: false, // 盲审模式
  bibliography: none, // 原来的参考文献函数
  fonts: (:), // 字体，应传入「宋体」、「黑体」、「楷体」、「仿宋」、「等宽」
  info: (:),
) = {
  // 默认参数
  fonts = 字体 + fonts
  info = (
    title: ("基于 Typst 编写的", "华东师范大学学位论文"),
    title-en: "Typst Thesis Template for\nEast China Normal University",
    grade: "20XX",
    student-id: "1234567890",
    author: "张三",
    author-en: "Zhang San",
    department: "某学院",
    department-en: "XX Department",
    major: "某专业",
    major-en: "XX Major",
    field: "某方向",
    field-en: "XX Field",
    supervisor: ("李四", "教授"),
    supervisor-en: ("Professor", "Li Si"),
    supervisor-ii: (),
    supervisor-ii-en: (),
    submit-date: datetime.today(),
    // 以下为研究生项
    defend-date: datetime.today(),
    confer-date: datetime.today(),
    bottom-date: datetime.today(),
    clc: "",
    secret-level: "",
    supervisor-contact: "华东师范大学 上海市普陀区中山北路 3663 号",
    email: "example@stu.ecnu.edu.cn",
    school-code: "10269",
    degree: auto,
    degree-en: auto,
  ) + info

  (
    // 将传入参数再导出
    doctype: doctype,
    degree: degree,
    nl-cover: nl-cover,
    twoside: twoside,
    anonymous: anonymous,
    fonts: fonts,
    info: info,
    // 页面布局
    doc: (..args) => {
      doc(..args, info: info + args.named().at("info", default: (:)))
    },
    preface: (..args) => {
      preface(twoside: twoside, ..args)
    },
    mainmatter: (..args) => {
      if doctype == "master" or doctype == "doctor" {
        mainmatter(doctype: doctype, twoside: twoside, display-header: true, ..args, fonts: fonts + args.named().at("fonts", default: (:)))
      } else {
        mainmatter(twoside: twoside, ..args, fonts: fonts + args.named().at("fonts", default: (:)))
      }
    },
    mainmatter-end: (..args) => {
      mainmatter-end(..args)
    },
    appendix: (..args) => {
      appendix(..args)
    },
    // 字体展示页
    fonts-display-page: (..args) => {
      fonts-display-page(twoside: twoside, ..args, fonts: fonts + args.named().at("fonts", default: (:)))
    },
    // 封面页，通过 type 分发到不同函数
    cover: (..args) => {
      if doctype == "master" or doctype == "doctor" {
        master-cover(
          doctype: doctype,
          degree: degree,
          nl-cover: nl-cover,
          anonymous: anonymous,
          twoside: twoside,
          ..args,
          fonts: fonts + args.named().at("fonts", default: (:)),
          info: info + args.named().at("info", default: (:)),
        )
      } else if doctype == "postdoc" {
        panic("postdoc has not yet been implemented.")
      } else {
        bachelor-cover(
          anonymous: anonymous,
          twoside: twoside,
          ..args,
          fonts: fonts + args.named().at("fonts", default: (:)),
          info: info + args.named().at("info", default: (:)),
        )
      }
    },
    // 声明页，通过 type 分发到不同函数
    decl-page: (..args) => {
      if doctype == "master" or doctype == "doctor" {
        master-decl-page(
          anonymous: anonymous,
          twoside: twoside,
          ..args,
          fonts: fonts + args.named().at("fonts", default: (:)),
          info: info + args.named().at("info", default: (:)),
          doctype: doctype,
        )
      } else if doctype == "postdoc" {
        panic("postdoc has not yet been implemented.")
      } else {
        bachelor-decl-page(
          anonymous: anonymous,
          twoside: twoside,
          ..args,
          fonts: fonts + args.named().at("fonts", default: (:)),
          info: info + args.named().at("info", default: (:)),
        )
      }
    },
    committee: (..args) => {
      if doctype == "master" or doctype == "doctor" {
        master-committee(
          doctype: doctype,
          anonymous: anonymous,
          twoside: twoside,
          ..args,
          fonts: fonts + args.named().at("fonts", default: (:)),
          info: info + args.named().at("info", default: (:)),
        )
      } else {
        panic-page("committee page has not yet been implemented for bachelors.")
      }
    },
    // 中文摘要页，通过 type 分发到不同函数
    abstract: (..args) => {
      if doctype == "master" or doctype == "doctor" {
        master-abstract(
          doctype: doctype,
          degree: degree,
          anonymous: anonymous,
          twoside: twoside,
          ..args,
          fonts: fonts + args.named().at("fonts", default: (:)),
          info: info + args.named().at("info", default: (:)),
        )
      } else if doctype == "postdoc" {
        panic("postdoc has not yet been implemented.")
      } else {
        bachelor-abstract(
          anonymous: anonymous,
          twoside: twoside,
          ..args,
          fonts: fonts + args.named().at("fonts", default: (:)),
          info: info + args.named().at("info", default: (:)),
        )
      }
    },
    // 英文摘要页，通过 type 分发到不同函数
    abstract-en: (..args) => {
      if doctype == "master" or doctype == "doctor" {
        master-abstract-en(
          doctype: doctype,
          degree: degree,
          anonymous: anonymous,
          twoside: twoside,
          ..args,
          fonts: fonts + args.named().at("fonts", default: (:)),
          info: info + args.named().at("info", default: (:)),
        )
      } else if doctype == "postdoc" {
        panic("postdoc has not yet been implemented.")
      } else {
        bachelor-abstract-en(
          anonymous: anonymous,
          twoside: twoside,
          ..args,
          fonts: fonts + args.named().at("fonts", default: (:)),
          info: info + args.named().at("info", default: (:)),
        )
      }
    },
    // 目录页
    outline-page: (..args) => {
      if (doctype == "bachelor") {
        bachelor-outline-page(twoside: twoside, ..args, fonts: fonts + args.named().at("fonts", default: (:)))
      } else {
        bachelor-outline-page(
          twoside: twoside,
          title-text-args: (font: 字体.黑体, size: 字号.三号, weight: "bold"),
          ..args,
          vspace: (1.5em, 1em),
          indent: (0em, 0.5em, 1em),
          fonts: fonts + args.named().at("fonts", default: (:)),
          doctype: doctype,
          show-heading: true,
        )
      }
    },

    // 插图目录页
    list-of-figures: (..args) => {
      list-of-figures(
        twoside: twoside,
        show-heading: doctype != "bachelor",
        title-text-args: (font: 字体.黑体, size: 字号.三号, weight: "bold"),
        doctype: doctype,
        ..args,
        fonts: fonts + args.named().at("fonts", default: (:)),
      )
    },

    // 表格目录页
    list-of-tables: (..args) => {
      list-of-tables(
        twoside: twoside,
        doctype: doctype,
        show-heading: doctype != "bachelor",
        title-text-args: (font: 字体.黑体, size: 字号.三号, weight: "bold"),
        ..args,
        fonts: fonts + args.named().at("fonts", default: (:)),
      )
    },

    // 符号表页
    notation: (..args) => {
      notation(
        ..args,
        twoside: twoside,
        show-heading: doctype != "bachelor",
        title-text-args: (font: 字体.黑体, size: 字号.三号, weight: "bold"),
        doctype: doctype,
        fonts: fonts + args.named().at("fonts", default: (:)),
      )
    },

    // 参考文献页
    bilingual-bibliography: (..args) => {
      bilingual-bibliography(
        bibliography: bibliography,
        ..args,
      )
    },

    // 致谢页
    acknowledgement: (..args) => {
      acknowledgement(
        anonymous: anonymous,
        twoside: twoside,
        ..args,
      )
    },
  )
}
