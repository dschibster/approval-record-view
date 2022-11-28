@isTest
public with sharing class ApprovalRecordViewControllerTest {
  /*@testSetup static void insertData() {
        Account acc = createAccount('TestAccount');
        insert acc;

        Account free = createAccount('Kandidaten');
        insert free;

        Contact freeLancer = createFreelancer('WerIstDas', free.Id);
        insert freeLancer;

        Opportunity opp = createOpportunity('TestOpportunity', acc.id);
        opp.StageName = 'unqualifiziert';

        insert opp;
        Date dStart = Date.today().toStartOfMonth();
        Date dEnde = Date.today().addMonths(1).toStartOfMonth().addDays(-1);

        id fblId = [SELECT Id FROM User WHERE Kernteammitglied__c = 'activate-HR' and UserRole.Name = 'Fachbereichsleiter' limit 1].Id;

        Projekt__c project = createProject('TestProject', opp.id, acc.id, 'msPeople', fblId);
        project.Abrechnungsart__c = 'Rechnung';
        project.Projektleiter__c = Userinfo.getUserId();
        insert project;

        Projekt__c p2 = createProject('TestProject', opp.id, acc.id, 'msSolution', fblId);
        p2.Projektleiter__c = Userinfo.getuserId();
        insert p2;



        Projektbesetzung__c pBesetzung = createProjekbesetzung(project.id);
        pBesetzung.Mitarbeiter__c = UserInfo.getUserId();
        pBesetzung.Stundensatz__c = 80;
        insert pBesetzung;

        Kontierungsmonat__c monat = new Kontierungsmonat__c();
        monat.Projektbesetzung__c = pBesetzung.id;

        monat.OwnerId = UserInfo.getUserId();
        monat.Monatsbeginn__c = dStart;
        monat.Monatsende__c = dEnde;
        insert monat;

        Zeiterfassung__c ze = new Zeiterfassung__c(kontierungsmonat__c = monat.Id, Tag__c = Date.today(), Von_Stunde__c = 0, Bis_Stunde__c = 8, Taetigkeitsbeschreibung__c = 'Stuff');
        insert ze;

        Projektbesetzung__c pBesetzung2 = createProjekbesetzung(project.id);
        pBesetzung2.Mitarbeiter__c = UserInfo.getUserId();
        pBesetzung2.Stundensatz__c = 80;
        insert pBesetzung2;


        Projekt__c p3 = createProject('TestProject2', opp.id, acc.id, 'msSolution', fblId);
        p2.Abrechnungsart__c = 'Festpreis';
        p2.GeplanteMarge__c = 20;
        p2.Projektleiter__c = UserInfo.getUserId();
        insert p3;

        Projektbesetzung__c pBesetzung3 = createProjekbesetzung(p3.id);
        pBesetzung3.Mitarbeiter__c = UserInfo.getUserId();
        pBesetzung3.Stundensatz__c = 80;
        insert pBesetzung3;

        Kontierungsmonat__c monat2 = new Kontierungsmonat__c();
        monat2.Projektbesetzung__c = pBesetzung2.id;

        monat2 .OwnerId = UserInfo.getUserId();
        monat2 .Monatsbeginn__c = dStart;
        monat2 .Monatsende__c = dEnde;
        insert monat2;
    }

    @isTest static void testGetTargetObject(){
        Kontierungsmonat__c km = [SELECT Id FROM Kontierungsmonat__c LIMIT 1];


        Approval.ProcessSubmitRequest request = new Approval.ProcessSubmitRequest();
        request.setObjectId(km.Id);
        Approval.process(request);

        ProcessInstanceWorkitem wi = [SELECT Id FROM ProcessInstanceWorkitem LIMIT 1];
        APprovalRecordViewController.getTargetObjectId(wi.Id);
    }

    public static Account createAccount(String name)
    {
        Account acc = new Account();
        acc.name = name;

        return acc;
    }

    public static Opportunity createOpportunity(String name, id accountid)
    {
        Opportunity opp = new Opportunity();
        opp.CloseDate = date.today();
        opp.AccountId = accountid;
        opp.name = name;
        opp.stagename = 'Beauftragt';
        opp.Amount = 15215.00;
        return opp;
    }

    public static Projekt__c createProject(String name, id oppId, id accountid, String sparte, Id fblId)
    {
        Date dStart = Date.today().toStartOfMonth();
        Date dEnde = Date.today().addMonths(1).toStartOfMonth().addDays(-1);

        Projekt__c project = new Projekt__C();
        project.Account__c = accountid;
        project.Opportunity__c = oppId;
        project.Budget__c = 1235.00;
        project.Bezeichnung__c = 'Blub';
        project.Projektstart__c = dStart;
        project.Projektende__c = dEnde;
        project.Projektstatus__c = 'läuft';
        project.Sparte__c = sparte;
        project.Fachbereichsleiter__c = fblId;
        project.Projektleiter__c = UserInfo.getUserId();
        return project;
    }

    public static Projektbesetzung__c createProjekbesetzung(id projectid)
    {
        Projektbesetzung__c pB = new Projektbesetzung__c();
        pB.Projekt__c = projectid;
        pb.Stundensatz__c = 2;
        pb.VK_Stundensatz_Remote__c = 5;
        return pB;
    }

    public static Contact createFreelancer(String Name, id accountId){
        Contact fl = new Contact();
        fl.accountid = accountId;
        fl.LastName = Name;
        fl.Relationship__c = 'R2: Qualifiziert';
        fl.Quality__c = 'Q1: Offen';
        fl.FB_Quelle__c = 'XING';
        fl.email = 'abcd@efghkjklmnopwr.tu';

        return fl;
    }*/
}
