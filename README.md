# Practice SQL using SQLite

## これは何ですか？

### 概要

SQLiteを使った練習用DBです。以下のテーブルを作成・データ投入済みです。

- 課テーブル（TEAM）
- 部署テーブル（DEPARTMENT）
- 従業員テーブル（EMPLOYEE）
- 出退勤テーブル（ATTENDANCE）
- 製品テーブル（PRODUCT）
- 売上テーブル（SALES）

※　カッコ内はテーブル名です。

### 本リポジトリのファイルについて

- test.db: 練習用DB
- create.sql: テーブル作成用のSQLファイル
- insert-*テーブル名*.sql: 練習データ投入時のSQLファイル
- problem*.sql: 練習問題の解答SQLファイル

各テーブルの定義については、**create.sql**のコメントに記入していますので、適宜確認してください。

データの追加投入をする際は、**insert-テーブル名.sql**を参考にしてください。


## いつ使いますか？

手っ取り早くSQLを練習したい場合に使ってください。

## 誰のためですか？

SQLが初めての方、非エンジニアの方の利用を想定しています。

## 何故使いますか？

SQLiteはデータをローカルのファイルとして保存する、軽量な関係データベースです。スマホや家電等のデータ保存に広く使われれています。

リモート接続設定などをする必要がないため、気軽に利用できます。そして、OracleやMySQLのような、クライアント・サーバシステムで使われるデータベースと同じ文法※で動作するため、**練習にはもってこい**です。

※製品ごとに固有の機能や、細かい違いはあります。

## どう使いますか？

SQLiteがインストールされ、Path設定まで終わっていることとします。まだの方は[こちらの手順](#install)を参考にしてください。

### 1. test.dbをダウンロード

本リポジトリの**test.db**をダウンロードし、任意のフォルダにコピーしてください。

### 2. 実行したいSQLを準備

実行したいSQL文をテキストファイルに書き出し、上記の1と同じフォルダに保存します。

例：ファイル名は*test-select.sql*とします。

```sql
-- test-select.sql
SELECT * FROM EMPLOYEE;
```

SQL文の最期のセミコロンは必ず必要になります。

### 3. SQLiteでtest.dbを開く

test.dbの保存場所に、コマンドプロンプトでcdします。

```cmd
cd test.dbの保存フォルダ
```

SQLiteでtest.dbを開きます。

```cmd
sqlite3 test.db
```

SQLiteのコマンドラインツールに切り変わります。

### 4. ファイルからSQLを実行する

2で作成したSQLを実行します。

```
sqlite>
.read test-select.sql
```

```.read ファイル名```で、指定したファイルのSQL文が実行されます。

### 5. 終わり

終わったら```.exit```でSQLiteからexitします。

```
sqlite>
.exit
```

## 練習問題

### 問１

EMPLOYEE、DEPARTMENT、TEAMを使って、以下の項目をSELECTしてください。

- 従業員名（EMPLOYEEのFIST_NAMEとLAST_NAME）
- 部署名（DEPARTMENTのNAME列）
- 課名（TEAMのNAME列）

答えは**problem1.sql**。

### 問2

SALES、EMPLOYEE、TEAMSを使って、課別の売上（EARNING）の合計を集計してください。なお集計は以下の課に対して行ってください。

- TEAMSのIDがT0001（Cloud Services課）
- TEAMSのIDがT0002（Network Hardware課）
- TEAMSのIDがT0003（Enterprise Software課）

答えは**problem2.sql**

### 問3

ATTENDANCE、EMPLOYEE、TEAM、DEPARTMENTを使って、日別の休暇取得者数を、部署単位に集計してください。

ATTENDANCEのVACATION列が1の場合、休暇扱いとします。

答えは**problem3.sql**

## 参考

- [SQLite Home Page](https://www.sqlite.org/index.html)

<h2 id="install"> （参考）SQLiteのインストール</h2>

Windowsを前提に記載しています。

### 1. [SQLite Download Page](https://www.sqlite.org/download.html)からダウンロード

Windowsなら、**Precompiled Binaries for Windows**の*sqlite-tools-win32-x86-3420000.zip*をダウンロードしてください。

### 2. zipファイルを解凍し、任意のフォルダに保存

解凍し、*sqldiff.exe*,*sqlite3.exe*,*sqlite3_analyzer.exe*の3つの実行ファイルを任意のフォルダに保存します。

PATH設定をするので、後々保存場所が変わらないようなところに保存してください。私は**C:\sqlite**に保存しています。

### 3. PATHを通す

2で保存したフォルダにPATHを通します。

1. 「Windowsロゴ＋i」 で設定画面を開く
2. 検索ボックスに「環境変数を編集」と入力し、開く
3. 「ユーザ環境変数（U）」の**Path**列をダウブルクリック
4. 「新規（N）」をクリックし、保存先のフォルダをコピペ
5. 「OK」を押していく
