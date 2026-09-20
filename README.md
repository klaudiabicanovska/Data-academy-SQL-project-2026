# Projekt z SQL 

## Úvod
Projekt z SQL poskytuje informácie o dostupnosti potravín v závislosti od  priemerných príjmov v Českej republike za vymedzené časové obdobie. V prvej časti projektu sú vytvorené tabuľky, prostredníctvom ktorých odpovedáme na vopred stanovené výskumné otázky. V druhej časti projektu sú prezentované výsledky stanovených otázok, na základe vytvorených dátových podkladov. 

## 1.  Vytvorenie tabuliek

### 1.1 Tabuľka *t_klaudia_bicanovska_project_SQL_primary_final*
Prvotná tabuľka poskytuje informácie o priemerných mzdách podľa odvetví a rovnako aj cenách potravín v Českej republike. 

**Príprava a zhodnotenie vstupných dát**

Pred samotným vytvorením tabuľky sme overili niektoré vlastnosti dátových sad:

-*Spôsob prepočtu mzdy:* Pre výpočet priemernej mzdy boli použité hodnoty prepočítané na zamestnanca (calculation_code = 200), nie fyzický počet zamestnancov (calculation_code = 100). Dôvodom bolo získať presnejšiu informáciu o hrubej mzde, ktorá odráža reálnu hodnotu odpracovaného času, keďže prepočítaný počet zohľadňuje aj čiastočné úväzky. Rovnako sme podmienkou value_type_code = 5958 zabezpečili, že do výpočtu vstupuje len priemerná hrubá mzda na zamestnanca

-*Overenie NULL hodnoty v region_code:* Porovnaním počtu záznamov pre jednotlivé kraje sme zistili, že hodnota NULL v stĺpci region_code sa vyskytuje s rovnakou pravidelnosťou ako záznamy pre jednotlivé kraje (najčastejšie 7217 záznamov). Táto zhoda počtu záznamov podporuje záver, že NULL nereprezentuje chýbajúci údaj, ale samostatnú, celorepublikovú hodnotu ceny.

**Vytvorenie tabuľky**

Pre vytvorenie tabuľky sme prvotne zadefinovali porovnateľné obdobie pre dátové sady miezd a cien– prienikom oboch rozsahov rokov vyšlo obdobie od roku 2006 do roku 2018.Následne sme spojili dátové sady miezd a cien do jednej tabuľky, hoci mali rozdielny počet riadkov: pri mzdách boli hodnoty za všetky odvetvia a roky úplné, no pri cenách chýbali niektoré kategórie v niektorých rokoch, čím sa výsledný počet riadkov (342) neriadil presným súčinom 13 rokov × 27 kategórií.
Do tabuľky sme doplnili dva stĺpce, ktoré uľahčujú jej ďalšiu prácu s dátami:

-*type* pre rozdelenie dát na mzdy a ceny,

-*unit* pre zadefinovanie mernej jednotky. 

Priemerné hodnoty miezd a cien boli zaokrúhlené na 2 desatinné miesta pre lepšiu čitateľnosť výstupu.
