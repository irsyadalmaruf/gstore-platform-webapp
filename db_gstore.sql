-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 27 Sep 2023 pada 13.32
-- Versi server: 10.4.18-MariaDB
-- Versi PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_gstore`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `banners`
--

CREATE TABLE `banners` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `head` varchar(50) NOT NULL,
  `content` varchar(100) NOT NULL,
  `text_color` enum('text-dark','text-light') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `banners`
--

INSERT INTO `banners` (`id`, `product_id`, `image`, `head`, `content`, `text_color`) VALUES
(1, 9, 'b6b54e0a8bf07a2ad237ccd1d7586073.jpg', 'ARK: Survival Evolved', 'Stranded on the shores of a mysterious island, you must learn to survive. Use your cunning to kill..', 'text-light'),
(2, 8, '43dc025f892ac2b0e0974903194dd00e.jpg', 'Rise of the Tomb Raider™', 'Rise of the Tomb Raider: 20 Year Celebration includes the base game and Season Pass featuring all..', 'text-light'),
(8, 7, '14c394fd89e7cc8405285885569b4263.jpg', 'FIFA 2022', '<p>Powered by Football™, EA SPORTS™ FIFA 22 brings the game even closer to the real thing with funda', 'text-light');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `subtotal`) VALUES
(28, 1, 8, 570000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `total` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` text NOT NULL,
  `status` enum('waiting','paid','delivered','cancel') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `date`, `invoice`, `total`, `name`, `address`, `phone`, `status`) VALUES
(20, 18, '2022-06-09', '1820220609144240', 659000, 'defri Prasetyo', 'padang pariaman', '082330650609', 'paid'),
(21, 18, '2022-06-19', '1820220619103014', 139999, 'defri Prasetyo', 'jember', '082330650609', 'paid'),
(22, 18, '2022-06-19', '1820220619103119', 659000, 'defri Prasetyo', 'banyuwangi', '081364736479', 'waiting'),
(23, 19, '2023-07-18', '1920230718164114', 499000, 'defri prasetyo', 'depok,jawabarat', '082330650609', 'paid');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders_confirm`
--

CREATE TABLE `orders_confirm` (
  `id` int(11) NOT NULL,
  `orders_id` int(11) NOT NULL,
  `account_name` varchar(100) NOT NULL,
  `account_number` varchar(50) NOT NULL,
  `nominal` int(11) NOT NULL,
  `note` varchar(255) NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `orders_confirm`
--

INSERT INTO `orders_confirm` (`id`, `orders_id`, `account_name`, `account_number`, `nominal`, `note`, `image`) VALUES
(13, 20, 'defri', '082330650609', 659000, 'pembayaran selesai', ''),
(14, 21, 'fd', '082330650609', 659000, 'ddd', ''),
(15, 23, 'defri', '082330650609', 4000000, 'ridak', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders_detail`
--

