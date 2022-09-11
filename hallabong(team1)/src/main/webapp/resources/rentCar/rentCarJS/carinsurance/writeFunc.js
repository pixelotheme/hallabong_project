/**
 * 
 */
	//다음 api js 파일로 옮김
function checkData(num){
	if(!checkEmpty("insurancePrice"+num, "보험금"+num))return false;
	if(!checkEmpty("insuranceAge"+num, "보험 가입 대상 나이"))return false;
	if(!checkEmpty("insuranceExperience"+num, "보험 가입 운전경력"))return false;
	if(!checkEmpty("compensation"+num, "보상한도"))return false;
	
	
	return true;
}	
