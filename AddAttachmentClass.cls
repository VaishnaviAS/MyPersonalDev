public class AddAttachmentClass {

    public Attachment file1{get;set;}
    public Account acc;
    public AddAttachmentClass(ApexPages.StandardController controller) {
       /* acc = (Account)controller.getRecord();
        system.debug('@@' +acc.Id);*/
        file1 = new Attachment();
    }
    
    public void submit(){
    system.debug('inside submit');
    Attachment a1 = new Attachment();
    a1.Body = file1.Body;
    a1.ParentId = '0012800000k4BAy';
    a1.Name = 'attachment1';
    insert a1;  
    }

}