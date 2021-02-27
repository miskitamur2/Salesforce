import { LightningElement, api, wire } from 'lwc';
import { updateRecord } from 'lightning/uiRecordApi';
import { refreshApex } from '@salesforce/apex';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getOppList from '@salesforce/apex/RelatedOppListController.getOppList';

const actions = [
    { label: '編集', name: 'edit'}
];
const columns = [
    { label: '商談名' , fieldName: 'Name' },
    { label: '完了予定日', fieldName: 'CloseDate', type: 'date' },
    { label: '金額', fieldName: 'Amount', type: 'currency' },
    {
        type: 'action',
        typeAttributes: { 
            rowActions: actions
        },
    },
];

export default class RelatedOppList extends LightningElement {
    @api recordId;
    columns = columns;
    selectRecord;
    error;
    showModal;
    isLoading;

    get modalClass() {
        return 'slds-modal' + (this.showModal ? ' slds-fade-in-open' : '');
    }
    get backDropClass() {
        return 'slds-backdrop' + (this.showModal ? ' slds-backdrop_open' : '');
    }
    get spinnerClass() {
        return this.isLoading ? '' : 'slds-hide';
    }
    constructor() {
        super();
        this.showModal = false;
        this.isLoading = false;
        this.selectRecord = {};
    }
    onOpenModal() {
        this.showModal = true;
    }
    onCloseModal() {
        this.showModal = false;
    }

    @wire(getOppList, {accountId: '$recordId'})
    records;

    handleRowAction(event) {
        let actionName = event.detail.action.name;
        let row = event.detail.row;

        switch (actionName) {
            case 'edit':
                this.editCurrentRecord(row);
                break;
            // メニューが複数ある場合は追加
        }
    }

    editCurrentRecord(row){
        // 選択された行をモーダル表示用に渡す
        this.selectRecord.Id        = row.Id;
        this.selectRecord.Name      = row.Name;
        this.selectRecord.CloseDate = row.CloseDate;
        this.selectRecord.Amount    = row.Amount;
        this.onOpenModal();
    }

    onSave() {
        this.isLoading = true;

        // 入力値からデータ登録用のオブジェクトを作成
        const recordInput = {
            fields: {
                Id        :this.selectRecord.Id,
                Name      :this.template.querySelector("[data-field='name']").value,
                CloseDate :this.template.querySelector("[data-field='closeDate']").value,
                Amount    :this.template.querySelector("[data-field='amount']").value
            }
        };

        // LDS関数でレコード更新
        updateRecord(recordInput)
            .then(result => {
                const evt = new ShowToastEvent({
                      title: '成功',
                      message: '「{0}」を更新しました',
                      variant: 'success',
                      messageData: [result.fields.Name.value]
                });
                this.dispatchEvent(evt);

                // tableのrecordsはワイヤApexなので明示的にリフレッシュ
                refreshApex(this.records);

                this.isLoading = false;
                this.showModal = false;
            })
            .catch(error => {
                this.isLoading = false;
                this.error = error;
            });
    }
}