import 'package:flutter/material.dart';
import 'package:stoik_app/model/learning_model.dart';
import 'package:stoik_app/utils/prefs/prefs.dart';

class OnBoardingProvider extends ChangeNotifier {
  final Prefs _prefs = Prefs();

  bool isIntro = false;

  void storeIntro(value) {
    _prefs.storeBool('intro', value);
    notifyListeners();
  }

  OnBoardingProvider() {
    init();
  }

  init() async {
    isIntro = await _prefs.restoreBool('intro', isIntro);
    notifyListeners();
  }

  final List<LearnModel> policyList = [
    LearnModel(
        'Postanowienia Ogólne:\n',
        '''Administratorem danych jest Developer R85, 
(Play Store id: https://play.google.com/store/apps/developer?id=R85&gl=PL).
Aplikacja korzysta z usług stron trzecich i partnerów hostingowych, którzy są zgodni z RODO. W takich przypadkach stosujemy niezbędne metody bezpieczeństwa, aby zagwarantować, że przestrzegamy RODO podczas wysyłania i odbierania danych od stron trzecich.
Niniejsza Polityka Prywatności formułuje bieżące zasady i polityki dotyczące ochrony i przetwarzania danych osobowych otrzymanych od użytkowników bezpośrednio lub pośrednio, w takim wymiarze, w jakim chroni je prawo obowiązujące na terenie Rzeczpospolitej Polskiej.\n\n''',
        ' '),
    LearnModel(
        'Dane osobowe:\n',
        '''Zbieramy wyłącznie dane osobowe wymagane do świadczenia naszych usług i przechowujemy je tylko w zakresie niezbędnym do świadczenia tych usług.
Gromadzimy adresy e-mail od osób, które komunikują się z nami za pośrednictwem poczty e-mail, a także informacje przekazane w ramach dobrowolnych działań, takich jak rejestracja na stronie lub udział w ankietach czy newsletter.
Użytkownik zamawiając newsletter wyraża zgodę na przetwarzanie danych również w celach marketingowych – dzięki temu może otrzymywać na przekazanego nam maila informacje o realizowanych przez nas akcjach marketingowych;
Używamy gromadzonych informacji do bezpośredniej interakcji z użytkownikiem.
Dane przekazane jedynie w celu kontaktu (za pośrednictwem formularza umieszczonego w Serwisie lub przez wysłanie wiadomości e-mail) będą przechowywane jedynie dla celu udzielenia odpowiedzi na zadane zapytanie oraz w celu jej zarchiwizowania przez okres 8 miesięcy od dnia skierowania zapytania.\n\n''',
        ' '),
    LearnModel(
        'Dane osobowe - zmiany, aktualizacje, usuwanie:\n',
        '''Użytkownik może w każdym czasie żądać zmiany, aktualizacji bądź usunięcia swoich Danych Osobowych.
Użytkownik może w każdym czasie uzyskać od Administratora informacje na temat przetwarzanych przez niego Danych Osobowych oraz korzystać z wszystkich uprawnień kontrolnych w zgodzie z powszechnie obowiązującymi w tym zakresie przepisami prawa.
W pewnych okolicznościach możesz mieć również prawo do wniesienia sprzeciwu wobec przetwarzania Twoich danych osobowych. W celu złożenia takiego wniosku prosimy o skorzystanie z danych kontaktowych podanych poniżej. Na żądanie rozważymy i podejmiemy działania zgodnie z obowiązującymi przepisami o ochronie danych. Jeżeli polegamy na Twojej zgodzie na przetwarzanie Twoich danych osobowych, masz prawo do wycofania zgody w dowolnym momencie. Pamiętaj jednak, że nie wpłynie to na zgodność z prawem przetwarzania przed jej cofnięciem lub przetwarzania Twoich danych osobowych na podstawie innej niż zgoda, zgodnej z prawem podstawy przetwarzania.\n\n''',
        ' '),

    LearnModel(
        'Zbieranie danych anonimowych:\n',
        '''Zbieramy informacje o przeglądarkach i urządzeniach, z których korzystasz, w celu poprawienia wydajności produktu.
Zbieramy informacje dotyczące opinii o aplikacji.
Opinie publiczne wraz z nazwą użytkownika i zdjęciem z konta Google są widoczne dla wszystkich, użytkownik publikując opinię jednocześnie wyraża zgodę na udostępnianie tej opinii w postaci linku lub zrzutu ekranu do innych serwisów w celach marketingowych niniejszej aplikacji.
Opinie prywatne są zwykle dostępne w przypadku aplikacji objętych wcześniejszym dostępem lub testami wersji beta.
Opinie prywatne (wraz z nazwą użytkownika, zdjęciem z konta Google i historią zmian) są widoczne tylko dla deweloperów.
Deweloperzy mogą też używać tych danych, odpowiadając na Twoje opinie. Nawet jeśli edytujesz opinię, deweloperzy nadal będą mogli zobaczyć wcześniejsze jej wersje, chyba że ją usuniesz.
Więcej informacji dotyczących komentarzy i opinii o aplikacji znajdziesz tutaj:
https://play.google.com/about/comment-posting-policy/\n\n''',
        ' '),
    LearnModel(
        'Uprawnienia urządzeń: \n',
        '''W zależności od konkretnego urządzenia Użytkownika, ta Aplikacja może zażądać pewnych uprawnień, które pozwolą jej uzyskać dostęp do Danych urządzenia Użytkownika, jak opisano poniżej. Domyślnie uprawnienia te muszą zostać udzielone przez Użytkownika przed uzyskaniem dostępu do odpowiednich informacji. Wyrażone zezwolenie może zostać w każdej chwili odwołane przez Użytkownika. W celu cofnięcia tych uprawnień Użytkownicy mogą odwołać się do ustawień urządzenia. Dokładna procedura kontrolowania uprawnień aplikacji może zależeć od urządzenia i oprogramowania Użytkownika. Należy pamiętać, że cofnięcie takich uprawnień może wpłynąć na prawidłowe działanie tej Aplikacji. Jeśli Użytkownik udzieli któregokolwiek z wymienionych poniżej uprawnień, odpowiednie Dane Osobowe mogą być przetwarzane (tj. udostępniane, modyfikowane lub usuwane) przez „Stolik”. \n
1. Uprawnienia do odczytu i zapisu pamięci zewnętrznej:\n
Dane zapisane przez użytkownika, tj.wyniki rozgrywki gry, nazwa (nick) użytkownika oraz ustawienia gry są przechowywane tylko lokalnie (pamięć wewnętrzna urządzenia) .\n

2.Pozwolenie internetowe:\n
Główne funkcje aplikacji nie wymagają połączenia z internetem,
Aplikacja wymaga dostępu do Internetu tylko podczas wyświetlania
linki do stron internetowych twórców bibliotek zewnętrznych oraz mediów społecznościowych r85unit.\n''',
        ' '),

    ///############
    LearnModel(
        'Informacje zbierane przez „StoLik”:\n',
        '''Ta aplikacja nie zbiera danych osobowych. Dane utworzone przez użytkownika za pomocą „Stolik” (tj. wyniki, statystyki rozgrywek, nazwa użytkownika i jego preferencje ustawień) są przechowywane lokalnie i tylko użytkownik ma do nich dostęp. „Stolik” w żaden sposób nie udostępnia tych danych osobom trzecim ani nie przechowuje ich w chmurze.\n''',
        ' '),

    LearnModel(
        'Ciasteczka:\n',
        '''Na Stronie „Stolik” (https://stoikapp.herokuapp.com/) wymagane są pliki cookie. Używamy ich do zbierania preferencji odwiedzających, a tym samym do lepszej optymalizacji doświadczenia użytkownika. Użytkownicy mogą wyłączyć pliki cookies w ustawieniach swojej przeglądarki. Należy jednak pamiętać, że nasze usługi do prawidłowego działania opierają się na plikach cookie, a po ich wyłączeniu możesz nie mieć dostępu do niektórych funkcji naszej Witryny.\n''',
        ' '),
    LearnModel(
        'Kasowanie danych:\n',
        '''Aplikacja tworzy, zachowuje dane lokalnie (na urządzeniu użytkownika) Podczas procesu odinstalowywania aplikacji z urządzenia dane są nieodwracalnie usuwane. Dane z serwisu, takie jak imię i nazwisko oraz adres e-mail podane do newslettera, mogą zostać usunięte po przesłaniu informacji na adres kontaktowy z prośbą o usunięcie danych.\n''',
        ' '),
    LearnModel(
        'Zmiany w niniejszej Polityce:\n',
        '''Jeśli nasza Polityka prywatności ulegnie zmianie w przyszłości, nie ograniczymy Twoich praw wynikających z niniejszej Polityki prywatności bez Twojej wyraźnej zgody. Zawsze wskazujemy datę publikacji najnowszych zmian. Jeśli zmiany są znaczące, wyślemy Ci bardziej widoczne powiadomienie (w tym, w przypadku niektórych usług, powiadomienie e-mail o zmianach w Polityce prywatności). Prosimy o okresowe sprawdzanie, aby być na bieżąco z aktualizacjami lub zmianami niniejszej Polityki prywatności. Kontynuując użytkowanie aplikacji „Stolik” zgadzasz się przestrzegać zmienionej polityki.\n''',
        ' '),
    LearnModel(
        'Dane kontaktowe:\n',
        '''Jeśli masz jakiekolwiek pytania dotyczące niniejszej Polityki, napisz do nas na adres r85unit@gmail.com, wpisując w tytule temat: „Polityka Prywatności”.\n''',
        ' '),
  ];

