public class ApprovalRecordViewController {
    @AuraEnabled(cacheable=true)
    public static ObjectInfoWrapper getTargetObjectId(Id approvalRequestId, Boolean customized) {
        ObjectInfoWrapper info = null;
        ProcessInstanceWorkItem currentApproval = [
            SELECT ProcessInstance.ProcessDefinition.DeveloperName, ProcessInstance.TargetObjectId
            FROM ProcessInstanceWorkitem
            WHERE Id = :approvalRequestId
        ];

        if (currentApproval != null) {
            Id targetObjectId = currentApproval.ProcessInstance.TargetObjectId;
            String sObjectType = targetObjectId.getSobjectType().getDescribe().getName();
            if (customized) {
                info = getRelatedObjectId(targetObjectId, sobjectType, currentApproval);
            }
            if (info == null) {
                info = new ObjectInfoWrapper(sObjectType, targetObjectId);
            }
        }

        return info;
    }

    private static ObjectInfoWrapper getRelatedObjectId(
        Id targetObjectId,
        String sobjectType,
        ProcessInstanceWorkItem approval
    ) {
        ApprovalRecordViewId__mdt config = ApprovalRecordViewId__mdt.getInstance(
            approval.ProcessInstance.ProcessDefinition.DeveloperName
        );

        if (config != null) {
            SObject targetObject = Database.query(
                'SELECT Id, ' +
                config.PathToTargetId__c +
                ' FROM ' +
                sobjectType +
                ' WHERE Id = :targetObjectId'
            );
            Id resultObjectId = traverseToObjectId(targetObject, config.PathToTargetId__c);
            String resultObjectType = resultObjectId.getSobjectType().getDescribe().getName();

            return new ObjectInfoWrapper(resultObjectType, resultObjectId);
        } else {
            return null;
        }
    }

    private static Id traverseToObjectId(SObject targetObject, String fieldPath) {
        Object finalValue;
        SObject sobjectRelation = targetObject;
        List<String> relations = fieldPath.split('\\.');
        Integer i = 1;
        try {
            for (String relation : relations) {
                if (i == relations.size()) {
                    finalValue = sobjectRelation.get(relation);
                    break;
                }
                sobjectRelation = sobjectRelation.getSObject(relation);
                i++;
            }
        } catch (Exception ex) {
            System.debug(
                LoggingLevel.ERROR,
                'Premature End of Object reached. Means that this record does not have a value on the relationship/field ' +
                fieldPath
            );
        }
        return (Id) finalValue;
    }

    public class ObjectInfoWrapper {
        @AuraEnabled
        public String sobjectType;
        @AuraEnabled
        public Id sobjectId;

        public ObjectInfoWrapper(String type, Id recordId) {
            this.sobjectId = recordId;
            this.sobjectType = type;
        }
    }
}
