-- phpMyAdmin SQL Dump
-- version 4.0.10.10
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 02 2016 г., 19:39
-- Версия сервера: 5.5.45
-- Версия PHP: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `csvimport`
--

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL,
  `publish` enum('0','1') NOT NULL DEFAULT '1',
  `articul` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `id_cat` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `meta_desc` text NOT NULL,
  `text` text NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `publish`, `articul`, `name`, `id_cat`, `number`, `keywords`, `title`, `description`, `meta_desc`, `text`, `price`, `image`) VALUES
(0, '1', '', 'Street кофта Свитшот   ', 0, 0, '', '', '', '', '', 0, '1480618160.9243.jpg,1480618161.0723.jpg'),
(0, '1', '', 'Swanky Monkey кофта Свитшот ', 0, 0, '', '', '', '', '', 0, '1480618161.2113.jpg'),
(0, '1', '', 'Viveros кофта Свитшот   ', 0, 0, '', '', '', '', '', 0, '1480618161.3443.jpg,1480618161.4633.jpg'),
(0, '1', '', 'Viveros кофта Свитшот Д ', 0, 0, '', '', '', '', '', 0, '1480618161.6103.jpg,1480618161.7303.jpg'),
(0, '1', '', 'Альфонс Муха кофта Свитшот   ', 0, 0, '', '', '', '', '', 0, '1480618161.9773.jpg,1480618162.1513.jpg,1480618162.3003.jpg'),
(0, '1', '', 'Белая обезьяна кофта Свитшот  ', 0, 0, '', '', '', '', '', 0, '1480618162.4503.jpg,1480618162.6623.jpg'),
(0, '1', '', 'Белый тигр кофта Свитшот   ', 0, 0, '', '', '', '', '', 0, '1480618162.8683.jpg'),
(0, '1', '', 'Версаче кофта Свитшот   ', 0, 0, '', '', '', '', '', 0, '1480618163.1073.jpg,1480618163.3203.jpg'),
(0, '1', '', 'Винтажные розы кофта Свитшот   ', 0, 0, '', '', '', '', '', 0, '1480618163.5583.jpg,1480618163.7923.jpg,1480618163.9443.jpg'),
(0, '1', '', 'Витраж кофта Свитшот  ', 0, 0, '', '', '', '', '', 0, '1480618164.1943.jpg,1480618164.3913.jpg,1480618164.6133.jpg'),
(0, '1', '', 'Геометрический узор кофта Свитшот', 0, 0, '', '', '', '', '', 0, '1480618164.8253.jpg,1480618164.9753.jpg'),
(0, '1', '', 'Гжель кофта Свитшот   ', 0, 0, '', '', '', '', '', 0, '1480618165.2713.jpg,1480618165.4433.jpg,1480618165.6283.jpg'),
(0, '1', '', 'Голландские цветы кофта Свитшот   ', 0, 0, '', '', '', '', '', 0, '1480618165.8513.jpg,1480618166.0153.jpg,1480618166.1953.jpg'),
(0, '1', '', 'Граффити кофта Свитшот   ', 0, 0, '', '', '', '', '', 0, '1480618166.3753.jpg,1480618166.5713.jpg'),
(0, '1', '', 'Дали кофта Свитшот   ', 0, 0, '', '', '', '', '', 0, '1480618166.8393.jpg'),
(0, '1', '', 'Девушкавенок кофта Свитшот   ', 0, 0, '', '', '', '', '', 0, '1480618166.9823.jpg'),
(0, '1', '', 'Дисней кофта Свитшот   ', 0, 0, '', '', '', '', '', 0, '1480618167.1833.jpg,1480618167.3853.jpg'),
(0, '1', '', 'Дональд Дак кофта Свитшот   ', 0, 0, '', '', '', '', '', 0, '1480618167.6003.jpg,1480618167.7903.jpg'),
(0, '1', '', 'Заяц кофта Свитшот Ромб  ', 0, 0, '', '', '', '', '', 0, '1480618167.9473.jpg,1480618168.1073.jpg'),
(0, '1', '', 'Зебра кофта Свитшот   ', 0, 0, '', '', '', '', '', 0, '1480618168.3063.jpg,1480618168.4753.jpg,1480618168.6443.jpg'),
(0, '1', '', 'Зеркала кофта Свитшот   ', 0, 0, '', '', '', '', '', 0, '1480618168.9283.jpg,1480618169.2643.jpg'),
(0, '1', '', 'Змея кофта Свитшот ДН ', 0, 0, '', '', '', '', '', 0, '1480618169.5013.jpg,1480618169.6393.jpg'),
(0, '1', '', 'Камеи черный кофта Свитшот', 0, 0, '', '', '', '', '', 0, '1480618169.8673.jpg,1480618170.0113.jpg'),
(0, '1', '', 'Кензо кофта Свитшот', 0, 0, '', '', '', '', '', 0, '1480618170.1913.jpg,1480618170.3303.jpg'),
(0, '1', '', 'Коровка кофта Свитшот   ', 0, 0, '', '', '', '', '', 0, '1480618170.5513.jpg,1480618170.8143.jpg,1480618171.0433.jpg'),
(0, '1', '', 'Кот Сфинкс кофта Свитшот   ', 0, 0, '', '', '', '', '', 0, '1480618171.2593.jpg,1480618171.4723.jpg'),
(0, '1', '', 'Краска кофта Свитшот', 0, 0, '', '', '', '', '', 0, '1480618171.6743.jpg,1480618171.8963.jpg'),
(0, '1', '', 'Криминальное чтиво кофта Свитшот   ', 0, 0, '', '', '', '', '', 0, '1480618172.0683.jpg'),
(0, '1', '', 'Лаванда кофта Свитшот Реглан  ', 0, 0, '', '', '', '', '', 0, '1480618172.2043.jpg,1480618172.3453.jpg'),
(0, '1', '', 'Леди Леопард кофта Свитшот   ', 0, 0, '', '', '', '', '', 0, '1480618172.5583.jpg,1480618172.8673.jpg,1480618173.0313.jpg'),
(0, '1', '', 'Леопард D кофта Свитшот   ', 0, 0, '', '', '', '', '', 0, '1480618173.5073.jpg,1480618173.7663.jpg,1480618174.0583.jpg'),
(0, '1', '', 'Лошади кофта Свитшот   ', 0, 0, '', '', '', '', '', 0, '1480618174.2693.jpg,1480618174.4653.jpg'),
(0, '1', '', 'Маки кофта Свитшот   ', 0, 0, '', '', '', '', '', 0, '1480618174.7223.jpg,1480618175.0833.jpg'),
(0, '1', '', 'Макикруг кофта Свитшот   ', 0, 0, '', '', '', '', '', 0, '1480618175.3093.jpg,1480618175.4883.jpg');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
