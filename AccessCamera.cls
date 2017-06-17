Public class AccessCamera {
    
/** same saveTheFile implementation here **/
	@AuraEnabled
    public static Id saveTheFile(String fileName, String base64Data, String contentType) { 
        base64Data = EncodingUtil.urlDecode(base64Data, 'UTF-8');
        
        Attachment a = new Attachment();
        a.parentId = '0012800000ZkkaMAAR'; //test vaish2
 		//a.parentId = pId;
        a.Body = EncodingUtil.base64Decode(base64Data);
        //a.Body = Blob.valueOf(base64Data);
        a.Name = fileName;
        a.ContentType = contentType;
        
        insert a;
        
        return a.Id;
    }
    
    @AuraEnabled
    public static Id saveTheChunk(String fileName, String base64Data, String contentType, String fileId) { 
        //parentId= '00128000009ZZZ5AAO';
        system.debug('fileID$' +fileId);
        system.debug('BASE64' +base64Data);
        system.debug('ContentType' +contentType);
        if (fileId == '') {
            fileId = saveTheFile( fileName, base64Data, contentType);
        } else if(fileId!=null){
            appendToFile(fileId, base64Data);
        }
        
        return Id.valueOf(fileId);
    }
    
    private static void appendToFile(Id fileId, String base64Data) {
        base64Data = EncodingUtil.urlDecode(base64Data, 'UTF-8');
        
        Attachment a = [
            SELECT Id, Body
            FROM Attachment
            WHERE Id = :fileId
        ];
        
     	String existingBody = EncodingUtil.base64Encode(a.Body);
        a.Body = EncodingUtil.base64Decode(existingBody + base64Data); 
        
        update a;
    }
}