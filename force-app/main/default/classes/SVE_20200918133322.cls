global with sharing class SVE_20200918133322 extends SkyEditor2.SkyEditorPageBaseWithSharing {
	public Account record {get{return (Account)mainRecord;}}
	public Component4 Component4 {get; private set;}
	public Component6 Component6 {get; private set;}
	{
	setApiVersion(42.0);
	}
	public SVE_20200918133322(ApexPages.StandardController controller) {
		super(controller);

		SObjectField f;

		f = Account.fields.Name;
		f = Account.fields.BillingPostalCode;
		f = Account.fields.BillingState;
		f = Account.fields.BillingCity;
		f = Account.fields.BillingStreet;
		f = Account.fields.Phone;
		f = Account.fields.Fax;
		f = Contact.fields.LastName;
		f = Contact.fields.FirstName;
		f = Contact.fields.Department;
		f = Contact.fields.Title;
		f = Contact.fields.Phone;
		f = Contact.fields.Email;
		f = Training__c.fields.KaisaibiStart__c;
		f = Training__c.fields.KaisaibiEnd__c;
		f = Training__c.fields.KaisaiBasho__c;
		f = Training__c.fields.Status__c;
		f = Training__c.fields.TrainingContent__c;

		List<RecordTypeInfo> recordTypes;
		try {
			mainSObjectType = Account.SObjectType;
			setPageReferenceFactory(new PageReferenceFactory());
			sve_ClassName = 'SVE_20200918133322';
			mainQuery = new SkyEditor2.Query('Account');
			mainQuery.addField('Name');
			mainQuery.addField('BillingPostalCode');
			mainQuery.addField('BillingState');
			mainQuery.addField('BillingCity');
			mainQuery.addField('BillingStreet');
			mainQuery.addField('Phone');
			mainQuery.addField('Fax');
			mainQuery.addWhere('Id', mainRecord.Id, SkyEditor2.WhereOperator.Eq)
				.limitRecords(1);
			mode = SkyEditor2.LayoutMode.TempRegistParentAndChild_01; 
			queryMap = new Map<String, SkyEditor2.Query>();
			SkyEditor2.Query query;
			Component4 = new Component4(new List<Contact>(), new List<Component4Item>(), new List<Contact>(), null);
			listItemHolders.put('Component4', Component4);
			query = new SkyEditor2.Query('Contact');
			query.addField('LastName');
			query.addField('FirstName');
			query.addField('Department');
			query.addField('Title');
			query.addField('Phone');
			query.addField('Email');
			query.addWhere('AccountId', mainRecord.Id, SkyEditor2.WhereOperator.Eq);
			relationFields.put('Component4', 'AccountId');
			Component4.queryRelatedEvent = False;
			query.limitRecords(500);
			queryMap.put('Component4', query);
			Component6 = new Component6(new List<Training__c>(), new List<Component6Item>(), new List<Training__c>(), null);
			listItemHolders.put('Component6', Component6);
			query = new SkyEditor2.Query('Training__c');
			query.addField('KaisaibiStart__c');
			query.addField('KaisaibiEnd__c');
			query.addField('KaisaiBasho__c');
			query.addField('Status__c');
			query.addField('TrainingContent__c');
			query.addWhere('Accout__c', mainRecord.Id, SkyEditor2.WhereOperator.Eq);
			relationFields.put('Component6', 'Accout__c');
			Component6.queryRelatedEvent = False;
			query.limitRecords(500);
			queryMap.put('Component6', query);
			registRelatedList('Contacts', 'Component4');
			registRelatedList('kennsyuPtlZ__r', 'Component6');
			p_showHeader = true;
			p_sidebar = true;
			init();
			Component4.extender = this.extender;
			Component6.extender = this.extender;
			if (record.Id == null) {
				saveOldValues();
			}


        } catch (SkyEditor2.Errors.FieldNotFoundException e) { fieldNotFound(e);
        } catch (SkyEditor2.Errors.RecordNotFoundException e) { recordNotFound(e);
        } catch (SkyEditor2.ExtenderException e) { e.setMessagesToPage();
        }
	}

	@TestVisible
		private void sObjectNotFound(SkyEditor2.Errors.SObjectNotFoundException e) {
		SkyEditor2.Messages.addErrorMessage(e.getMessage());
		hidePageBody = true;
	}
	@TestVisible
		private void fieldNotFound(SkyEditor2.Errors.FieldNotFoundException e) {
		SkyEditor2.Messages.addErrorMessage(e.getMessage());
		hidePageBody = true;
	}
	@TestVisible
		private void recordNotFound(SkyEditor2.Errors.RecordNotFoundException e) {
		SkyEditor2.Messages.addErrorMessage(e.getMessage());
		hidePageBody = true;
	}

	global with sharing class Component4Item extends SkyEditor2.ListItem {
		public Contact record{get; private set;}
		@TestVisible
		Component4Item(Component4 holder, Contact record, SkyEditor2.RecordTypeSelector recordTypeSelector) {
			super(holder);
			if (record.Id == null ){
				if (recordTypeSelector != null) {
					recordTypeSelector.applyDefault(record);
				}
			}
			this.record = record;
		}
		global override SObject getRecord() {return record;}
		public void doDeleteItem(){deleteItem();}
	}
	global with sharing  class Component4 extends SkyEditor2.ListItemHolder {
		public List<Component4Item> items{get; private set;}
		@TestVisible
			Component4(List<SObject> records, List<SkyEditor2.ListItem> items, List<SObject> deleteRecords, SkyEditor2.RecordTypeSelector recordTypeSelector) {
			super(records, items, deleteRecords, recordTypeSelector);
			this.items = (List<Component4Item>)items;
		}
		global override SkyEditor2.ListItem create(SObject data) {
			return new Component4Item(this, (Contact)data, recordTypeSelector);
		}
		public void doDeleteSelectedItems(){deleteSelectedItems();}
	}
	global with sharing class Component6Item extends SkyEditor2.ListItem {
		public Training__c record{get; private set;}
		@TestVisible
		Component6Item(Component6 holder, Training__c record, SkyEditor2.RecordTypeSelector recordTypeSelector) {
			super(holder);
			if (record.Id == null ){
				if (recordTypeSelector != null) {
					recordTypeSelector.applyDefault(record);
				}
			}
			this.record = record;
		}
		global override SObject getRecord() {return record;}
		public void doDeleteItem(){deleteItem();}
	}
	global with sharing  class Component6 extends SkyEditor2.ListItemHolder {
		public List<Component6Item> items{get; private set;}
		@TestVisible
			Component6(List<SObject> records, List<SkyEditor2.ListItem> items, List<SObject> deleteRecords, SkyEditor2.RecordTypeSelector recordTypeSelector) {
			super(records, items, deleteRecords, recordTypeSelector);
			this.items = (List<Component6Item>)items;
		}
		global override SkyEditor2.ListItem create(SObject data) {
			return new Component6Item(this, (Training__c)data, recordTypeSelector);
		}
		public void doDeleteSelectedItems(){deleteSelectedItems();}
	}
	with sharing class PageReferenceFactory implements SkyEditor2.PageReferenceFactory.Implementation {
        public PageReference newPageReference(String url) {
            return new PageReference(url);
        }
    }
}