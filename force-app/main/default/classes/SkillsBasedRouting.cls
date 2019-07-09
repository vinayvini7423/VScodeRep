Global class SkillsBasedRouting {
    @InvocableMethod
    public static void routeUsingSkills(List<String> cases) {
        System.debug('-----------------cases'+cases);
        List<Case> caseObjects = [SELECT Id, Subject,Description FROM Case WHERE Id in :cases];
        for (Case caseObj : caseObjects) {
            try {
                 System.debug('-----------------caseObj--------'+caseObj);
                // Create a PendingServiceRouting to initiate routing
                createPendingServiceRouting(caseObj);
            } catch(exception e) {
                System.debug('ERROR:' + e.getStackTraceString());
                throw e;
            }
        }
    }
    
    static void createPendingServiceRouting(Case caseObj) {
        // Create a new SkillsBased PendingServiceRouting
        PendingServiceRouting psrObj = new PendingServiceRouting(
            CapacityWeight = 1,
            IsReadyForRouting = FALSE,
            RoutingModel  = 'MostAvailable',
            RoutingPriority = 1,
            RoutingType = 'SkillsBased',
            ServiceChannelId = getChannelId(),
            WorkItemId = caseObj.Id,
            PushTimeout = 0
        );
        insert psrObj;
        System.debug('-----------------psrObj--------'+psrObj);
        psrObj = [select id, IsReadyForRouting from PendingServiceRouting where id = : psrObj.id];
        
        // Now add SkillRequirement(s) to the PendingServiceRouting
        SkillRequirement srObj = new SkillRequirement(
            RelatedRecordId = psrObj.id,
            SkillId = getSkillId(caseObj.Subject),
            SkillLevel = 5
        );
         System.debug('-----------------srObj--------'+srObj);
        insert srObj;
        
        // Update PendingServiceRouting as IsReadyForRouting
        psrObj.IsReadyForRouting = TRUE;
        update psrObj; 
    }
    
    static String getChannelId() {
        ServiceChannel channel = [Select Id From ServiceChannel Where RelatedEntity = 'Case'];
         System.debug('-----------------channel--------'+channel);
        return channel.Id;
    }
    
    static String getSkillId(String caseDescription) {
         System.debug('-----------------caseDescription--------'+caseDescription);
        String skillName = 'English';
        if (caseDescription != null) {
            if (caseDescription.contains('Login_Issue')) {
                skillName = 'Login_Issue';
            } else if (caseDescription.contains('payment_issue')) {
                skillName = 'payment_issue';
            }
        }
         System.debug('-----------------skillName--------'+skillName);
        Skill skill = [Select Id From Skill Where DeveloperName = :skillName];
        return skill.Id;
    }
}