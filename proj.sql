/**********************************************************************
 * NAME: Payton Burks
 * CLASS: CPSC 321
 * DATE: 12/13/21
 * Project
 * DESCRIPTION: A database for concerts
 **********************************************************************/

-- TODO: add drop table statements
DROP TABLE IF EXISTS concert;
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS artist;
DROP TABLE IF EXISTS venue;

-- TODO: add create table statements
CREATE TABLE user(
    username VARCHAR(25),
    birthday DATE,
    name_ VARCHAR(50),

    primary key (username)
);

CREATE TABLE venue(
    name_ VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    num_seats INT,

    primary key (name_)
);

CREATE TABLE artist(
    name_ VARCHAR(50),
    genre VARCHAR(25),

    primary key (name_)
);

CREATE TABLE concert(
    username VARCHAR(25),
    date DATE,
    venue VARCHAR(50),
    artist VARCHAR(50),
    price DECIMAL(5,2),

    primary key (username, artist, venue, date),
    foreign key (username) references user (username) ON DELETE CASCADE,
    foreign key (artist) references artist (name_) ON DELETE CASCADE,
    foreign key (venue) references venue (name_) ON DELETE CASCADE
);

-- TODO: add insert statements
INSERT INTO user VALUES
    ('pburks', '2001-05-07', 'Payton Burks'),
    ('dbalbsexy', '2001-09-18', 'Daniel Balboni'),
    ('woohoo88', '2000-07-31', 'Ligma Fort'),
    ('jschmitz68', '2000-05-25', 'Josh Schmitz'),
    ('Dwall81', '1990-02-15', 'Darren Waller'),
    ('Mookdawg_', '1998-04-22', 'Javon Kinlaw'),
    ('SaulGoodmann7', '1973-07-20', 'Bob Odenkirk'),
    ('keynankel', '1984-10-03', 'Kenan Kel'),
    ('phinni', '2005-05-05', 'Phineas Fletcher'),
    ('kroolyun', '1991-11-06', 'Kingu Krule'),
    ('dinnieyumyum', '2002-12-21', 'Tina Bina'),
    ('ctcrunch', '2004-03-23', 'Captain Falcon'),
    ('kingkollmona', '2002-09-09', 'George J-hool'),
    ('BigUnc42', '1960-08-30', 'Andrew Feldman'),
    ('louisssssss', '2000-05-20', 'Louis Gomez'),
    ('KFK!', '1992-03-17', 'Kenny Alvarez'),
    ('unreal6', '2000-03-18', 'Bard Sooper'),
    ('julio777', '1983-02-01', 'Julio Jones'),
    ('yunglean22', '1995-03-01', 'Jonathan Lunderman'),
    ('dabby88', '1992-04-19', 'Darrel Shoo')
;

INSERT INTO artist VALUES
    ('JPEGMAFIA', 'rap'),
    ('Lil Uzi Vert', 'rap'),
    ('Yung Gravy', 'rap'),
    ('City Morgue', 'metal rap'),
    ('$uicideBoy$', 'rap'),
    ('BTS', 'kpop'),
    ('King Krool', 'alternative'),
    ('Slowthai', 'rap'),
    ('Juice WRLD', 'rap'),
    ('Kanye West', 'rap'),
    ('SKEPTA', 'rap'),
    ('IDLES', 'rock'),
    ('Snoop Dogg', 'rap'),
    ('Fivio Foreign', 'rap'),
    ('Yung Lean', 'cloud rap'),
    ('Bladee', 'cloud rap'),
    ('Post Malone', 'pop'),
    ('Playboi Carti', 'rap'),
    ('Drownmilli', 'rap'),
    ('DaBaby', 'rap')
;

INSERT INTO venue VALUES
    ('Red Rocks', 'Denver', 'Colorado', 'United States', 9545),
    ('Ballis Arena', 'Henderson', 'Nevada', 'United States', 7570),
    ('Knitting Factory', 'Spokane', 'Washington', 'United States', 150),
    ('Welts Palace', 'London', 'London', 'United Kingdom', 12000),
    ('Duke University Concert Hall', 'Durham', 'North Carolina', 'United States', 3250),
    ('Lego Colosseum', 'Los Angeles', 'California', 'United States', 745),
    ('Dennis Hopper Ampitheatre', 'Los Angeles', 'California', 'United States', 6770),
    ('Constantinope', 'San Diego', 'California', 'United States', 75),
    ('Lebron Promise School', 'Akron', 'Ohio', 'United States', 2500),
    ('Birmingham Palace', 'Birmingham', 'London', 'United Kingdom', 1250),
    ('Dover House', 'Dover', 'Alabama', 'United States', 231),
    ('G-Mobile Arena', 'Las Vegas', 'Nevada', 'United States', 57000),
    ('Robin in the Hood', 'Henderson', 'Nevada', 'United States', 220),
    ('Icy Drawer Arena', 'Brooklyn', 'New York', 'United States', 7800),
    ('Skate Locker', 'Liverpool', 'Shampshire', 'United Kingdom', 130),
    ('1FODAGNG', 'Richardson', 'Washington', 'United States', 66),
    ('BigDogP Prison', 'Wardell', 'Virginia', 'United States', 1000),
    ('Hard Rock Cafe Palace', 'Las Vegas', 'Nevada', 'United States', 1100)
;

