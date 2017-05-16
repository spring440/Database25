ALTER VIEW CompleteClassView
  AS select distinct Event.eventName, Person.fName, Person.lName, Presentation.title, Presentation.location, Room.roomNumber, TimeSlot.timeStart
    FROM PersonPresentationTimeMap
    inner join Person on Person.id_Person=PersonPresentationTimeMap.id_Person
    inner join Presentation on Presentation.id_Presentation=PersonPresentationTimeMap.id_Presentation
    inner join TimeSlot on TimeSlot.id_TimeSlot=PersonPresentationTimeMap.id_TimeSlot
    inner join Room on Room.id_Room=PersonPresentationTimeMap.id_Room
    inner join Event on Event.id_Event=PersonPresentationTimeMap.eventSchedule;