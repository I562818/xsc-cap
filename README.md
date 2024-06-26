# Introduction

1. We use the SAP HANA Application Migration Assistant for migrating XS Classic application to XS Advanced Programming Model or Cloud Application Programming Model.  

2. The SAP HANA Application Migration Assistant converts the source XSC application  to a CAP application with SAP HANA Cloud as a database where the Source XSC Repository  artifacts are converted to the corresponding target CAP artifacts.

# Using SAP HANA Application Migration Assistant to migrate XSC application to CAP Application

## Architecture

### Solution Diagram

<p align="center">
<img src="https://github.wdf.sap.corp/storage/user/131107/files/108b8b5a-2ac4-41fb-be56-bef892f660f5" width="600" height="400">
</p>

## Prerequisites

* SAP Cloud Connector
* SAP BTP account
* SAP Business Application Studio

## Configuration

### Install SAP Cloud Connector

1. Install Cloud Connector to your local system from [Cloud-Connector](https://tools.hana.ondemand.com/#cloud)

2. Refer to the help documentation https://help.sap.com/docs/connectivity/sap-btp-connectivity-cf/installation?locale=en-US 
  	   for the installation and prerequisites for cloud connector setup.  
  
3. Once the cloud connector is installed, open it in the browser on the port setup as https://localhost:<port-no>/ and login with the correct 
	   credentials
	
4. Click on connector in the left menu and add your subaccount which has the source database and also add the subaccount where the bas 
	   subscription is created and add the subaccount details  

<p align="center">
	<img src="https://github.com/I562818/xsc-cap/assets/159874418/6059dc21-0bf9-416d-b372-c8c7f895c7e9" width="600" height="400">
</p>

5. Choose the subaccount where the source db is present and add a service channel under on-prem to cloud with the following details:  
	
   1. Type: HANA Database  
	
   2. HANA Instance Name: <DB/Schema ID>  
	
   3. Local Instance Number: any number from 00 to 09( this is a double digit number which is used to compute the port number to access sap 			instance in hana cloud, local port is derived from local instance no 3<n<15, for eg if no=7, then local port = 30715)  
	
   4. Connections: 1  


<p align="center">
	<img src="https://github.com/I562818/xsc-cap/assets/159874418/519ccdfc-a72d-47d0-bb12-d4a04b6f0195" width="600" height="400">
</p>


6. In the BTP cf account where the BAS subscription is created, choose cloud to on prem and add mapping with the following details:  
	
   1. Back-end Type: SAP Hana  
	
   2. Protocol: TCP  
	
   3. Internal Host: localhost  
	
   4. Internal Port: <portno>(derived from local instance number)  
	
   5. Virtual Host: myvirtualhost  
	
   6. Virtual Port: same as internal port  
	
   7. Principal Type: None  
		
<p align="center">
	<img src="https://github.com/I562818/xsc-cap/assets/159874418/5abe85af-58ed-4b5d-94de-54c1f7890b9a" width="600" height="400">
</p>
	


### Setup BTP Destination
  
1. Go to the BTP cf subaccount and select destination from Connectivity from the left menu pane and create a new destination with the following  	    details: 

   1. Name: <destination name>

   2. Type: HTTP

   3. URL: "https://<internal-host>:<internal-port-no>/" 

   4. ProxyType: on-premise

   5. Authentication: Basic Authentication 

   6. Locationid: Location id as mentioned in cloud connector

   7. User and Password: Hana Db login credentials 

 And the following additional properties: 

   1. HTML5.DynamicDestination : true 

   2. WebIDEEnabled : true 

   3. WebIDEUsage : xs_hdb 
	
<p align="center">
	<img src="https://github.com/I562818/xsc-cap/assets/159874418/1ddbb09a-19e2-47d8-94ab-e62ff4f5d6ed" width="600" height="400">
</p>
	


### BAS Configuration:  
	
1. In the sub-account that the destination is present, create a subscription to SAP Business Application Studio.  
	

2. Open BAS from this subscription and select “Create DevSpace”, give it a name and choose the appropriate application type and then select SAP 	   HANA Application Migration Assistant Extension.  


3. Open the DevSpace and create a new workspace, then select the SAP HANA Application Migration Assistant from the Command Palette (View->Command 	     Palette or (Ctrl+Shift+P).  
	

# SAP HANA Application Migration Assistant

## How to launch Guided Development

	Use Command Palette -> CMD/CTRL + Shift + P
	
	Type command -> SAP HANA Application Migration Assistant
	
1. Select the Migration Path - XSC->XSA or XSC->CAP.  	
	

<p align="center">
  <img width="536" alt="MicrosoftTeams-image (22)" src="https://github.com/I562818/xsc-cap/assets/159874418/f9af13e0-08f5-44f3-ba27-c511f89e675e">
</p>



2. Configure the Data Source:  
	
   Select your Destination from the dropdown.  
	
	

<p align="center">
  <img width="544" alt="MicrosoftTeams-image (23)" src="https://github.com/I562818/xsc-cap/assets/159874418/7a00a7af-f6db-408a-8b36-9a7d2184cc7f">
</p>





   Enter the Hana DB Credentials for the Technical Username and Password fields and click on login to complete the authentication.

	
<p align="center">
<img width="545" alt="MicrosoftTeams-image (24)" src="https://github.com/I562818/xsc-cap/assets/159874418/373cf1ed-b503-47e5-96e9-1f42d7ac1f3d">
</p>




   Click on Next.  
		

<p align="center">
<img src="https://github.wdf.sap.corp/storage/user/128039/files/a3ee9d97-3ee6-48f8-91c0-6ee76f7f8db8" width="300" height="200">
</p>

	
3. Enter the Source Delivery Unit name.  	

<p align="center">
<img src="https://github.wdf.sap.corp/storage/user/128039/files/c50cbf48-2d80-49cd-9a01-c7dac60bfdc6" width="500" height="300">
</p>
	




4. Choose the target directory where the migration results will be stored.  	

<p align="center">
<img src="https://github.wdf.sap.corp/storage/user/128039/files/61026d83-a977-4879-bb0e-bb6abb2efdcf" width="500" height="320">
</p>



5. Enter the Target Folder name for the migration results folder and click on Finish. 

<p align="center">
<img src="https://github.wdf.sap.corp/storage/user/128039/files/431d9a83-7e13-4383-b995-34967a0a4c68" width="550" height="400">
</p>




6. You will now see a pop-up at the bottom right of your window mentioning that the migration has started and all the respective steps there onward. 


<p align="center">
<img src="https://github.wdf.sap.corp/storage/user/128039/files/47e72bfc-a1bf-47a4-baff-67087e3278e0" width="350" height="220">
</p>


# Deployment steps post migration
Note: These steps are relevant for the HCO_DEMOCONTENT delivery unit
### Step 1:

- Under **SAP HANA Projects** section in your dev space, the project's database connection and artifacts will be visible
<p align="center">
<img width="420" alt="img" src="https://github.wdf.sap.corp/storage/user/106842/files/40c7f890-32a0-47a6-8ccb-41c2554fb25d">
</p>

- Please login to your cloud foundry account using the following steps:
  - Open a new terminal in Business Application Studio
  - Enter the command ```cf login -a API_URL``` and enter your username and password
	
- Under **Database Connections**, click ```bind``` and click on ```Bind to an HDI container```. Once this is successfully bound you will see ```.env``` file with the VCAP services is created inside db folder of the project.
- Inside ```.env```, from VCAP services extract the value of ```currentschema```, this is your schema name.
- Click on the open hdi container, then database explorer will be opened 
<p align="center">
<img width="433" alt="img" src="https://github.wdf.sap.corp/storage/user/106842/files/2ccc2453-6d96-4069-b4a2-932da8713f2b">
</p>

- Please open sql console with the DBADMIN user or admin privileges.
- Execute the following query in HANA Cloud to grant access: “9FFEDFB3459645918EEC7CC85078FD28” should be replaced with your schema name
```
GRANT SELECT ON SCHEMA "_SYS_BI" TO "9FFEDFB3459645918EEC7CC85078FD28#OO";

GRANT SELECT ON "_SYS_BI"."M_TIME_DIMENSION" TO "9FFEDFB3459645918EEC7CC85078FD28#OO";

GRANT UPDATE ON "_SYS_BI"."M_TIME_DIMENSION" TO "9FFEDFB3459645918EEC7CC85078FD28#OO" WITH GRANT OPTION;

GRANT INSERT, SELECT, UPDATE ON "_SYS_BI"."M_TIME_DIMENSION" TO "9FFEDFB3459645918EEC7CC85078FD28#OO" WITH GRANT OPTION;

GRANT SELECT ON SCHEMA "_SYS_BI" TO "9FFEDFB3459645918EEC7CC85078FD28#OO" WITH GRANT OPTION;
```
	
### Step 2:
1. Delete uis folder from db/cfg
2. Delete ```synonym-grantor-service.hdbgrants``` and ```synonym-grantor-service.hdbsynonymconfig``` from db/cfg
3. Delete ```synonym-grantor-service.hdbsynonym``` from db/src/uis/db

Reason: UIS is part of another schema so need to migrate before migrating shine DU and use UIS folder, as of now you can remove it. To use the other container objects, please follow the help documentation of hana-cloud and configure them.

	
### Step 3:
We need to change the file ```db/src/synonym-grantor-service.hdbsynonym``` with the following configuration:
```
{
    "SAP_HANA_DEMOCONTENT_EPM_DUMMY": {
        "target": {
        "schema": "SYS",
        "object": "DUMMY"
        }
    },
    "SAP_HANA_DEMOCONTENT_EPM_M_TIME_DIMENSION": {
        "target": {
        "schema": "_SYS_BI",
        "object": "M_TIME_DIMENSION"
        }
    },
    "M_TIME_DIMENSION":{
        "target": {
        "schema": "_SYS_BI",
        "object": "M_TIME_DIMENSION"
        }
    }
}
```
	
Reason: To grant access to the schemas SYS and _SYS_BI, to access the objects we need to add the above configuration in db/src/synonym-grantor-service.hdbsynonym 

### Step 4:
Remove the unused configuration from ```db/src/defaults/default_access_role.hdbrole```: "SAP_HANA_DEMOCONTENT_EPM_MIGRATION_ALL_ANALYTIC_PRIV" 

Reason: We can remove this privilege or add all the privileges into one single privilege. 

### Step 5:
Give the correct name for the entities in the file: ```db/src/models/PURCHASE_COMMON_CURRENCY.hdbcalculationview``` 

On line 181 of the file, replace TCURR with SAP_HANA_DEMOCONTENT_EPM_DATA_CONVERSIONS_TCURR Migrated file is as follows: <currencyConversionTables rates="TCURR" configuration="TCURV" prefactors="TCURF" notations="TCURN" precisions="TCURX"/>

Should be changed as follows: 
```
<currencyConversionTables rates="SAP_HANA_DEMOCONTENT_EPM_DATA_CONVERSIONS_TCURR" configuration="SAP_HANA_DEMOCONTENT_EPM_DATA_CONVERSIONS_TCURV" prefactors="SAP_HANA_DEMOCONTENT_EPM_DATA_CONVERSIONS_TCURF" notations="SAP_HANA_DEMOCONTENT_EPM_DATA_CONVERSIONS_TCURN" precisions="SAP_HANA_DEMOCONTENT_EPM_DATA_CONVERSIONS_TCURX"/>
```
	
### Step 6:
1. Remove the unused configurations from the ```db/src/roles/User.hdbrole``` file 
```
{
    "reference": "_SYS_BIC",
    "privileges": [
        "EXECUTE",
        "SELECT"
    ]
},
{
    "reference": "_SYS_REPO",
    "privileges": [
        "EXECUTE",
        "SELECT"
    ]
},
{
    "reference": "_SYS_RT",
    "privileges": [
        "SELECT"
    ]
}
```
	
Reason: Having granted access by executing the SQL commands in ```Step 1```, we now have the option to either remove the current configuration in hdbrole, or modify the hdbrole file with supported options.

	
### Step 7:
Remove the unused configurations from ```db/src/roles/Admin.hdbrole```
```
{
    "name": "REPOSITORY_REST",
    "type": "PROCEDURE",
    "privileges": 
        [
            "EXECUTE"
        ]
}
```

Reason: Roles are not required for executing procedure in the same container rather we can add authorization based on users in CAP.

	
### Step 8:
In db/src/roles/Admin.hdbrole, replace the existing ```schema_privileges``` and add ```schema_analytic_privileges``` (replace 9FFEDFB3459645918EEC7CC85078FD28 with your schema name)
```
"schema_privileges": [
   {
      "reference": "9FFEDFB3459645918EEC7CC85078FD28",
      "privileges": [
         "SELECT METADATA",
         "SELECT CDS METADATA",
         "SELECT",
         "INSERT",
         "EXECUTE",
         "DELETE",
         "UPDATE",
         "CREATE TEMPORARY TABLE"
      ]
   }
],
"schema_analytic_privileges": [
   {
      "schema_reference": "9FFEDFB3459645918EEC7CC85078FD28",
      "privileges": [
         "SAP_HANA_DEMOCONTENT_EPM_MODELS_AP_SALES_ORDER_6",
         "SAP_HANA_DEMOCONTENT_EPM_MODELS_AP_SALES_ORDER",
         "SAP_HANA_DEMOCONTENT_EPM_MODELS_AP_SALES_ORDER_1",
         "SAP_HANA_DEMOCONTENT_EPM_MODELS_AP_SALES_ORDER_2",
         "SAP_HANA_DEMOCONTENT_EPM_MODELS_AP_SALES_ORDER_4",
         "SAP_HANA_DEMOCONTENT_EPM_MODELS_AP_SALES_ORDER_12",
         "SAP_HANA_DEMOCONTENT_EPM_MODELS_AP_SALES_ORDER_3",
         "SAP_HANA_DEMOCONTENT_EPM_MODELS_AP_SALES_ORDER_9",
         "SAP_HANA_DEMOCONTENT_EPM_MODELS_AP_PURCHASE_ORDER_2",
         "SAP_HANA_DEMOCONTENT_EPM_MODELS_AP_SALES_ORDER_10",
         "SAP_HANA_DEMOCONTENT_EPM_MODELS_AP_PURCHASE_ORDER_PROD_CAT_1",
         "SAP_HANA_DEMOCONTENT_EPM_MODELS_AP_SALES_ORDER_16",
         "SAP_HANA_DEMOCONTENT_EPM_MODELS_AP_PURCHASE_ORDER_3",
         "SAP_HANA_DEMOCONTENT_EPM_MODELS_AP_PURCHASE_ORDER_PROD_CAT_1_1054430",
         "SAP_HANA_DEMOCONTENT_EPM_MODELS_AP_SALES_ORDER_5",
         "SAP_HANA_DEMOCONTENT_EPM_MODELS_AP_PURCHASE_ORDER_1",
         "SAP_HANA_DEMOCONTENT_EPM_MODELS_AP_SALES_ORDER_7",
         "SAP_HANA_DEMOCONTENT_EPM_MODELS_AP_PURCHASE_ORDER_PROD_CAT_2",
         "SAP_HANA_DEMOCONTENT_EPM_MODELS_AP_PURCHASE_ORDER",
         "SAP_HANA_DEMOCONTENT_EPM_MODELS_AP_PURCHASE_ORDER_PROD_CAT",
         "SAP_HANA_DEMOCONTENT_EPM_MODELS_AP_SALES_ORDER_11",
         "SAP_HANA_DEMOCONTENT_EPM_MODELS_AP_SALES_ORDER_13",
         "SAP_HANA_DEMOCONTENT_EPM_MODELS_AP_SALES_ORDER_15",
         "SAP_HANA_DEMOCONTENT_EPM_MODELS_AP_SALES_ORDER_8",
         "SAP_HANA_DEMOCONTENT_EPM_MIGRATION_ALL_PRIV",
         "SAP_HANA_DEMOCONTENT_EPM_MODELS_AP_SALES_ORDER_14"
      ]
   }
],
```
	
Reason: We need the above the modification in the hdbrole file to access calculation views with analytical privileges.

### Step 9:
Create a file named ```Admin.hdbroleconfig``` with the following configuration: (replace 9FFEDFB3459645918EEC7CC85078FD28 with your db schema name) in the path db/src/roles/
```
{
   "SAP_HANA_DEMOCONTENT_EPM_ROLES_ADMIN": {
      "9FFEDFB3459645918EEC7CC85078FD28": {
         "schema": "9FFEDFB3459645918EEC7CC85078FD28"
      }
   }
}
```
	
Reason: Providing the permission to the users with admin role to access the schema
	
### Step 10:
To deploy your application, please select the option ```deploy``` in SAP HANA Projects section
<p align="center">
<img width="435" alt="MicrosoftTeams-image (15)" src="https://github.wdf.sap.corp/storage/user/106842/files/273fb8d5-b76c-4a05-8c66-40cd7f450053">
</p>


# Limitations

1. Creating proxy cds for “.hdbtable”, “.hdbview”, “.hdbcalculationview”

2. Converting xsodata into cap service definition

3. Converting “xsjs”,”xsjslib” into cap nodejs

4. Creating proxy cds for cross container schemas

5. Unsupported datatypes in calculation views ex: the date() function is not supported in SAP HANA Cloud, hence it needs to be converted into daydate()

6. SQL syntax changes in procedure is not integrated ex: UPDATE FROM has to be changed to MERGE INTO, TRUNCATE statement has to be changed to DELETE FROM statement

7. Flowgraph and Replication Artifacts Changes are not supported


## How to Obtain Support

In case you find a bug, or you need additional support, please open an issue here in [GitHub](https://github.wdf.sap.corp/XSA-Migration/xs-migration-bas-extn/issues).

## License

This extension is provided under the terms of the [SAP Developer License Agreement](https://tools.hana.ondemand.com/developer-license-3_2.txt).
