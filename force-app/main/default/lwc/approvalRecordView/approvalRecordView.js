import { LightningElement, api } from 'lwc';
import getTargetObjectId from "@salesforce/apex/ApprovalRecordViewController.getTargetObjectId";

export default class ApprovalRecordView extends LightningElement {

    @api recordId;
    @api columns;
    targetObjectId;
    targetObjectType;


    connectedCallback(){
        getTargetObjectId({approvalRequestId : this.recordId})
        .then(result => {
            console.log(result);
            const objectInfo = result;
            this.targetObjectId = objectInfo.sobjectId;
            this.targetObjectType = objectInfo.sobjectType;  
        });
    }

}