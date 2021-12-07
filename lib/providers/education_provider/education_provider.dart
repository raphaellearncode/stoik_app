import 'package:flutter/material.dart';
import 'package:stoik_app/model/learning_model.dart';

class EducationProvider extends ChangeNotifier {
  EducationProvider() {
    init();
  }

  init() async {
    print('LOAd Education PROVIDER');
  }

  //todo: game assets:
  final List<LearnModel> educationList = [
    LearnModel(
        'Czym jest stoicyzm',
        '''Kilka książkowych informacji \n
Nurt w dziejach filozofii utworzony przez Zenona z Kition (ok. 336 - 264 p.n.e.) i rozwijany przez wielu antycznych filozofów greckich i rzymskich. Jego nazwa pochodzi od budowli, w której Zenon nauczał w Atenach: Stoa Poikile. 
Postawa życiowa i intelektualna rozpowszechniona i biorąca swą nazwę od szkoły stoików; 
Celem postawy stoickiej jest życie zgodne z cnotą, pojmowaną jako harmonia rozumnych działań człowieka, opartych na porządku racjonalnej natury; cechuje ją stała samoświadomość i odczuwanie siebie jako cząstki kosmosu, spokój wewnętrzny, opanowanie afektów, niewzruszoność wobec tego, co od człowieka nie zależy, dające wolność i szczęście; stoicyzm, poprzez dzieła stoików rzymskich, zwłaszcza Marka Aureliusza, Seneki Młodszego i Epikteta z Hierapolis, kształtował postawę życiową od starożytnego chrześcijaństwa, poprzez średniowiecze po czasy współczesne.\n
A tak po ludzku \n 
Nie zawsze mamy wpływ na dotykające nas zdarzenia ale możemy kontrolować nasze podejście i reakcje.
Na co dzień stoicy skupiają się na tu i teraz, zarazem pamiętając o lekcjach przeszłości i Kierują się powyższą myślą oraz czterema cnotami: rozsądek sprawiedliwość, wstrzemięźliwość, odwaga.
Rozumieją, że nasze emocje i reakcje zależą od interpretacji sytuacji zamiast od sytuacji samej w sobie.''',
        'assets/images/edu1.png'),
    LearnModel('Sławni stoicy', ''' ''', 'assets/images/edu2.png'),
    LearnModel(
        'Zachowaj spokój',
        '''`Optymiści i pesymiści żyją tak samo długo, tylko optymisci weselej. Dlaczego mam żyć smutniej? Wystarczy nie krzywdzić i nadmiernie nie narzekać.`- Władysław Bartoszewski. \n''',
        'assets/images/meditation.png'),
    LearnModel(
        'Moje "Ja"',
        '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.''',
        'assets/images/me.png'),
    LearnModel(
        'Ludzie',
        '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.''',
        'assets/images/people.png'),
  ];

  int get educationListCounter {
    return educationList.length;
  }

