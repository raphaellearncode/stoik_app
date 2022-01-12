import 'package:flutter/material.dart';
import 'package:stoik_app/model/learning_model.dart';

class EducationProvider extends ChangeNotifier {
  EducationProvider() {
    init();
  }

  init() async {
    print('LOAd Education PROVIDER');
  }

  final List<LearnModel> educationList = [
    LearnModel(
        'Czym jest stoicyzm',
        '''Stoicyzm różni się od większości filozofii. Zamiast rozmyślać nad trudnymi zagadnieniami, skupia się na radzeniu sobie z rzeczywistością, taką, jaka jest.\nStoicy już od czasów starożytnych zdawali sobie sprawę z tego, co dziś dowodzi psychologia:\nNie zawsze mamy kontrolę nad tym, co na nas oddziałuje, ale mamy wpływ na nasze podejście i reakcje.\nWykorzystując to nastawienie, stoicy pracują nad swoim światem wewnętrznym. Nawet w obliczu kryzysu zachowują spokój. Niezależnie od okoliczności, zamiast pogrążać się w smutku czy złości, szukają pozytywów. Kierują się rozsądkiem, sprawiedliwością, wstrzemięźliwością i odwagą.\nBycie stoikiem nie oznacza jednak, że trzeba godzić się ze złem, które dzieje się na świecie. Stoicy uważają, że tylko ludzie pracujący nad sobą mogą pozytywnie wpłynąć na innych.\n Podsumowując, stoickie nastawienie polega na:\n- akceptacji rzeczywistości taką, jaką jest,\n- zrozumieniu, że nie zawsze mamy kontrolę\nnad tym, co na nas oddziałuje, ale mamy nad samym sobą,\n- odnajdywaniu pozytywów w trudnych sytuacjach,\n- pracy nad swoim światem wewnętrznym,\nby móc zmieniać ten zewnętrzny.\n„Wypadki zewnętrzne duszy nie dotykają, lecz stoją spokojnie poza nią, a wszelki niepokój jest jedynie skutkiem wewnętrznego sądu.”\nMarek Aureliusz''',
        'assets/images/edu1.png'),
    LearnModel('Sławni stoicy', ''' ''', 'assets/images/edu2.png'),
    LearnModel(
        'Zachowaj spokój',
        '''Niemalże codziennie jesteśmy bombardowani stresowymi sytuacjami, życie stawia nas przed trudnymi wyborami, testuje naszą cierpliwość do granic możliwości.\nCzy istnieje przepis na szczęśliwe życie?\nSzczęście to równowaga duchowa i poczucie spokoju, filozofia stoicka może być dobrą wskazówką w dzisiejszych czasach. Stoicyzm nakazuje by niezależnie od sytuacji nie martwić się tym na co nie mamy wpływu, zachować spokój i kierować się w życiu rozumem. Stoicki spokój, to rodzaj dystansu, cierpliwie wypracowywany i dający szansę na przetrwanie w świecie, którym rządzi ślepy, nieubłagany los.\n`Optymiści i pesymiści żyją tak samo długo, tylko optymisci weselej. Dlaczego mam żyć smutniej? Wystarczy nie krzywdzić i nadmiernie nie narzekać.`\n Władysław Bartoszewski''',
        'assets/images/meditation.png'),
    LearnModel(
        'Moje "Ja"',
        '''Ja i stoicyzm?!\nMoje życie to emocje, potrafię w ciągu godziny śmiać się, płakać i narzekać. Jak właściwie spojrzeć na rzeczy i złapać dystans?\nInterpretacja rzeczywistości zależy od nas samych, postawa stoicka nie jest postawą obojętną na zdarzenia, lecz skupia się na radzeniu sobie z rzeczywistością taką jaka jest.\nNajwięcej dzieje się w naszych głowach.\nKiedy uznamy ten fakt, zmieni się nasz sposób myślenia i interpretowania rzeczywistości, a to z kolei pozwoli nie zadręczać się rzeczami, na które nie mamy wpływu. Epiktet uwielbiał wyrywać swoich uczniów z ich zadowolenia z siebie i ich postępów. Chciał im przypomnieć o stałej pracy i nauce potrzebnej każdego dnia, jeśli chcemy zbliżyć się do doskonałości. Ważne jest, abyśmy pamiętali w naszej własnej drodze do samodoskonalenia, że ona nie przychodzi sama.\nStoicyzm to w pewnym sensie proces poznawania siebie, uświadomieniem sobie własnej niedoskonałości, która nie jest powodem do smutku lecz do skromności i motywacją do pracy nad sobą. 
         \n„Wskaż mi kogoś, kto jest chory i szczęśliwy, w niebezpieczeństwie, ale szczęśliwy, kogoś, umierającego i szczęśliwego, wygnanego i szczęśliwego, zhańbionego i szczęśliwego. Pokaż mi! Na Boga, jak bardzo chciałbym zobaczyć stoika. Ale skoro nie możesz pokazać mi kogoś, kto jest perfekcyjnie „uformowany”, przynajmniej pokaż mi kogoś, kto nad tym pracuje… Pokaż mi!” \n \n Epitet.''',
        'assets/images/me.png'),
    LearnModel(
        'Ludzie i stoicyzm',
        '''Żyjemy w ciągłym pośpiechu, spięci i sfrustrowani próbujemy mieć kontrolę nad wszystkim.Tymczasem jest całe mnóstwo rzeczy, rozmaitych wydarzeń losowych, działań przyrody, korków na drodze czy awantury przy kasie w supermarkecie niezależnych od nas.Nie jesteśmy w stanie sprawić siłą woli, że staniemy się celebrytami, milionerami czy mistrzami świata w jakiejś dyscyplinie sportowej.\nJest tyle rzeczy na które nie mamy wpływu, więc jaki jest sens przejmowania się nimi?Stoicy uważają, że najrozsądniej jest skupić swoją energię, czas i postanowienia na tym co zależy od nas samych na sprawach wobec których możemy podjąć jakieś konkretne działanie, trzymać się faktów i im nie zaprzeczać nie koncentrować się na wymyślaniu odrealnionego świata.\n
W przypadku ludzi niezaprzeczalnym faktem jest to, że jesteśmy gatunkiem społecznym, żyjemy w grupie, tworzymy społeczeństwo.\n
Zenon z Kition był pierwszym, który powiedział ludzkości, żeby nie przesadzała w żadną stronę, nie radowała się, ani nie smuciła nadmiernie, nie załamywała i zachowała spokój.\nZenon z Kition był filozofem, który urodził się koło 335 roku p.n.e., zasłynął jako założyciel jednej z najważniejszych starożytnych szkół filozoficznych - stoicyzmu. Wedle ideałów tej filozofii nie ma niczego ważniejszego od samopoznania i samodoskonalenia. Celem samym w sobie jest zdobywanie wiedzy i doświadczenia - nie żeby coś za to dostać, lecz dlatego, że dążenie do mądrości to wystarczający sens życia. Jak pisał Marek Aureliusz w „Rozmyślaniach”.\nWybór wartości za jakimi staramy się podążać w życiu, cele jakie sobie stawiamy, sposób w jaki staramy się kształtować swój charakter to są rzeczy na które mamy wpływ. Oczywiście nic nie daje nam gwarancji, że podążając tymi drogami dojdziemy tam, gdzie chcemy jednak tylko do nas należy decyzja wyboru tych dróg i to z perspektywy stoika jest kluczową wartością.''',
        'assets/images/people.png'),
  ];

