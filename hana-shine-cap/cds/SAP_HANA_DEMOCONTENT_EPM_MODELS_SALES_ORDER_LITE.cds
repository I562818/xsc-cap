@cds.persistence.exists
@cds.persistence.calcview
entity SAP_HANA_DEMOCONTENT_EPM_MODELS_SALES_ORDER_LITE {
  key PRODUCTID             : String(10)       @title: 'PRODUCTID';
      PRODUCT_TYPECODE      : String(2)        @title: 'PRODUCT_TYPECODE';
      PRODUCT_CATEGORY      : hana.VARCHAR(40) @title: 'PRODUCT_CATEGORY';
      PRODUCT_CURRENCY      : String(5)        @title: 'PRODUCT_CURRENCY';
      PRODUCT_WEIGHTUNIT    : String(3)        @title: 'PRODUCT_WEIGHTUNIT';
      PRODUCT_WEIGHTMEASURE : Decimal(13, 3)   @title: 'PRODUCT_WEIGHTMEASURE';
      PRODUCT_PRICE         : Decimal(15, 2)   @title: 'PRODUCT_PRICE';
      PRODUCTPICURL         : String(255)      @title: 'PRODUCTPICURL';
      SUPPLIER_ID           : String(10)       @title: 'SUPPLIER_ID';
      COMPANYNAME           : String(80)       @title: 'COMPANYNAME';
      SUPPLIER_CITY         : hana.VARCHAR(40) @title: 'SUPPLIER_CITY';
      SUPPLIER_POSTALCODE   : String(10)       @title: 'SUPPLIER_POSTALCODE';
      SUPPLIER_STREET       : String(60)       @title: 'SUPPLIER_STREET';
      SUPPLIER_BUILDING     : String(10)       @title: 'SUPPLIER_BUILDING';
      SUPPLIER_COUNTRY      : String(3)        @title: 'SUPPLIER_COUNTRY';
      SUPPLIER_REGION       : String(4)        @title: 'SUPPLIER_REGION';
      PRODUCT_NAME          : String(1024)     @title: 'PRODUCT_NAME';
      PRODUCT_DESCRIPTION   : String(1024)     @title: 'PRODUCT_DESCRIPTION';
  key PARTNERID             : String(10)       @title: 'PARTNERID';
      PARTNERROLE           : String(3)        @title: 'PARTNERROLE';
      EMAILADDRESS          : String(255)      @title: 'EMAILADDRESS';
      BUYER_COMPANYNAME     : String(80)       @title: 'BUYER_COMPANYNAME';
      LEGALFORM             : String(10)       @title: 'LEGALFORM';
      CITY                  : hana.VARCHAR(40) @title: 'CITY';
      POSTALCODE            : String(10)       @title: 'POSTALCODE';
      BUILDING              : String(10)       @title: 'BUILDING';
      STREET                : String(60)       @title: 'STREET';
      COUNTRY               : String(3)        @title: 'COUNTRY';
      REGION                : String(4)        @title: 'REGION';
  key DATETIMESTAMP         : Timestamp        @title: 'DATETIMESTAMP';
      DATE_SQL              : Date             @title: 'DATE_SQL';
      DATETIME_SAP          : hana.VARCHAR(14) @title: 'DATETIME_SAP';
      DATE_SAP              : hana.VARCHAR(8)  @title: 'DATE_SAP';
      YEAR                  : hana.VARCHAR(4)  @title: 'YEAR';
      QUARTER               : hana.VARCHAR(2)  @title: 'QUARTER';
      MONTH                 : hana.VARCHAR(2)  @title: 'MONTH';
      WEEK                  : hana.VARCHAR(2)  @title: 'WEEK';
      WEEK_YEAR             : hana.VARCHAR(4)  @title: 'WEEK_YEAR';
      DAY_OF_WEEK           : hana.VARCHAR(2)  @title: 'DAY_OF_WEEK';
      DAY                   : hana.VARCHAR(2)  @title: 'DAY';
      HOUR                  : hana.VARCHAR(2)  @title: 'HOUR';
      MINUTE                : hana.VARCHAR(2)  @title: 'MINUTE';
      SECOND                : hana.VARCHAR(2)  @title: 'SECOND';
      CALQUARTER            : hana.VARCHAR(5)  @title: 'CALQUARTER';
      CALMONTH              : hana.VARCHAR(6)  @title: 'CALMONTH';
      CALWEEK               : hana.VARCHAR(6)  @title: 'CALWEEK';
      YEAR_INT              : Integer          @title: 'YEAR_INT';
      QUARTER_INT           : hana.TINYINT     @title: 'QUARTER_INT';
      MONTH_INT             : hana.TINYINT     @title: 'MONTH_INT';
      WEEK_INT              : hana.TINYINT     @title: 'WEEK_INT';
      WEEK_YEAR_INT         : Integer          @title: 'WEEK_YEAR_INT';
      DAY_OF_WEEK_INT       : hana.TINYINT     @title: 'DAY_OF_WEEK_INT';
      DAY_INT               : hana.TINYINT     @title: 'DAY_INT';
  key SALESORDERID          : String(10)       @title: 'SALESORDERID';
  key SALESORDERITEM        : String(10)       @title: 'SALESORDERITEM';
      NETAMOUNT             : Decimal(15, 2)   @title: 'NETAMOUNT';
};
