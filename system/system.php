<?php   
	if(isset($_REQUEST['request'])) {	
		 
		$system = new System(); 
		$toDo = $_REQUEST['request'];
		unset($_REQUEST['request']);

		// Check the action to do according the request that was sent
		switch($toDo){
			case 'getTableData':
				echo $system->getTableData();	
				break;  
		}
	}

	////////////////////////////////////////////////////////////////////////
 
	class System { 
		protected $values = [];

		/**
		 * Load data from database
		 * @return  JSON object to inject into the view.
		 */
		public function getTableData()
		{ 
			// Create connection
			include_once('connection.php');
			$db = new Connection();  
			
			$values['info'] = [];
 
			// Execute query
			$querys = [
				"SELECT * from log_LOGIN",
				"SELECT * from log_READ",
				"SELECT * from log_WRITE",
				"SELECT * from log_MODIFY",
				"SELECT * from log_DELETE"
			];

			foreach($querys as $q){
				$items = $db->select($q);
				$values['error'][] = $db->error();  
				foreach($items as $o){
					unset($o['id']);
					$values['info'][] = $o;			
				}
			}; 
			 
			// Change the line below to your timezone
			date_default_timezone_set('America/Mexico_City');
			$values['datetime'] = date('Y-m-d h:i:s', time());

			return json_encode($values);
		}  
	};
?>