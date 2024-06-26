namespace sap.hana.democontent.epm.data;

using sap.hana.democontent.epm.data.EPM as EPM from './EPM';
using sap.hana.democontent.epm.data.MD as MD from './MD';

context PO {

  entity Header {
    key PURCHASEORDERID : EPM.BusinessKey;
        ITEMS           : Association[ * ] to Item
                            on ITEMS.PURCHASEORDERID = PURCHASEORDERID;
        HISTORY         : MD.HistT;
        NOTEID          : EPM.BusinessKey null;
        PARTNER         : Association to MD.BusinessPartner;
        CURRENCY        : EPM.CurrencyT;
        GROSSAMOUNT     : EPM.AmountT;
        NETAMOUNT       : EPM.AmountT;
        TAXAMOUNT       : EPM.AmountT;
        LIFECYCLESTATUS : EPM.StatusT;
        APPROVALSTATUS  : EPM.StatusT;
        CONFIRMSTATUS   : EPM.StatusT;
        ORDERINGSTATUS  : EPM.StatusT;
        INVOICINGSTATUS : EPM.StatusT;
  };


  entity Item {
    key PURCHASEORDERID   : EPM.BusinessKey;
    key PURCHASEORDERITEM : EPM.BusinessKey;
        HEADER            : Association[1] to Header
                              on HEADER.PURCHASEORDERID = PURCHASEORDERID;
        PRODUCT           : Association to MD.Products;
        NOTEID            : EPM.BusinessKey null;
        CURRENCY          : EPM.CurrencyT;
        GROSSAMOUNT       : EPM.AmountT;
        NETAMOUNT         : EPM.AmountT;
        TAXAMOUNT         : EPM.AmountT;
        QUANTITY          : EPM.QuantityT;
        QUANTITYUNIT      : EPM.UnitT;
        DELIVERYDATE      : EPM.SDate;
  };

  define view HeaderView as
    select from Header {
      PURCHASEORDERID              as ![PurchaseOrderId],
      HISTORY.CREATEDBY.EMPLOYEEID as ![CreatedByEmployeeId],
      HISTORY.CREATEDBY.NAME.FIRST as ![CreatedByFirstName],
      HISTORY.CREATEDBY.NAME.LAST  as ![CreatedByLastName],
      HISTORY.CREATEDBY.LOGINNAME  as ![CreatedByLoginName],
      HISTORY.CREATEDAT            as ![CreatedAt],
      PARTNER.PARTNERID            as ![PartnerId],
      PARTNER.COMPANYNAME          as ![CompanyName],
      CURRENCY                     as ![Currency],
      GROSSAMOUNT                  as ![GrossAmount],
      NETAMOUNT                    as ![NetAmount],
      TAXAMOUNT                    as ![TaxAmount]
    };

  define view ItemView as
    select from Item {
      PURCHASEORDERID   as ![PurchaseOrderItemId],
      PURCHASEORDERITEM as ![ItemPos],
      PRODUCT.PRODUCTID as ![ProductID],
      CURRENCY          as ![CurrencyCode],
      GROSSAMOUNT       as ![Amount],
      NETAMOUNT         as ![NetAmount],
      TAXAMOUNT         as ![TaxAmount],
      QUANTITY          as ![Quantity],
      QUANTITYUNIT      as ![QuantityUnit],
      DELIVERYDATE      as ![DeliveryDate1]
    };

  define view POWorklistView as
    select from Item {
      PURCHASEORDERID                     as ![PurchaseOrderId],
      PURCHASEORDERITEM                   as ![PurchaseOrderItem],
      HEADER.PARTNER.PARTNERID            as ![PartnerId],
      HEADER.PARTNER.COMPANYNAME          as ![CompanyName],
      HEADER.GROSSAMOUNT                  as ![GrossAmount],
      CURRENCY                            as ![Currency],
      HEADER.LIFECYCLESTATUS,
      HEADER.APPROVALSTATUS,
      HEADER.CONFIRMSTATUS,
      HEADER.ORDERINGSTATUS,
      PRODUCT.PRODUCTID                   as ![ProductID],
      PRODUCT.NAMEID,
      PRODUCT.DESCID,
      PRODUCT.PRICE                       as ![ProductPrice],
      PRODUCT.PRODUCTPICURL               as ![ProductURL],
      HEADER.PARTNER.ADDRESSES.CITY       as ![PartnerCity],
      HEADER.PARTNER.ADDRESSES.POSTALCODE as ![PartnerPostalCode],
      GROSSAMOUNT                         as ![GrossAmount_1],
      NETAMOUNT                           as ![NetAmount],
      TAXAMOUNT                           as ![TaxAmount],
      QUANTITY                            as ![Quantity],
      QUANTITYUNIT                        as ![QuantityUnit],
      DELIVERYDATE                        as ![DeliveryDate]
    };
};
