
/****************************************************************************
 * Validate Service
 ********************************************/

var Validate = function(){
    this.isEmpty = function(value){
        return (value === null || value === undefined || value === "")    
    }

    this.isInArray = function(value, array) {
        if(array == undefined)
            return 0;
        return array.indexOf(value) > -1;
    } 
}

angular.module('app').service('Validate', Validate); 
 