  //todo: game assets:
  final List<LearnModel> stoicList = [
    LearnModel(
        'Zenon Z Kition \n(ok. 335–263 p.n.e.)',
        '''Założyciel szkoły stoickiej, Zenon, urodził się
w mieście Kition na Cyprze ok. 335 r. p.n.e.
W jego żyłach płynęła krew semicka – przodkowie filozofa pochodzili bowiem
z terenów Bliskiego Wschodu. Pewnego razu ojciec Zenona, który jako kupiec dużo podróżował, przywiózł mu pisma sokratyczne.
Pod ich wpływem, mając dwadzieścia dwa lata, Zenon opuścił rodzinne miasto i udał się do Aten, by tam poświęcić się studiowaniu
filozofii. W Atenach największy wpływ na Zenona miał cynik Krates oraz przedstawiciele szkoły megarejskiej, którzy nauczali, aby kłaść nacisk na logiczną
i dialektyczną stronę refleksji. Nie bez wpływu na wewnętrzny rozwój Zenona pozostały także studia nad tekstami wcześniejszych myślicieli. Ponieważ filozof
nie był obywatelem ateńskim, nie miał prawa do zakupu budynku, w którym mógłby umieścić swą szkołę. Z tego też względu spotykał się z uczniami w „malowanej kolumnadzie” lub „malowanym portyku” (gr. stoa poikile), od
którego pochodzi nazwa stoicy. Otwarty umysł Zenona przekładał się na sposób nauczania. Wykłady prowadzone były w sposób niedogmatyczny: towarzyszyły im dyskusje, podczas
których poglądy nauczyciela były rewidowane i krytykowane. Tu tkwi przyczyna ewolucji filozofii stoickiej. Zenon był znany ze swej mądrości, prawego życia i skromności. Jednym z najważniejszych dokonań myśliciela było połączenie dwóch obcych sobie tendencji
w filozofii starożytnej – materializmu i idealizmu. Połączenie to stało się podstawą stoickiej fizyki (monizm panteistyczny), ta zaś zaważyła na kształcie nauk moralnych (życie zgodne
z rozumem, akceptacja konieczności).''',
        'assets/images/zenon.png'),
    LearnModel(
        'Epiktet \n(50–135 r.)',
        '''W nauce Epikteta ogniskuje się istota stoicyzmu. Myśliciel miał dydaktyczne zacięcie,
nauczał wiele, lecz swojej nauki nie spisywał. Nie rozwijał też zagadnień logicznych
i metafizycznych – mówił o nich tylko w kontekście najważniejszych dla siebie kwestii
etycznych. Trudno przecenić wpływ Epikteta na kształtowanie się stoicyzmu w okresie
pochrystusowym – pod wpływem filozofa Marek Aureliusz porzucił retorykę, w obrębie
której wykazywał wielkie zdolności, by poświęcić się właśnie mądrości stoickiej.
Aureliuszowe Rozmyślania są wyraźnym nawiązaniem do nauki Epikteta. Rzecz to ciekawa,
gdyż Marek Aureliusz był cesarzem rzymskim, a Epiktet – najpierw niewolnikiem, który
należał do jednego z oddziałów straży przybocznej Nerona, potem zaś wyzwoleńcem
zmuszonym do opuszczenia Rzymu, gdy Domicjan wygnał filozofów z cesarstwa. Epiktet
założył szkołę w Nikopolis w Epirze. Tam jego uczeń, Flawiusz Arianus, spisał naukę mistrza.
Jej istotę można zawrzeć w następującym sformułowaniu: są rzeczy od człowieka zależne
(akty woli) i rzeczy niezależne (wszystko, co poddane jest przeznaczeniu), szczęśliwy jest
ten, kto nie przykłada wagi do spraw, na które nie ma wpływu, lecz je ze spokojem akceptuje.''',
        'assets/images/epiktet.png'),
    LearnModel(
        'Marek Aureliusz\n (121–180 r.)',
        '''Marek Aureliusz był filozofem, a zarazem
władcą Cesarstwa Rzymskiego w latach 161–180. Zasiadł na tronie, mając trzydzieści
dziewięć lat. Czasy, w których przyszło mu rządzić, nie były łatwe. Już na samym
początku jego rządów wschodnie prowincje cesarstwa były atakowane przez Partów –
wojna z najeźdźcą trwała pięć lat i zakończyła się zwycięstwem Rzymu. Ale, gdy jedna wojna
się skończyła, rozpoczęła się kolejna. Tym razem Rzymianie walczyli na północy
z plemionami germańskimi i sarmackimi; walki z przerwami trwały kilkanaście lat. Do
zagrożeń zewnętrznych dochodziły wewnętrzne: rebelie i bunty, a także zaraza,
wylew Tybru, trzęsienie ziemi. W tym czasie Marek Aureliusz przeżywał też osobiste
dramaty, umarło mu bowiem siedmioro z trzynaściorga dzieci, a także jego żona,
Faustyna. Jednak w obliczu tych problemów władca rządził cesarstwem w sposób sprawny
i rozsądny. Z filozofią spotkał się wcześnie, jeszcze jako dziecko. Już jako dwunastolatek
marzył o ascetycznym życiu prawdziwego mędrca, a mając lat dwadzieścia, pod wielkim
wpływem pism Epikteta, porzucił studiowanie retoryki, by ostatecznie poświęcić się
stoicyzmowi. Pisał dla samego siebie, traktując filozofię przede wszystkim jako ćwiczenie
duchowe. Z tego też względu nie wzbogacił on stoickiej doktryny, nadał jej jednak charakter
jeszcze bardziej moralny, naznaczony z jednej strony odcieniem religijnym, z drugiej –
sceptycznym.
W osobie Marka Aureliusza urzeczywistnił się
platoński ideał władcy-filozofa. Ten, bodaj najbardziej
znany stoik, był nie tylko autorem Rozmyślań, książki
pięknej i głębokiej, lecz także jednym z najlepszych
przywódców Cesarstwa Rzymskiego.''',
        'assets/images/aureliusz.png'),
    LearnModel(
        'Seneka \n(5 p.n.e.–65 n.e.)',
        '''Seneka był nie tylko filozofem, lecz także
politykiem mającym duży wpływ na sposób
funkcjonowania Cesarstwa Rzymskiego – w 56
r. n.e. sprawował urząd konsula. Urodził się
w Kordobie, studiował w Rzymie, potem zaś –
z uwagi na słaby stan zdrowia – wyjechał do
Egiptu, gdzie spędził piętnaście lat. Powrócił
do Rzymu, ale już po dziesięciu latach cesarz
Klaudiusz wygnał go na Korsykę. Gdy
ponownie wrócił do Rzymu, został
wychowawcą młodego Nerona, a gdy ten
zasiadł na tronie, Seneka był jednym z jego
doradców. Ten sam Neron, podejrzewając
Senekę o spisek, zmusił go jednak do
samobójstwa. Seneka odebrał sobie życie w 65
r. Filozof jest jednym z najbardziej znanych
pisarzy starożytnych. Pisał po łacinie
i zostawił po sobie bogatą spuściznę. Jego
poglądy filozoficzne, podobnie jak innych
„stoików młodszych”, koncentrowały się
wokół kwestii mądrości życiowej i moralności.
Stoicy głosili cnotę dostępną dla każdego bez względu na wykształcenie czy status
społeczny – oto jeden z powodów, dla których filozofia ta znalazła szerokie grono
wyznawców, również wśród ludzi ubogich i niewolników. Z tego też względu mówi się wiele
o podobieństwie stoicyzmu i chrześcijaństwa, a legenda głosi, że Seneka znał osobiście św.
Pawła''',
        'assets/images/seneka.png'),
    LearnModel(
        'Chryzyp \n(ok. 279–207 p.n.e.)',
        '''Chryzyp zażegnał wewnętrzne kryzysy szkoły.
Spisał, usystematyzował i rozwinął naukę stoików, nadając jej wyrafinowany kształt
logicznych argumentów. Jego wybitne teksty przyćmiły wszystkie inne: powoływano się na
nie, czytano je i komentowano tak, że trudno dziś powiedzieć, które poglądy stoików od
kogo dokładnie pochodzą. Mówi się słusznie, że gdyby nie było Chryzypa, szkoła by nie
przetrwała, a nauka stoików zostałaby zapomniana. Chryzyp stworzył dwuwartościową logikę zdań, która, obok
arystotelesowskiej logiki nazw, jest uważana za jedno z najwspanialszych zdobyczy ludzkiego
rozumu. Jak pisze Diogenes Laertios:
Wręczyli mu klucze do bram miasta i uczcili go złotym wieńcem oraz
spiżowym posągiem.
Źródło: Diogenes Laeros, Żywoty i poglądy słynnych filozofów.

Chryzyp był najwybitniejszym umysłem starej szkoły
stoickiej i jednym z najwybitniejszych logików w całej
historii myśli europejskiej. Urodził się w Soloi w Cylicji
i był pochodzenia semickiego – świadczy o tym
chociażby fakt, że greki nauczył się późno, już jako
dorosły, i z tego względu popełniał błędy językowe.''',
        'assets/images/chryzyp.png'),
//     LearnModel(
//         'Klejstenes \n(ok. 331–232 p.n.e.)',
//         '''Następcą Zenona został Kleantes z Assos, stoik z dwudziestoletnim stażem i bogatym
// doświadczeniem życiowym. Zanim trafił do Portyku, był pięściarzem. Ponadto, jako człowiek
// nie dość zamożny, lecz pragnący poświęcić się filozofii, nie bał się w późniejszym okresie
// podejmować prac przeznaczonych dla osób o niskim statusie społecznym: podlewał w nocy
// ogrody czy ugniatał mąkę dla przekupek. Kleantes miał talent literacki: pisał dużo i pięknie.
// Brakowało mu jednak zręczności w prowadzeniu szkoły. Egalitaryzm, wolność dyskusji,
// krytyka i rewizja filozoficznych poglądów, będące od początku standardem stoickiego
// kształcenia, zaczęły coraz częściej wymykać się spod kontroli, przeradzając się
// w poważniejsze wstrząsy, potem zaś w kryzys, którego Kleantes w czasie swoich
// trzydziestoletnich rządów w Portyku nie potrafił już rozwiązać''',
//         'assets/images/people.png'),
  ];

  int get stoicListCounter {
    return educationList.length;
  }
}
