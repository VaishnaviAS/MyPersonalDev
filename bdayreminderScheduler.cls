global with sharing class bdayreminderScheduler implements schedulable{
public void execute(SchedulableContext sc){

bdayreminder bd = new bdayreminder();
database.executeBatch(bd,200);

}

}