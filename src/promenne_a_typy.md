# Proměnné

V dynamicky typovaných jazycích nedeklarujeme typy použitých proměnných jako třeba v jazycích C/C++, Java, apod. Nebuďme však uvedeni v omyl, že by proměnné neměly svůj typ! Typy jednotlivých proměnných jsou rozlišeny za běhu. V jazyce Python není možné, aby proměnná neměla přiřazen nějaký typ.

Proměnnou vytvoříme jednoduchým přiřazením nějaké hodnoty do jejího jména. Na následujícím výpisu kódu je ukázáno, jak vytvořit proměnnou, zjistit její datový typ a dále do ní přiřadit jinou hodnotu jiného datového typu.

```python
In [1]: promenna
-----------------------------------------------------------
NameError                 Traceback (most recent call last)
<ipython-input-2-4c4614e58bc8> in <module>()
----> 1 promenna

NameError: name 'promenna' is not defined

In [2]: promenna = 1

In [3]: promenna
Out[3]: 1

In [4]: type(promenna)
Out[4]: int

In [5]: promenna = 1.0

In [6]: type(promenna)
Out[6]: float

In [7]: promenna = "Toto je text."

In [8]: type(promenna)
Out[8]: str

In [9]: promenna = True

In [10]: type(promenna)
Out[10]: bool

In [11]: promenna = False

In [12]: type(promenna)
Out[12]: bool
```

