-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Окт 04 2019 г., 13:18
-- Версия сервера: 10.1.32-MariaDB
-- Версия PHP: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `php_blog`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `author` varchar(255) NOT NULL,
  `news_id` int(11) NOT NULL,
  `comm` varchar(255) NOT NULL,
  `date_d` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `author`, `news_id`, `comm`, `date_d`) VALUES
(1, 'Bill', 1, 'Good!!!', '2019-10-04 10:47:50'),
(2, 'Mark', 4, 'Very interesting', '2019-10-04 10:48:52'),
(3, 'Linus', 1, 'Nice', '2019-10-04 10:51:03');

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `author` varchar(255) NOT NULL,
  `date_d` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(255) NOT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`id`, `author`, `date_d`, `name`, `text`) VALUES
(1, 'DOU', '2019-10-04 10:42:19', 'Генерація SQL-запиту засобами MySQL-сервера', 'Ще далекого 2015 року в СКБД MySQL, починаючи з версії 5.7.8, додали підтримання нового типу даних JSON. Насамперед це створило нові можливості для роботи з даними, які з тих чи інших причин не потребують нормалізації. Однак мене це нововведення більше зацікавило суттєвим розширенням можливостей взаємодії зі збереженими процедурами.\n\nЗазвичай, при роботі з БД за класичною архітектурою «клієнт-сервер», створення запиту відбувається на стороні клієнта. А коли він вже остаточно сформований — відправляється на сервер для виконання. Такий підхід надає клієнту максимальну гнучкість для роботи з базою даних, але він має і недоліки.\n\nОдин з недоліків такого підходу в тому, що парадигма програмування в середовищі клієнта дуже сильно відрізняється від тієї, що використовуються в СКБД. Звичайно ж, з технічної точки зору, сформувати в клієнті текстовий рядок, навіть з дуже складним SQL-запитом, не є непосильним завданням. Та зі сторони це виглядає доволі неприродно, особливо коли доводиться використовувати умовні конструкції в клієнті, наприклад, з об’єктно-орієнтованою парадигмою. А вам ще до того ж необхідно в цей запит додати безліч різноманітних даних, як то значення поля чи фільтра для відбору.'),
(2, 'DOU', '2019-10-04 10:43:36', 'Как учить иностранный язык так, чтобы заговорить на нем', 'Я работаю IT-инженером больше 10 лет, часть из которых пришлась на командировки (от недели до полугода), а часть — на постоянное проживание за рубежом. Кроме этого, в аутсорс-проектах я повсеместно замечал, как пробелы в активном языке мешали людям выражать свои мысли, отстаивать технически верные решения, понимать заказчика.\n\nЭта статья — тезисы моего личного опыта прикладного изучения иностранных языков:\n\nАнглийский — после 10-летнего перерыва с момента окончания школы за 6 месяцев до возможности смотреть фильмы в оригинале и общаться с заказчиком. Я тратил около часа в день плюс одно групповое занятие (60 мин.) в неделю в IT-компании.\nИспанский — с нуля за 4 месяца до возможности читать адаптированную литературу, понимать на слух песни, общаться с испаноязычными туристами. Мне понадобилось также около часа в день, но в этом случае дополнительно одно индивидуальное занятие (60 мин.) в неделю.\nДатский — с нуля за 8 месяцев до возможности по телефону записаться к врачу, говорить с госслужащими, читать рабочие письма или сообщения из детского сада. Сейчас я трачу около часа в день и прохожу одно групповое занятие (120 мин.) в неделю.\nЭти методы помогли заговорить мне и, надеюсь, помогут вам.'),
(3, 'habr', '2019-10-04 10:45:18', 'PHP Xdebug proxy: когда стандартных возможностей Xdebug не хватает', 'Для отладки PHP-программ часто используют Xdebug. Однако стандартных возможностей IDE и Xdebug не всегда достаточно. Часть проблем можно решить с помощью Xdebug proxy — pydbgpproxy, но всё же не все. Поэтому я реализовал PHP Xdebug proxy на базе асинхронного фреймворка amphp.\n\n\nПод катом я расскажу, что не так с pydbgpproxy, чего в нём не хватает и почему я не стал его дорабатывать. Также объясню, как работает PHP Xdebug proxy, и покажу на примере, как его расширять.'),
(4, 'habr', '2019-10-04 10:46:59', 'Fasttext на PHP\\Python. Первые шаги', 'Уже достаточно давно популярность набрали разного рода алгоритмы машинного обучения. Также, благодаря крупным компаниям, которые двигают технологический прогресс, появилось много opensource продуктов. Одним из них является Fasttext, о котором пойдет речь ниже.\n\nFasttext — разработка от Facebook. Основная задача программы — классификация текста. Классификация текста может понадобиться для:\n\nобъединение текстовой информации в группы по «похожести» (новости на одну тему )\nгруппировка текста со схожей тематикой в одну группу (новости про автомобили)\nпоиск информации, которая может являться спамом\nпоиск кликбэйтовой информации\n...\n\nВариантов, на самом деле, очень много и перечислять все нет смысла, идея должна быть понятна.'),
(5, 'Virus', '2019-10-04 10:52:30', 'Test', '<script>prompt(\'Ente Your name:\');</script>'),
(6, 'Virus;drop table comments', '2019-10-04 10:55:58', 'Test2', 'test');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_id_idx` (`news_id`);

--
-- Индексы таблицы `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `news_id` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;