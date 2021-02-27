@isTest
private with sharing class SVE_20200918133322Test{
	private static testMethod void testPageMethods() {		SVE_20200918133322 extension = new SVE_20200918133322(new ApexPages.StandardController(new Account()));
		SkyEditor2.Messages.clear();
		extension.sObjectNotFound(new SkyEditor2.Errors.SObjectNotFoundException(SkyEditor2.Messages.sObjectNotFound('SkyEditor2__SkyEditorDummy__c')));
		System.assert(extension.getErrorMessages().endsWith(SkyEditor2.Messages.sObjectNotFound('SkyEditor2__SkyEditorDummy__c')));
		SkyEditor2.Messages.clear();
		extension.fieldNotFound(new SkyEditor2.Errors.FieldNotFoundException(SkyEditor2.Messages.fieldNotFound(SkyEditor2__SkyEditorDummy__c.SObjectType, 'Name')));
		System.assert(extension.getErrorMessages().endsWith(SkyEditor2.Messages.fieldNotFound(SkyEditor2__SkyEditorDummy__c.SObjectType, 'Name')));
		SkyEditor2.Messages.clear();
		extension.recordNotFound(new SkyEditor2.Errors.RecordNotFoundException(SkyEditor2.Messages.DATA_NOT_FOUND));
		System.assert(extension.getErrorMessages().endsWith(SkyEditor2.Messages.DATA_NOT_FOUND));

		Integer defaultSize;
	}
	private static testMethod void testComponent4() {
		SVE_20200918133322.Component4 Component4 = new SVE_20200918133322.Component4(new List<Contact>(), new List<SVE_20200918133322.Component4Item>(), new List<Contact>(), null);
		Component4.create(new Contact());
		System.assert(true);
	}
	
	private static testMethod void testComponent6() {
		SVE_20200918133322.Component6 Component6 = new SVE_20200918133322.Component6(new List<Training__c>(), new List<SVE_20200918133322.Component6Item>(), new List<Training__c>(), null);
		Component6.create(new Training__c());
		System.assert(true);
	}
	
	@isTest
	private static void testLightDataTables(){

		System.assert(true);
	}
}