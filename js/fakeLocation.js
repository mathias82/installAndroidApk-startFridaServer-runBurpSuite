
Java.perform(function() {    

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
