public class JsonCreationForFulfillment {
    public class fulfillmentDetails
    {
        public OppDetails Data { get; set; }
    }
    
    public class OppDetails
    {
        public string Account_Id { get; set; }
        public string Account_Name { get; set; }
        public string Account_Type { get; set; }
        public string Close_Date { get; set; }
        public string Opportunity_Name { get; set; }
        public string OpportunityId { get; set; }
        public string Primary_Service_Line { get; set; }
        public string Project_End_Date { get; set; }
        public string Project_Start_Date { get; set; }
        public List<SkillsSet> fulfillment { get; set; }
    }
    
    public class SkillsSet{
        public string Fulfilment_Plan_Status { get; set; }
        public string Location { get; set; }
        public string NoOfResources { get; set; }
        public string Skills { get; set; }
    }
}