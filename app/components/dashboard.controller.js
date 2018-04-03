var dashCtrl = function($scope, $log, Validate, Obj, System){
     
    System.setRoute("system/system.php");
    System.call("getTableData").then((response) => {
        $log.info(response.data);
        $scope.data = response.data.info;

        angular.forEach($scope.data, (val, id)=>{
            val.icon = $scope.setIcon(val.operation);
        });
    });

    // Set icon according to its operation
    $scope.setIcon = function(operation){
        var index;
        var iconset = [
            { operation: 'File uploaded',   icon: 'file_upload' },
            { operation: 'File Deleted',    icon: 'delete' },
            { operation: 'Folder Created',  icon: 'create_new_folder' },
            { operation: 'Folder Deleted',  icon: 'delete_forever' },
            { operation: 'Login',           icon: 'lock_open' },
            { operation: 'Read',            icon: 'chrome_reader_mode' },
            { operation: 'Rename',          icon: 'edit' },
        ]; 
        angular.forEach(iconset, function(obj, id){
            if(operation === obj.operation){
                index = id;
                return -1;
            }
        }); 
        return iconset[index]['icon'];
    }
}

dashCtrl.$inject = ['$scope', '$log', 'Validate', 'Obj', 'System'];
angular.module('app').controller('dashCtrl', dashCtrl);
