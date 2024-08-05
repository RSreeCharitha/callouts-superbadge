global class AccessibilityProjectBilling{ 
     @future(callout=true)
   public static void callBillingService(String projId, Decimal billingAmount){
     BillingServiceProxy.InvoicesPortSoap11 bis = new BillingServiceProxy.InvoicesPortSoap11();
     BillingServiceProxy.project proj = new BillingServiceProxy.project();
          proj.username = '{!$Credential.BillingServiceCredential.username}';
        //Setup username, password, billAmount, and projectid in BillingServiceProxy.project and then call billProject method
        
        proj.password = '{!$Credential.BillingServiceCredential.password}';
        proj.projectid= projId;
        proj.billAmount = billingAmount;
         //If response is ok set Accessibility Project Status = Complete

         String response = bis.billProject(proj);

         System.debug(response);

         if(response!=''){
          Accessibility_Project__c ap = [select id, Status__c from Accessibility_Project__c where id=:projId];
          ap.Status__c='Complete';
          update ap;
         }
            
    }
}