<div align="justify">

# Projekt z SQL 

## Úvod
Projekt z SQL poskytuje informácie o dostupnosti potravín v závislosti od priemerných príjmov v Českej republike za vymedzené časové obdobie. Rovnako sa zaoberá aj vývojom HDP a jeho vplyvom na zmeny v mzdách a cenách v Českej republike. V prvej časti projektu sú vytvorené tabuľky, prostredníctvom ktorých odpovedáme na vopred stanovené výskumné otázky. V druhej časti projektu sú prezentované výsledky stanovených otázok, na základe vytvorených dátových podkladov. 

## 1.  Vytvorenie tabuliek

### 1.1 Tabuľka *t_klaudia_bicanovska_project_SQL_primary_final*
Prvotná tabuľka poskytuje informácie o priemerných mzdách podľa odvetví a rovnako aj cenách potravín v Českej republike. 

**Príprava a zhodnotenie vstupných dát**

Pred samotným vytvorením tabuľky sme overili niektoré vlastnosti dátových sad:

-*Spôsob prepočtu mzdy:* Pre výpočet priemernej mzdy boli použité hodnoty prepočítané na zamestnanca (calculation_code = 200), nie fyzický počet zamestnancov (calculation_code = 100). Dôvodom bolo získať presnejšiu informáciu o hrubej mzde, ktorá odráža reálnu hodnotu odpracovaného času. Rovnako sme podmienkou value_type_code = 5958 zabezpečili, že do výpočtu vstupuje len priemerná hrubá mzda na zamestnanca.

-*Overenie NULL hodnoty v region_code:* Porovnaním počtu záznamov pre jednotlivé kraje sme zistili, že hodnota NULL v stĺpci region_code sa vyskytuje s rovnakou pravidelnosťou ako záznamy pre jednotlivé kraje (najčastejšie 7217 záznamov). Táto zhoda počtu záznamov podporuje záver, že NULL nereprezentuje chýbajúci údaj, ale samostatnú, celorepublikovú hodnotu ceny.

**Vytvorenie tabuľky**

Pre vytvorenie tabuľky sme prvotne zadefinovali porovnateľné obdobie pre dátové sady miezd a cien– prienikom oboch rozsahov rokov vyšlo obdobie od roku 2006 do roku 2018. Následne sme spojili dátové sady miezd a cien do jednej tabuľky, hoci mali rozdielny počet riadkov: pri mzdách boli hodnoty za všetky odvetvia a roky úplné, no pri cenách chýbali niektoré kategórie v niektorých rokoch, čím sa výsledný počet riadkov (342) neriadil presným súčinom 13 rokov × 27 kategórií. Konkrétne chýbali hodnoty za kategóriu *Akostné víno biele* v rokoch 2006-2014.

Do tabuľky sme doplnili dva stĺpce, ktoré uľahčujú jej ďalšiu prácu s dátami:

-*type* pre rozdelenie dát na mzdy a ceny,

-*unit* pre zadefinovanie mernej jednotky. 

Priemerné hodnoty miezd a cien boli zaokrúhlené na 2 desatinné miesta pre lepšiu čitateľnosť výstupu.

### 1.2 Tabuľka  *t_klaudia_bicanovska_project_SQL_secondary_final*
Druhá tabuľka zobrazuje HDP, gini a obyvateľstvo krajín Európy (vrátane Českej republiky) v porovnateľnom období.

## 2.  Výskumné otázky
### 2.1 Rastú v priebehu rokov mzdy vo všetkých odvetviach, alebo v niektorých klesajú?
V sledovanom období rástli každý rok mzdy jedine v odvetviach: Spracovateľský priemysel, Zdravotná a sociálna starostlivosť a  Ostatné činnosti. V ostatných odvetviach mzdy aspoň v jednom roku klesali. 
### 2.2 Koľko litrov mlieka a kilogramov chleba je možné si kúpiť za prvé a posledné porovnateľné obdobie v dostupných údajoch o cenách a mzdách?
V roku 2006 bolo možné nakúpiť za priemernú mzdu v Českej republike 1 312,98 kg chleba a 1 465,73 l mlieka. Napriek zdražovaniu potravín rástla priemerná mzda v Českej republike rýchlejšie než ceny chleba a mlieka, čo spôsobilo lepšiu dostupnosť týchto potravín v roku 2018 – v tomto roku bolo možné za priemernú mzdu nakúpiť už 1 365,16 kg chleba a 1 669,60 l mlieka.
### 2.3 Ktorá kategória potravín zdražuje najpomalšie (má najnižší percentuálny medziročný nárast)?
Najpomalší nárast ceny potravín zaznamenala kategória - cukor krištálový, ktorý vo väčšej miere klesal.
### 2.4 Existuje rok, v ktorom bol medziročný nárast cien potravín výrazne vyšší ako rast miezd (viac ako 10 %)?
Počas rokov 2006–2018 nenastala situácia, kedy by bol medziročný nárast ceny potravín o viac než 10 percentuálnych bodov vyšší než rast miezd. 
### 2.5 Má výška HDP vplyv na zmeny miezd a cien potravín? Inými slovami, ak HDP výraznejšie vzrastie v jednom roku, prejaví sa to na cenách potravín alebo mzdách v tom istom či nasledujúcom roku výraznejším rastom?
Na základe analýzy vývoja miezd, cien a HDP Českej republiky, môžeme zhodnotiť nasledovné závery:
-  Mzdy rástli počas celého sledovaného obdobia, okrem roku 2013. 
-  V prípade vývoja cien, môžeme rovnako zhodnotiť rastúci trend, okrem roku 2009, 2015 a 2016. 
-  HDP Českej republiky zaznamenalo rast, avšak môžeme sledovať aj pokles v roku 2009, 2012 a 2013.
-  Vzhľadom na predchádzajúce závery nemôžeme jednoznačne potvrdiť vplyv vývoja HDP na zmeny cien a miezd v Českej republike.

*Poznámka*: Pri skúmaní vplyvu HDP na zmeny v cenách a mzdách, nebola testovaná miera vplyvu premennej, iba rast a pokles.   
</div>
