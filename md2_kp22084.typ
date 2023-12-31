= Automātu teorijas 2. mājasdarbs

Krišjānis Petručeņa kp22084

== 1. uzdevums

Stāvokļu kopa $Q={s_0, s_1, s_2}$. Ieejas alfabēts $X={0,1}$. Steka alfabēts $S={z, dollar}$.

Sākuma stāvoklis $q_0=s_0$. Steka beigu simbols $dollar$. Akceptējošo stāvokļu kopa $Q_A = {s_0}$.


#grid(columns:(1.05fr,0.95fr), gutter: 10pt,
table(
  columns: (auto, auto, auto, auto, auto),
  inset: 5pt,
  align: center,
  stroke: gray,
  [Stāv. $q$], [Ieeja $x$], [Simb. no],[Mērķis],[Virkne uz],
  [$s_0$], [$epsilon$], [$dollar$], [$s_1$], [$z dollar$],
  [$s_1$], [$0$], [$z$], [$s_1$], [$z z z$],
  [$s_1$], [$epsilon$], [$z$], [$s_2$], [$epsilon$],
  [$s_2$], [$1$], [$z$], [$s_2$], [$epsilon$],
  [$s_2$], [$0$], [$z$], [$s_0$], [$epsilon$],
  [$s_2$], [$1$], [$z$], [$s_1$], [$z z$],
),
align(center,image("./automata_md2_kp22084.drawio.png", height: auto))
)

Valodas vārdi ar garumu $<= 4$: "$epsilon$" "00" "000" "0000" "0010" "010" "0100" "0110".


Rezultāts iegūts ar šo kodo:
#text(link("https://github.com/KrisjanisP/lu-automata-md2/blob/main/codes/1.cpp"),fill:blue)

== 2. uzdevums (a)

Jāuzbūvē akceptors, kurš akceptē vārdus, kuros apakšvirknes "010" ir mazāk nekā "000".

Stāvokļu kopa $Q={s_0, s_1, s_2, s_3, s_4, s_5, s_6, s_7}$. Ieejas alfabēts $X={0,1}$. Steka alfabēts $S={a, b, dollar}$. Sākuma stāvoklis $q_0=s_0$. Steka beigu simbols $dollar$. Akceptējošo stāvokļu kopa $Q_A = {s_7}$. Idejiski stekā jebkurā brīdī atrodas $a$ un $dollar$ vai $b$ un $dollar$ vai $dollar$. Ja stekā ir $a$, tas nozīmē, ka "000" ir vairākumā. Ja stekā ir $b$, tas nozīmē, ka "010" ir vairākumā. Ja stekā ir $dollar$, tas nozīmē, ka "010" un "000" ir vienādi daudz. Diagramma:

#align(center,image("./automata_md2_kp22084_2.drawio.png", height: 40%))

