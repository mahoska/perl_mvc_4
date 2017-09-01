-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Сен 01 2017 г., 09:23
-- Версия сервера: 10.1.19-MariaDB
-- Версия PHP: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `user11`
--

-- --------------------------------------------------------

--
-- Структура таблицы `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `txt` text NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `articles`
--

INSERT INTO `articles` (`id`, `user_id`, `title`, `txt`, `date`) VALUES
(3, 1, 'Italy opens up island of Montecristo to tourists', 'The tiny Tuscan island of Montecristo, whose mysterious history is filled with saints, monks and pirates, is to be opened up to the public for the first time.\r\n                    Крошечный остров Тосканского архипелага Монтекристо, чья загадочная история пестрит именами святых, монахов и пиратов, будет впервые открыт для публичного посещения. \r\n\r\n                    The diamond-shaped island, which is around four square miles in size, was immortalised by Alexandre Dumas in The Count of Monte Cristo as the site of an enormous hidden treasure.\r\n                    Остров в форме ромба и размером около 12 кв. км прославлен Александром Дюма в романе ''Граф Монте-Кристо'' как место, где спрятаны невероятные сокровища.\r\n\r\n                    For almost 40 years, since it became a nature reserve, only scientists and researchers have been allowed within three miles of the island''s granite cliffs.\r\n                    В течение почти 40 лет, с тех пор как острову присвоили статус природного заповедника, на три мили гранитных скал острова могли попасть только ученые и исследователи.\r\n\r\n                    The waters were regularly patrolled to make sure the island''s population of monk seals, dolphins, tuna and rare birds was not disturbed.\r\n                    Воды, окружающие остров, постоянно патрулировались. Это делалось для того, чтобы никто не беспокоил обитающих здесь тюленей-монахов, дельфинов, тунцов и редких видов птиц. \r\n\r\n                    Anyone entering the waters illegally was liable to an instant 150 pounds fine.\r\n                    Каждый, кто незаконно входил в акваторию острова, должен был заплатить штраф в 150 фунтов. \r\n\r\n                    However, the Park Authority for the Tuscan Archipelago has now decided to allow up to 1,000 tourists a year to visit Montecristo, which lies 22 miles south of Elba and 40 miles from the coast of Italy.\r\n                    Однако, сейчас дирекция Национального парка Тосканского архипелага согласилась пускать на Монтекристо, который лежит на 22 мили южнее Эльбы и в 40 милях от берега Италии, тысячу туристов в год. \r\n\r\n                    Visitors will be allowed from April 1 to July 15 and then from August 31 to the end of October each year. Trips for 2009 have to be booked with the authority by the end of January next year.\r\n                    Им разрешат приезжать на остров ежегодно с 1 апреля по 15 июля и с 31 августа до конца октября. Поездки, планируемые на 2009 год, должны быть согласованы с руководством заповедника до конца января следующего года.\r\n\r\n                    Dumas arrived on the island in 1842, in the company of Napoleon Bonaparte''s nephew. \r\n                    Дюма попал на остров в 1842 году, путешествуя вместе с племянником Наполеона Бонапарта. \r\n\r\n                    ''It is fantastic and lonely, smelling of thyme and broom,'' he wrote, in a letter.\r\n                    ''Фантастический и пустынный, благоухающий тимьяном и ракитником'', – заметил Дюма в одном из писем.\r\n\r\n                    He decided to write The Count of Monte Cristo to remind him of the trip.\r\n                    В память о поездке он решил написать ''Графа Монте-Кристо''.\r\n\r\n                    His hero, Edmond Dantes, discovers a pirate''s treasure on the island after being tipped off by his companion in prison, Abbe Faria.\r\n                    Герой романа Эдмон Дантес, которому удалось сбежать из тюрьмы, находит на острове сокровища пирата. О них Дантес, находясь в заключении, узнал от другого узника, аббата Фариа. \r\n\r\n                    Dumas described the island at midday: ''Thousands of grasshoppers, hidden in the bushes, chirped with a monotonous and dull note; the leaves of the myrtle and olive trees waved and rustled in the wind. \r\n                    Дюма описал остров в лучах полуденного солнца: ''Тысячи кузнечиков, скрытых в вереске, оглашали воздух однообразным и непрерывным стрекотанием; шелестели листья миртов и олив; \r\n\r\n                    ''At every step that Edmond took he disturbed the lizards glittering with hues of emerald; afar off he saw the wild goats bounding from crag to crag.''\r\n                    каждый шаг Эдмона по нагретому солнцем граниту спугивал зеленых,цвета изумруда, ящериц; вдали виднелись дикие горные козлы, прыгыющие с камня на камень''.\r\n\r\n                    Dumas was inspired by tales of a pirate''s haul, buried in one of the island''s grottos. In the 1550s, two pirates, Red Beard and Dragut, sacked the monastery on Montecristo and set up their base. Dragut, a Turk, is thought to have accumulated vast wealth and hidden his haul somewhere on the island. \r\n                    Писателя вдохновили рассказы о пиратских сокровищах, спрятанных в одном из гротов острова. В 1550-х годах два пирата, Рыжая Борода и Драгут, ограбили монастырь на Монтекристо и устроили там свое логово. Считается, что Драгут, турок по национальности, был богат и спрятал свои сокровища где-то на острове. \r\n\r\n                    However, no one has found it yet.\r\n                    Однако пока они не найдены. ', '2017-09-01 07:48:53'),
(4, 1, 'Famed Roman statue ''not ancient'' ', 'A statue symbolising the mythical origins and power of Rome, long thought to have been made around 500BC, has been found to date from the 1200s.\r\n                    Долго считалось, что статуя, символизирующая легендарное зарождение и могущество Рима, была создана приблизительно в 500-ом году до нашей эры, однако было установлено, что дата её рождения приблизительно приходится на 13-ый век.\r\n\r\n\r\n                    The statue depicts a she-wolf suckling Remus and his twin brother Romulus - who is said to have founded Rome.\r\n                    Статуя изображает волчицу, кормящую грудью Рема и его брата-близнеца Ромула, который, как считается, основал Рим.\r\n\r\n                    The statue of the wolf was carbon-dated last year, but the test results have only now been made public.\r\n                    Эта статуя волчицы в прошлом году была подвергнута радиоуглеродному анализу с целью установления даты её создания, однако результаты этого теста стали достоянием общественности только сейчас.\r\n\r\n                    The figures of Romulus and Remus have already been shown to be 15th Century additions to the statue.\r\n                    На тот момент уже было обнаружено, что фигуры Ромула и Рема были дополнениями статуи, сделанными в 15-ом веке.\r\n\r\n                    In a front page article in the Italian newspaper, La Repubblica, Rome''s former top heritage official, Professor Adriano La Regina, said about 20 tests were carried out on the she-wolf at the University of Salerno.\r\n                    В статье, опубликованной на первой полосе итальянской газеты ''Республика'' (La Repubblica), бывший высший чиновник по вопросам римского культурного наследия, профессор Адриано Ла Реджина, сообщил, что в университете города Салерно были на статуе волчицы выполнены около 20 тестов.\r\n\r\n                    He said the results of the tests gave a very precise indication that the statue was manufactured in the 13th Century.\r\n                    Он сообщил, что результаты этих исследований дали очень точное указание на то, что эта статуя была изготовлена в 13-ом столетии.\r\n\r\n\r\n                    Damaged paw\r\n                    Повреждённая лапа', '2017-09-01 07:48:53'),
(5, 2, 'Crumbs: half of Britons injured by their biscuits on coffee break, survey reveals', 'More than half of all Britons have been injured by biscuits ranging from scalding from hot tea or coffee while dunking or breaking a tooth eating during a morning tea break, a survey has revealed. \r\n                    Исследование показало, что более половины британцев получают травмы, поедая печенье: ожоги горячим чаем или кофе, когда они макают туда своё печенье, или сломанный зуб во время утреннего чаепития – обычное дело.\r\n\r\n\r\n                    An estimated 25 million adults have been injured while eating during a tea or coffee break – with at least 500 landing themselves in hospital, the survey revealed. \r\n                    По результатам исследования, 25 миллионов взрослых людей получили травмы во время перерыва на чай или кофе – из них, по крайней мере, 500 человек попали в больницу. \r\n\r\n                    The custard cream biscuit was found to be the worse offender to innocent drinkers. \r\n                    Печенье с заварным кремом было признано злейшим обидчиком невинных любителей горячих напитков. \r\n\r\n                    It beat the cookie to top a table of 15 generic types of biccy whose potential dangers were calculated by The Biscuit Injury Threat Evaluation. \r\n                    Оно опередило печенья 15 распространенных видов, чья небезопасность была посчитана с помощью "Анализа травмоопасности печенья".\r\n\r\n                    Hidden dangers included flying fragments and being hurt while dunking in scalding tea through to the more strange such as people poking themselves in the eye with a biscuit or fallen off a chair reaching for the tin.\r\n                    Скрытые опасности таятся в самих крошках печенья и в процессе обмакивания печенья в очень горячий чай. Что ещё более странно, опасности связаны с тыканьем себя печеньем в глаз или падением со стула, в результате попытки дотянуться до жестянки с печеньем.\r\n\r\n                    One man even ended up stuck in wet concrete after wading in to pick up a stray biscuit.\r\n                    Один мужчина дошел до того, что увяз в свежем бетонном растворе, когда хотел поднять печенье, случайно там оказавшееся.\r\n\r\n                    Custard creams get a risk rating of 5.63, the highest of all.\r\n                    Печенье, прослоенное кремовой начинкой, имеет показатель риска равный 5.63, больший из всех.\r\n\r\n                    This compared to 1.16 for Jaffa cakes, which was the safest biscuit of all in the evaluation.\r\n                    Сравните этот фактор с фактором 1.16 у бисквитного печенья Jaffa, самого безопасного печенья в исследовании. \r\n\r\n                    Research company Mindlab International were commissioned by Rocky, a chocolate biscuit bar, to conduct the research.\r\n                    Исследовательская компания Mindlab International была привлечена к исследованию Rocky, производителем шоколадных батончиков с печеньем.\r\n\r\n                    It found almost a third of adults said they had been splashed or scalded by hot drinks while dunking or trying to fish the remnants of a collapsed digestive.\r\n                    Было обнаружено, что одна треть взрослых, пытаясь размягчить остатки печенья (в целях облегчения пищеварения), обжигается горячими напитками или расплёскивает их.\r\n\r\n                    It also revealed 28 per cent had choked on crumbs while one in 10 had broken a tooth or filling biting a biscuit.\r\n                    Выяснилось также, что 28 процентов людей давились крошками, а каждый десятый, хотя бы раз, печеньем ломал себе зуб или пломбу.\r\n\r\n                    More unusually, three per cent had poked themselves in the eye with a biscuit and seven per cent bitten by a pet or "other wild animal" trying to get their biscuit.\r\n                    Ещё более удивительно, что три процента попадали печеньем себе в глаз, а семь процентов подвергались нападениям как домашних, так и диких животных, которые пытались отобрать у них печенье. \r\n                ', '2017-09-01 07:50:56'),
(6, 2, 'Atom-sized transistor created by scientists', 'Scientists have shrunk a transistor to the size of a single atom,\r\n                    Учёные уменьшили размеры транзистора до одного атома,\r\n\r\n                    bringing closer the day of microscopic electronic devices that will revolutionise computing, engineering and medicine.\r\n                    приблизив эру микроскопических электронных устройств, которые произведут революцию в информационных технологиях, инженерии и медицине. \r\n\r\n                    Researchers at Cornell University, New York, and Harvard University, Boston, fashioned the two ''nano-transistors'' from purpose-made molecules. \r\n                    Исследователи из Корнельского университета (Нью-Йорк) и Гарвардского университета (Бостон) создали два ''нано-транзистора'' из специально подготовленных молекул. \r\n\r\n                    When voltage was applied, electrons flowed through a single atom in each molecule.\r\n                    Когда подавалось напряжение, электроны передавались посредством одного атома каждой молекуле.\r\n\r\n                    The ability to use individual atoms as components of electronic circuits marks a key breakthrough in nano-technology, the creation of machines at the smallest possible size.\r\n                    Возможность использования отдельных атомов в качестве компонентов электронных схем знаменует ключевой прорыв в области нано-технологий - создание устройств минимального размера.\r\n\r\n                    Prof Paul McEuen, a physicist at Cornell, who reports the breakthrough in today''s issue of Nature, said the single-atom transistor did not have all the functions of a conventional transistor such as the ability to amplify.\r\n                    Профессор Пол Макуин, физик из Корнелла, который рассказал о прорыве в современных исследованиях, сообщил, что транзистор из одного атома не имеет функций обычного транзистора, таких как способность к усилению.\r\n\r\n                    But it had potential use as a chemical sensor to any change in its environment.\r\n                    Однако он имеет потенциал использования в качестве химического датчика, реагирующего на любые изменения в окружающей среде. \r\n\r\n                    By David Derbyshire, Science Correspondent ', '2017-09-01 07:50:56'),
(7, 1, 'Japan centenarians at record high', 'The number of Japanese people hitting the landmark age of 100 has reached record levels. \r\n                    Число японцев, доживших до столетнего возраста, достигло рекордного уровня. \r\n\r\n                    There are now 36,276 centenarians in the country – a rise of 4,000 on last year''s figure, a report by the Health and Welfare Ministry found.\r\n                    В докладе Министерства здравоохранения и социального обеспечения говорится, что в сегодня стране насчитывается 36 276 человек, которым сто и более лет, – это на 4000 человек больше, чем число столетних граждан в прошлом году. \r\n\r\n                    Women make up the vast majority of those who are living past 100.\r\n                    Среди тех, кто живёт более ста лет, женщины составляют подавляющее большинство. \r\n\r\n                    Japan has one of the world''s longest life expectancies, but there are concerns about the burden this is placing on society.\r\n                    В Японии средняя продолжительность жизни граждан является одной из самых длинных в мире, однако существует беспокойство относительно бремени, которое это явление накладывает на общество. \r\n\r\n                    Both the country''s pension system and social services are under pressure from its burgeoning greying population. \r\n                    И пенсионная система страны и социальные службы испытывают давление растущей ''седовласой популяции''. \r\n\r\n                    Active lives', '2017-09-01 07:52:02');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `login` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `email`) VALUES
(1, 'tom', '12345', 'tom@mail.ru'),
(2, 'stive', '12345', 'stive@gmail.com');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `articles_fk0` (`user_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_fk0` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
