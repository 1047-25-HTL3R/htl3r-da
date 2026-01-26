#import "../util.typ": format-date, insert-blank-page

#let create-page(
  authors,
  date,
  generative-ai-clause,
) = [
  = Ehrenwörtliche Erklärung
  Hiermit versichere ich, dass ich die vorliegende Arbeit selbstständig verfasst und keine
  anderen Hilfsmittel als die angegebenen benützt habe. Die Stellen, die anderen Werken
  (gilt ebenso für Werke aus elektronischen Datenbanken oder aus dem Internet) wörtlich
  oder sinngemäß entnommen sind, habe ich unter Angabe der Quelle und Einhaltung der
  Regeln wissenschaftlichen Zitierens kenntlich gemacht. Diese Versicherung umfasst auch
  in der Arbeit verwendete bildliche Darstellungen, Tabellen, Skizzen und Zeichnungen.

  Die verwendeten Hilfsmittel wurden vollständig und wahrheitsgetreu inkl. Produktversion
  und Prompt ausgewiesen.

  Für die Erstellung g der Arbeit habe ich auch folgende Hilfsmittel generativer KI-Tools ... (z. B. ChatGPT, Grammarly Go, Midjourney) zu folgendem Zweck verwendet: [Bitte hier Einsatzgebiet anführen.]. Die verwendeten Hilfsmittel wur-den vollständig und wahrheitsgetreu inkl. Produktversion und Prompt ausgewiesen.

  #if generative-ai-clause == none [
    Es wurden keine Hilfsmittel generativer KI-Tools für die Erstellung der Arbeit verwendet.
  ] else [
    #generative-ai-clause
  ]
  #v(2em)
  Wien, am #format-date(date)
  #v(5em)
  #let fields = authors.map(author => {
    box(
      block(
        width: 7.5cm,
        height: 1cm,
        stroke: (
          top: 0.5pt + black,
        ),
      )[#align(center + horizon)[
        #author.name
      ]],
    )
  })
  #let fields = (
    fields
      .chunks(2)
      .map(a => [
        #let first = a.first()
        #let last = if a.len() == 2 { a.last() } else {
          box(block(width: 7cm, height: 1cm))
        }
        #block(width: 100%)[#first #h(1fr) #last #v(2cm)]
      ])
  )
  #for field in fields [
    #field
  ]
]
