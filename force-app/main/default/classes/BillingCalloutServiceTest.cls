@isTest
public with sharing class BillingCalloutServiceTest {
    @isTest
    static void testCallout(){
        Test.setMock(WebServiceMock.class, new BillingCalloutServiceMock());
        Accessibility_Project__c ap = new Accessibility_Project__c(Amount__c = 35880, Type__c = 'Sign Language Interpreters', Status__c = 'Submitted');
        insert ap;
        test.startTest();
        AccessibilityProjectBilling.callBillingService(ap.id, ap.Amount__c);
        test.stopTest();
        Accessibility_Project__c apTest = [select id, Status__c from Accessibility_Project__c limit 1];

        system.assertEquals(apTest.Status__c, 'Complete', 'error');


    }
}