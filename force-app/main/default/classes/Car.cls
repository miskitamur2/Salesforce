public with sharing class Car{
// フィールド変数
private Integer num;
private Decimal gas;
// コンストラクタ
public Car(){
System.debug('車を1台作りました');
}
// メソッド
public void setNumAndGas(Integer num, Decimal gas){
this.num = num;
this.gas = gas;
}
public void show(){
System.debug('この車のナンバーは' + num + '、ガソリンは' + gas + 'です');
}
}