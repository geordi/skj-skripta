# Funkce

V této kapitole si probereme funkce, které na rozdíl od jazyků C, Java a C# disponují v jazyce Python většími možnostmi použití a definic.

Asi bychom byli schopni naše programy psát tak, abychom nepotřebovali použít funkce. Toto by nám však vystačilo na velmi krátké programy, poněvadž bychom jinak museli všechen znovupoužitelný kód psát znovu a znovu.

Základní vlastností funkcí je jejich znovupoužitelnost. Pokud tedy máme úlohu, kterou víme, že budeme požívat více než jednou, je vhodné ji umístit do funkce. Takovýto blok kódu by též měl fungovat pokud možno co nejvíce samostatně.

## Funkce v jazyce Python

V jazyce Python je definice funkce do jisté míry podobná definici funkce v jiných jazycích s tím rozdílem, že neuvádíme návratový datový typ a ani neuvádíme datové typy argumentů funkce. Toto je dáno dynamickou typovostí jazyka. Uveďme si jednoduchý příklad pro výpočet mocniny čísla.

```python
def sqr(number):
    return number**2

sqr(3) #9
```

Pokud pomineme to, že v jazyce Python máme pro mocninu operátr `**`, měl by nám být zápis funkce celkem jasný. Definice funkce je uvozena klíčovým slovem `def` následovaným jménem funkce a v závorce uvedeným seznamem argumentů oddělených čárkou, což si za chvíli ukážeme. Volání funkce je pak provedeno jménem funkce s parametry uvedenými v kulatých závorkách tak, jak je to uvedeno na příkladu.

Funkce nám také dovolují provádět generalizaci, což je zobecnění zadaného problému. Vezměme si výpočet mocniny čísla jako jednoduchý příklad. První ukázka funkce `sqr` umí vypočítat pouze druhou mocninu zadaného čísla `number`. My bychom však chtěli vytvořit obecnou funkci na výpočet jakékoli mocniny čísla. Taková funkce je v ukázce níže.

```python
def pow(number, exponent):
    return number**exponent

pow(2, 3) #8
```

Funkce `pow` má nyní 2 parametry s mocněncem `number` a mocnitelem `exponent`. Místo natvrdo nastavené hodnoty `2` pro výpočet druhé mocniny z předcházejícího příkladu je mocnitel zadán parametrem funkce. Máme tak zobecněný (generalizovaný) kód pro výpočet mocniny.

## Parametry funkcí

Z jazyka C znáte využití defaultního parametru funkce. I v jazyce Python je tato možnost zachována. Syntaxe je opět podobná jazyku C, kdy parametr funkce, který může nabývat defaultní hodnoty, má tuto hodnotu v definici funkce nastavenou pomocí rovnítka. **Poznamenejme**, že takovýchto parametrů může být více, ale musí být vždy uvedeny na konci seznamu argumentů funkce, jinak by interpret nedokázal rozlišit, které parametry má nastavit jako defaultní, a kterým přiřadit volanou hodnotu.

Uveďme si tedy jednoduchý příklad, který nám opět generalizuje předchozí příklad tak, že pro výpočet druhé mocniny funkcí `pow` nebudeme muset zadávat hodnotu mocnitele.

```python
def pow(number, exponent=2):
    return number**exponent

pow(3) #9

pow(3, 3) #27
```

## Proměnlivý počet argumentů funkce

V jazyce C jste používali funkci `printf`, která slouží pro tisk na výstup. Její zajímavou vlastností je to, že do ní může vstupovat proměnlivý počet argumentů. Pojďme se podívat, jak takovou funkci vytvořit v jazyce Python.

Proměnlivý počet argumentů funkce je možno vytvořit tak, že poslední argument funkce bude mít před svým jménem znak `*`. Jakmile pak zavoláme takovou funkci, bude v tomto parametru vždy uložen tuple, který bude obsahovat tolik hodnot, kolik se jich již nevešlo do standardních argumentů funkce. Z toho tedy plyne, že můžeme kombinovat různé typu argumentů funkce. Ukažme si jednoduchý příklad funkce s proměnlivým počtem argumentů.