  int get policyListCounter {
    return policyList.length;
  }

  final List<LearnModel> menuLearnList = [
    LearnModel(
        'Ekran gry',
        '''Tutaj znajdziesz główny ekran gry, \nklikając w kafelek przejdziesz do okienka gry. \nZalecamy zapoznać się z zasadami gry zanim zaczniesz :) ''',
        ' '),
    LearnModel(
        'Ekran edukacji',
        '''Okienko edukacji, tutaj dowiesz się czegoś o filozofii stoicyzmu\n sławnych filozofach od których wszystko się zaczęło. ''',
        ' '),
    LearnModel(
        'Ekran statystyk',
        '''W tym okienku możesz podejrzeć wszystkie zdobyte punkty jak i statystyki wyników gry, diagram najlepiej to obrazuje.''',
        ' '),
    LearnModel(
        'O nas',
        '''Tutaj znajduj się link do polityki prywatności, naszj strony internetowej jaki i socialmediów. \nHej! możesz też udostępnić link do tej aplikacji znajomym :)''',
        ' '),
    LearnModel(
        'Ekran ustawień',
        '''Okienko ustawień. Sam zdcyduj ile czasu trwa rzut kostką czy ilość rozdań w grze. ''',
        ' '),
  ];

  int get menuLearnListCounter {
    return menuLearnList.length;
  }
}
