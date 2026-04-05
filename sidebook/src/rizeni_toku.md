# Řízení toku

Nejznámější příkaz pro řízeni toku `if`, jsme si již uvedli v kapitole [Syntaxe](uvod.md#sec:syntax). Schématicky si jej proto pouze připomeneme:

- `if` <výraz>: <vnořený blok>

  - 0+ `elif` <výraz>: <vnořený blok>

  - volitelně: `else:` <vnořený blok>

Pro vytvoření cyklů nám v jazyce Python slouží dvě konstrukce: `while` a `for`.

## Cyklus `while`

Cyklus `while` funguje podobně jako jsme zvyklí z jazyka C. Na začátku máme dánu podmínku iterace. Je-li podmínka splněna, je vykonáno tělo cyklu, v opačném případě je cyklus přeskočen a pokračuje se dále v programu. V těle cyklu můžeme použít klíčová slova `break` a `continue`. Slovo `break` zapříčiní ukončení cyklu. Slovo `continue` zapříčiní přeskočení zbytku těla cyklu a tím pádem vykonání dalšího cyklu za předpokladu, že je splněna vstupní podmínka.

```python
In [1]: i = 0

In [2]: while i < 5:
   ....:     print(i)
   ....:     i += 1
   ....:

0
1
2
3
4
```

## Cyklus `for`

Cyklus `for` je v jazyce Python poněkud odlišný od svého ekvivalentu v jazyce C. Jeho sémantika je podobná jako u příkazu `foreach` v jazycích Java nebo C#. Cyklus `for` je schopen procházet pouze sekvence, o kterých jsme si něco řekli v části [Sekvence](promenne_a_typy.md#sec:sequnces). Podstatným rozdílem oproti cyklu `for` z jazyka C je to, že řídící proměnná cyklu postupně nabývá jednotlivých hodnot v zadané sekvenci. Odpadá tak nutnost přistupovat k prvkům sekvence pomocí nějaké jiné proměnné. Zápis je také podstatně jednodušší. Ukažme si proto jednoduchý příklad na součet prvků v seznamu.

```python
seznam = [1, 2, 5, 10, 100]

sum = 0

for prvek in seznam:
    sum += prvek

sum #118
```

I v cyklu `for` můžeme použít klíčová slova `break` a `continue`. Ukažme si tedy příklad, kdy jsou v seznamu uloženy i hodnoty jiného typu než `int` nebo `float`, a které samozřejmě spolu nemůžeme sčítat.

```python
seznam = [1.5, 2, 'Ahoj', 10, 3+5j]

sum = 0

for prvek in seznam:
    if type(prvek) == int or type(prvek) == float:
       sum += prvek

sum # 13.5
```
