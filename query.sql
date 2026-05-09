SELECT Title, Genre FROM Games;

SELECT DeveloperID FROM Developers WHERE name = 'Godzilla';

SELECT Title FROM Games WHERE Developer_ID = 1;

SELECT email, level FROM Players;

SELECT email FROM Players WHERE level > 80;

SELECT name FROM Items WHERE rarity = 'Mythic';

SELECT name FROM Badges WHERE Game_ID = 1;

SELECT StartTime, EndTime FROM Sessions WHERE Player_ID = 1;

SELECT PurchasePrice FROM Purchases WHERE PlayerID = 2;

SELECT g.Title, d.name
FROM Games g
JOIN Developers d ON g.Developer_ID = d.DeveloperID;

SELECT p.email, s.StartTime
FROM Players p
JOIN Sessions s ON p.PlayerID = s.Player_ID;

SELECT i.name, p.PurchasePrice
FROM Items i
JOIN Purchases p ON i.ItemID = p.ItemID;

SELECT b.name
FROM Have h
JOIN Badges b ON h.BadgesID = b.BadgesID
WHERE h.PlayerID = 1;

SELECT g.Title
FROM InTable t
JOIN Games g ON t.GameID = g.GameID
WHERE t.PlayerID = 2;

SELECT COUNT(*) AS total_players FROM Players;

SELECT type, COUNT(*) FROM Items GROUP BY type;

SELECT Title FROM Games WHERE ReleaseDate > '2023-01-01';

SELECT SessionID FROM Sessions
WHERE TIMESTAMPDIFF(HOUR, StartTime, EndTime) > 2;

SELECT DISTINCT p.email
FROM Players p
JOIN Have h ON p.PlayerID = h.PlayerID;

SHOW TABLES;

DESCRIBE Developers;

DESCRIBE Games;

DESCRIBE Players;

DESCRIBE Items;

DESCRIBE Badges;

DESCRIBE Sessions;

DESCRIBE Purchases;

DESCRIBE Develop;

DESCRIBE InTable;

DESCRIBE Have;

DESCRIBE Buy;

SELECT DeveloperID, StudioName, ContactEmail, Name
    -> FROM Developers;