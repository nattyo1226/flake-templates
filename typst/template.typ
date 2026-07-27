#let Sabiasagi = rgb("#5c9291")
#let Shironezu = rgb("#dcdddd")

#let project(
  title: [],
  subtitle: [],
  affiliations: (),
  authors: (),
  date: datetime.today(),
  table-of-contents: true,
  body,
) = {
  set page(
    numbering: "1",
    number-align: center,
  )

  set heading(
    numbering: "1.1 ",
  )
  show heading: set block(below: 1em)

  set par(
    justify: true,
    spacing: 1em,
  )

  set text(
    font: ("New Computer Modern", "Source Han Serif"),
    size: 10pt,
    lang: "ja",
  )

  show raw: set text(font: "PlemolJP")
  show raw.where(block: false): box.with(
    fill: Shironezu,
    inset: (x: 3pt, y: 0pt),
    outset: (y: 3pt),
    radius: 2pt,
  )

  show math.equation: set text(font: ("New Computer Modern Math", "Source Han Serif"))

  show link: set text(fill: Sabiasagi)

  set list(
    indent: 1em,
  )

  set enum(
    indent: 1em,
  )

  align(center)[
    #text(16pt)[#title]
    #if subtitle != () {
      linebreak()
      text(12pt)[#subtitle]
    }
    #v(6pt)
    #if affiliations != () {
      text(12pt)[#affiliations]
      linebreak()
    }
    #text(12pt)[#authors]
    #v(6pt)
    #text(12pt)[#date.display()]
  ]

  if table-of-contents {
    outline()
    pagebreak()
  } else {
    v(12pt)
  }

  body
}
