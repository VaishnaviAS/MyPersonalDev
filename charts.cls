public class charts {

    public Date dateVal{get;set;}

    public charts(ApexPages.StandardController controller) {

    }
    
    public void submit(){
        
        getPieData();
    }

    public List<PieWedgeData> getPieData()
    { 
        List<PieWedgeData> data = new List<PieWedgeData>();
        List<Opportunity> memb = new List<Opportunity>(); 
       
        //String sql = 'SELECT Id,Name, Amount FROM Opportunity WHERE CloseDate=''+CloseDate+ ''';
        //memb = Database.Query(sql);
       
        memb =[SELECT Id,Name, Amount FROM Opportunity];
        
        System.debug('@@' +dateVal);
        System.debug(memb);
        for(Opportunity temp:memb)
        {          
            data.add(new PieWedgeData(temp.Name,temp.Amount));
        }
        return data; 
    } 
   
    // Wrapper class 
    public class PieWedgeData
    { 
        public String name { get; set; } 
        public Decimal data { get; set; } 
       
        public PieWedgeData(String name, Decimal data)
        { 
            this.name = name; 
            this.data = data; 
        } 
    } 

}