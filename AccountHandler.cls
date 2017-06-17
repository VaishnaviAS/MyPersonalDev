public class AccountHandler {
    public static Account insertNewAccount(String Aname){
        
        try{
            Account a = new Account();
            a.Name = Aname;
            insert a;
            return a;
        }catch(Exception e){
            return null;
        }
        
    }
}