#block(breakable: false,
[Pārejas funkcijas tabula:

#table(
  columns: (auto, auto, auto, auto, auto),
  inset: 5pt,
  align: center,
  stroke: gray,
  [Stāv. $q$],  [Ieeja $x$],  [Simb. no],   [Mērķis], [Virkne uz],
  [$s_0$],      [$0$],        [$dollar$],   [$s_1$],  [$dollar$],
  [$s_0$],      [$1$],        [$dollar$],   [$s_2$],  [$dollar$],
  [$s_1$],      [$0$],        [$dollar$],   [$s_3$],  [$dollar$],
  [$s_1$],      [$1$],        [$dollar$],   [$s_4$],  [$dollar$],
  [$s_2$],      [$0$],        [$dollar$],   [$s_5$],  [$dollar$],
  [$s_2$],      [$1$],        [$dollar$],   [$s_6$],  [$dollar$],
  [$s_3$],      [$0$],        [$dollar$],   [$s_3$],  [$a dollar$],
  [$s_3$],      [$0$],        [$a$],        [$s_3$],  [$a a$],
  [$s_3$],      [$0$],        [$b$],        [$s_3$],  [$epsilon$],
  [$s_3$],      [$1$],        [$dollar$],   [$s_4$],  [$dollar$],
  [$s_3$],      [$1$],        [$a$],        [$s_4$],  [$a$],
  [$s_3$],      [$1$],        [$b$],        [$s_4$],  [$b$],
  [$s_4$],      [$0$],        [$dollar$],   [$s_5$],  [$b dollar$],
  [$s_4$],      [$0$],        [$a$],        [$s_5$],  [$epsilon$],
  [$s_4$],      [$0$],        [$b$],        [$s_5$],  [$b b$],
  [$s_4$],      [$1$],        [$dollar$],   [$s_6$],  [$dollar$],
  [$s_4$],      [$1$],        [$a$],        [$s_6$],  [$a$],
  [$s_4$],      [$1$],        [$b$],        [$s_6$],  [$b$],
  [$s_5$],      [$0$],        [$dollar$],   [$s_3$],  [$dollar$],
  [$s_5$],      [$0$],        [$a$],        [$s_3$],  [$a$],
  [$s_5$],      [$0$],        [$b$],        [$s_3$],  [$b$],
  [$s_5$],      [$1$],        [$dollar$],   [$s_4$],  [$dollar$],
  [$s_5$],      [$1$],        [$a$],        [$s_4$],  [$a$],
  [$s_5$],      [$1$],        [$b$],        [$s_4$],  [$b$],
  [$s_6$],      [$0$],        [$dollar$],   [$s_5$],  [$dollar$],
  [$s_6$],      [$0$],        [$a$],        [$s_5$],  [$a$],
  [$s_6$],      [$0$],        [$b$],        [$s_5$],  [$b$],
  [$s_6$],      [$1$],        [$dollar$],   [$s_6$],  [$dollar$],
  [$s_6$],      [$1$],        [$a$],        [$s_6$],  [$a$],
  [$s_6$],      [$1$],        [$b$],        [$s_6$],  [$b$],
  [$s_3$],      [$epsilon$],        [$a$],        [$s_7$],  [$epsilon$],
  [$s_4$],      [$epsilon$],        [$a$],        [$s_7$],  [$epsilon$],
  [$s_5$],      [$epsilon$],        [$a$],        [$s_7$],  [$epsilon$],
  [$s_6$],      [$epsilon$],        [$a$],        [$s_7$],  [$epsilon$],

)]
)

#pagebreak()

== 2. uzdevums (b)

Pumpēšanas lemma: ja $A$ ir regulāra valoda, tad eksistē vesels skaitlis $p$ (pumpēšanas garums),
ka, ja $s in A$ un $|s| >= p$, tad $s=x y z$ tā, ka izpildās:
$ forall i >= 0 (x y^i z in A) and (|y| > 0) and (|x y| <= p) $

Valodu, kurā apakšvirknes "000" ir vairāk nekā "010" apzīmēsim ar A.

Apskatīsim $s=$"$00(0)^(p+1) 11 0(10)^(p)$", kur $s in A$. Vardā $s$ apakšvirkne "$000$" parādās tieši vienu reizi vairāk nekā "$010$".

Pēc nosacījuma $|x y| <= p$ skaidrs, ka $y$ var saturēt tikai nulles.

Kad $i=0$ jeb $s=x z$, $x z$ nevar saturēt vairāk nekā $p+2$ nulles prefiksā, jo $|y|>0$, līdz ar to iegūta pretruna, jo apakšvirknes "$000$" ir ne vairāk kā $p$ (tik ir arī apakšvirkņu "$010$").

== 3. uzdevums (a)

#grid(columns:(1fr,1fr), gutter: 10pt,
table(
  columns: (auto, auto, auto, auto),
  inset: 10pt,
  align: center,
  stroke: gray,
  [Stāv. $q$], [Ieeja $x$], [Mērķis],[Varbūtība],
  [$s_0$], [$a$], [$s_1$], [$1$],
  [$s_0$], [$b$], [$s_0$], [$1/7$],
  [$s_0$], [$b$], [$s_1$], [$6/7$],
  [$s_1$], [$a$], [$s_0$], [$1$],
  [$s_1$], [$b$], [$s_0$], [$1/7$],
  [$s_1$], [$b$], [$s_1$], [$6/7$],
),
align(center,image("./automata_md2_kp22084_3.drawio.png", height: auto))
)

$Q = {s_0, s_1}$  - stāvokļu kopa.
$X = {a, b}$   - ieejas alfabēts.
$q_0 = s_0$  - sākumstāvoklis.
$Q_A = {s_0}$  - akceptējošo stāvokļu kopa.
$λ = 0.5$    - akceptēšanas slieksnis.

Valodas vārdi garumā $<= 4$: "$epsilon$",
"aa",
"ba",
"aba",
"bba",
"aaaa",
"aaba",
"abba",
"baaa",
"baba",
"bbba".

