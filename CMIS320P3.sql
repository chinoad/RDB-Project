Genre_ID -- comedy 01, drama 02,


CREATE TABLE Movie (Movie_ID INT PRIMARY KEY,
                    Title VARCHAR(30) UNIQUE,
                    Genre_ID INT NOT NULL,
                    Serial_Number INT UNIQUE,
                    Casting VARCHAR(20),
                    Awards VARCHAR (20),
                    Discount INT,
                    Duration NUMBER NOT NULL,
                    Rating VARCHAR (5) NOT NULL,
                    Year_Released NUMBER NOT NULL,
                    Quantity_of_DVD INT,
                    Quantity_of_Video INT);

INSERT INTO Movie VALUES (134542, 'UndertheTuscanSun', 01, 546545, 'DianeLane', 'None', 0, 1.53, 'PG13', 2003, 5, 3);
INSERT INTO Movie VALUES (164568, 'BridgetJonesDiary', 01, 154581, 'ReneeZellweger', 'None', 1, 1.37, 'R', 2001, 2, 4);
INSERT INTO Movie VALUES (324567, 'TheHoliday', 01, 453651, 'KateWinslet', 'None', 0, 2.18, 'PG13', 2006, 6, 4);
INSERT INTO Movie VALUES (241651, 'TheDevilWearsPrada', 02, 365157, 'MerylStreep', 'None', 0, 1.49, 'PG13', 2006, 3, 3);
INSERT INTO Movie VALUES (581236, 'MadameBovary', 02, 364158, 'MiaWasikowska', 'None', 0, 1.58, 'R', 2014, 1, 1);
INSERT INTO Movie VALUES (455644, 'MissionImpossibleRogueNation', 03, 55135, 'TomCruise', 'None', 0, 2.11, 'PG13', 2015, 8, 3);


CREATE TABLE Distributor (Distributor_ID INT PRIMARY KEY,
                    Distributor_Name VARCHAR (20) NOT NULL,
                    Quantity_of_DVD INT,
                    Quantity_of_Video INT,
                    Year INT NOT NULL);

INSERT INTO Distributor VALUES (14543, 'MOVIECO', 1526, 2156, 1996);
INSERT INTO Distributor VALUES (54863, 'MOVIESRUS', 4182, 1458, 2000);
INSERT INTO Distributor VALUES (32548, 'DVDANDMOVIE', 5687, 3256, 1982);
INSERT INTO Distributor VALUES (64487, 'MOVIEDEPOT', 1483, 6456, 2013);
INSERT INTO Distributor VALUES (48626, 'CINEMADEPOT', 2548, 1025, 2002);

CREATE TABLE DVD (DVD_ID INT PRIMARY KEY,
                  Serial_Number INT UNIQUE,
                  Title VARCHAR(30) UNIQUE,
                  Genre_ID INT NOT NULL,
                  DVD_Price NUMBER NOT NULL,
                  Discount NUMBER,
                  Distributor_ID INT,
                  Movie_ID INT,
                  CONSTRAINT dvdDistributor_ID FOREIGN KEY(Distributor_ID) REFERENCES Distributor(Distributor_ID),
                  CONSTRAINT dvdMovie_ID FOREIGN KEY(Movie_ID) REFERENCES Movie(Movie_ID));

INSERT INTO DVD VALUES (65245, 546545, 'UndertheTuscanSun', 01, 8, 0, 14543,134542);
INSERT INTO DVD VALUES (45822, 55135, 'MissionImpossibleRogueNation', 03, 9, 0, 32548,455644);
INSERT INTO DVD VALUES (32558, 154581, 'BridgetJonesDiary', 01, 8, 0, 14543, 164568);
INSERT INTO DVD VALUES (144654, 365157, 'TheDevilWearsPrada', 02, 8, 0, 48626,241651);
INSERT INTO DVD VALUES (34616, 364158, 'MadameBovary', 02, 6, 0, 32548,581236);


CREATE TABLE VIDEO (Video_ID INT PRIMARY KEY,
                    Serial_Number INT UNIQUE,
                    Title VARCHAR(30) UNIQUE,
                    Genre_ID INT NOT NULL,
                    Video_Price NUMBER NOT NULL,
                    Discount NUMBER,
                    Distributor_ID INT,
                    Movie_ID INT,
                    CONSTRAINT videoDistributor_ID FOREIGN KEY(Distributor_ID) REFERENCES Distributor(Distributor_ID),
                    CONSTRAINT videoMovie_ID FOREIGN KEY(Movie_ID) REFERENCES Movie(Movie_ID));

INSERT INTO VIDEO VALUES (3985, 546545, 'UndertheTuscanSun', 01, 8, 0, 32548,134542);
INSERT INTO VIDEO VALUES (7153, 55135, 'MissionImpossibleRogueNation', 03, 9, 0, 48626,455644);
INSERT INTO VIDEO VALUES (8416, 154581, 'BridgetJonesDiary', 01, 8, 0, 64487, 164568);
INSERT INTO VIDEO VALUES (1245, 365157, 'TheDevilWearsPrada', 02, 8, 0, 14543,241651);
INSERT INTO VIDEO VALUES (3659, 364158, 'MadameBovary', 02, 6, 0, 32548,581236);

