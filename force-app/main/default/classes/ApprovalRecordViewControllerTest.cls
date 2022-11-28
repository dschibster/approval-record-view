@isTest
public with sharing class ApprovalRecordViewControllerTest {
    /**
     * @description Your mileage may vary here, as the test Setup requires you to create an Object
     * that currently has an Approval Process which you can submit without issue. My suggestion is to create a dummy Approval Process
     * and use that. Otherwise feel free to adjust this test Setup and the Test to your liking.
     * @author Dennis Grzyb
     * @return   return description
     */
    @testSetup
    static void insertData() {
        Account acc = new Account(Name = 'Dennis');
        insert acc;
        Contact con = new Contact(AccountId = acc.Id, FirstName = 'Dennis', LastName = 'Grzyb');
        insert con;
    }

    @isTest
    static void testGetTargetObject() {
        Contact con = [SELECT Id FROM Contact LIMIT 1];

        Approval.ProcessSubmitRequest request = new Approval.ProcessSubmitRequest();
        request.setObjectId(con.Id);
        request.setNextApproverIds(new List<Id>{ UserInfo.getUserId() });
        Approval.process(request);

        ProcessInstanceWorkitem wi = [SELECT Id FROM ProcessInstanceWorkitem LIMIT 1];
        APprovalRecordViewController.getTargetObjectId(wi.Id, false);
    }
    @isTest
    static void testGetTargetObjectWithCustomFieldPath() {
        Contact con = [SELECT Id FROM Contact LIMIT 1];

        Approval.ProcessSubmitRequest request = new Approval.ProcessSubmitRequest();
        request.setObjectId(con.Id);
        request.setNextApproverIds(new List<Id>{ UserInfo.getUserId() });

        Approval.process(request);

        ProcessInstanceWorkitem wi = [SELECT Id FROM ProcessInstanceWorkitem LIMIT 1];
        APprovalRecordViewController.getTargetObjectId(wi.Id, true);
    }
}
