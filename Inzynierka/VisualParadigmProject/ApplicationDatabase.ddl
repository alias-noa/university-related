ALTER TABLE `user` DROP FOREIGN KEY FKUser113130;
ALTER TABLE `user` DROP INDEX FKUser113130;
ALTER TABLE `user` DROP FOREIGN KEY FKUser476241;
ALTER TABLE `user` DROP INDEX FKUser476241;
ALTER TABLE `User` modify column company_ID int(10);
ALTER TABLE `User` ADD COLUMN language_ID int(11) NOT NULL;
ALTER TABLE User_data ADD COLUMN description varchar(500) NOT NULL;
ALTER TABLE auction DROP FOREIGN KEY FKAuction664231;
ALTER TABLE auction DROP INDEX FKAuction664231;
ALTER TABLE auction DROP FOREIGN KEY FKAuction66394;
ALTER TABLE auction DROP INDEX FKAuction66394;
ALTER TABLE Auction modify column userWonBy_ID int(10);
ALTER TABLE image DROP FOREIGN KEY FKImage715098;
ALTER TABLE image DROP INDEX FKImage715098;
ALTER TABLE Image modify column auction_properties_ID int(10);
ALTER TABLE Auction_properties ADD COLUMN category_ID int(10) NOT NULL;
ALTER TABLE Company_data ADD COLUMN description varchar(2000) NOT NULL;
CREATE TABLE Bids (ID int(10) NOT NULL, Offer decimal(10, 2) NOT NULL, auction_properties_ID int(10) NOT NULL, user_ID int(10) NOT NULL, PRIMARY KEY (ID)) CHARACTER SET UTF8;
CREATE TABLE Category (ID int(10) NOT NULL, name varchar(35) NOT NULL, PRIMARY KEY (ID)) CHARACTER SET UTF8;
CREATE TABLE Account_status (ID int(10) NOT NULL AUTO_INCREMENT, status_type_ID int(10) NOT NULL, description varchar(500) NOT NULL, company_ID int(10), user_ID int(10), PRIMARY KEY (ID)) CHARACTER SET UTF8;
CREATE TABLE Status_type (ID int(10) NOT NULL AUTO_INCREMENT, name varchar(25) NOT NULL, PRIMARY KEY (ID)) CHARACTER SET UTF8;
CREATE TABLE Language (ID int(11) NOT NULL AUTO_INCREMENT, name varchar(20) NOT NULL, PRIMARY KEY (ID)) CHARACTER SET UTF8;
ALTER TABLE Image ADD INDEX FKImage715098 (auction_properties_ID), ADD CONSTRAINT FKImage715098 FOREIGN KEY (auction_properties_ID) REFERENCES Auction_properties (ID);
ALTER TABLE `User` ADD INDEX FKUser178703 (account_type_ID), ADD CONSTRAINT FKUser178703 FOREIGN KEY (account_type_ID) REFERENCES Account_type (ID);
ALTER TABLE Auction ADD INDEX FKAuction664231 (userOwner_ID), ADD CONSTRAINT FKAuction664231 FOREIGN KEY (userOwner_ID) REFERENCES `User` (ID);
ALTER TABLE `User` ADD INDEX FKUser113130 (company_ID), ADD CONSTRAINT FKUser113130 FOREIGN KEY (company_ID) REFERENCES Company (ID);
ALTER TABLE Auction ADD INDEX FKAuction66394 (userWonBy_ID), ADD CONSTRAINT FKAuction66394 FOREIGN KEY (userWonBy_ID) REFERENCES `User` (ID);
ALTER TABLE Bids ADD INDEX FKBids24593 (auction_properties_ID), ADD CONSTRAINT FKBids24593 FOREIGN KEY (auction_properties_ID) REFERENCES Auction_properties (ID);
ALTER TABLE Bids ADD INDEX FKBids415427 (user_ID), ADD CONSTRAINT FKBids415427 FOREIGN KEY (user_ID) REFERENCES `User` (ID);
ALTER TABLE Auction_properties ADD INDEX FKAuction_pr292912 (category_ID), ADD CONSTRAINT FKAuction_pr292912 FOREIGN KEY (category_ID) REFERENCES Category (ID);
ALTER TABLE Account_status ADD INDEX FKAccount_st503042 (status_type_ID), ADD CONSTRAINT FKAccount_st503042 FOREIGN KEY (status_type_ID) REFERENCES Status_type (ID);
ALTER TABLE Account_status ADD INDEX FKAccount_st736731 (company_ID), ADD CONSTRAINT FKAccount_st736731 FOREIGN KEY (company_ID) REFERENCES Company (ID);
ALTER TABLE Account_status ADD INDEX FKAccount_st216156 (user_ID), ADD CONSTRAINT FKAccount_st216156 FOREIGN KEY (user_ID) REFERENCES `User` (ID);
ALTER TABLE `User` ADD INDEX FKUser823556 (language_ID), ADD CONSTRAINT FKUser823556 FOREIGN KEY (language_ID) REFERENCES Language (ID);
