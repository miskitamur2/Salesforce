public with sharing class SampleAccountEditController {
    public Account acc {get; set;}
    public SampleAccountEditController(){
    System.debug('■コンストラクタ起動');
    }
    // 初期処理メソッド
    public PageReference doInit(){
    System.debug('■doInitメソッド起動');
    // URLのクエリ文字列を取得
    Map<String, String> params = ApexPages.CurrentPage().getParameters();
    // クエリ文字列からidを取り出し、クエリの条件とする
    Id accId = (Id)params.get('id');
    if(String.isNotBlank(accId)){
    acc = [SELECT Id, Name, Phone, Type,(SELECT Id, Name, Amount, StageName FROM Opportunities)
    FROM Account WHERE Id=:accId LIMIT 1];
    }
    // 画面を更新する
    return null;
    }
    // カスタムの保存メソッド
public PageReference doCustomSave(){
    System.debug('■doCustomSaveメソッド起動');
    // 更新DML
    update acc;
    update acc.Opportunities;
    // 標準UIの詳細画面に戻る
    PageReference retPage = new PageReference('/'+acc.Id);
    return retPage;
    }
    }