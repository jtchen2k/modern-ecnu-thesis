# 华东师范大学学位论文 Typst 模板 modern-encu-thesis

这里是华东师范大学学位论文的 Typst 模板。

本项目 fork 自 [OrangeX4](https://github.com/Orangex4) 开发的 [modern-nju-thesis](https://github.com/nju-lug/modern-nju-thesis) 项目。相比原项目，我们严格适配了华东师范大学本科及硕士学位论文的格式要求。

对于研究生，我们参考华东师范大研究生院于 2023 年发布的[华东师范大学博士、硕士学位论文基本格式要求](https://yjsy.ecnu.edu.cn/8e/62/c42090a429666/page.htm)；对于本科生，我们参考华东师范大学教务处于 2021 年更新的[华东师范大学本科生毕业论文（设计）格式要求](http://www.jwc.ecnu.edu.cn/d4/be/c40573a513214/page.htm)。后续使用的同学请留意参考校方的最新通知。


![](imgs/editor.png)

## Tips

- Typst 支持的图片格式包括 png, jpeg, gif 与 svg，不支持 pdf 与 eps。你可以使用 InkSpace:

```bash
inkscape \
--without-gui \
--file=input.pdf \
--export-plain-svg=output.svg
```

- Typst 有一套自己的公式语法，与 LaTeX 大同小异且更加简洁。如果你已经十分熟悉 LaTeX 的语法并希望使用，可以使用 [MiTeX](https://github.com/mitex-rs/mitex) 工具，它将帮你在 Typst 中使用熟悉的 LaTeX 公式。
- Typst 原生兼容了 biblatex 引用格式，直接修改 ref.bib 即可。

更多 Typst 的介绍、学习资料与项目背景可参考[上游项目](https://github.com/nju-lug/modern-nju-thesis)的 README。

## Contribution

与华东师范大学格式标准相关的请求欢迎在这里发起 issue 或 PR。项目本身的优化与建议请前往[上游项目](https://github.com/nju-lug/modern-nju-thesis) 参与讨论，这样可以帮助到更多该项目的未来用户。

## References

- [modern-nju-thesis](https://github.com/nju-lug/modern-nju-thesis) by [OrangeX4](https://github.com/Orangex4)
- [ECNU-Undergraduate-LaTeX](https://github.com/YijunYuan/ECNU-Undergraduate-LaTeX) by [YijunYuan](https://github.com/YijunYuan)
- [华东师范大学硕士论文模板-2023](https://www.overleaf.com/latex/templates/hua-dong-shi-fan-da-xue-shuo-shi-lun-wen-mo-ban-2023/ctvnwyqtsbbz) by ivyee17
- [关于2023-2024学年第二学期学术型学位硕士研究生论文答辩及学位申请工作的通知](https://yjsy.ecnu.edu.cn/c1/7a/c42079a573818/page.htm) by 华东师范大学研究生院
- [毕业论文常用下载材料](http://www.jwc.ecnu.edu.cn/d4/be/c40573a513214/page.htm) by 华东师范大学教务处
- [学校标识](https://www.ecnu.edu.cn/wzcd/xxgk/xxbs.htm) by 华东师范大学

## License

This project is licensed under the MIT License.