```python
def va_args_function(a, *b):
    print(a, b)

va_args_function(1)
#1 ()

va_args_function(1, 2)
#1 (2,)

va_args_function(1, 3, 4)
#1 (3, 4)

va_args_function(1, 3, 4, "Ahoj")
#1 (3, 4, 'Ahoj')

va_args_function(1, 3, 4, "Ahoj", 5.3)
#1 (3, 4, 'Ahoj', 5.3)
```

Na této ukázce vidíme, jak se tuple v argumentu `b` postupně zaplňuje více hodnotami podle toho, jak jich přibývá při volání funkce. Také si všimněme, že je argument použit bez znaku `*`.

Pokusme se nyní vytvořit funkci `super_print`, která bude akceptovat proměnlivý počet argumentů (předpokládejme typ `str`). Tyto argumenty budou vytištěny a jejich výpis bude ohraničen nahoře a dole znakem `=` v délce celé sekvence. V kódu jsme využili metodu `join` na objektu `str`{{sidenote: http://docs.python.org/library/stdtypes.html#str.join}}.

```python
def super_print(*p):
  s = " ".join(p)
  print "-" * len(s)
  print s
  print "-" * len(s)

super_print("Jedna", "dve", "3", "4")

#=============
#jedna dve 3 4
#=============
```

## Agrumenty funkce předané klíčovými slovy

Posledním typem argumentu funkce je ten, který je předáván jako slovník. Takovýto argument je v definici funkce nejčastěji podle konvence označován jako `**kw`. Argumenty jsou pak funkci předávány tak, že je jako argument funkce použito jméno argument, kterému je přiřazena hodnota pomocí rovnítka. Tyto argumenty jsou odděleny čárkou. Ukažme si jednoduchý příklad.

```python
def kw_function(a, **kw):
    print a, kw

kw_function("jedna", SPJA="Skriptovani", ALG="Algorimizace")
#jedna {'ALG': 'Algorimizace', 'SPJA': 'Skriptovani'}
```

Na ukázce také vidíme, že se jednotlivé typy argumentů můžou kombinovat. Podstatnou částí však je, že argument `kw` se uvnitř funkce jeví jako slovník, jenž jsme si již probrali v kapitole [Slovník (`dict`)](promenne_a_typy.md#sec:dict). Pozoruhodnou vlastností funkcí, které používají předávaní argumentů klíčovými slovy je jejich rozšiřitelnost.

Představme si, že pracujeme na větším softwarovém díle a potřebujeme změnit určitou komponentu. V takovém případě většinou musíme provést refactoring kódu s tím, že budeme takovou komponentu doplňovat o další parametry její funkce. V případě, že však takováto funkce má parametr předávaný klíčovými slovy, je její rozšíření jednoduché. Stačí pouze upravit operace práce se slovníkem `kw`. Ukažme si tedy typičtější práci s takovou funkcí. Mějme funkci, která filtruje města podle počtu obyvatel. Funkce `filtruj_mesta` s argumentem `gt` vrátí taková města, jejichž počet obyvatel je vyšší než zadaná hodnota.

```python
def filtruj_mesta(mesta, **kw):
    """Funkce vrati seznam mest, ktere odpovidani svym
    poctem obyvatel zadanym omezenim.
    V **kw bude mozno predat argument:
     'gt': jen mesta s poctem obyvatel vetsim nez hodnota argumentu.
    Je mozne zadat zadny nebo jeden parametr.
    Pokud nezadame zadny parametr, vrati se prazdny seznam.
    """
    flt = []
    if 'gt' in kw:
        lim = kw['gt']
        flt = [ key for key in mesta if mesta[key] > lim ]
    return flt

mesta = {"Ostrava": 336000, "Praha": 1249000,
         "Brno": 405000, "Olomouc": 101000,
         "Karvina": 63000, "Havirov": 82000}

filtruj_mesta(mesta, gt=100000)
#['Ostrava', 'Praha', 'Brno', 'Olomouc']
```

Pokud bychom chtěli rozšířit funkcionalitu výše zmíněné funkce o to, aby také uměla vrátit města s počtem obyvatel nižším než bude zadaná hodnota, provedeme to pomocí následujícího kódu.

```python
def filtruj_mesta(mesta, **kw):
    """Funkce vrati seznam mest, ktere odpovidani svym
    poctem obyvatel zadanym omezenim.
    V **kw bude mozno predat argument:
     'gt': jen mesta s poctem obyvatel vetsim nez hodnota argumentu,
     'lt': jen mesta s poctem obyvatel mensim nez hodnota argumentu.
    Je mozne zadat zadny, jeden nebo oba parametry nejednou.
    Pokud nezadame zadny parametr, vrati se prazdny seznam.
    """
    flt = []
    if 'gt' in kw:
        lim = kw['gt']
        flt = [ key for key in mesta if mesta[key] > lim ]
    if 'lt' in kw:
        lim = kw['lt']
        flt += [ key for key in mesta if mesta[key] < lim ]
    return flt

mesta = {"Ostrava": 336000, "Praha": 1249000,
         "Brno": 405000, "Olomouc": 101000,
         "Karvina": 63000, "Havirov": 82000}

filtruj_mesta(mesta, gt=1000000, lt=70000)
#['Praha', 'Karvina']
```

Při porovnání obou kódů vidíme, že API dané funkce se nezměnilo a ani její funkce není nijak narušena, pokud je zavolána jen s původním argumentem `gt`.

**Poznámka:**

V kódu jsme použili list comprehension{{sidenote: http://docs.python.org/tutorial/datastructures.html#list-comprehensions}}, který je popsán v kapitole [List comprehension](funkce.md#sec:list-comprehension).

**Cvičení:**

Promyslete si sami, jak by vypadala varianta rozšíření funkce bez použití předávaní argumentů klíčovými slovy.

## Funkce jako argument funkce

Funkce je v jazyce Python objekt jako každý jiný, což je poněkud jiný přístup, než na jaký jsme zvyklí z jazyka Java. Pokud je funkce objektem, můžeme ji uložit do námi zvolené proměnné, tak jak to zobrazuje následující příklad.

```python
def pow(number, exponent=2):
    return number**exponent

sqr = pow

pow(3) #9

sqr(3) #9
```

Pokud je však funkce objekt, můžeme jej stejně jako jiné objekty poslat funkci jako její argument. Když je toto v jazyce možné, říkáme, že jsou funkce "first class object". Tato vlastnost je též základním prvkem funkcionálních jazyků. Ukažme si tedy příklad.

```python
def sqr_lst(fun, lst):
    ret_lst = []
    for item in lst:
        ret_lst.append(fun(item))
    return ret_lst

sqr_lst(sqr, [1, 2, 3])
#[1, 4, 9]
```

V ukázce jsme využili již naprogramované funkce `sqr`. Funkce `sqr_lst` dostane dva parametry. Prvním parametrem je funkce, která se bude aplikovat na každý prvek ze seznamu, který je předán jako druhý argument. Uvnitř funkce je tedy smyčka `for`, která postupně vybírá prvky ze seznamu s čísly a každé takové číslo pošle jako argument funkce `fun`. Výsledek každého volání je pak přidán do výstupního seznamu. V našem případě jsme funkci `sqr_lst` předali funkci `sqr`, která nám z každého čísla vrátí jeho druhou mocninu.

Pokud pomineme název funkce `sqr_lst`, máme poměrně obecnou funkci, která umí na všechny prvky jakékoli sekvence aplikovat funkci, kterou předáme v parametru. Samozřejmě jsme nyní nevymysleli nic nového. Pouze jsme se relativně nenáročnou cestou dostali k dobře známému konceptu funkce `map`.

Poznamenejme, že v jazycích C/C++ a C# je funkci také možno použít jako argument funkce.

## Funkce `map`

Funkce `map` je dlouhou dobu známa z funkcionálních jazyků a v současné době se začíná objevovat i v klasičtějších jazycích. Funkce přijímá dva parametry. Prvním je funkce a druhým pak sekvence. Na kazdý prvek ze sekvence je aplikována funkce. Výsledek je pak seznam, který má stejnou délku jako vstupní sekvence a obsahuje výsledky funkce pro korespondující prvky ze vstupní sekvence.

## Anonymní funkce

Při používání funkce `map` se často setkáváme s tím, že funkce kterou chceme aplikovat na prvky sekvence je použita pouze jednou, popřípadě si nechceme do jmenného prostoru umisťovat jednoúčelové funkce. V takovém případě se nám bude hodit koncept anonymní funkce `lambda`. Syntaxi lambda funkcí by měla osvětlit následující ukázka.

```python
sqr = lambda x: x**2

sqr(2) #4

sqr(5) #25

pow = lambda number, exponent: number**exponent

pow(2, 3) #8
```

Vidíme, že do proměnné `sqr` jsme přiřadili anonymní funkci s jedním parametrem. Z něj se počítá druhá mocnina. Anonymní funkce též mohou mít více parametrů jako v příkladu funkce `pow`. Pokud bychom anonymní funkci nikam nepřiřadili, nemohli bychom ji později použít. Pro úplnost uvedeme příklad, kdy takto vytvořenou funkci, která není nikde uložena okamžitě zavoláme a získáme tak její návratovou hodnotu. Poznamenejme, že toto použití není příliš časté.

```python
(lambda x, y: x**y)(2, 3) #8
```

## Anonymní funkce jako parametry funkcí

Řekli jsme si, že anonymní funkce můžeme použít pro velmi malé úseky kódu, pro které nemá často význam vytvářet speciální funkce. Častým využitím anonymních funkcí je jejich předávaní jako argumentů jiných funkcí. Velmi časté je proto použití lambda funkce s funkcí `map`. Uveďme si tedy opět ukázku na výpočet druhé mocniny seznamu čísel.

```python
map(lambda x: x**2, [2, 3, 4]) #[4, 9, 16]
```

Vidíme, že se nám původní příklad funkce `sqr_lst` podařilo zkrátit na jeden řádek.

Nezapomeňme také, že v sekvencích, které mohou vstupovat do funkce `map` se mohou objevit složitější objekty. V lambda funkci pak můžeme volat jejich metody. Následující ukázka převede všechny řetězce na velká písmena.

```python
map(lambda x: x.upper(), ["ahoj", "svete"])
#['AHOJ', 'SVETE']
```

<a id="sec:list-comprehension"></a>

## List comprehension

List comprehension je způsob jak vytvářet nové listy. Doposud jsme je byli schopni vytvářet pomocí funkce `map`. List comprehension navíc umožňuje aplikovat na prvky vstupní sekvence predikát. Pokud je predikát vyhodnocen jako logická hodnota `True`, potom je prvek podroben funkci, která je předána jako parametr. Jinak je prvek vyřazen z výstupního seznamu. Syntakticky je list comprehension čitelnější než funkce `map`. Ukažme si několik příkladů.

```python
lst = [1, 2, 3, 4]
ships = ['Daru Mozu' , 'Cloud 9' , 'Galactica' ]

squares = [ x**2 for x in lst ]
#[1, 4, 9, 16]

squares = [ x**2 for x in lst if x > 2 ]
#[9, 16]

new_ships = [ x.upper() for x in ships ]
#[ 'DARU MOZU', 'CLOUD 9', 'GALACTICA' ]

new_ships = [ x.upper() for x in ships if len(x) > 7 ]
#[ 'DARU MOZU', 'GALACTICA' ]
```

Na první pohled vidíme, že oproti funkci `map` není pro aplikování požadované funkce na prvky sekvence zapotřebí vytvoření anonymní funkce. Predikát, který je nepovinný se nalézá na konci zápisu.

Zápis pomocí list comprehension je v současné době preferovaným způsobem zápisu pro generování nových seznamů. Je také zajímavé, že funkce `filter` {{sidenote: <http://docs.python.org/library/functions.html?highlight=filter#filter>}} je plně nahraditelná právě tímto zápisem.
