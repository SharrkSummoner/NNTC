-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Дек 10 2021 г., 07:08
-- Версия сервера: 10.4.20-MariaDB
-- Версия PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `practic`
--

-- --------------------------------------------------------

--
-- Структура таблицы `audiences`
--

CREATE TABLE `audiences` (
  `audience_id` int(11) NOT NULL,
  `floor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `audiences`
--

INSERT INTO `audiences` (`audience_id`, `floor`) VALUES
(1, 1),
(2, 1),
(3, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `computers`
--

CREATE TABLE `computers` (
  `comp_id` int(11) NOT NULL,
  `date_build` date DEFAULT NULL,
  `date_guarantee_end` date DEFAULT NULL,
  `mother_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  `ram_id` int(11) NOT NULL,
  `rom_id` int(11) NOT NULL,
  `cpu_id` int(11) NOT NULL,
  `perif_id` int(11) NOT NULL,
  `audeince_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `computers`
--

INSERT INTO `computers` (`comp_id`, `date_build`, `date_guarantee_end`, `mother_id`, `video_id`, `ram_id`, `rom_id`, `cpu_id`, `perif_id`, `audeince_id`) VALUES
(1, '2021-12-01', '2021-12-31', 1, 1, 1, 1, 1, 1, 2),
(2, '2021-12-01', '2021-12-31', 1, 1, 1, 1, 1, 1, 1);

--
-- Триггеры `computers`
--
DELIMITER $$
CREATE TRIGGER `cant_del_from_computers` BEFORE DELETE ON `computers` FOR EACH ROW IF OLD.date_guarantee_end > CURRENT_DATE THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Невозможно удалить, срок эксплуатации еще не вышел'; 
END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `computers_has_softwares`
--

CREATE TABLE `computers_has_softwares` (
  `comp_soft_id` int(11) NOT NULL,
  `comp_id` int(11) NOT NULL,
  `soft_id` int(11) NOT NULL,
  `date_install` date DEFAULT NULL,
  `date_expiration` date DEFAULT NULL,
  `version` varchar(45) DEFAULT NULL,
  `activation_key` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `computers_has_softwares`
--

INSERT INTO `computers_has_softwares` (`comp_soft_id`, `comp_id`, `soft_id`, `date_install`, `date_expiration`, `version`, `activation_key`) VALUES
(1, 1, 1, '2021-12-01', '2021-12-07', '18', 'wdfhbsdifjoidjfpwd1823uwijdnf91uh2'),
(2, 1, 2, '2021-12-01', '2021-12-31', '2020', 'asijdnaijs198nijn9nijqnd71');

-- --------------------------------------------------------

--
-- Структура таблицы `cpu`
--

CREATE TABLE `cpu` (
  `cpu_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `price` decimal(6,2) DEFAULT NULL,
  `date_build` date DEFAULT NULL,
  `date_guarantee_end` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `cpu`
--

INSERT INTO `cpu` (`cpu_id`, `name`, `price`, `date_build`, `date_guarantee_end`) VALUES
(1, 'intel core i7 9700k', '9999.99', '2021-12-01', '2021-12-31');

-- --------------------------------------------------------

--
-- Структура таблицы `lecturers`
--

CREATE TABLE `lecturers` (
  `lecturer_id` int(11) NOT NULL,
  `FIO` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `lecturers`
--

INSERT INTO `lecturers` (`lecturer_id`, `FIO`) VALUES
(1, 'Жмышенко Николай Петрович'),
(2, 'Валуев Николай Сигналович');

-- --------------------------------------------------------

--
-- Структура таблицы `lecturers_has_audiences`
--

CREATE TABLE `lecturers_has_audiences` (
  `lecturer_id` int(11) NOT NULL,
  `audience_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `lecturers_has_audiences`
--

INSERT INTO `lecturers_has_audiences` (`lecturer_id`, `audience_id`) VALUES
(2, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `motherboard`
--

CREATE TABLE `motherboard` (
  `mother_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `price` decimal(6,2) DEFAULT NULL,
  `date_build` date DEFAULT NULL,
  `date_guarantee_end` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `motherboard`
--

INSERT INTO `motherboard` (`mother_id`, `name`, `price`, `date_build`, `date_guarantee_end`) VALUES
(1, 'msi', '7000.00', '2021-12-01', '2021-12-31');

-- --------------------------------------------------------

--
-- Структура таблицы `peripherials`
--

CREATE TABLE `peripherials` (
  `perif_id` int(11) NOT NULL,
  `audio_card` varchar(45) DEFAULT NULL,
  `network_card` varchar(50) DEFAULT NULL,
  `wifi` varchar(50) DEFAULT NULL,
  `bluetooth` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `peripherials`
--

INSERT INTO `peripherials` (`perif_id`, `audio_card`, `network_card`, `wifi`, `bluetooth`) VALUES
(1, NULL, NULL, 'wireless', '5.0');

-- --------------------------------------------------------

--
-- Структура таблицы `ram`
--

CREATE TABLE `ram` (
  `ram_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `price` decimal(6,2) DEFAULT NULL,
  `date_build` date DEFAULT NULL,
  `date_guarantee_end` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `ram`
--

INSERT INTO `ram` (`ram_id`, `name`, `price`, `date_build`, `date_guarantee_end`) VALUES
(1, 'samsung', '3000.00', '2021-12-01', '2021-12-31');

-- --------------------------------------------------------

--
-- Структура таблицы `rom`
--

CREATE TABLE `rom` (
  `rom_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `price` decimal(6,2) DEFAULT NULL,
  `date_build` date DEFAULT NULL,
  `date_guarantee_end` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `rom`
--

INSERT INTO `rom` (`rom_id`, `name`, `price`, `date_build`, `date_guarantee_end`) VALUES
(1, 'ssd kingston', '2000.00', '2021-12-01', '2021-12-31');

-- --------------------------------------------------------

--
-- Структура таблицы `softwares`
--

CREATE TABLE `softwares` (
  `soft_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `price` decimal(6,2) DEFAULT NULL,
  `developer` varchar(45) DEFAULT NULL,
  `language` varchar(45) DEFAULT NULL,
  `type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `softwares`
--

INSERT INTO `softwares` (`soft_id`, `name`, `price`, `developer`, `language`, `type_id`) VALUES
(1, 'Sony Vegas', '3000.00', 'magix', 'RU', 1),
(2, 'Word', '1000.00', 'Microsoft', 'RU', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `software_type`
--

CREATE TABLE `software_type` (
  `type_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `software_type`
--

INSERT INTO `software_type` (`type_id`, `name`) VALUES
(1, 'Video Editor'),
(2, 'Text Editor');

-- --------------------------------------------------------

--
-- Структура таблицы `viedocard`
--

CREATE TABLE `viedocard` (
  `video_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `price` decimal(6,2) DEFAULT NULL,
  `date_build` date DEFAULT NULL,
  `date_guarantee_end` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `viedocard`
--

INSERT INTO `viedocard` (`video_id`, `name`, `price`, `date_build`, `date_guarantee_end`) VALUES
(1, 'geforce gtx 3070', '9999.00', '2021-12-01', '2021-12-31');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `audiences`
--
ALTER TABLE `audiences`
  ADD PRIMARY KEY (`audience_id`);

--
-- Индексы таблицы `computers`
--
ALTER TABLE `computers`
  ADD PRIMARY KEY (`comp_id`),
  ADD KEY `motherboard_mother_id` (`mother_id`),
  ADD KEY `viedocard_video_id` (`video_id`),
  ADD KEY `RAM_ram_id` (`ram_id`),
  ADD KEY `ROM_rom_id` (`rom_id`),
  ADD KEY `CPU_cpu_id` (`cpu_id`),
  ADD KEY `peripherials_perif_id` (`perif_id`),
  ADD KEY `computers_ibfk_7` (`audeince_id`);

--
-- Индексы таблицы `computers_has_softwares`
--
ALTER TABLE `computers_has_softwares`
  ADD PRIMARY KEY (`comp_soft_id`),
  ADD KEY `comp_id` (`comp_id`),
  ADD KEY `soft_id` (`soft_id`);

--
-- Индексы таблицы `cpu`
--
ALTER TABLE `cpu`
  ADD PRIMARY KEY (`cpu_id`);

--
-- Индексы таблицы `lecturers`
--
ALTER TABLE `lecturers`
  ADD PRIMARY KEY (`lecturer_id`);

--
-- Индексы таблицы `lecturers_has_audiences`
--
ALTER TABLE `lecturers_has_audiences`
  ADD KEY `lecturer_id` (`lecturer_id`),
  ADD KEY `audience_id` (`audience_id`);

--
-- Индексы таблицы `motherboard`
--
ALTER TABLE `motherboard`
  ADD PRIMARY KEY (`mother_id`);

--
-- Индексы таблицы `peripherials`
--
ALTER TABLE `peripherials`
  ADD PRIMARY KEY (`perif_id`);

--
-- Индексы таблицы `ram`
--
ALTER TABLE `ram`
  ADD PRIMARY KEY (`ram_id`);

--
-- Индексы таблицы `rom`
--
ALTER TABLE `rom`
  ADD PRIMARY KEY (`rom_id`);

--
-- Индексы таблицы `softwares`
--
ALTER TABLE `softwares`
  ADD PRIMARY KEY (`soft_id`),
  ADD KEY `type_id` (`type_id`);

--
-- Индексы таблицы `software_type`
--
ALTER TABLE `software_type`
  ADD PRIMARY KEY (`type_id`);

--
-- Индексы таблицы `viedocard`
--
ALTER TABLE `viedocard`
  ADD PRIMARY KEY (`video_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `computers_has_softwares`
--
ALTER TABLE `computers_has_softwares`
  MODIFY `comp_soft_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `computers`
--
ALTER TABLE `computers`
  ADD CONSTRAINT `computers_ibfk_1` FOREIGN KEY (`mother_id`) REFERENCES `motherboard` (`mother_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `computers_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `viedocard` (`video_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `computers_ibfk_3` FOREIGN KEY (`ram_id`) REFERENCES `ram` (`ram_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `computers_ibfk_4` FOREIGN KEY (`rom_id`) REFERENCES `rom` (`rom_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `computers_ibfk_5` FOREIGN KEY (`cpu_id`) REFERENCES `cpu` (`cpu_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `computers_ibfk_6` FOREIGN KEY (`perif_id`) REFERENCES `peripherials` (`perif_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `computers_ibfk_7` FOREIGN KEY (`audeince_id`) REFERENCES `audiences` (`audience_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `computers_has_softwares`
--
ALTER TABLE `computers_has_softwares`
  ADD CONSTRAINT `computers_has_softwares_ibfk_1` FOREIGN KEY (`comp_id`) REFERENCES `computers` (`comp_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `computers_has_softwares_ibfk_2` FOREIGN KEY (`soft_id`) REFERENCES `softwares` (`soft_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `lecturers_has_audiences`
--
ALTER TABLE `lecturers_has_audiences`
  ADD CONSTRAINT `lecturers_has_audiences_ibfk_1` FOREIGN KEY (`lecturer_id`) REFERENCES `lecturers` (`lecturer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `lecturers_has_audiences_ibfk_2` FOREIGN KEY (`audience_id`) REFERENCES `audiences` (`audience_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `softwares`
--
ALTER TABLE `softwares`
  ADD CONSTRAINT `softwares_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `software_type` (`type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
