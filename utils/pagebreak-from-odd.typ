#import "@preview/anti-matter:0.1.1": core

#let pagebreak-from-odd(twoside: false) = {
  context {
    if twoside and calc.rem(here().page(), 2) == 0 {
      core.outer-counter().update(prev => if prev > 0 { prev - 1} else { prev })
    }
  }
  set page(footer: { text(size: 0pt, ".") })
  pagebreak(weak: true, to: if twoside { "odd" })
}