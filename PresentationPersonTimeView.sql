ALTER VIEW PersonPresentationTimeMap
  AS select Target.id_Presentation, Target.id_Person, Schedule.id_TimeSlot, Schedule.eventSchedule, Schedule.id_Room
        FROM(select Presentation.id_Presentation, Person.id_Person
              FROM PresenterPresentationMap
              inner join Presentation on PresenterPresentationMap.id_Presentation = Presentation.id_Presentation
              inner join Person on PresenterPresentationMap.id_Presenter = Person.id_Person) as Target
              inner join Schedule on Target.id_Presentation = Schedule.id_Presentation;