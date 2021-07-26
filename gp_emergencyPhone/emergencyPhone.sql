CREATE TABLE `emergencyPhone` (
  `id` int(11) NOT NULL,
  `identifier` varchar(250) DEFAULT NULL,
  `firstname` varchar(250) DEFAULT NULL,
  `lastname` varchar(250) DEFAULT NULL,
  `phone_number` varchar(250) DEFAULT NULL,
  `office` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `emergencyPhone`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `emergencyPhone`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;
COMMIT;

