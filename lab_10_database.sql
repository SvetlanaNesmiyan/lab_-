--task1
CREATE DATABASE MetroMap;
USE MetroMap;

--task2
CREATE TABLE Cities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL
);

--task3
CREATE TABLE MetroLines (
    id INT AUTO_INCREMENT PRIMARY KEY,
    city_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    color VARCHAR(7),
    FOREIGN KEY (city_id) REFERENCES Cities(id) ON DELETE CASCADE
);

--task4
CREATE TABLE Stations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    line_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    position INT NOT NULL,
    FOREIGN KEY (line_id) REFERENCES MetroLines(id) ON DELETE CASCADE
);

--task5
CREATE TABLE Connections (
    id INT AUTO_INCREMENT PRIMARY KEY,
    station_id_from INT NOT NULL,
    station_id_to INT NOT NULL,
    connection_type ENUM('direct', 'transition') NOT NULL,
    FOREIGN KEY (station_id_from) REFERENCES Stations(id) ON DELETE CASCADE,
    FOREIGN KEY (station_id_to) REFERENCES Stations(id) ON DELETE CASCADE
);

--task6
CREATE TABLE StationInfo (
    station_id INT PRIMARY KEY,
    opened_date DATE,
    closed_date DATE, 
    FOREIGN KEY (station_id) REFERENCES Stations(id) ON DELETE CASCADE
);

--information filling 
INSERT INTO Cities (name, country) VALUES ('Kharkiv', 'Ukraine');

INSERT INTO MetroLines (city_id, name, color) VALUES (2, 'Red Line', '#FF0000');
INSERT INTO MetroLines (city_id, name, color) VALUES (2, 'Blue Line', '#0000FF');
INSERT INTO MetroLines (city_id, name, color) VALUES (2, 'Green Line', '#008000');

INSERT INTO Stations (line_id, name, position) VALUES (1, 'Центральний ринок', 1);
INSERT INTO Stations (line_id, name, position) VALUES (1, 'Майдан Конституції', 2);
INSERT INTO Stations (line_id, name, position) VALUES (1, 'Спортивна', 3);
INSERT INTO Stations (line_id, name, position) VALUES (2, 'Пушкінська', 1);
INSERT INTO Stations (line_id, name, position) VALUES (2, 'Університет', 2);
INSERT INTO Stations (line_id, name, position) VALUES (2, 'Історичний музей', 3);
INSERT INTO Stations (line_id, name, position) VALUES (3, 'Наукова', 1);
INSERT INTO Stations (line_id, name, position) VALUES (3, 'Держпром', 2);
INSERT INTO Stations (line_id, name, position) VALUES (3, 'Архітектора Бекетова', 3);
INSERT INTO Stations (line_id, name, position) VALUES (3, 'Захисників України', 4);
INSERT INTO Stations (line_id, name, position) VALUES (3, 'Метробудівників', 5);
INSERT INTO Stations (line_id, name, position) VALUES (3, 'Одеська', 6);

INSERT INTO Connections (station_id_from, station_id_to, connection_type) VALUES (2, 6, 'direct');
INSERT INTO Connections (station_id_from, station_id_to, connection_type) VALUES (6, 2, 'direct');
INSERT INTO Connections (station_id_from, station_id_to, connection_type) VALUES (5, 8, 'direct');
INSERT INTO Connections (station_id_from, station_id_to, connection_type) VALUES (8, 5, 'direct');
INSERT INTO Connections (station_id_from, station_id_to, connection_type) VALUES (3, 11, 'direct');
INSERT INTO Connections (station_id_from, station_id_to, connection_type) VALUES (11, 3, 'direct');
INSERT INTO Connections (station_id_from, station_id_to, connection_type) VALUES (11, 12, 'transition');

INSERT INTO StationInfo (station_id, opened_date) VALUES (1, '1975-08-22');
INSERT INTO StationInfo (station_id, opened_date) VALUES (2, '1986-10-24');
INSERT INTO StationInfo (station_id, opened_date) VALUES (3, '1995-05-06');