Na výše uvedeném výpisu je použit interpret **iPython**{{sidenote: http://ipython.org/}}, který poskytuje větší uživatelský komfort než standardní interpret. Řádek `1` demonstruje, že pokud do proměnné `promenna` neuložíme nějakou hodnotu, její jméno neexistuje a ani jej nemůžeme referovat. Také můžeme vidět, že tento příkaz vyhodil výjimku `NameError`. Pro teď nám bude stačit konstatovat, že všechny chyby v jazyce Python budou interpretem vyhodnoceny jako výjimky. Díky tomu je také můžeme jednoduše ošetřit. Na řádku `2` vidíme přiřazení hodnoty `1` do proměnné `promenna`. Na řádku `3` vidíme, že pokud použijeme jméno proměnné, dostaneme její hodnotu. Na řádku `4` se ptáme na typ proměnné pomocí funkce `type`. Na řádku `5` jsme přiřadili do proměnné hodnotu typu `float` a na řádku `7` hodnotu typu `str`, která je zkratkou pro typ string. Na řádcích `9` a `11` vidíme použití pravdivostní hodnoty `True` a `False`, které jsou datového typu `bool`.

Na výše uvedeném výpisu programu můžeme vidět první základní vlastnost dynamicky typovaných jazyků a to tu, že proměnná, která má přiřazenu nějakou hodnotu a s ní nějaký datový typ může v průběhu programu tento typ změnit. Samozřejmě to není vlastnost jediná, ale je to vlastnost, která je nejčastěji vidět.

V interpretu můžeme provádět klasické operace s proměnnými tak, jak jsme zvyklí z běžných jazyků (tím myslíme operace sčítání, násobení, apod.). Nezapomeňme, že dělení dvou celých čísel je opět celé číslo. Dělení celých čísel se tedy chová stejně jako v jazyce C.

To, že proměnné nemají předem určený typ však neznamená, že bychom mohli provádět nedefinované operace. Uveďme si jednoduchý příklad.

```python
In [13]: 123 + "Ahoj"
----------------------------------------------------------
TypeError                Traceback (most recent call last)
<ipython-input-13-4d72da21761a> in <module>()
----> 1 123 + "Ahoj"

TypeError: unsupported operand type(s) for +: 'int' and 'str'

In [14]: a = 123

In [15]: b = "Ahoj"

In [16]: a + b
----------------------------------------------------------
TypeError                Traceback (most recent call last)
<ipython-input-16-f96fb8f649b6> in <module>()
----> 1 a + b

TypeError: unsupported operand type(s) for +: 'int' and 'str'
```

Na příkladu můžeme vidět, že interpret poznal, že se snažíme o sečtení celého čísla a řetězce. Při takovéto operaci nevíme, jaký má být výsledný datový typ, a proto interpret vyhodil výjimku `TypeError`. Ve výpisu je provedena ukázka s použitím proměnných i bez nich, aby bylo vidět, že i jednotlivé literály jsou v jazyce Python objekty. K tématu objektů se vrátíme později.

# Jednoduché datové typy

Nyní si ve stručnosti ukážeme základní datové typy.

**Čísla:** `int, long, float, complex`

- `23 2345837934346901268 0x17 3.4 5.6+7.8j`
- operátory: `+ - * ** / // % ~ & | << >>`
- build-in funkce: `abs min max pow round sum`

**Cvičení:**

V interaktivním režimu si vyzkoušejte práci s čísly. Vyzkoušejte si operátory, speciálně operátor `**`. Také si zkuste použití build-in funkcí, které jsou často užitečné.

**Řetězce:** jednoduché a Unicode

- `'apostrofy' "uvozovky" r'raw' u"unicode" \n`
- operátory: `+` (spojení, konkatenace), `*` (opakovaní), `%` (format)
- formátování podobné jako v jazyce C
- jsou neměnitelné (immutable) sekvence: `len`, `[]` (index/slice), `for`
- objekt řetězce má mnoho metod

**Cvičení:**

Vyzkoušejte práci s řetězci. Použijte znaky pro uvození řetězců " a ' a sledujte jak se od sebe liší popřípadě, zda je možné je do sebe zanořit. Přistupujte k jednotlivým prvkům a podřetězcům řetězců pomocí indexů mezi znaky `[` a `]`. Řetězce spojujte.

# Kolekce

Jedním z důležitých prvků programovacích jazyků je práce s kolekcemi dat. Pod pojmem kolekce si budeme představovat nějakou datovou strukturu, která nám umožní vkládat jednotlivé (třeba i různé) prvky do jedné proměnné. Takováto proměnná se pak bude nazývat kolekcí (shromažďuje v sobě jiné prvky). S kolekcí jsme se již setkali v podobě řetězců, kde je řetězec znaků tvořen jednotlivými znaky, které jsou uloženy v jednotlivých prvcích seznamu. K jednotlivým znakům řetězce též můžeme přistoupit pomocí hranatých závorek uvedených za seznamem. Ukažme si to na příkladu:

```python
>>> ret = "Ahoj"
>>> print(ret[0], ret[1], ret[2], ret[3])
A h o j
```

Z uvedeného příkladu vyplývá, že seznamy se do určité míry chovají jako pole v jazyce C.

<a id="sec:list"></a>
## Seznam (`list`)

Seznamy v jazyce Python jsou však univerzálnější. Mohou ve svých prvcích obsahovat jakékoli další prvky bez ohledu na datový typ (toto je důsledek dynamického typování jazyka). Uveďme si tedy další příklad:

```python
>>> sez = ["Ahoj", 1, 2, [1, 2, 3]]
>>> print(sez[0], sez[1], sez[2], sez[3])
"Ahoj" 1 2 [1, 2, 3]
```

### Indexování seznamu

S poli v jazyce C bychom byli hotovi, v Pythonu však nikoli. Indexovat seznam můžeme i od konce:

```python
>>> sez = ["Ahoj", 1, 2, [1, 2, 3]]
>>> print(sez[-1], sez[-2], sez[-3], sez[-4])
[ 1, 2, 3] 2 1 "Ahoj"
```

Poslední prvek seznamu má index -1, předposlední -2, atd.

Z nějakého seznamu můžeme vytvořit podseznam (subsekvenci). Tu vytvoříme tak, že do hranatých závorek vložíme index prvního a posledního prvku (bez tohoto prvku), které chceme ve výsledném podseznamu mít. Počátek a konec oddělíme dvojtečkou. Často může nastat případ, kdy chceme podseznam od začátku do nějakého indexu, nebo od nějakého indexu do konce seznamu. V takovémto případě se začátek nebo konec v rozsahu vynechá. Ukažme si příklady:

```python
>>> sez = ["Ahoj", 1, 2, [1, 2, 3]]
>>> sez[2:4] # od 2. do 3. prvku
[2, [1, 2, 3]]
>>> sez[:2] # od zacatku do 2. prvku
['Ahoj', 1]
>>> sez[2:] # od 3. prvku do konce
[2, [1, 2, 3]]
```

### Modifikace seznamu

Seznam můžeme též modifikovat. Nejjednodušeji lze modifikovat určitý prvek seznamu tak, že jej indexujeme a do takto indexovaného prvku přiřadíme požadovanou hodnotu. Stávající hodnota se v seznamu přepíše hodnotou novou.

```python
>>> sez = ["Ahoj", 1, 2, [1, 2, 3]]
>>> print(sez)
['Ahoj', 1, 2, [1, 2, 3]]
>>> sez[1] = 5 # 2. prvek bude nahrazen cislem 5
>>> print(sez)
['Ahoj', 5, 2, [1, 2, 3]]
```

Přidání prvku na konec seznamu se provede jednoduše zavoláním funkce `append` na objektu seznamu. Parametr této funkce je objekt, který se vloží na konec seznamu.

```python
>>> sez = ["Ahoj", 1, 2, [1, 2, 3]]
>>> print(sez)
['Ahoj', 1, 2, [1, 2, 3]]
>>> sez.append(5)
>>> print(sez)
['Ahoj', 1, 2, [1, 2, 3], 5]
```

Samozřejmě přidávání prvků na konec seznamu není jedinou možností jak přidat do seznamu prvek. Pokud chceme na partikulární pozici v seznamu umístit nějaký objekt, použijeme funkci `insert`, která přijímá dva parametry. Prvním parametrem je pozice, na kterou se prvek vloží, druhým je prvek samotný. Opět si ukažme příklad:

```python
>>> sez = ["Ahoj", 1, 2, [1, 2, 3]]
>>> print(sez)
['Ahoj', 1, 2, [1, 2, 3]]
>>> sez.insert(0, 5)
>>> print(sez)
[5, 'Ahoj', 1, 2, [1, 2, 3]]
```

Metoda `insert` tedy vloží prvek na zadanou pozici a ostatní prvky za ní o jednu posune.

Odstranění prvku ze seznamu můžeme provézt dvěma různými způsoby. Pokud víme, na které pozici se prvek který chceme odstranit nachází, můžeme použít příkazu `del` a zadat seznam s indexem prvku k odstranění. Druhá možnost je ta, kdy neznáme pozici prvku v seznamu, ale známe jeho hodnotu. V takovémto případě zavoláme metodu `remove` s argumentem prvku k odstranění na našem seznamu (pokud je v seznamu více prvků, které vyhovují zadanému argumentu, odstraní se první prvek zleva). Příklad ukazuje použití obou metod:

```python
>>> sez = ["Ahoj", 1, 2, [1, 2, 3]]
>>> print(sez)
['Ahoj', 1, 2, [1, 2, 3]]
>>> del sez[1]
>>> print(sez)
['Ahoj', 2, [1, 2, 3]]
>>> sez.remove("Ahoj")
>>> print(sez)
[2, [1, 2, 3]]
```

### Práce se seznamem

Čisté přidávání nebo odebírání prvků ze seznamu není zcela užitečnou operací. Nyní si ukážeme několik jednoduchých, avšak užitečných operací nad seznamem.

Velice často se setkáváme s požadavkem, zda seznam obsahuje nějaký prvek či nikoli. Python obsahuje klíčové slovo `in`, které lze ve spojení se seznamem k takovémuto účelu využít. Ukažme si tedy jednoduchý příklad, kdy se budeme snažit zjistit, zda je nějaký prvek v našem seznamu:

```python
>>> sez = ["Ahoj", 1, 2, [1, 2, 3]]
>>> print(sez)
['Ahoj', 1, 2, [1, 2, 3]]
>>> "Ahoj" in sez
True
>>> "Cau" in sez
False
```

Tento jednoduchý způsob zjišťování obsahu seznamu se často používá ve webových aplikacích, kde se snažíme zjistit, jestli je v URL předáván nějaký parametr. Ve spojení s podmínkou `if` se pak můžeme rozhodnout, jak se k přijatému HTTP požadavku zachovat.

Pro zjištění maxima nebo minima v seznamu můžeme využít vestavěnou funkci `min` a `max`, které budou brát jako argument seznam.

```python
>>> sez = [8, 1, 2, 5]
>>> max(sez)
8
>>> min(sez)
1
```

## N-tice (`tuple`)

Seznam má v Pythonu také nemodifikovatelný ekvivalent v podobě n-tice. Význam slova nemodifikovatelný je třeba chápat tak, že jakmile je n-tice vytvořena, nelze její prvky přidávat ani mazat. Další práce s n-ticí je však stejná jako se seznamem. Můžeme jednoduše vytvářet podn-tice pomocí stejné notace jako u seznamu. Zjišťování obsahu n-tice probíhá obdobným způsobem.

Jak tedy odlišit n-tici od seznamu? Odpověď je velice jednoduchá. Seznam je vytvořen pomocí hranatých závorek, n-tice pomocí závorek kulatých. Pro názornost si opět uveďme jednoduchý příklad:

```python
>>> tup = (8, 1, 2, 5)
>>> tup[2:3]
(2, 5)
>>> max(tup)
8
>>> min(tup)
1
```

N-tice používáme hlavně tam, kde víme, že nepotřebujeme měnit jejich obsah. Slouží též jako základ pro konstrukci slovníků.

<a id="sec:dict"></a>
## Slovník (`dict`)

Pokud chceme v seznamu nebo n-tici, které jsou obecně nesetřízené, nalézt nějakou položku, její vyhledání je v čase `O(n)`, kde `n` je počet prvků uložených v seznamu nebo n-tici. Pro velké kolekce dat je toto samozřejmě značně problematické. Tento problém řeší datový typ slovník. Slovník mapuje klíč (key) na hodnotu (value) pomocí hašovací tabulky. Vyhledání hodnoty pro zadaný klíč je pomocí slovníku v konstantním čase `O(1)`.

Příklady, jako mohou vypadat slovníky:

- `{}`
- `{'key': 12}`
- `{1: 'value'}`
- `{'key': 'value'}`
- `{'Galactica': 75, 'Pegasus': 62}`
- `dict(one=1, two=2)`

Příklad práce se slovníkem:

```python
In [1]: slovnik = {}

In [2]: slovnik
Out[2]: {}

#ulozeni hodnoty pod klic 'SPJA'
In [3]: slovnik['SPJA'] = "Skriptovaci jazyky"

#ziskani hodnoty pro klic 'SPJA'
In [4]: slovnik['SPJA']
Out[4]: 'Skriptovaci jazyky'
```

Je jasné, že pro neexistující klíč není ve slovníku hodnota. Pokud bychom se tedy zeptali na neexistující klíč, obdržíme výjimku `KeyError` tak, jak už jsme z jazyka zvyklí.

```python
# pokus o ziskani hodnoty pro klic 460
In [6]: slovnik[460]
------------------------------------------------------------
KeyError                   Traceback (most recent call last)
<ipython-input-6-ef73e3cb1ba9> in <module>()
----> 1 slovnik[460]

KeyError: 460

#ulozeni hodnoty pod klic 460
In [7]: slovnik[460] = 'Katedra informatiky'

#ziskani hodnoty pro klic 460
In [8]: slovnik[460]
Out[8]: 'Katedra informatiky'
```

Pro zjištění, zda-li slovní obsahuje daný klíč můžeme použít klíčového slova `in`. Díky tomu můžeme předejít vyhození výjimky neexistujícího klíče. Použití je ukázáno na následujícím příkladu.

```python
In [29]: slovnik
Out[29]:
{460: 'Katedra informatiky',
 'SPJA': 'Skriptovaci jazyky'}

In [30]: 470 in slovnik
Out[30]: False

In [31]: slovnik[470] = "Katedra aplikovane matematiky"

In [32]: slovnik
Out[32]:
{460: 'Katedra informatiky',
 470: 'Katedra aplikovane matematiky',
 'SPJA': 'Skriptovaci jazyky'}

In [33]: 470 in slovnik
Out[33]: True
```

<a id="sec:sequnces"></a>
# Sekvence

Z výše uvedených datových typů jsou sekvencemi: řetězce (string), seznamy a n-tice. Sekvence můžeme sčítat (`c1 + c2`), opakovat (`c*N`). Všechny sekvence je také možno indexovat pomocí jednotného rozhraní: `c[i]`, `'ciao'[2] == 'a'`. Ze sekvencí též můžeme vybírat různé podsekvence pomocí tzv. slicingu: `c[i:j]`, `c[i:j:k]`, `'ciao'[3:1:-1] == 'oa'`. Více příkladů na toto téma jsme si ukázali v části [Seznam (`list`)](promenne_a_typy.md#sec:list).

Sekvence také můžeme jednoduše procházet pomocí cyklu `for`, kdy v jednotlivých průchodech dostáváme hodnotu na dané pozici ze sekvence v řídící proměnné.

Slovník má tu vlastnost, že není sekvencí, ale je možné jej procházet cyklem `for`. Více ukáže následující příklad.

```python
In [1]: slovnik = {}

In [2]: slovnik['SPJA'] = "Skriptovaci jazyky"

In [3]: slovnik[460] = "Katedra informatiky"

In [4]: slovnik
Out[4]: {460: 'Katedra informatiky',
         'SPJA': 'Skriptovaci jazyky'}

In [5]: for klic in slovnik:
   ...:     print("Klic:", klic, "Hodnota:", slovnik[klic])
   ...:

Klic: 460 Hodnota: Katedra informatiky
Klic: SPJA Hodnota: Skriptovaci jazyky
```

# Porovnání, testy, pravdivost

Pro porovnání hodnot v jazyce Python používáme operátory `==` a `!=`. Pro porovnání identity pak operátory `is` a `is not`. Operátor identity funguje jinak než např. metoda `equals` v jazyce Java. V principu operátor identity neporovnává obsah nějakých proměnných, ale porovnává, zda jednotlivé proměnné ukazují na stejný objekt v paměti. Více nám osvětlí následující příklad.

```python
In [36]: 123435 is 123435
Out[36]: True

In [37]: 123435 == 123435
Out[37]: True

In [38]: a = 123456

In [39]: a == 123456
Out[39]: True

In [40]: a is 123456
Out[40]: False
```

Na posledním řádku je zřejmé, že proměnná `a` ukazuje na nějaké místo v paměti, které je odlišné od místa v paměti, které reprezentuje objekt čísla `12345`.

K porovnání pořadí nám slouží operátory `<`, `>`, `<=` a `>=`.

Členství nějaké hodnoty v sekvenci obstarají operátory `in` a `not in`.

Boolovské hodnoty nám repzentuji singletony `True` a `False`.

Speciálním singletonem je též typ `None`, který je do jisté míry ekvivalentní s hodnotou `null` v jazyce C.
