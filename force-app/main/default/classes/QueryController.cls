public class QueryController { 
    
    public final List<query__mdt> Querys {get;set;}
    final Map<String, query__mdt> QuerysByApiName {get; set;}
    
    public QueryController(ApexPages.StandardController controller) { 
        Querys = new List<query__mdt>();
        QuerysByApiName = new Map<String, query__mdt>();
        for (query__mdt v : [SELECT QualifiedApiName, MasterLabel, Activate__c, dbQuery__c
                                FROM query__mdt]) { 
                                   Querys.add(v);
                                    QuerysByApiName.put(v.QualifiedApiName, v);
                                     System.debug('---------v.QualifiedApiName------'+v.dbQuery__c+'-----'+v.Activate__c);
                                }
    }
    
    public PageReference save() {        
        
        // Create a metadata container.
        Metadata.DeployContainer container = new Metadata.DeployContainer();
        List<String> controllersNames = new List<String>();
        for (String recordName : QuerysByApiName.keySet()) {
            System.debug('---------record name------'+recordName);
            
            System.debug('---------record name------'+ QuerysByApiName.get(recordName));
            controllersNames.add('query__mdt'+ recordName);
        }
        
        List<Metadata.Metadata> records = 
            Metadata.Operations.retrieve(Metadata.MetadataType.CustomMetadata, 
                                         controllersNames);
        
        for (Metadata.Metadata record : records) {
            Metadata.CustomMetadata controllerRecord = (Metadata.CustomMetadata) record;
            System.debug('---------record ------'+controllerRecord);
            
            String vatRecordName = controllerRecord.fullName.substringAfter('.');
            System.debug('---------vatRecordName ------'+vatRecordName);
            query__mdt ToCopy = QuerysByApiName.get(vatRecordName);
                System.debug('---------vatToCopy ------'+ToCopy);
            
            for (Metadata.CustomMetadataValue RecValue : controllerRecord.values) {
                RecValue.value = ToCopy.get(RecValue.field);
                 System.debug('--------- vatRecValue.value ------'+ RecValue.value);
            }
            
            // Add record to the container.
            container.addMetadata(controllerRecord);
        }   
        // Deploy the container with the new components. 
        Id asyncResultId = Metadata.Operations.enqueueDeployment(container, null);
        
        return null;
    }
}