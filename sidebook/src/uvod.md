# Úvod

Tento text vznikl pro potřeby výuky předmětu Skriptovací jazyky. Studentům by měl sloužit pro získání nutného minima znalostí ke zvládnutí programování v jazyce kurzu – tedy jazyka Python{{sidenote: http://www.python.org}}. V žádném případě však není text plnohodnotnou náhradou za poslechy přednášek a návštěvy cvičení. Studentům je tudíž velmi doporučeno, aby přednášky a cvičení navštěvovali.

Tento text si též neklade za cíl vytvořit kompletního průvodce jazykem Python. Pro takovýto účel lze doporučit některý knižní titul, např.: [Harms, McDonald](reference.md#harms-mcdonald).

## Úvod do skriptovacích jazyků

Skriptovací programovací jazyky tvoří protiváhu tzv. kompilovaným programovacím jazykům. Jednotlivé programy jsou tvořeny zdrojovými kódy (skripty), které jsou tzv. interpretovány, tj. čteny a spouštěny za běhu speciálním programem, tzv. interpretem.

Typický skript těží z výhody, že se nemusí překládat, a často tvoří rozšiřitelnou (parametrickou) část nějakého softwarového projektu, která se může měnit, aniž by bylo potřeba pokaždé rekompilovat hlavní spustitelný soubor. Skripty tak najdeme u her (Quake), grafických uživatelských rozhraní (XULRunner v produktech Mozilla), složitějších softwarových řešení nebo jako hlavní součást dynamických webových stránek (YouTube, Instagram) a podobně.

**Výhody:**

- Není nutné provádět po každé změně kódu kompilaci,
- snadnější údržba, vývoj a správa kódu,
- některé skripty umožňují interpretaci kódu z řetězce (jako například funkce eval() v Pythonu nebo PHP). Něco takového překládané programy bez použití speciálních technik nedokáží.

**Nevýhody:**

- Rychlost. Interpretace stojí určitý strojový čas a většinou nebývá tak rychlá jako běh přeloženého (a optimalizovaného) programu,

- vyšší paměťová náročnost. Interpret musí být spuštěn a tedy zabírá určitou část operační paměti,

- skriptovací jazyky mají většinou větší omezení než překládané programovací jazyky (např. co do přístupu do paměti, ovládání tzv. handlerů procesů, kontextových zařízení, apod.).

## Programovací jazyk Python

Python je interpretovaný procedurální, objektově orientovaný a funkcionální programovací jazyk, který v roce 1990 navrhl Guido van Rossum. Python je vyvíjen jako open source projekt, který zdarma nabízí instalační balíky pro většinu běžných platforem (Unix, Windows, Mac OS); ve většině distribucí systému GNU/Linux je Python součástí základní instalace.

Python je dynamický interpretovaný jazyk a také jej zařazujeme mezi skriptovací jazyky. Python byl navržen tak, aby umožňoval tvorbu rozsáhlých, plnohodnotných aplikací (včetně grafického uživatelského rozhraní).

Python je hybridní jazyk (nebo také víceparadigmatický), to znamená, že umožňuje při psaní programů používat nejen objektově orientované paradigma, ale i procedurální a v omezené míře i funkcionální, podle toho komu co vyhovuje nebo co se pro danou úlohu nejlépe hodí. Python má díky tomu vynikající vyjadřovací schopnosti. Kód programu je ve srovnání s jinými jazyky krátký a dobře čitelný.

K význačným vlastnostem jazyka Python patří jeho jednoduchost z hlediska učení a proto se jím budeme primárně zabývat v rámci našeho kurzu. Bývá dokonce považován za jeden z nejvhodnějších programovacích jazyků pro začátečníky. Python ale současně bourá zažitou představu, že jazyk vhodný pro výuku není vhodný pro praxi a naopak. Podstatnou měrou k tomu přispívá čistota a jednoduchost syntaxe, na kterou se při vývoji jazyka hodně dbá.

Význačnou vlastností jazyka Python je produktivita z hlediska rychlosti psaní programů. Týká se to jak nejjednodušších programů, tak aplikací velmi rozsáhlých. U jednoduchých programů se tato vlastnost projevuje především stručností zápisu. U velkých aplikací je produktivita podpořena rysy, které se používají při programování ve velkém, jako jsou například přirozená podpora prostorů jmen, používání výjimek, standardně dodávané prostředky pro psaní testů (unit testing) a dalšími. S vysokou produktivitou souvisí dostupnost a snadná použitelnost široké škály knihovních modulů, umožňujících snadné řešení úloh z řady oblastí. V poslední době je Python též oblíben u komunity zabývající se výpočty na superpočítačích (HPC). K tomuto účelu vznikla speciální sada knihoven, která je protiváhou dobře známemu MATLABu – SciPy{{sidenote: http://www.scipy.org/}}.

## Vývojové prostředí jazyka Python

Pro práci v s jazykem Python je doporučováno mít nainstalován Python ve verzi 2.5, 2.6 nebo 2.7. Uživatelé Linuxových distribucí již mají Python nainstalován ve standardní instalaci. Uživatelé Windows si mohou stáhnout instalátor Pythonu z domovské stránky projektu [Oficiální webová stránka jazyka Python](reference.md#python-web), sekce Download.

Skriptovací jazyky mají většinou tu vlastnost, že dovolují spouštění skriptů dvojím způsobem a to v **interaktivním režimu** a nebo spuštění skriptu ze souboru se zdrojovým kódem (**dávkový režim**).

**Interaktivní režim** lze spustit jednoduše spuštěním interpretu Pythonu z příkazové řádky nebo z programové nabídky. Tento režim slouží většinou k testování funkcionality kódu. Po spuštění interaktivního režimu se na obrazovce objeví následující výpis:

```text
Python 3.4.2 (default, Oct  8 2014, 10:45:20)
GCC 4.9.1 on linux
Type "help", "copyright", "credits" or "license"
for more information.
$>>>$
```

Řádek se znaky `>>>` je tzv. **prompt** (výzva). Tam již můžeme zadávat příkazy jazyka a pomocí klávesy Enter je spustit. Nyní tedy stačí do promptu napsat `print("Ahoj svete!")` a objeví se nám:

```python
>>> print("Ahoj svete")
Ahoj svete
>>>
```

Funkce `print` slouží pro tisk zadaných informací na výstup. Po volání této funkce vidíme výsledek na dalším řádku.

**Dávkový režim** slouží ke spouštění složitějších skriptů. Takovýto skript spustíme jednoduše na příkazové řádce pomocí příkazu ($ je promptem shellu operačního systému):

```text
$ python muj_skript.py
```

**Cvičení:**

Vytvořte si jednoduchý skript, který vypíše na výstup řetězec "Ahoj svete" a ověřte jeho funkcionalitu.

**Cvičení:**

V interaktivním režimu si vyzkoušejte jednoduché počítání. Provádějte operace s čísly jako na kalkulátoru. Pokuste se použít proměnné a závorky.

**Cvičení:**

V interaktivním režimu si vyzkoušejte práci s řetězci. Použijte znaky pro uvození řetězců " a ' a sledujte jak se od sebe liší popřípadě, zda je možné je do sebe zanořit. Přistupujte k jednotlivým prvkům a podřetězcům řetězců pomocí indexů mezi znaky $[$ a $]$. Řetězce spojujte.

**Cvičení:**

V interaktivním režimu si vyzkoušejte práci s seznamy a n-ticemi (jsou popsány v 6. kapitole knihy). Opět přistupujte k jednotlivým prvkům seznamů a n-tic. Přidávejte prvky do již existujících seznamů.

<a id="sec:syntax"></a>

## Syntaxe

Jazyk Python má relativně jednoduchou syntaxi nez množství různých "kudrlinek" (Anglicky je toto nazýváno pojmem "boilerplate"). Hlavní rysy, se kterými mají někdy začátečníci problémy, by se daly shrnout do následujících bodů:

- nepoužívají se složené závorky `{}` pro označení bloku, používá se **odsazení**, který je uvozen dvojtečkou `:`,
- nepoužívají se složené závorky `{` a `}` pro označení bloku, používá se **odsazení**, který je uvozen dvojtečkou `:`,
- u podmínek příkazů `if` a `while` se nepoužívají kulaté závorky `(` a `)`,

- pro ukončení příkazu nepoužíváme středník `;`, ale jednoduše přejdeme na nový řádek a vložíme další příkaz.

Uveďme si nyní jednoduchý příklad, který shrnuje obě vlastnosti.

```python
if a > 0:
    print("Positive")
elif a < 0:
    print("Negative")
else:
    print("Zero")
```

Na příkladu můžeme vidět, že bloky jednotlivých větví příkazu `if` jsou uvozeny dvojtečkou a jejich tělo (blok) je odsazen o 4 mezery doprava oproti korespondující větvi. Samozřejmě můžeme do bloku umístit více příkazů tak, že je postupně řadíme pod sebe se stejným odsazením. Též si povšimněme, že není použit znak středníku. Speciálně odsazení bloků je někdy problematické. V jazycích jako je C nebo Java však také běžně bloky odsazujeme proto, abychom je jednoduše vizuálně odlišili. Proto je v jazyce Python této dobře známé praktiky využito s tím, že není nutné psát označení bloků složenými závorkami. Také si povšimněme, že blok je uvozen dvojtečkou. Pro srovnání je ještě zobrazena stejná situace v jazyce C.

```python
if (a > 0) {
    printf( "Positive\n" );
}
else if (a < 0) {
    printf( "Negative\n" );
}
else {
    printf( "Zero\n" );
}
```
