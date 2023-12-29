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
