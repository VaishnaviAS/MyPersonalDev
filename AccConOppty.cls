public class AccConOppty {

public List<Account> acc{get;set;}

public AccConOppty(){

acc=[Select Name, (SELECT Name FROM Contacts), (SELECT Name FROM Opportunities) From Account];

}

}