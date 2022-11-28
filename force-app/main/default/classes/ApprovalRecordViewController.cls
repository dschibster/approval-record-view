public class ApprovalRecordViewController {
    
    @AuraEnabled(cacheable = true)
    public static ObjectInfoWrapper getTargetObjectId(Id approvalRequestId){
        ObjectInfoWrapper info = null;
        ProcessInstanceWorkItem currentApproval = [SELECT ProcessInstance.TargetObjectId FROM ProcessInstanceWorkitem WHERE Id = :approvalRequestId];

        if(currentApproval != null){
            Id targetObjectId = currentApproval.ProcessInstance.TargetObjectId;
            String sObjectType = targetObjectId.getSobjectType().getDescribe().getName();
            info = new ObjectInfoWrapper(sobjectType, targetObjectId);
        }
        
        return info;
        
    }

    public class ObjectInfoWrapper{
        @AuraEnabled public String sobjectType;
        @AuraEnabled public Id sobjectId;
        
        public ObjectInfoWrapper(String type, Id recordId){
            this.sobjectId = recordId;
            this.sobjectType = type;
        }
    }
}