Rezultāts iegūts ar šo kodo:
#text(link("https://github.com/KrisjanisP/lu-automata-md2/blob/main/codes/3.py"),fill:blue)

== 3. uzdevums (b)

#grid(columns:(1fr,1fr), gutter: 10pt,[
Automātā iespējams veikt novērojumu, ka pēc $b$ atkārtotas ievades varbūtību sadalījums nemainās. Precīzāk pēc $b$ ievades vienmēr tiek iegūts viens un tas pats varbūtību sadalījums: $s_0$ iegūst varbūtību $1/7$, bet $s_1$ iegūst varbūtību $6/7$. No šī sadalījumu citu var iegūt tikai pēc nepāra skaita $a$ ievades. Balstoties uz šiem novērojumiem ir iespējams izveidot DFA. 

Ja ir iespējams uzbūvēt DFA, tad tā ir regulāra valoda.

],[
#align(center,image("./automata_md2_kp22084_3b.drawio.png", height: 20%))

])

== 4. uzdevums

Jāuzbūvē varbūtiskais akceptors, kurš akceptē tādus un tikai tādus vārdus, kuros $a$ burtu skaits ir 3, $b$ burtu skaits ir 14.

Risinājums:

$Q = {s_0, s_1, s_2, s_3, s_4, s_5, s_6, s_7, s_8, s_9}$  - stāvokļu kopa.
$X = {a, b}$   - ieejas alfabēts.
$q_0 = s_0$  - sākumstāvoklis.
$Q_A = {s_4, s_5, s_9}$  - akceptējošo stāvokļu kopa.

$λ = 0.5+0.31479=0.81479$   - akceptēšanas slieksnis.

#block(breakable: false,[
Diagramma:

#align(center,image("./automata_md2_kp22084_4.drawio.png", height: 40%))
])

#grid(columns:(1fr,1fr), gutter: 10pt,[
Apskatot $s_5$ un $s_4$ summu pie dažādiem b skaitiem, pīķis tiek sasniegts pie 14.

Vērtība ($s_5+s_4$) pie $b=1$ ir $0.25$, pie $b=13$ ir $0.31448$, pie $b=14$ ir $0.31479$, pie $b=15$ ir $0.31472$.
],[
#align(center,image("./automata_md2_kp22084_4_plot.png", height: auto))
])


#block(breakable: false,
[Pārejas funkcijas tabula:

#table(
  columns: (auto, auto, auto, auto),
  inset: 5pt,
  align: center,
  stroke: gray,
  [Stāv. $q$],  [Ieeja $x$],  [Mērķis], [Varbūtība],
  [$s_0$], [$a$], [$s_1$], [$0.5$],
  [$s_0$], [$a$], [$s_7$], [$0.5$],
  [$s_0$], [$b$], [$s_2$], [$0.5$],
  [$s_0$], [$b$], [$s_3$], [$0.25$],
  [$s_0$], [$b$], [$s_4$], [$0.25$],
  [$s_1$], [$a$], [$s_1$], [$1$],
  [$s_1$], [$b$], [$s_3$], [$0.5$],
  [$s_1$], [$b$], [$s_5$], [$0.5$],
  [$s_2$], [$a$], [$s_7$], [$1$],
  [$s_2$], [$b$], [$s_2$], [$1$],
  [$s_3$], [$a$], [$s_3$], [$1$],
  [$s_3$], [$b$], [$s_3$], [$0.9$],
  [$s_3$], [$b$], [$s_4$], [$0.1$],
  [$s_4$], [$a$], [$s_4$], [$1$],
  [$s_4$], [$b$], [$s_4$], [$1$],
  [$s_5$], [$a$], [$s_5$], [$1$],
  [$s_5$], [$b$], [$s_5$], [$0.95$],
  [$s_5$], [$b$], [$s_6$], [$0.05$],
  [$s_6$], [$a$], [$s_6$], [$1$],
  [$s_6$], [$b$], [$s_6$], [$1$],
  [$s_7$], [$a$], [$s_8$], [$1$],
  [$s_7$], [$b$], [$s_7$], [$1$],
  [$s_8$], [$a$], [$s_9$], [$1$],
  [$s_8$], [$b$], [$s_8$], [$1$],
  [$s_9$], [$a$], [$s_6$], [$1$],
  [$s_9$], [$b$], [$s_9$], [$1$],
)]
)