@isTest
private class LeadTriggerTest {
@isTest
static void myUnitTest() {
System.debug('■■テスト準備■■');
List<Lead> newLeads = new List<Lead>();
newLeads.add(new Lead(Company='株式会社テラスカイ', LastName='日本橋',
Website=''));
newLeads.add(new Lead(Company='株式会社', LastName='日本橋'));
System.debug('■■テスト実行■■');
Test.startTest();
// DMLでトリガを呼び出す
Database.SaveResult[] results = Database.insert(newLeads, false);
Test.stopTest();
System.debug('■■テスト検証■■');
// 1件目のFirstNameが変わっている検証
System.debug(results[0]);
System.assert(results[0].isSuccess());
Lead afterSaveLead = [SELECT Website
FROM Lead WHERE Id =:newLeads[0].Id LIMIT 1];
System.assertEquals('https://www.terrasky.co.jp/', afterSaveLead.Website);
// 2件目のエラーになる検証
System.assert(! results[1].isSuccess());
System.assertEquals('その名前は許可されていません',
results[1].getErrors()[0].getMessage());
}
}