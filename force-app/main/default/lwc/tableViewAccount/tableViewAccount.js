import { LightningElement, wire, api } from "lwc";
import getOpportunityList from "@salesforce/apex/TableViewAccountController.getOpportunityList";
const columns = [
  { label: "商談名", fieldName: "Name" },
  { label: "フェーズ", fieldName: "StageName" },
  { label: "完了予定日", fieldName: "CloseDate" },
  { label: "金額", fieldName: "Amount", type: "date" }
];
export default class TableViewAccount extends LightningElement {
    @api recordId;
    columns = columns;
    Opportunity;

  @wire(getOpportunityList, {id:'$recordId'})
  wiredOpportunities({ error, data }) {
    if (data) {
      this.Opportunity = data;
    } else if (error) {
      // エラー処理
    }
  }
}