  int get educationListCounter {
    return educationList.length;
  }

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
        '''W nauce Epikteta ogniskuje się istota stoicyzmu. Myśliciel miał dydaktyczne zacięcie, nauczał wiele, lecz swojej nauki nie spisywał. Nie rozwijał też zagadnień logicznych i metafizycznych – mówił o nich tylko w kontekście najważniejszych dla siebie kwestii etycznych. Trudno przecenić wpływ Epikteta na kształtowanie się stoicyzmu w okresie pochrystusowym – pod wpływem filozofa Marek Aureliusz porzucił retorykę, w obrębie której wykazywał wielkie zdolności, by poświęcić się właśnie mądrości stoickiej. Aureliuszowe Rozmyślania są wyraźnym nawiązaniem do nauki Epikteta. Rzecz to ciekawa, gdyż Marek Aureliusz był cesarzem rzymskim, a Epiktet – najpierw niewolnikiem, który należał do jednego z oddziałów straży przybocznej Nerona, potem zaś wyzwoleńcem zmuszonym do opuszczenia Rzymu, gdy Domicjan wygnał filozofów z cesarstwa. Epiktet założył szkołę w Nikopolis w Epirze. Tam jego uczeń, Flawiusz Arianus, spisał naukę mistrza. Jej istotę można zawrzeć w następującym sformułowaniu: są rzeczy od człowieka zależne (akty woli) i rzeczy niezależne (wszystko, co poddane jest przeznaczeniu), szczęśliwy jest ten, kto nie przykłada wagi do spraw, na które nie ma wpływu, lecz je ze spokojem akceptuje.''',
        'assets/images/epiktet.png'),
    LearnModel(
        'Marek Aureliusz\n (121–180 r.)',
        '''Marek Aureliusz był filozofem, a zarazem ładcą Cesarstwa Rzymskiego w latach 161–180. Zasiadł na tronie, mając trzydzieści dziewięć lat. Czasy, w których przyszło mu rządzić, nie były łatwe. Już na samym początku jego rządów wschodnie prowincje cesarstwa były atakowane przez Partów – wojna z najeźdźcą trwała pięć lat i zakończyła się zwycięstwem Rzymu. Ale, gdy jedna wojna się skończyła, rozpoczęła się kolejna. Tym razem Rzymianie walczyli na północy z plemionami germańskimi i sarmackimi; walki z przerwami trwały kilkanaście lat. Do zagrożeń zewnętrznych dochodziły wewnętrzne: rebelie i bunty, a także zaraza, wylew Tybru, trzęsienie ziemi. W tym czasie Marek Aureliusz przeżywał też osobiste dramaty, umarło mu bowiem siedmioro z trzynaściorga dzieci, a także jego żona, Faustyna. Jednak w obliczu tych problemów władca rządził cesarstwem w sposób sprawny i rozsądny. Z filozofią spotkał się wcześnie, jeszcze jako dziecko. Już jako dwunastolatek marzył o ascetycznym życiu prawdziwego mędrca, a mając lat dwadzieścia, pod wielkim wpływem pism Epikteta, porzucił studiowanie retoryki, by ostatecznie poświęcić się stoicyzmowi. Pisał dla samego siebie, traktując filozofię przede wszystkim jako ćwiczenie duchowe. Z tego też względu nie wzbogacił on stoickiej doktryny, nadał jej jednak charakter jeszcze bardziej moralny, naznaczony z jednej strony odcieniem religijnym, z drugiej – sceptycznym. W osobie Marka Aureliusza urzeczywistnił się platoński ideał władcy-filozofa. Ten, bodaj najbardziej znany stoik, był nie tylko autorem Rozmyślań, książki pięknej i głębokiej, lecz także jednym z najlepszych przywódców Cesarstwa Rzymskiego.''',
        'assets/images/aureliusz.png'),
    LearnModel(
        'Seneka \n(5 p.n.e.–65 n.e.)',
        '''Seneka był nie tylko filozofem, lecz także politykiem mającym duży wpływ na sposób funkcjonowania Cesarstwa Rzymskiego – w 56 r. n.e. sprawował urząd konsula. Urodził się w Kordobie, studiował w Rzymie, potem zaś – z uwagi na słaby stan zdrowia – wyjechał do Egiptu, gdzie spędził piętnaście lat. Powrócił do Rzymu, ale już po dziesięciu latach cesarz Klaudiusz wygnał go na Korsykę. Gdy ponownie wrócił do Rzymu, został wychowawcą młodego Nerona, a gdy ten zasiadł na tronie, Seneka był jednym z jego doradców. Ten sam Neron, podejrzewając Senekę o spisek, zmusił go jednak do samobójstwa. Seneka odebrał sobie życie w 65 r. Filozof jest jednym z najbardziej znanych pisarzy starożytnych. Pisał po łacinie i zostawił po sobie bogatą spuściznę. Jego poglądy filozoficzne, podobnie jak innych „stoików młodszych”, koncentrowały się wokół kwestii mądrości życiowej i moralności. Stoicy głosili cnotę dostępną dla każdego bez względu na wykształcenie czy status społeczny – oto jeden z powodów, dla których filozofia ta znalazła szerokie grono wyznawców, również wśród ludzi ubogich i niewolników. Z tego też względu mówi się wiele o podobieństwie stoicyzmu i chrześcijaństwa, a legenda głosi, że Seneka znał osobiście św. Pawła''',
        'assets/images/seneka.png'),
    LearnModel(
        'Chryzyp \n(ok. 279–207 p.n.e.)',
        '''Chryzyp zażegnał wewnętrzne kryzysy szkoły. Spisał, usystematyzował i rozwinął naukę stoików, nadając jej wyrafinowany kształt logicznych argumentów. Jego wybitne teksty przyćmiły wszystkie inne: powoływano się na nie, czytano je i komentowano tak, że trudno dziś powiedzieć, które poglądy stoików od kogo dokładnie pochodzą. Mówi się słusznie, że gdyby nie było Chryzypa, szkoła by nie przetrwała, a nauka stoików zostałaby zapomniana. Chryzyp stworzył dwuwartościową logikę zdań, która, obok arystotelesowskiej logiki nazw, jest uważana za jedno z najwspanialszych zdobyczy ludzkiego rozumu. Jak pisze Diogenes Laertios: Wręczyli mu klucze do bram miasta i uczcili go złotym wieńcem oraz spiżowym posągiem. Źródło: Diogenes Laeros, Żywoty i poglądy słynnych filozofów. Chryzyp był najwybitniejszym umysłem starej szkoły stoickiej i jednym z najwybitniejszych logików w całej historii myśli europejskiej. Urodził się w Soloi w Cylicji i był pochodzenia semickiego – świadczy o tym chociażby fakt, że greki nauczył się późno, już jako dorosły, i z tego względu popełniał błędy językowe.''',
        'assets/images/chryzyp.png'),
  ];

  int get stoicListCounter {
    return educationList.length;
  }
}