INSERT INTO concert VALUES
    ('pburks', '2009-05-06', 'Red Rocks', 'JPEGMAFIA', 94.20),
    ('pburks', '2009-05-12', 'Ballis Arena', 'Lil Uzi Vert', 35.99),
    ('dbalbsexy', '2020-04-30', 'Knitting Factory', 'Yung Gravy', 25.99),
    ('pburks', '2020-04-30', 'Knitting Factory', 'Yung Gravy', 22.99),
    ('woohoo88', '2020-12-25', 'Welts Palace', 'City Morgue', 0.00),
    ('jschmitz68', '2021-06-17', 'Duke University Concert Hall', '$uicideBoy$', 38.99),
    ('Dwall81', '2021-06-17', 'Duke University Concert Hall', '$uicideBoy$', 38.99),
    ('jschmitz68', '2019-08-22', 'Lego Colosseum', 'BTS', 119.99),
    ('jschmitz68', '2019-07-30', 'Red Rocks', 'King Krool', 44.00),
    ('SaulGoodmann7', '2021-09-01', 'Dennis Hopper Ampitheatre', 'Lil Uzi Vert', 84.99),
    ('SaulGoodmann7', '2003-03-17', 'Constantinope', 'Slowthai', 17.00),
    ('SaulGoodmann7', '2005-04-22', 'Hard Rock Cafe Palace', 'Juice WRLD', 29.99),
    ('keynankel', '2020-04-30', 'Knitting Factory', 'Yung Gravy', 22.99),
    ('keynankel', '2009-07-08', 'Lebron Promise School', 'Kanye West', 72.99),
    ('keynankel', '2021-01-01', 'Birmingham Palace', 'Slowthai', 50.99),
    ('keynankel', '2021-01-01', 'Birmingham Palace', 'SKEPTA', 50.99),
    ('phinni', '2021-01-01', 'Birmingham Palace', 'Slowthai', 50.99),
    ('phinni', '2021-01-01', 'Birmingham Palace', 'SKEPTA', 50.99),
    ('phinni', '2020-09-09', 'Dover House', 'IDLES', 19.99),
    ('kroolyun', '2004-04-20', 'G-Mobile Arena', 'Snoop Dogg', 42.00),
    ('kroolyun', '2021-05-07', 'Robin in the Hood', 'Fivio Foreign', 0.00),
    ('kroolyun', '2010-05-30', 'Icy Drawer Arena', 'City Morgue', 24.99),
    ('dinnieyumyum', '2011-03-20', 'Skate Locker', 'Yung Lean', 99.99),
    ('dinnieyumyum', '2001-08-21', '1FODAGNG', 'Bladee', 123.45),
    ('dinnieyumyum', '2011-06-25', 'BigDogP Prison', 'Post Malone', 0.00),
    ('kingkollmona', '2019-06-15', 'Knitting Factory', 'JPEGMAFIA', 32.00),
    ('kingkollmona', '2021-06-17', 'Duke University Concert Hall', '$uicideBoy$', 38.99),
    ('kingkollmona', '2021-09-01', 'Dennis Hopper Ampitheatre', 'Lil Uzi Vert', 85.60),
    ('kingkollmona', '2021-01-01', 'Birmingham Palace', 'Slowthai', 50.99),
    ('BigUnc42', '2021-09-28', 'Robin in the Hood', 'Juice WRLD', 43.27),
    ('BigUnc42', '2021-07-25', 'Duke University Concert Hall', 'Kanye West', 55.34),
    ('BigUnc42', '2021-09-30', 'Lebron Promise School', 'Bladee', 234.99),
    ('BigUnc42', '2020-06-22', 'Dover House', 'Fivio Foreign', 34.99),
    ('louisssssss', '2004-04-20', 'G-Mobile Arena', 'Snoop Dogg', 42.00),
    ('louisssssss', '2009-05-03', 'G-Mobile Arena', 'City Morgue', 39.99),
    ('louisssssss', '2021-10-22', 'Icy Drawer Arena', 'IDLES', 32.99),
    ('louisssssss', '2021-10-30', 'Welts Palace', 'BTS', 424.00),
    ('KFK!', '2005-04-22', 'Hard Rock Cafe Palace', 'Juice WRLD', 99.99),
    ('KFK!', '2021-08-07', 'Skate Locker', 'DaBaby', 43.99),
    ('KFK!', '2021-08-30', 'Constantinope', 'IDLES', 25.99),
    ('KFK!', '2020-09-22', '1FODAGNG', 'Yung Gravy', 87.99),
    ('unreal6', '2001-05-07', '1FODAGNG', 'Playboi Carti', 45.99),
    ('unreal6', '2020-09-22', '1FODAGNG', 'Yung Gravy', 87.99),
    ('unreal6', '2021-10-30', 'Birmingham Palace', 'Playboi Carti', 45.99),
    ('unreal6', '2019-08-27', 'Lego Colosseum', 'King Krool', 28.99),
    ('julio777', '2019-12-25', 'Lego Colosseum', 'Kanye West', 99.99),
    ('julio777', '2020-05-08', 'Lebron Promise School', 'Kanye West', 125.00),
    ('yunglean22', '2003-09-28', 'Skate Locker', 'Yung Lean', 94.56),
    ('yunglean22', '2021-01-01', 'Birmingham Palace', 'Slowthai', 50.99),
    ('yunglean22', '2021-01-01', 'Birmingham Palace', 'SKEPTA', 50.99),
    ('yunglean22', '2018-06-06', 'Constantinope', 'BTS', 78.05),
    ('dabby88', '2020-10-17', 'Dennis Hopper Ampitheatre', 'Juice WRLD', 89.99),
    ('dabby88', '2020-05-22', 'Dennis Hopper Ampitheatre', 'King Krool', 75.98),
    ('dabby88', '2017-11-14', 'Ballis Arena', 'Drownmilli', 32.99)
;

-- TODO: add select statements (to print tables)
select * from user;
select * from concert;
select * from venue;
select * from artist;
