--Contains details about the event
CREATE TABLE Event(
  id_Event INT IDENTITY PRIMARY KEY,
  eventDate DATE NOT NULL,
  eventName VARCHAR(255) NOT NULL,
  eventCity VARCHAR(55) NOT NULL,
  eventRegion VARCHAR(255) NOT NULL,
);
--Contains all people
CREATE TABLE Person(
  id_Person INT IDENTITY PRIMARY KEY,
  fName VARCHAR(50) NOT NULL,
  lName VARCHAR(50) NOT NULL,
  street VARCHAR(255),
  city VARCHAR(255),
  postalCode VARCHAR(16),
  state_Country VARCHAR(255),
  email VARCHAR(255),
  UNIQUE(fName, lName)
);
--Roles that will be assigned to people
CREATE TABLE Roles(
  id_Role INT IDENTITY PRIMARY KEY,
  role VARCHAR(50) NOT NULL UNIQUE
);
--Maps the persons and roles together
CREATE TABLE PersonRolesMap(
  id_PersonRoles INT IDENTITY PRIMARY KEY,
  id_Person INT NOT NULL FOREIGN KEY REFERENCES Person(id_Person),
  id_Role INT NOT NULL FOREIGN KEY REFERENCES Roles(id_Role),
  UNIQUE (id_Person, id_Role) --prevents duplicate entries
);
--Vendor Tabls
CREATE TABLE VendorTable(
  VendorTable INT IDENTITY PRIMARY KEY,
  num INT NOT NULL UNIQUE
);
--Contains the presentation title and location
CREATE TABLE Presentation(
  id_Presentation INT IDENTITY PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  location VARCHAR(50)
);
--Tracks
CREATE TABLE Track(
  id_Track INT IDENTITY PRIMARY KEY,
  Name VARCHAR(55) NOT NULL UNIQUE,
);
--Maps the track and presentation together
CREATE TABLE PresentationTrackMap(
  id_PresentationTrack INT IDENTITY PRIMARY KEY,
  id_Track INT NOT NULL FOREIGN KEY REFERENCES Track(id_Track),
  id_Presentation INT NOT NULL FOREIGN KEY REFERENCES Presentation(id_Presentation),
);
--Difficulty of the classes
CREATE TABLE Difficulty(
  id_Difficulty INT IDENTITY PRIMARY KEY,
  difficulty VARCHAR(50) NOT NULL UNIQUE
);
--Maps the Presentation and Difficulty together
CREATE TABLE PresentationDifficultyMap (
  id_PresentationDifficulty INT IDENTITY PRIMARY KEY,
  id_Presentation INT NOT NULL UNIQUE FOREIGN KEY REFERENCES Presentation(id_Presentation),
  id_Difficulty INT NOT NULL FOREIGN KEY REFERENCES Difficulty(id_Difficulty)
);
--Maps the Presenter(Person) and Presentation together
CREATE TABLE PresenterPresentationMap(
  id_PresenterPresentation INT IDENTITY PRIMARY KEY,
  id_Presentation INT NOT NULL FOREIGN KEY REFERENCES Presentation(id_Presentation),
  id_Presenter INT NOT NULL FOREIGN KEY REFERENCES Person(id_Person)
);
--Rooms
CREATE TABLE Room(
  id_Room INT IDENTITY PRIMARY KEY,
  roomNumber VARCHAR(55) NOT NULL UNIQUE
);
--Time Slots
CREATE TABLE TimeSlot(
  id_TimeSlot INT IDENTITY PRIMARY KEY,
  timeStart VARCHAR(55) NOT NULL UNIQUE
);
--Creates the schedule of presentations
CREATE TABLE Schedule(
  id_Schedule INT IDENTITY PRIMARY KEY,
  eventSchedule INT,
  id_Presentation INT NOT NULL UNIQUE FOREIGN KEY REFERENCES Presentation(id_Presentation),
  id_Room INT NOT NULL FOREIGN KEY REFERENCES Room(id_Room),
  id_TimeSlot INT NOT NULL FOREIGN KEY REFERENCES TimeSlot(id_TimeSlot),
  UNIQUE(eventSchedule, id_Room, id_TimeSlot)--prevents duplicate booking of rooms per event
);
CREATE TABLE EventScheduleMapping(
   id_EventSchedule INT IDENTITY PRIMARY KEY,
   id_Event INT UNIQUE FOREIGN KEY REFERENCES Event(id_Event),
   id_Schedule INT UNIQUE
);
--Contains the sponsor name and their tier
CREATE TABLE Sponsor(
  id_Sponsor INT IDENTITY PRIMARY KEY,
  Name VARCHAR(55) NOT NULL,
  Tier VARCHAR(55) NOT NULL,
);
--Temp
CREATE TABLE TempTable(
  id_TempTable INT IDENTITY PRIMARY KEY,
  presentationTitle VARCHAR(255),
  fName VARCHAR(50),
  lName VARCHAR(50),
  difficulty VARCHAR(50),
  event VARCHAR(255)
);




