CREATE TABLE Building (
  BuildingID  VARCHAR(10) NOT NULL,
  BuildingName  VARCHAR(255),
  Address  VARCHAR(255),
  PRIMARY KEY (BuildingID)
);

CREATE TABLE Location (
  LocationID  VARCHAR(10) NOT NULL,
  BuildingID  VARCHAR(10) NOT NULL,
  Floor INTEGER NOT NULL,
  PRIMARY KEY (LocationID),
  FOREIGN KEY (BuildingID) REFERENCES Building(BuildingID)
);

CREATE TABLE Room (
  RoomID  VARCHAR(10) NOT NULL,
  RoomNumber  INTEGER NOT NULL,
  LocationID VARCHAR(10) NOT NULL,
  Description VARCHAR(255),
  OwnerID VARCHAR(10) NOT NULL,
  Size FLOAT NOT NULL,
  Height FLOAT,
  Capacity INTEGER NOT NULL,
  GIScoordinates GEOGRAPHY NOT NULL,
  TotalItemCharge MONEY,
  RoomCharge MONEY NOT NULL,
  SuperRoomID VARCHAR(10),

  PRIMARY KEY (RoomID),
  FOREIGN KEY (LocationID) REFERENCES Location(LocationID),
  FOREIGN KEY (SuperRoomID) REFERENCES Room(RoomID),
  FOREIGN KEY (OwnerID) REFERENCES Department(DepartmentID),

  CHECK (RoomNumber > 0 AND Size > 0 AND Capacity > 0 AND RoomCharge > 0),
  CHECK (Height IS NULL OR Height > 0),
  CHECK (TotalItemCharge IS NULL OR TotalItemCharge > 0)
);

CREATE TABLE Department (
  DepartmentID VARCHAR(10) NOT NULL,
  DepartmentName VARCHAR(255) NOT NULL,
  SuperDepartmentID VARCHAR(10),
  Phone VARCHAR(20) NOT NULL,
  ManagerID VARCHAR(10) NOT NULL,

  PRIMARY KEY (DepartmentID),
  FOREIGN KEY (SuperDepartmentID) REFERENCES Department(DepartmentID),
  UNIQUE (Phone)
);

CREATE TABLE People (
  EID  VARCHAR(10) NOT NULL,
  LastName VARCHAR(255) NOT NULL,
  FirstName VARCHAR(255) NOT NULL,
  Phone VARCHAR(20) NOT NULL,
  Email VARCHAR(100) NOT NULL,
  Password VARCHAR(100) NOT NULL,
  PriorityLevel INTEGER,
  DepartmentID VARCHAR(10) NOT NULL,
  Office VARCHAR(255),

  PRIMARY KEY (EID),
  FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),

  UNIQUE (Phone),
  UNIQUE (Email),

  CHECK (PriorityLevel > 0) 
 );

CREATE TABLE Proxy (
  ProxyID  VARCHAR(10) NOT NULL,
  EID VARCHAR(10) NOT NULL,
  ManagerID VARCHAR(10) NOT NULL,
  Password VARCHAR(100) NOT NULL,
  ProxyLevel INTEGER,

  PRIMARY KEY (ProxyID),
  FOREIGN KEY (EID) REFERENCES People(EID),
  FOREIGN KEY (ManagerID) REFERENCES People(EID),

  CHECK (ProxyLevel > 0)
);

CREATE TABLE Account (
  AccountID VARCHAR(10) NOT NULL,
  EID VARCHAR(10) NOT NULL,
  AccountNumber VARCHAR(20) NOT NULL,

  PRIMARY KEY (AccountID),
  FOREIGN KEY (EID) REFERENCES People(EID),
  UNIQUE (AccountNumber)
);

CREATE TABLE Reservation (
  ReservationID VARCHAR(10) NOT NULL,
  RoomID VARCHAR(10) NOT NULL,
  StartDate DATETIME NOT NULL,
  EndDate DATETIME NOT NULL,
  Purpose VARCHAR(255),
  NumberOfPeople INTEGER,
  DateMade DATETIME NOT NULL,
  EID VARCHAR(10) NOT NULL,
  ProxyID VARCHAR(10),
  AccountID VARCHAR(10) NOT NULL,
  TotalItemCharge MONEY,
  TotalBilled MONEY,
  Flag VARCHAR(20),

  PRIMARY KEY (ReservationID),
  FOREIGN KEY (RoomID) REFERENCES Room(RoomID),
  FOREIGN KEY (EID) REFERENCES People(EID),
  FOREIGN KEY (ProxyID) REFERENCES Proxy(ProxyID),
  FOREIGN KEY (AccountID) REFERENCES Account(AccountID),

  CONSTRAINT check_valid_time CHECK (EndDate >= StartDate AND StartDate >= DateMade),
  CONSTRAINT check_valid_flag CHECK (Flag IN ('Active', 'Canceled', 'Replaced')),
  CONSTRAINT check_valid_account CHECK (dbo.check_valid_accountID(EID, AccountID) = 1),
  CONSTRAINT check_valid_people CHECK (dbo.check_valid_number_of_people(RoomID, NumberOfPeople) = 1)
);

CREATE TABLE Item (
 ItemID  VARCHAR(10) NOT NULL,
 Description  VARCHAR(255) NOT NULL,
 Price MONEY NOT NULL,
 PRIMARY KEY (ItemID)
);

CREATE TABLE RoomItem (
  RoomID VARCHAR(10) NOT NULL,
  ItemID VARCHAR(10) NOT NULL,
  Quantity INTEGER NOT NULL,
  Fixed BIT NOT NULL,
  Charge MONEY NOT NULL,

  PRIMARY KEY (RoomID, ItemID),
  FOREIGN KEY (RoomID) REFERENCES Room(RoomID),
  FOREIGN KEY (ItemID) REFERENCES Item(ItemID),

  CHECK (Quantity > 0 AND Charge > 0)
);

CREATE TABLE ReservationItem (
  ReservationID VARCHAR(10) NOT NULL,
  ItemID VARCHAR(10) NOT NULL,
  Quantity INTEGER NOT NULL,
  Charge MONEY NOT NULL,

  PRIMARY KEY (ReservationID, ItemID),
  FOREIGN KEY (ReservationID) REFERENCES Reservation(ReservationID),
  FOREIGN KEY (ItemID) REFERENCES Item(ItemID),

  CHECK (Quantity > 0 AND Charge > 0)
);

CREATE TABLE ReplacedReservation (
   OldReservation VARCHAR(10) NOT NULL,
   NewReservation VARCHAR(10) NOT NULL,
   ReplaceFlag VARCHAR(10),

   CONSTRAINT pk_reservationID PRIMARY KEY (OldReservation, NewReservation),
   CONSTRAINT fk_replaced_reservationID FOREIGN KEY (OldReservation) REFERENCES Reservation(ReservationID),
   CONSTRAINT fk_replacing_reservation FOREIGN KEY (NewReservation) REFERENCES Reservation(ReservationID),

   CONSTRAINT check_replace_flag CHECK (ReplaceFlag IN ('Valid', 'Invalid')),
   CONSTRAINT valid_new_vs_old_datemade CHECK  (dbo.check_valid_date_made(OldReservation, NewReservation)=(1))
);
