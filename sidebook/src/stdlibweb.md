# Vestavěný webový server

V dnešní době je většina informací dostupná na Internetu. Přiznejme si, kolik zajímavých informací jsme se dověděli díky webovým stránkám jako je wikipedia.org. Čtenáře jistě napadá jak takový Internet funguje a jakým způsobem se k nám informace dostávají. Nebudeme se zde zabývat jak Internet funguje, ale přiblížíme si nutné detaily k tomu, abychom byli schopni poskytovat informace na Internetu prostřednictvím jazyka Python.

Pro prohlížení Internetových stránek používáme nějaký klientský program, který nazýváme prohlížeč. K těmto programům patří Mozilla Firefox, Microsoft Internet Explorer, Opera a jiné. Tyto prohlížeče nám zobrazují obsah, který je získáván z webového serveru na základě našich požadavků (zadáním webové adresy, klikáním na odkazy). Naprogramovat prohlížeč webových stránek je pro nás v současné chvíli přeci jen obtížný úkol, avšak naprogramovat webový server za použití standardní knihovny jazyka Python se jeví jako celkem jednoduchá úloha.

## Princip webového serveru

V jednoduchosti si přibližme práci webového serveru. Takovýto server reaguje na požadavky, které dostává od klienta (prohlížeče). Tyto požadavky jsou mapovány na tzv. metody. V standardu pro web servery je definováno mnoho metod, pro jednoduchost se však omezíme na metodu GET, kterou klient požaduje nějakou stránku z web serveru. Když klient použije tuto metodu, jako parametr zadává URL s požadovanou stránkou, kterou chce zobrazit, např.: http://muj-server.cz/index.html.

Z pohledu webového serveru situace vypadá následovně:

1. Server přijme požadavek spolu se specifikací metody a jejího parametru,

1. pokud je metoda typu GET, server ví, že bude vracet nějaký soubor, který je uveden v parametru metody,

1. server zjistí hodnotu parametru metody, v našem příkladu tedy `index.html`,

1. `index.html` je pro server jednoduchým souborem na disku počítače, server jej proto načte a pošle zpět klientovi,

1. komunikace s klientem končí až do chvíle dalšího požadavku.

Na tomto místě si uveďme poznámku, že se zabýváme webovým serverem, který poskytuje statický obsah. Takový obsah je na serveru pevně dán a nemění se v čase. V současné době jsme zvyklí na dynamicky generované stránky. I tento způsob generování stránek je možné v jazyce Python vytvořit.

## Vlastní webový server

Z výše uvedeného vyplývá, že náš server slouží k jednoduchému poskytování souborů. Takovýto server nachází uplatnění v situaci, kdy chceme někomu zpřístupnit naše soubory, nebo pro vývoj velmi jednoduché aplikace, poněvadž i takovýto server pro poskytování statického obsahu se dá přepsat na server poskytující dynamický obsah.

Pro realizaci našeho vlastního webového serveru využijeme modul `BaseHTTPServer`. Tento modul v sobě obsahuje základní funkcionalitu serveru, jako je čekání na požadavky od klientů na síťovém rozhraní a vrácení patřičné odpovědi.

V následujícím příkladu je uveden velice jednoduchý server, který poskytuje soubor `index.html` pokud si o něj prohlížeč požádá.

```python
from BaseHTTPServer import BaseHTTPRequestHandler

class ObsluhaGet(BaseHTTPRequestHandler):

    def do_GET(self):
        if self.path == "/index.html":
            self.send_response(200)
            self.end_headers()
            f = open("index.html", "rt")
            self.wfile.write(f.read())
            f.close()
        return

if __name__ == '__main__':
    from BaseHTTPServer import HTTPServer
    server = HTTPServer(('localhost', 8000), ObsluhaGet)
    print 'Startuji server, stisknete <Ctrl-C> pro ukonceni'
    server.serve_forever()
```

V příkladu vidíme, že z modulu `BaseHTTPServer` využijeme dvě třídy a to `BaseHTTPRequestHandler` a `HTTPServer`. První z nich slouží k obsluze jednotlivých požadavků od klientů. Druhá slouží k inicializaci webového serveru samotného.

Důležitou částí je definování vlastní třídy `ObsluhaGet`, která dědí z třídy `BaseHTTPRequestHandler`. V metodách této třídy se bude dít hlavní část práce při obsluze požadavku klienta. Je důležité poznamenat, že jména metod v této třídě mají pevně dané schéma. Metody se jmenují vždy `do_NAZEV_METODY`, kde `NAZEV_METODY` je jméno metody, kterou chceme obsloužit. Pro jednoduché získávání webových stránek (souborů) nám stačí obsloužit metodu `GET`, existují však metody `POST`, `PUT`, `HEAD`, atd.

V metodě `do_GET` si přečteme obsah instanční proměnné `path`, která obsahuje jméno souboru, který si prohlížeč vyžádal. Jak vidíme na příkladu, jednoduchým porovnáním obsahu proměnné `path` s nějakým řetězcem, který obsahuje jméno souboru uloženého na disku můžeme tento soubor načíst a poslat zpět prohlížeči. V tomto případě předpokládáme, že soubor `index.html` je umístěn ve stejném adresáři jako skript serveru. Pro správné zobrazení obsahu souboru však musíme ještě nastavit několik důležitých hlaviček odpovědi. Ty se nastavují pomocí metod `send_respo nse()` (hodnota `200` znamená, že vše je v pořádku a budeme odpovídat klientovi), `end_headers()` metoda informuje prohlížeč o ukončení hlaviček. Dále bude následovat samotná odpověď, která se skládá z načtení souboru z disku. Soubor nejprve otevřeme funkcí `open`, který bere dva parametry. První parametr je název souboru, který chceme otevřít, druhy je příznak, který specifikuje, zda chceme soubor otevřít pro zápis nebo čtení. Naši odpověď klientovi zašleme pomocí volání metody `write()` na atribudu `wfile`. Jako argument co klientovi zašleme, použijeme volání `read()` na právě otevřeném souboru.

Takovýmto relativně jednoduchým způsobem můžeme vytvořit náš vlastní webový server. Na podobném principy pracují i jiné servery pro poskytování statického obsahu. V produkčním nasazení se však doporučuje používat nějaký osvědčený server a náš vlastní používat jen pro soukromé nebo testovací účely.

**Cvičení:**

Teď již víte jak vypsat obsah nějakého souboru. Pokuste se upravit příklad webového serveru tak, aby jako odpověď vracel obsah jakéhokoli souboru v aktuálním adresáři.

**Cvičení:**

Předešlé cvičení upravte tak, aby Váš webový server vracel pouze obsah souborů s příponou `html`.

**Cvičení:**

První cvičení upravte tak, aby Váš webový server vracel stránku 404 (nenalezeno), pokud zadaný soubor neexistuje. K řešení využijte výjimku, která bude vyvolána při snaze otevřít neexistující soubor.