CREATE TABLE Customer (Customer_ID INT PRIMARY KEY,
                    Name VARCHAR(20) NOT NULL,
                    Street VARCHAR(20) NOT NULL,
                    City VARCHAR(20) NOT NULL,
                    State VARCHAR(2) NOT NULL,
                    Zipcode INT NOT NULL,
                    Phone_Number NUMBER NOT NULL,
                    Email VARCHAR(30),
                    Number_of_Video_Rentals INT,
                    Number_of_DVD_Rentals INT);

INSERT INTO CUSTOMER VALUES (0125, 'Chase_Noad', '142_Scott_Dr', 'Washington', 'DC', 22203, 2022114586,'chasenoad@yahoo.com', 0, 5 );
INSERT INTO CUSTOMER VALUES (0214, 'Carson_Wentz', '148_Daisy_Dr', 'Philadelphia', 'PA', 21454, 4145558895,'cwentz@yahoo.com', 15, 3 );
INSERT INTO CUSTOMER VALUES (0412, 'Hali_VanGilder', '124_Wimble_Cir', 'Alexandria', 'VA', 14839, 1235459865,'halivan@yahoo.com', 2, 15 );
INSERT INTO CUSTOMER VALUES (0352, 'Connie_Knight', '12_Leslie_Ave', 'Alexandria', 'VA', 14423, 7031444454,'connieknight@gmail.com', 30, 5 );
INSERT INTO CUSTOMER VALUES (0325, 'Alice_Elizo', '452_Shiloh_Ct', 'Arlington', 'VA', 22209, 7034884512,'aliceelizo@yahoo.com', 8, 12 );


CREATE TABLE Rental_Record (Transaction_ID INT PRIMARY KEY,
                            Customer_ID INT NOT NULL,
                            Date_Rented DATE NOT NULL,
                            Date_Returned DATE,
                            Video_ID INT,
                            DVD_ID INT,
                            CONSTRAINT rrCustomer_ID FOREIGN KEY(Customer_ID) REFERENCES Customer(Customer_ID),
                            CONSTRAINT rrVideo_ID FOREIGN KEY(Video_ID) REFERENCES Video(Video_ID),
                            CONSTRAINT rrDVD_ID FOREIGN KEY(DVD_ID) REFERENCES DVD(DVD_ID));

INSERT INTO Rental_Record VALUES (1254, 0412,'01-JUL-2018', '10-JUL-2018', 84126, 32558);
INSERT INTO Rental_Record VALUES (1442, 0352,'15-MAY-2017', '17-MAY-2017', 3659, 34616);
INSERT INTO Rental_Record VALUES (367, 0352,'01-JUN-2018', '03-JUN-2018', 1245, 32558);
INSERT INTO Rental_Record VALUES (1458, 0325,'01-JUN-2018', '03-JUN-2018', 7153, 65245);
INSERT INTO Rental_Record VALUES (4856, 0214,'10-JUL-2018', '12-JUL-2018', 84126, 45822);
INSERT INTO Rental_Record VALUES (8452,0125, '03-JUN-2018', '20-JUN-2018', 3985, 65245  );

CREATE TABLE Customer_Charge (Charge_ID INT PRIMARY KEY,
                              Customer_ID INT,
                              Late_Fee NUMBER,
                              Damage_Fee NUMBER,
                              Failure_Rewind_Fee NUMBER,
                              Taxes NUMBER,
                              Video_ID INT,
                              DVD_ID INT,
                              CONSTRAINT ccCustomer_ID FOREIGN KEY(Customer_ID) REFERENCES Customer(Customer_ID),
                              CONSTRAINT ccVideo_ID FOREIGN KEY(Video_ID) REFERENCES Video(Video_ID),
                              CONSTRAINT ccDVD_ID FOREIGN KEY(DVD_ID) REFERENCES DVD(DVD_ID));

INSERT INTO Customer_Charge VALUES (1441, 0412, 0,0,0,1.2,3659, 34616 );
INSERT INTO Customer_Charge VALUES (3222, 0352, 20,0,0,1.2,1245, 32558 );
INSERT INTO Customer_Charge VALUES (5892, 0214, 0,0,0,1.2,84126, 45822);
INSERT INTO Customer_Charge VALUES (4128, 0325, 0,0,0,2,7153, 65245 );
INSERT INTO Customer_Charge VALUES (1244, 0125, 10,0,0,1.2,3985, 65245 );

**QUERY**
SELECT NAME, Customer_ID, Street, Zipcode FROM CUSTOMER ORDER BY Customer_ID;
SELECT Date_Rented, Video_ID FROM Rental_Record WHERE Date_Rented > sysdate-30;
SELECT * FROM Distributor ORDER BY Distributor_Name;
UPDATE Customer SET NAME = 'Alice_Vilar' WHERE Customer_ID = 0325;
DELETE FROM Customer WHERE Customer_ID = 0412;
