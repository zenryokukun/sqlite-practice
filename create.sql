/*部署テーブル*/
CREATE TABLE DEPARTMENT (
    -- 部署ID: 'D'+ ４桁の数字
    ID text PRIMARY KEY,
    -- 部署名
    NAME text,
    -- 場所
    LOCATION text
);


/*課テーブル*/
CREATE TABLE TEAM (
    -- 課ID: 'T' + 4桁の数字
    ID text PRIMARY KEY,
    -- 課名
    NAME text,
    -- 電話番号
    TEL text,
    -- 所属人数
    WORKERS int,
    -- 所属部署ID
    DEPARTMENT_ID text,

    /*外部キー制約*/
    foreign key(DEPARTMENT_ID) references DEPARTMENT(ID)
);


/*従業員テーブル*/
CREATE TABLE EMPLOYEE (
    -- 従業員ID: 'E' + ４桁の数字
    ID text PRIMARY KEY,
    -- 名前
    FIRST_NAME text,
    -- 苗字
    LAST_NAME text,
    -- 所属課ID
    GROUP_ID text,
    -- 入社直 'YYYY-MM-DD'
    JOINED text,

    /*外部キー制約*/
    foreign key(GROUP_ID) references TEAM(ID)
);


/*出退勤テーブル*/
CREATE TABLE ATTENDANCE (
    -- 日付 'YYYY-MM-DD'
    DATE text,
    -- 従業員ID
    EMP_ID text,
    -- 休暇フラグ 0:出勤、1:休暇
    VACATION int,
    -- 業務開始時刻 'HH:MM'
    START text,
    -- 業務終了時刻 'HH:MM'
    END text,
    -- 働いた時間
    HOURS int,

    /*主キー*/
    PRIMARY KEY(DATE,EMP_ID),
    /*外部キー制約*/
    foreign key(EMP_ID) references EMPLOYEE(ID)
);

/*製品テーブル*/
CREATE TABLE PRODUCT (
    -- 製品ID: 'P' + ４桁の数字
    ID text PRIMARY KEY,
    -- 製品名
    NAME text,
    -- 発売日
    RELEASE text,
    -- 価格
    PRICE int
);

/*売上テーブル*/
CREATE TABLE SALES (
    -- 売った日　‘‘YYYY-MM-DD‘
    DATE text,
    -- 連番
    SEQ int,
    -- 売った従業員
    EMP_ID text,
    -- 売った製品
    PRODUCT_ID text,
    -- 売った個数
    UNIT int,
    -- 売上
    EARNING int,

    /*主キー*/
    PRIMARY KEY(DATE,SEQ),
    /*外部キー制約*/
    foreign key(EMP_ID) references EMPLOYEE(ID),
    foreign key(PRODUCT_ID) references PRODUCT(ID)
);