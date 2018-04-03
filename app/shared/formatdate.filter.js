var FormatDate = function($filter) {
    return function(timestamp) {
      	var currentDate = new Date();
		var toFormat = new Date(timestamp);
		  
      	if(toFormat.getDate() == currentDate.getDate() && toFormat.getMonth() == currentDate.getMonth() && toFormat.getFullYear() == currentDate.getFullYear() ) {
	        return 'Hoy ' + $filter('date')(toFormat.getTime(), 'h:mm a', 'UTC/CST');
    	}
      	if(toFormat.getDate() == (currentDate.getDate() - 1) && toFormat.getMonth() == currentDate.getMonth() && toFormat.getFullYear() == currentDate.getFullYear()) {
	        return 'Ayer ' + $filter('date')(toFormat.getTime(), 'h:mm a', 'UTC/CST');
		}
		if(toFormat.getDate() >= (currentDate.getDate() - 5) && toFormat.getMonth() == currentDate.getMonth() && toFormat.getFullYear() == currentDate.getFullYear()) {
	        return $filter('date')(toFormat.getTime(), 'EEEE h:mm a', 'UTC/CST');
    	}

      	return $filter('date')(toFormat.getTime(), 'dd/mm/yyyy h:mm a', 'UTC/CST');
    }
}

angular.module('app').filter('FormatDate', FormatDate);