# Vzdálené volání funkcí pomocí XML-RPC

Vzdálené volání funkcí slouží, jak už název napovídá, k volání funkcí na nějakém vzdáleném místě (v tomto případě počítači připojenému do počítačové sítě). V současné chvíli je nám zcela jasné, jak provádět volání funkcí v rámci našeho skriptu, volání funkcí z modulů nebo volání metod tříd.

V praxi však často dochází k tomu, že náš softwarový produkt je umístěn na více počítačích, které jsou spolu propojeny počítačovou sítí. Každý takovýto počítač je vybaven programy, které složí k jinému účelu. Tyto počítače by však měly ve výsledku tvořit kompaktní celek. Z tohoto důvodu spolu musí komunikovat (předávat si zprávy).

Jedním ze způsobů komunikace je tzv. vzdálené volaní funkcí (nebo procedur). V princip se jedná o komunikaci pomocí architektury klient/server, kde se komunikující programy dělí na klienta a server.

**Klient** je program, který bude požadovat vykonání funkce na vzdáleném serveru. Při požadavku serveru předá potřebné parametry a po vykonání vzdálené funkce serverem také obdrží výsledek.

**Server** je program, který očekává požadavky od klientů. Pokud takový požadavek obdrží, vykoná jej prostřednictvím volaní své vnitřní funkce a výsledek pak předá klientovi.

My se konkrétně budeme zabývat technologií XML-RPC, tedy vzdáleným voláním funkcí za pomoci XML. Na první pohled to může vypadat velice složitě, avšak díky standardní knihovně Pythonu bude práce s touto technologií velice jednoduchá. Pro praktické použití nebudeme potřebovat ani dva počítače, pokud budou server i klient komunikovat přes lokální síťové rozhraní počítače.

Nyní se pokusme vytvořit jednoduchou kalkulačku pomocí vzdáleného volání funkcí. Server bude poskytovat funkce pro sčítání a odčítání čísel, klient bude tyto funkce využívat.

```python
import SimpleXMLRPCServer

def add(a, b):
    return a + b

def subtract(a, b):
    return a - b

# simple server
server = SimpleXMLRPCServer.SimpleXMLRPCServer(\
("localhost", 8000))
print "Listening at the port 8000..."

server.register_function(add, 'plus')
server.register_function(subtract, 'minus')

server.serve_forever()
```

Nyní si ve stručnosti projděme zdrojový kód serveru. Standardní knihovna Pythonu obsahuje modul `SimpleXMLRPCServer`, který poskytuje funkcionalitu serveru pro vzdálená volání. Na prvním řádku si tento modul připojíme. Dále definuje dvě funkce pro sčítání a odečítání dvou čísel. Zbylá část kódu jen inicializuje server. Nejprve si vytvoříme objekt serveru, který bude naslouchat na lokálním síťovém rozhraní počítače (konkrétně na portu `8000`). Dále je nutné tzv. registrovat funkce, které bude server navenek poskytovat klientům. Jak je vidět z výpisu. Funkce `add` a `subtract` se budou navenek tvářit jako funkce `plus` a `minus`. Toto je užitečná metoda jak zachovat vnitřní konvenci pojmenovávání funkcí a přitom je navenek propagovat pod jiným jménem. Nakonec náš server spustíme a budeme čekat na volání od klientů.

Všimněme si důležitého faktu, že funkce které chceme zpřístupnit pro vzdálené volání jsou zcela totožné z hlediska syntaxe s funkcemi, které již dobře známe.

Klientská část vypadá následovně:

```python
import xmlrpclib

remote_server = xmlrpclib.ServerProxy("http://localhost:8000/")
print remote_server.plus(7, 3) # 10
print remote_server.minus(7, 3) # 4
```

Pro klienta využijeme modul `xmlrpclib`, který obsahuje funkce pro zpřístupnění vzdáleného volání funkcí na nějakém serveru. Pro aktuální zpřístupnění funkcí na serveru si nejprve vytvoříme objekt serveru zavoláním funkce `ServerProxy` z modulu `xmlrpclib`, kde parametrem bude síťová adresa serveru (v našem případě lokální adresa a port použitý v kódu serveru). Pomocí toho to objektu pak můžeme volat funkce definované na serveru tak, jako by byly definované uvnitř nějakého objektu, který jsme si vytvořili sami. V našem případě tedy příkaz `remote_server.plus(7, 3)` zavolá funkci `add` na serveru.

Jak je z tohoto příkladu vidět, vzdálené volání v Pythonu za použití standardní knihovny je velice jednoduché. Při tom si všimněte, že jsme se nikde nesetkali s XML, které je použito ve vnitřní implementaci celého mechanizmu.

**Cvičení:**

Vyzkoušejte si uvedený příklad a doplňte server o další funkce.

**Cvičení:**

Naimplementujte server, který bude provádět jednoduché výpočetní operace. Při implementaci serveru použijte třídu, jejíž metody budou přístupné klientům. Všimněte si rozdílu v registraci funkcí na serveru. V dokumentaci k jazyku Python je tento případ dobře popsán{{sidenote: <http://docs.python.org/2/library/simplexmlrpcserver.html#simplexmlrpcserver-example>}}.
