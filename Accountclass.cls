public class Accountclass {

    public List<Account> accounts {
    get {
    accounts = [select name, billingcity, billingstate, billingstreet, billingpostalcode 
    from account where ownerid = :userinfo.getuserid()];

    return accounts;
    }
    set;
    }

}