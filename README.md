自分用に作成した Flutter のテンプレです。
flutter version-3.22.3

https://qiita.com/koichi505/items/2ccea646f4e829cb5c77

新しいプロジェクトにこのテンプレートを採用する方法

1. 新規作成した flutterproject の lib と pubspec.yaml をこのリポジトリの lib と pubspec.yaml に置き換える
2. pubspec.yaml の name を flutter_template から新規作成したアプリの名前と同じにする
3. package:flutter_template とある個所をすべて package:'新規作成したアプリの名前'に置換する

Google mobile ad
1.AndroidManifest.xml の meta-data value の ID をコンソールで設定した値に修正
2.info.plist の GADApplicationIdentifier <string> をコンソールで設定した値に修正
3.main.dart の google 広告の初期化項目のコメントアウトを解除
4.env の各広告 ID の値をコンソールで作成した ID に修正
