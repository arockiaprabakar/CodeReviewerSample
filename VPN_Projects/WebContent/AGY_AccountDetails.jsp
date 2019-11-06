<%@page language="java" contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%!
// Implement this method to execute some server-side logic.
public JSONObject performLogic(JSONObject state, Map<String, String> additionalParams) throws Exception {
    
        
	JSONObject result = new JSONObject();	 
	
	//Get appSession Object 
    JSONObject appSession = state.getJSONObject("appSession");
  	  
    String loggingCommonFormat = appSession.getString("loggingCommonFormat");
    String custAcctNumber=appSession.getString("custAcctNumber");
    String servAcctNumber=appSession.getString("servAcctNumber");
    JSONObject accountDataObj=appSession.getJSONObject("accountDataObj");
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
    
  	//Log info of the call
  	IvrAppLogger.debug(loggingCommonFormat + "******************************************");
  	IvrAppLogger.debug(loggingCommonFormat + "****** AGY_AccountDetails ******");
   
  	//CXi Members
  	JSONArray CXiArray = state.has("CXI_Obj")?state.getJSONArray("CXI_Obj"):new JSONArray();
  	JSONObject cxi_addflow = new JSONObject();
  	
 	// CXi data
	cxi_addflow.put(appSession.getString("CXI_LABEL_ENTRY_TIME"),additionalParams.get("ENTRY_TIME"));
	cxi_addflow.put(appSession.getString("CXI_LABEL_STATE_TYPE"),appSession.getString("CXI_LABEL_BE"));
  	
  	try{
  		
  		JSONObject returnObj=new JSONObject();	

  		IvrAppLogger.debug(loggingCommonFormat + "Getting customer account and service account ");
  		JSONObject custAcct = AccountData.findCustomerAccount(custAcctNumber,accountDataObj);
  		JSONObject servAcct = AccountData.findServiceAccount(servAcctNumber,accountDataObj);
  		
  		//String caType = custAcct.getString("custAcctTypeCode");
  		//IvrAppLogger.debug(loggingCommonFormat +"caType= "+caType);
  		//String statusCode = custAcct.getString("statusCode");
  		//IvrAppLogger.debug(loggingCommonFormat + "statusCode= "+statusCode);
  		
  		//if(custAcct.has("creditCollectionInfo") ){
	  		//appSession.put("ARBalance",Double.parseDouble(custAcct.getJSONObject("creditCollectionInfo").getString("totalAccountBalance"))*1);
	  		appSession.put("ARBalance",appSession.getString("totalAccountBalance") );
	  		//String	tempdate = custAcct.getJSONObject("creditCollectionInfo").getString("finalCallExpdate");
	  		String	tempdate = appSession.getString("finalCallDueDate");
	  		int tempdateLen=tempdate.length();
	  		
	  		//appSession.put("FCAmount",custAcct.getJSONObject("creditCollectionInfo").getString("finalCallExpAmount"));
	  		appSession.put("FCAmount",appSession.getString("finalCallAmount"));
	  		String FCDate=tempdate.substring(0,3)+tempdate.substring(4,6)+tempdate.substring(tempdateLen-2,tempdateLen);
	  		appSession.put("FCDate",FCDate);
	  		
	  		IvrAppLogger.debug(loggingCommonFormat + "Session ARBalance = "+appSession.getString("ARBalance"));
			IvrAppLogger.debug(loggingCommonFormat + "Session FCAmount = "+appSession.getString("FCAmount"));
			IvrAppLogger.debug(loggingCommonFormat + "Session FCDate = "+appSession.getString("FCDate"));
  		/* }else{
  			appSession.put("ARBalance","");
  			appSession.put("FCAmount","");
  			appSession.put("FCDate","");
  			
  			IvrAppLogger.debug(loggingCommonFormat + "Session ARBalance is null or empty ");
			IvrAppLogger.debug(loggingCommonFormat + "Session FCAmount is null or empty ");
			IvrAppLogger.debug(loggingCommonFormat + "Session FCDate is null or empty ");
  		} */
  		
		String nAllowType = "";
  		String dmId = "";
  		String stateName = "";
		
  		//Phase-II Development
  		servAcctNumber = appSession.getString("servAcctNumber");
  		/* String detailCase = appSession.has("detailCaseNumber") ? appSession.getString("detailCaseNumber") : "0";
  		int detailCaseNumber = Integer.parseInt(detailCase);
  		detailCaseNumber = detailCaseNumber%10;
  		String accountReview = String.valueOf(detailCaseNumber); */
  		
  		//if("0".equals(accountReview)){  //FYI - accountReview = 1 is Pass && accountReview = 0 is Fail
		if(servAcctNumber == null){ 
			
    		dmId = "AGY_NoActiveCA^menu";	
    		stateName = "AGY_NoActiveCA_DM";
			nAllowType = "3";
			
		}else{
			appSession.put("BLTURerun","N");
			nAllowType = "5";  //AGY_Profiles -AGY_TotalBalance
			appSession.put("flowName","AGY_Profiles");
		}
		
	  	
		appSession.put("inputType" ,"digits");
					
		IvrAppLogger.debug(loggingCommonFormat + "dmId : "+dmId);
		
		result.put("nAllowType",nAllowType);	
	    result.put("appSession",appSession);
	    result.put("dmId",dmId);	
	    result.put("stateName",stateName);	
	    result.put("CXI_Obj",CXiArray);
    
	}catch(Exception exc){		
		IvrAppLogger.error(loggingCommonFormat + "Encountered exception in AGY_AccountDetails : " + exc.toString() );
	}
    
  	return result;
};
%>

<%-- GENERATED: DO NOT REMOVE --%> 
<%@page import="ivr.util.backend.*"%>
<%@page import="ivr.util.resource.loggerservice.IvrAppLogger"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONException"%>
<%@page import="java.util.Map"%>
