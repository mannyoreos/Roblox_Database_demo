CREATE DATABASE IF NOT EXISTS roblox_db;
USE roblox_db;

CREATE TABLE Developers (
    DeveloperID INT,
    StudioName VARCHAR(50),
    ContactEmail VARCHAR(50),
    Name VARCHAR(50)
);

CREATE TABLE Games (
    GameID INT,
    ReleaseDate DATE,
    Title VARCHAR(25),
    Genre VARCHAR(25),
    Developer_ID INT
);

CREATE TABLE Players (
    PlayerID INT,
    Email VARCHAR(50),
    Age INT,
    Character_MD VARCHAR(255),
    Level INT,
    JoinDate DATE
);

CREATE TABLE Items (
    ItemID INT,
    Type VARCHAR(25),
    BasePrice DECIMAL(10,2),
    Name VARCHAR(25),
    Rarity ENUM('Common','Rare','Epic','Mythic')
);

CREATE TABLE Badges (
    BadgeID INT,
    Name VARCHAR(25),
    Description TEXT,
    UnlockRequirements TEXT,
    Game_ID INT
);

CREATE TABLE Sessions (
    Session_ID INT,
    StartTime DATETIME,
    EndTime DATETIME,
    Game_ID INT,
    Player_ID INT
);

CREATE TABLE Purchases (
    PurchaseID INT,
    PurchasePrice DECIMAL(10,2),
    PurchaseDate DATETIME,
    PlayerID INT,
    ItemID INT
);

CREATE TABLE Develop (
    DeveloperID INT,
    GameID INT
);

CREATE TABLE InTable (
    PlayerID INT,
    SessionID INT,
    GameID INT
);

CREATE TABLE Have (
    GameID INT,
    SessionID INT,
    PlayerID INT,
    BadgeID INT
);

CREATE TABLE Buy (
    PlayerID INT,
    PurchaseID INT,
    ItemID INT
);

ALTER TABLE Developers ADD PRIMARY KEY (DeveloperID);
ALTER TABLE Developers MODIFY DeveloperID INT NOT NULL AUTO_INCREMENT;
ALTER TABLE Developers ADD CONSTRAINT unique_dev_email UNIQUE (ContactEmail);
ALTER TABLE Developers MODIFY StudioName VARCHAR(50) NOT NULL;
ALTER TABLE Developers MODIFY Name VARCHAR(50) NOT NULL;

ALTER TABLE Games ADD PRIMARY KEY (GameID);
ALTER TABLE Games MODIFY GameID INT NOT NULL AUTO_INCREMENT;
ALTER TABLE Games MODIFY ReleaseDate DATE NOT NULL;
ALTER TABLE Games MODIFY Title VARCHAR(25) NOT NULL;
ALTER TABLE Games MODIFY Genre VARCHAR(25) NOT NULL;
ALTER TABLE Games MODIFY Developer_ID INT NOT NULL;
ALTER TABLE Games ADD CONSTRAINT fk_games_dev FOREIGN KEY (Developer_ID) REFERENCES Developers(DeveloperID);

ALTER TABLE Players ADD PRIMARY KEY (PlayerID);
ALTER TABLE Players MODIFY PlayerID INT NOT NULL AUTO_INCREMENT;
ALTER TABLE Players ADD CONSTRAINT unique_player_email UNIQUE (Email);
ALTER TABLE Players ADD CONSTRAINT unique_character UNIQUE (Character_MD);
ALTER TABLE Players MODIFY Age INT NOT NULL CHECK (Age >= 0);
ALTER TABLE Players MODIFY Level INT NOT NULL CHECK (Level >= 0);
ALTER TABLE Players MODIFY JoinDate DATE NOT NULL;

ALTER TABLE Items ADD PRIMARY KEY (ItemID);
ALTER TABLE Items MODIFY ItemID INT NOT NULL AUTO_INCREMENT;
ALTER TABLE Items MODIFY Type VARCHAR(25) NOT NULL;
ALTER TABLE Items MODIFY BasePrice DECIMAL(10,2) NOT NULL CHECK (BasePrice >= 0);
ALTER TABLE Items MODIFY Name VARCHAR(25) NOT NULL;
ALTER TABLE Items MODIFY Rarity ENUM('Common','Rare','Epic','Mythic') NOT NULL;
