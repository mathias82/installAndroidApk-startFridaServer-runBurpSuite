
Java.perform(function() {    

    var telephonyManager = Java.use('android.telephony.TelephonyManager');

    telephonyManager.getLine1Number.overload().implementation = function(){
      //var ret = "+351963963963";
      var ret = "+33757130733";

        console.log('[!][!][!][!][!][!][!][!][!][!][!][!][!][!][!][!] A call to android.telephony.TelephonyManager.getLine1Number detected');
        return ret;
    }
    

	//USA
	//const simulated_latitude = 34.50217; 
	//const simulated_longitude = ‑96.95573;
	//Brazil
	//const simulated_latitude = -15.793889; const simulated_longitude = -47.882778;
	//Norway
	//const simulated_latitude = 59.911491; const simulated_longitude = 10.757933;
	//India
	//const simulated_latitude = 12.971599; const simulated_longitude = 77.594566;
	//Indonesia
	//const simulated_latitude = -7.005145; const simulated_longitude = 110.438125;
	//Batman turkia
	//const simulated_latitude = 37.889011; const simulated_longitude = 41.125728;
	//ukrain
	//const simulated_latitude = 50.399842; const simulated_longitude = 30.512107;
	//Serbia, Yugoslavia
	//const simulated_latitude = 44.802264; const simulated_longitude = 20.465899;
	//Slovenia
	//const simulated_latitude = 46.025962; const simulated_longitude = 14.526009;
	//Paris
	//const simulated_latitude = 48.844601; const simulated_longitude = 2.319567;
	//Peru
	const simulated_latitude = -12.0266034; const simulated_longitude = -77.1278622;

  const Location = Java.use('android.location.Location')
        
	var location = Location.$new("gps")
	location.setLatitude(simulated_latitude)
	location.setLongitude(simulated_longitude)

	Location.getLatitude.implementation = function(){
		console.log("Old latitude : " + this.getLatitude() + ", New Latitude : " + simulated_latitude)
		return simulated_latitude
	}


	Location.getLongitude.implementation = function(){
		console.log("Old longitude : " + this.getLongitude() + ", New Longitude : " + simulated_longitude)
		return simulated_longitude
	}

	// Not sure if needed, bypass fake location check
	Location.isFromMockProvider.implementation = function(){
		console.log("Location.isFromMockProvider -> false")
		return false
	}

});