CREATE TABLE `orders_detail` (
  `id` int(11) NOT NULL,
  `orders_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `orders_detail`
--

INSERT INTO `orders_detail` (`id`, `orders_id`, `product_id`, `subtotal`) VALUES
(25, 20, 7, 659000),
(26, 21, 9, 139999),
(27, 22, 7, 659000),
(28, 23, 6, 499000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `edition` enum('reguler','premium') NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `requirements` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `edition`, `image`, `description`, `requirements`) VALUES
(1, 'DreadOut', 95999, 'reguler', '92d30dac7961a5151cbf7cb60c5bf0ec.jpg', '														<p><b>ABOUT THIS GAME.</b>																																																														\r\n<p><b>When twilight fades. Where darkness reigns.\r\n</b></p><p>\r\n</p><p>\r\nDreadOut is a third person supernatural horror game where you play as Linda, a high school student trapped in an old abandoned town. Equipped with her trusty smart-phone and an SLR camera, she will battle against terrifying encounters and solve mysterious puzzles which will ultimately determine her fate.\r\nHelp her overcome the challenges that will stand before her. Survive the Dread!.\r\n</p><p><b>\r\n</b></p><p><b></b></p><p><b>Synopsis</b>\r\n</p><p>When a group of high school students went astray from a field trip, they came across something totally unexpected. A town long forgotten trapped in a peaceful state of slumber. What they did not realize was what lurks within. And what seemed like an innocent stroll turns into disaster as the secluded town reveals its dark and terrible secrets. The presence of sinister forces from beyond their realm of existence.\r\nIt all comes down to Linda. She will experience stirrings of unfamiliar powers, emerging from within her. These new found abilities might just be the only way she can save her own life and those of her friends.\r\n</p><p></p><p><b>\r\nFeatures</b>\r\n</p><p>- Explore a haunted environment in an Asian - Indonesian setting.<br>\r\n- Battle against terrifying beings from a supernatural realm.<br>\r\n- Solve mysterious puzzles that block your path.<br>\r\n- Switch between first person and third person view.<br>\r\n- Engage in a thrilling storyline. <br>\r\n- Play Act 1 and 2 of Linda\'s terrifying journey along with Act 0 (previously released as DreadOut Demo).<br>\r\n- Get access to Linda\'s unlockable wardrobe<br>\r\n\r\n- Rated 17+ for the following <br>\r\n- Frequent / Intense horror / fear themes<br>\r\n- Infrequent / Mild Realistic Violence<br>\r\n- Infrequent / Mild Sexual Content or Nudity<br>\r\n- Infrequent Mature / Mild Suggestive Themes.<br>\r\n																																																																																									', '																																																																																																									<p>							<u>MINIMUM\r\n</u></p><p>\r\nOS: Windows 7 / 8</p><p>PROCESSOR: Intel Dual-Core 2.4 GHz or AMD Dual-Core Athlon 2.5 GHz @ 3.9 GHz or equivalent\r\n</p><p>\r\nVIDEO CARD:  NVIDIA GeForce 8800GT or AMD Radeon HD 3830 or Intel HD Graphics 4000, 512 MB VRAM\r\n\r\n</p><p>MEMORY: 4 GB RAM\r\n\r\n</p><p> STORAGE: 5 GB available space\r\n\r\n</p><p><br></p><p><u>RECOMMENDED\r\n</u></p><p>\r\nOS: Windows 7 / 8 - 64 bits\r\n</p><p>\r\nPROCESSOR: Intel Core i5-2300 or AMD Phenom II X4 940 or better</p><p>\r\n\r\nVIDEO CARD: NVIDIA GeForce GTX 550 or AMD Radeon HD 7750 with 1 GB VRAM or better\r\n\r\n</p><p>MEMORY: 8 GB RAM\r\n\r\n</p><p>STORAGE: 10 GB available space																																																																																										'),
(6, 'ONE PIECE: PIRATE WARRIORS 4', 499000, 'premium', '8385d56ea57bfbdf6f7c8f72d8e26b9e.jpg', '																																																																																									<b><p>ABOUT THIS GAME</p></b>\r\n\r\n<p>The PIRATE WARRIORS series has successfully combined the popular anime ONE PIECE with the thrilling action of the WARRIORS series to create a worldwide phenomenon selling more than four million copies!\r\n\r\n<p>ONE PIECE: PIRATE WARRIORS 4 is the latest evolution of PIRATE WARRIORS action! Based on the concept of \"experiencing a real ONE PIECE battlefield,\" buildings will come crashing down during the action and attacks will throw up smoke and dust, placing you in the thick of the ONE PIECE world!\r\n</p>\r\n<p>\r\nInjecting fresh elements that couldn\'t be achieved in previous entries has now realized an even more thrilling brand of PIRATE WARRIORS action!\r\n</p>																																																																														', '																																																																																				<U><p>MINIMUM</p></U>\r\n<p>-Requires a 64-bit processor and operating systemOS: Windows 10, 64bits</p>\r\n<p>-Processor: Intel Core i5 3450 / AMD Ryzen 3 1300X</p>\r\n<p>-Memory: 8 GB RAM</p>\r\n<p>-Graphics: NVIDIA GeForce GTX 660 (2GB) / AMD Radeon HD 7870 (2GB)</p>\r\n<p>-DirectX: Version 11</p>\r\n<p>-Network: Broadband Internet connection</p>\r\n<p>-Storage: 25 GB available space</p>\r\n<p>-Additional Notes: Graphics settings: All \'Low\' or \'OFF\'; Expected Framerate: 30 FPS @ 1280x720</p>\r\n</br>\r\n<U><p>RECOMMENDED</p></U>\r\n\r\n<p>-Requires a 64-bit processor and operating systemOS: Windows 10, 64bits</p>\r\n<p>-Processor: Intel Core i7 3770 / AMD Ryzen 5 1400</p>\r\n<p>-Memory: 8 GB RAM</p>\r\n<p>-Graphics: NVIDIA GeForce GTX 1060 (3GB) / AMD Radeon RX 580 (4GB)</p>\r\n<p>-DirectX: Version 11</p>\r\n<p>-Network: Broadband Internet connection</p>\r\n<p>-Storage: 25 GB available space</p>\r\n<>p-Additional Notes: Graphics settings: All \'High\' or \'ON\'; \'Character display number\' only set to \'Medium\'; Expected Framerate: 60 FPS @ 1920x1080</p>\r\n\r\n																																																																								'),
(7, 'FIFA 22', 659000, 'reguler', '91a196d65fd90b5d3178b49c7f005c10.jpg', '														<b><p>ABOUT THIS GAME</p></b>\r\n<p>What is FIFA?</p>\r\n\r\n<p>Play The World’s Game with 17,000+ players, over 700 teams in 90+ stadiums and more than 30 leagues from all over the globe.</p>\r\n\r\n<p>GAME MODES\r\n- Career Mode – Live out your dreams as both a manager and a player in FIFA 22. Create the newest club in FIFA, design your kits, style your stadium, and choose whether to compete with the elite or rise up from the lower divisions as you manage your club to glory. Or test your skills as a player, with a more immersive Player Career mode that gives you more ways to progress, achieve, and immerse yourself in your Pro’s journey through the game.\r\n</p>\r\n\r\n<P>VOLTA FOOTBALL – Take it back to the streets with VOLTA FOOTBALL. Build a player, pick your gear, and express your style on the streets alone or with your squad in football playgrounds all around the world. Get rewarded for your skill on the ball with restyled gameplay, and play unique events in special locations each season as you unlock new gear through a new seasonal progression system that lets you earn XP towards all of the rewards on offer in VOLTA FOOTBALL, whichever mode you play.\r\n</p>\r\n\r\n<p>FIFA Ultimate Team–  Get involved with the most popular mode in FIFA, FIFA Ultimate Team. Build your dream squad from thousands of players from across the world of football, make your club your own on and off the pitch with custom kits, badges, and a whole FUT Stadium to leave your mark on, and take your team into matches against the AI or other players in the FUT Community. Plus, welcome back some of the game’s most memorable players as new FUT Heroes, as some of football’s most memorable players return to the pitch.</p>\r\n\r\n<p>Unrivaled Authenticity – Play with the world’s biggest players in the world’s biggest competitions, including the iconic UEFA Champions League, UEFA Europa League, brand new UEFA Europa Conference League, CONMEBOL Libertadores, CONMEBOL Sudamericana, Premier League, Bundesliga, LaLiga Santander, and many more!</p>																								', '														<p><u>MINIMUM:</u></p>\r\n<p>-Requires a 64-bit processor and operating systemOS: Windows 10 - 64-Bit</p>\r\n<p>-Processor: Intel Core i3-6100 @ 3.7GHz or AMD Athlon X4 880K @4GHz</p>\r\n<p>-Memory: 8 GB RAM</p>\r\n<p>-Graphics: NVIDIA GTX 660 2GB or AMD Radeon HD 7850 2GB</p>\r\n<p>-Storage: 50 GB available space</p>\r\n\r\n<p><u>RECOMMENDED:</u></p>\r\n<p>-Requires a 64-bit processor and operating systemOS: Windows 10 - 64-Bit</p>\r\n<p>-Processor: Intel i5-3550 @ 3.40GHz or AMD FX 8150 @ 3.6GHz</p>\r\n-Memory: 8 GB RAM\r\n<p>-Graphics: NVIDIA GeForce GTX 670 or AMD Radeon R9 270X</p>\r\n<p>-Network: Broadband Internet connection</p>\r\n<p>-Storage: 50 GB available space</p>																		'),
(8, 'Rise of the Tomb Raider™', 570000, 'premium', '5b6951c6621c7db32e9bfbc32b17c924.jpg', '																																			<p><b>ABOUT THIS GAME.</b>\r\n\r\n<p>Rise of the Tomb Raider: 20 Year Celebration includes the base game and Season Pass featuring all-new content. Explore Croft Manor in the new “Blood Ties” story, then defend it against a zombie invasion in “Lara’s Nightmare”. Survive extreme conditions with a friend in the new online Co-Op Endurance mode, and brave the new “Extreme Survivor” difficulty. Also features an outfit and weapon inspired by Tomb Raider III, and 5 classic Lara skins. Existing DLC will challenge you to explore a new tomb that houses an ancient terror in Baba Yaga: The Temple of the Witch, and combat waves of infected predators in Cold Darkness Awakened.</p>\r\n\r\n<p>Key Features</p>\r\n<p>Lara’s Journey – Lara uncovers an ancient mystery that places her in the cross-hairs of a ruthless organization known as Trinity. As she races to find the secret before Trinity, the trail leads to a myth about the Lost City of Kitezh. Lara knows she must reach the Lost City and its hidden secrets before Trinity. With that, she sets out for Siberia on her first Tomb Raiding expedition</p>\r\n<p>Woman vs. Wild – In “Rise of the Tomb Raider,” Lara battles with not only enemies from around the world, but the world itself. Hunt animals to craft weapons and scavenge for rare resources in densely populated ecosystems. You’ll encounter beautifully hostile environments, full of treacherous conditions and unstable landscapes that will require Lara to push her limits to the very edge.</p>\r\n<p>Guerilla Combat - Use the environment to your advantage, scale trees and dive underwater to avoid or takedown enemies, configure Lara’s gear, weapons, and ammo to suit your play style from stealth to guns blazing, craft explosives on the fly to sow chaos, and wield Lara’s signature combat bows and climbing axe.</p>\r\n<p>Return to Tomb Raiding – Tombs are back, and they’re bigger and better than ever. In “Rise of the Tomb Raider” you’ll explore huge, awe-inspiring ancient spaces littered with deadly traps, solve dramatic environmental puzzles, and decipher ancient texts to reveal crypts as you take on a world filled with secrets to discover.</p>																														', '																																			<p><u>MINIMUM:</u></p>\r\n<p>-OS: Windows 7 64bit</p>\r\n<p>-Processor: Intel Core i3-2100 or AMD equivalent</p>\r\n<p>-Memory: 6 GB RAM</p>\r\n<p>-Graphics: NVIDIA GTX 650 2GB or AMD HD7770 2GB</p>\r\n<p>-DirectX: Version 11</p>\r\n<p>-Storage: 25 GB available space</p>\r\n\r\n<p><u>RECOMMENDED:</u></p>\r\n<p>-OS: Windows 10 64 bit</p>\r\n<p>-Processor: Intel Core i7-3770K</p>\r\n<p>-Memory: 8 GB RAM</p>\r\n<p>-Graphics: NVIDIA GTX 980Ti 2560x1440 or NVIDIA GTX 970 1920x1080</p>\r\n<p>-DirectX: Version 11</p>\r\n<p>-Storage: 25 GB available space</p>\r\n																								'),
(9, 'ARK: Survival Evolved', 139999, 'reguler', '90d3c8ba2fd5950a99d5d65138d802a7.jpg', '														<b><p>ABOUT THIS GAME</p></b>\r\n\r\n<p>\r\nAs a man or woman stranded naked, freezing and starving on the shores of a mysterious island called ARK, you must hunt, harvest resources, craft items, grow crops, research technologies, and build shelters to withstand the elements. Use your cunning and resources to kill or tame & breed the leviathan dinosaurs and other primeval creatures roaming the land, and team up with or prey on hundreds of other players to survive, dominate... and escape!\r\n</p>\r\n\r\n<p>\r\nDinosaurs, Creatures, & Breeding! -- over 100+ creatures can be tamed using a challenging capture-&-affinity process, involving weakening a feral creature to knock it unconscious, and then nursing it back to health with appropriate food. Once tamed, you can issue commands to your tames, which it may follow depending on how well you’ve tamed and trained it. Tames, which can continue to level-up and consume food, can also carry Inventory and Equipment such as Armor, carry prey back to your settlement depending on their strength, and larger tames can be ridden and directly controlled! Fly a Pterodactyl over the snow-capped mountains, lift allies over enemy walls, race through the jungle with a pack of Raptors, tromp through an enemy base along a gigantic brontosaurus, or chase down prey on the back of a raging T-Rex! Take part in a dynamic ecosystem life-cycle with its own predator & prey hierarchies, where you are just one creature among many species struggling for dominance and survival. Tames can also be mated with the opposite gender, to selectively breed successive generations using a trait system based on recombinant genetic inheritance. This process includes both egg-based incubation and mammalian gestation lifecycles! Or put more simply, raise babies!\r\n\r\n</p>												', '														<p><u>MINIMUM:</u></p>\r\n<p>-OS: Windows 7/8.1/10 (64-bit versions)</p>\r\n<p>Processor: Intel Core i5-2400/AMD FX-8320 or better</p>\r\n<p>Memory: 8 GB RAM</p>\r\n<p>-Graphics: NVIDIA GTX 670 2GB/AMD Radeon HD 7870 2GB or better</p>\r\n<p>-DirectX: Version 10</p>\r\n<p>-Storage: 60 GB available space</p>\r\n<p>-Additional Notes: Requires broadband internet connection for multiplayer</p>	\r\n<p><u>Minimum</u></p>											'),
(10, 'DreadOut 2', 477000, 'reguler', '6b1ed95a5648f1aef26fc26920eca252.jpg', '																												<b><p>ABOUT THIS GAME</p></b>\r\n<p>\r\nA unique take on third-person action-adventure survival horror with Indonesian supernatural in veins. Mixed gameplay of city exploring, “DreadOut” style smartphone ghost hunting and new action-packed combat within DreadOut supernatural realm. Even though it is a Horror game in veins, but with the touch of silly high school problems, satiric social commentaries, and yet touchy memorable moments, DreadOut 2 will become a fresh take on the survival horror genre.\r\n</p>\r\n<p><b>FEATURES</b>\r\n</p><p>SURVIVAL ACTION-HORROR<br>\r\nDreadOut 2 will be utilizing a mixed improved mechanic of our previous DreadOut along with a new combat-oriented mechanic.<br>\r\n- Banish them all! DreadOut style smartphone ghost hunting is back.<br>\r\n- Delve deeper in DreadOut supernatural realm with a new combat-oriented mechanic.<br>\r\n- Fight back and survive further using any available melee weapons throughout Linda\'s journey.<br>\r\n- Battle hideous bosses that roamed in the supernatural realm.<br>\r\n\r\nNON LINEAR SURVIVAL HORROR<br>\r\nExploration is the heart of DreadOut 2. We want to take another step to enrich our way of non-linear storytelling through different key elements.<br>\r\n- Explore sleepy Lil\' town, night and day to solve terrifying urban legends that haunt within.<br>\r\n- Interact with various unique NPCs both human and ghosts, with various locations teeming with their antics.<br>\r\n- Considerable amount of side quests, hidden stages, and mini-bosses written specifically based on our Asian/Indonesian urban legends.<br>\r\n- Experience environmental storytelling. Learning about the city nooks and cranny that will guide players in finding an interesting discovery.<br>\r\n- Substantial amount collection of ghost and urban legends lore under our Ghostpedia is waiting to be discovered.<br>\r\n																																																																																										', '														<p><i>MINIMUM:</p>\r\n<p>Requires a 64-bit processor and operating system</p>\r\n<p>-OS: Windows 8.1</p>\r\n<p>-Processor: Intel i5 3570K / AMD FX-8350</p>\r\n<p>- Memory: 4 GB RAM</p>\r\n<p>- Graphics: GTX 770 with 2GB VRAM / Radeon R9 280X 3GB</p>\r\n<p>- DirectX: Version 11</p>\r\n<p>- Storage: 16 GB available space</p>\r\n<p>- Sound Card: DirectX compatible</p>	\r\n<p><i>RECOMMENDED:</p>\r\n<p>- Requires a 64-bit processor and operating system</p>\r\n<p>- OS: Windows 10</p>\r\n<p>- Processor: Intel i7</p>\r\n<p>- Memory: 16 GB RAM</p>\r\n<p>- Graphics: GTX 1050 / Radeon Rx 570</p>\r\n<p>- DirectX: Version 12</p>																					');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('1','2') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`) VALUES
(1, 'Admin', 'admin@gmail.com', '$2y$10$I52FUe8oEeyXPw8y6olwD.m12vecYpd0FiS66r2iN08cOiRmHE.I6', '1'),
(18, 'defri ', 'user@gmail.com', '$2y$10$BaBaIQVNbt2dlKnwG2xLhOMLp5raEUPHXLypfZ5tANyA8o6SMUo4u', '2'),
(19, 'defri prasetyo', 'defriprasetyo46@gmail.com', '$2y$10$R0ix4si4Z3JHU3IhGZUjiOmQ6slwoco7ZHs1fo/nbke.AkNouNNga', '2');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indeks untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders_confirm`
--
ALTER TABLE `orders_confirm`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders_detail`
--
ALTER TABLE `orders_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `orders_confirm`
--
ALTER TABLE `orders_confirm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `orders_detail`
--
ALTER TABLE `orders_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `banners`
--
ALTER TABLE `banners`
  ADD CONSTRAINT `banners_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Ketidakleluasaan untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
