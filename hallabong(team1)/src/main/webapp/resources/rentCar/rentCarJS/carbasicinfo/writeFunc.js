/**
 * 
 */
function checkData(){
	if(!checkEmpty("carName", "차이름"))return false;
	if(!checkEmpty("carCapacity", "차량 정원"))return false;
	
	
	return true;
}