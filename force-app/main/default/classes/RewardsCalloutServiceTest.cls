@isTest 
public with sharing class RewardsCalloutServiceTest {
    @isTest 
    static void testPost(){
        List<Wellness_Journey__c> wj = new List<Wellness_Journey__c>();
        for(integer i=0;i<15;i++){
            if(i<6){
                wj.add(new Wellness_Journey__c(Name='Evolve Yoga ' + i, Type__c='Physical', Status__c='Complete', Completion_Date__c = Date.newInstance(2024, 5, 3+i)));
            }
            else {
                integer num = i-5;
                wj.add(new Wellness_Journey__c(Name='Strength + '+ num, Type__c='Mental', Status__c='Complete', Completion_Date__c = Date.newInstance(2024, 5, 25-i))); 
            }
        }
        insert wj;
        List<Wellness_Journey__c> wjQuery = [SELECT Id,Name,OwnerId, Owner.Name, Owner.Email,Completion_Date__c, Owner.Username FROM Wellness_Journey__c];
        for(Wellness_Journey__c w: wjQuery){
            System.debug(w);
        }
        WellnessJourneyRewardsBatch batchable = new WellnessJourneyRewardsBatch();

        Test.setMock(HttpCalloutMock.class, new RewardsCalloutServiceMock());

       // test.startTest();
        id job = Database.executeBatch(batchable);
        //test.stopTest();

        Integer statusCode = RewardsCalloutService.submitUsersForRewardCallout(JSON.serialize(wjQuery));

        system.assertEquals(statusCode, 200, 'error');     
    }
}