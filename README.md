<div align="justify">

# Projekt z SQL 

## Úvod
Projekt z SQL poskytuje informácie o dostupnosti potravín v závislosti od  priemerných príjmov v Českej republike za vymedzené časové obdobie. V prvej časti projektu sú vytvorené tabuľky, prostredníctvom ktorých odpovedáme na vopred stanovené výskumné otázky. V druhej časti projektu sú prezentované výsledky stanovených otázok, na základe vytvorených dátových podkladov. 

## 1.  Vytvorenie tabuliek

### 1.1 Tabuľka *t_klaudia_bicanovska_project_SQL_primary_final*
Prvotná tabuľka poskytuje informácie o priemerných mzdách podľa odvetví a rovnako aj cenách potravín v Českej republike. 

**Príprava a zhodnotenie vstupných dát**

Pred samotným vytvorením tabuľky sme overili niektoré vlastnosti dátových sad:

-*Spôsob prepočtu mzdy:* Pre výpočet priemernej mzdy boli použité hodnoty prepočítané na zamestnanca (calculation_code = 200), nie fyzický počet zamestnancov (calculation_code = 100). Dôvodom bolo získať presnejšiu informáciu o hrubej mzde, ktorá odráža reálnu hodnotu odpracovaného času. Rovnako sme podmienkou value_type_code = 5958 zabezpečili, že do výpočtu vstupuje len priemerná hrubá mzda na zamestnanca.

-*Overenie NULL hodnoty v region_code:* Porovnaním počtu záznamov pre jednotlivé kraje sme zistili, že hodnota NULL v stĺpci region_code sa vyskytuje s rovnakou pravidelnosťou ako záznamy pre jednotlivé kraje (najčastejšie 7217 záznamov). Táto zhoda počtu záznamov podporuje záver, že NULL nereprezentuje chýbajúci údaj, ale samostatnú, celorepublikovú hodnotu ceny.

**Vytvorenie tabuľky**

Pre vytvorenie tabuľky sme prvotne zadefinovali porovnateľné obdobie pre dátové sady miezd a cien– prienikom oboch rozsahov rokov vyšlo obdobie od roku 2006 do roku 2018.Následne sme spojili dátové sady miezd a cien do jednej tabuľky, hoci mali rozdielny počet riadkov: pri mzdách boli hodnoty za všetky odvetvia a roky úplné, no pri cenách chýbali niektoré kategórie v niektorých rokoch, čím sa výsledný počet riadkov (342) neriadil presným súčinom 13 rokov × 27 kategórií.
Do tabuľky sme doplnili dva stĺpce, ktoré uľahčujú jej ďalšiu prácu s dátami:

-*type* pre rozdelenie dát na mzdy a ceny,

-*unit* pre zadefinovanie mernej jednotky. 

Priemerné hodnoty miezd a cien boli zaokrúhlené na 2 desatinné miesta pre lepšiu čitateľnosť výstupu.

### 1.2 Tabuľka  *t_klaudia_bicanovska_project_SQL_secondary_final*
Druhá tabuľka zobrazuje HDP, gini a obyvateľstvo krajín Európy (vrátane Českej republiky) v porovnateľnom období.

## 2.  Výskumné otázky
### 2.1 Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
V sledovanom období rástli každý rok mzdy jedine v odvetviach: Spracovateľský priemysel, Zdravotná a sociálna starostlivosť a  Ostatné činnosti. V ostatných odvetviach mzdy aspoň v jednom roku klesali. 
### 2.2 Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
V roku 2006 bolo možné nakúpiť za priemernú mzdu v Českej republike 1 312,98 kg chleba a 1 465,73 l mlieka. Napriek zdražovaniu potravín rástla priemerná mzda v Českej republike rýchlejšie než ceny chleba a mlieka, čo spôsobilo lepšiu dostupnosť týchto potravín v roku 2018 – v tomto roku bolo možné za priemernú mzdu nakúpiť už 1 365,16 kg chleba a 1 669,6 l mlieka.
### 2.3 Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)? 
Najpomalší nárast ceny potravín zaznamenala kategória - cukor krištáľový, ktorý vo väčšej miere klesal.
### 2.4 Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
Počas rokov 2006–2018 nenastala situácia, kedy by bol meziročný nárast ceny potravín o viac než 10 percentuálnych bodov vyšší než rast miezd. 
### 2.5 Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?

Na základe porovnania meziročnej percentuálnej zmeny HDP Českej republiky s meziročnou zmenou priemernej mzdy a priemernej ceny potravín (v rovnakom aj nasledujúcom roku) boli zistené nasledovné závery:

Mzdy rástli takmer vo všetkých sledovaných rokoch (2006–2018), a to väčšinou nezávisle od toho, či HDP v danom roku rástlo. Výnimkou boli len roky, v ktorých HDP samo kleslo (2009, 2012, 2013) – v týchto rokoch skript vyhodnotil "HDP neovplyvnilo mzdu", keďže podmienka rastu HDP nebola splnená.

Vzťah medzi HDP a cenami potravín je menej konzistentný – napríklad v rokoch 2015 a 2016 ceny potravín klesali (alebo rástli až v nasledujúcom roku), aj keď HDP v tom čase rástlo.

**Záver:** Na základe dostupných dát nie je možné jednoznačne potvrdiť silný a konzistentný vplyv HDP na mzdy a ceny potravín – mzdy vykazovali stabilný rastový trend prevažne nezávislý od HDP, zatiaľ čo pri cenách potravín bol vzťah s HDP nejednoznačný.

*Poznámka: Skript testuje len smer zmeny (rast/pokles), nie mieru "výraznosti" rastu, ako sa pôvodná otázka pýta. Presnejšie vyhodnotenie výraznosti by vyžadovalo definovať konkrétnu prahovú hodnotu (podobne ako pri otázke 4, kde bola stanovená hranica 10 %), čo v zadaní pre túto otázku nebolo explicitne určené.*

## 3.  Zhrnutie

</div>
