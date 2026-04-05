# Standardní knihovna jazyka Python

Standardní knihovna jazyka Python obsahuje velké množství užitečných funkcí. Vysvětleme si nejprve co je a k čemu takováto knihovna slouží. Programovací jazyky obecně slouží ke konstrukci algoritmů, které poté jejich kompilátor nebo interpret převede do spustitelné podoby, která daný algoritmus vykonává. Programovací jazyk obsahuje jen velice málo funkcí, které programátor může použít. Standardní knihovna je ihned dispozici po nainstalování příslušného programovacího jazyka. Většinou ji stačí k našemu programu jednoduše připojit.

Knihovny slouží jako úložná místa s již vytvořenými funkcemi, které programátorovi usnadňují každodenní práci. Velkým skokem kupředu v oblasti standardní knihovny se stal v minulosti programovací jazyk Java. Ten oproti jazyku C s sebou přinesl velkou sadu funkcí, které jinak museli programátoři jazyka C pracně vyhledávat, popřípadě vytvářet sami.

Programovací jazyk Python jde v ohledu ke standardní knihovně v podobném stylu jako jazyk Java. Python disponuje širokou škálou knihoven od práce s regulárními výrazy, přes práci se sítí, až po webové služby. Příjemné též je to, že i vaše vlastní knihovna se může stát součástí standardní knihovny Pythonu, pokud bude dostatečně užitečná, kvalitně napsaná a zdokumentovaná.

## Použití standardní knihovny

Na začátek je třeba si říci, jak se v jazyce Python používá standardní knihovna. Instalace interpretu Pythonu v sobě obsahuje mnoho modulů (knihoven), které se k našemu skriptu dají připojit pomocí klíčového slova import, následovaného jménem modulu. Tímto příkazem se k našemu skriptu připojí modul a dále můžeme používat funkce, které jsou v něm obsaženy pomocí syntaxe `jméno_modulu.funkce()`. Existují i jiné způsoby práce s funkcemi z modulu, tato je však jedna z nejpřehlednějších. Uveďme si krátký příklad, kdy pomocí modulu `os` ze standardní knihovny vytiskneme obsah aktuálního adresáře:

```python
>>> import os
>>> os.listdir(".")
["text.tex", "text.pdf", "text.aux", "text.toc"]
```

Modul `os` obsahuje mnoho užitečných funkcí pro práci s operačním systémem. V našem případě chceme vytisknout obsah aktuálního adresáře (tedy soubory a adresáře v něm obsažené). Funkce, která slouží pro výpis obsahu adresáře se jmenuje `listdir()` a její parametr je cesta k adresáři, ve kterém chceme tuto operaci provést. Aktuální adresář tedy bude řetězec `"."`. K funkci `listdir()` pak přistoupíme jednoduše pomocí příkazu `os.listdir(".")`.
