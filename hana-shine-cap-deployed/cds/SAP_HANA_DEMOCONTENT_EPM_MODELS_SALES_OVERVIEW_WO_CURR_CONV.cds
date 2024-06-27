@cds.persistence.exists
@cds.persistence.calcview
entity SAP_HANA_DEMOCONTENT_EPM_MODELS_SALES_OVERVIEW_WO_CURR_CONV {
  key PARTNERID             : String(10)       @title: 'PARTNERID';
      PARTNERROLE           : String(3)        @title: 'PARTNERROLE';
      EMAILADDRESS          : String(255)      @title: 'EMAILADDRESS';
      COMPANYNAME           : String(80)       @title: 'COMPANYNAME';
      LEGALFORM             : String(10)       @title: 'LEGALFORM';
      CITY                  : hana.VARCHAR(40) @title: 'CITY';
      POSTALCODE            : String(10)       @title: 'POSTALCODE';
      BUILDING              : String(10)       @title: 'BUILDING';
      STREET                : String(60)       @title: 'STREET';
      COUNTRY               : String(3)        @title: 'COUNTRY';
      REGION                : String(4)        @title: 'REGION';
  key PRODUCTID             : String(10)       @title: 'PRODUCTID';
      PRODUCT_TYPECODE      : String(2)        @title: 'PRODUCT_TYPECODE';
      PRODUCT_CATEGORY      : hana.VARCHAR(40) @title: 'PRODUCT_CATEGORY';
      PRODUCT_CURRENCY      : String(5)        @title: 'PRODUCT_CURRENCY';
      PRODUCT_WEIGHTUNIT    : String(3)        @title: 'PRODUCT_WEIGHTUNIT';
      PRODUCT_WEIGHTMEASURE : Decimal(13, 3)   @title: 'PRODUCT_WEIGHTMEASURE';
      PRODUCT_PRICE         : Decimal(15, 2)   @title: 'PRODUCT_PRICE';
      PRODUCTPICURL         : String(255)      @title: 'PRODUCTPICURL';
      SUPPLIER_ID           : String(10)       @title: 'SUPPLIER_ID';
      PROD_COMPANYNAME      : String(80)       @title: 'PROD_COMPANYNAME';
      SUPPLIER_CITY         : hana.VARCHAR(40) @title: 'SUPPLIER_CITY';
      SUPPLIER_POSTALCODE   : String(10)       @title: 'SUPPLIER_POSTALCODE';
      SUPPLIER_STREET       : String(60)       @title: 'SUPPLIER_STREET';
      SUPPLIER_BUILDING     : String(10)       @title: 'SUPPLIER_BUILDING';
      SUPPLIER_COUNTRY      : String(3)        @title: 'SUPPLIER_COUNTRY';
      SUPPLIER_REGION       : String(4)        @title: 'SUPPLIER_REGION';
      PRODUCT_NAME          : String(1024)     @title: 'PRODUCT_NAME';
      PRODUCT_DESCRIPTION   : String(1024)     @title: 'PRODUCT_DESCRIPTION';
  key LIFECYCLESTATUS       : String(1)        @title: 'LIFECYCLESTATUS';
  key BILLINGSTATUS         : String(1)        @title: 'BILLINGSTATUS';
  key DELIVERYSTATUS        : String(1)        @title: 'DELIVERYSTATUS';
  key HISTORY_CREATEDBY     : String(10)       @title: 'HISTORY_CREATEDBY';
  key SALESORDERID          : String(10)       @title: 'SALESORDERID';
  key CURRENCY              : String(5)        @title: 'CURRENCY';
  key SALESORDERITEM        : String(10)       @title: 'SALESORDERITEM';
  key QUANTITYUNIT          : String(3)        @title: 'QUANTITYUNIT';
      POSTING_DATE          : Date             @title: 'POSTING_DATE';
      NETAMOUNT             : Decimal(15, 2)   @title: 'NETAMOUNT';
      TAXAMOUNT             : Decimal(15, 2)   @title: 'TAXAMOUNT';
      QUANTITY              : Decimal(13, 3)   @title: 'QUANTITY';
      RM_AMOUNT_NEW         : Decimal(15, 2)   @title: 'RM_AMOUNT_NEW';
      RM_AMOUNT_COMPLETED   : Decimal(15, 2)   @title: 'RM_AMOUNT_COMPLETED';
      RM_AMOUNT_INPROCESS   : Decimal(15, 2)   @title: 'RM_AMOUNT_INPROCESS';
      RM_AMOUNT_PAID        : Decimal(15, 2)   @title: 'RM_AMOUNT_PAID';
      RM_AMOUNT_UNPAID      : Decimal(15, 2)   @title: 'RM_AMOUNT_UNPAID';
      RM_AMOUNT_DELIVERD    : Decimal(15, 2)   @title: 'RM_AMOUNT_DELIVERD';
      RM_AMOUNT_UNDELIVERD  : Decimal(15, 2)   @title: 'RM_AMOUNT_UNDELIVERD';
};
