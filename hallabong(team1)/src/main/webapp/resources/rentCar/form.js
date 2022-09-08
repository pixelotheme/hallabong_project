/**
 * form 태그에 관련된 js 함수
 */
 //아이디를 객체로 받아내ㅡㄴㄴ 메서드
 function toObject(id){
	return  document.getElementById(id)	
}

//필수항목 체크 메서드
//if(!checkEmpty("title", "제목")){return false;}
function checkEmpty(id, item){
	alert("form"+ id)
	var str = toObject(id).value;
	str = str.trim();
	toObject(id).value = str;
	if(!str){
		alert(item + "을(를) 입력하셔야 합니다.")
		toObject(id).focus();
		return false;
	}
	return true;
}

//항목 패턴 체크 메서드
//if(!checkReg("title", "제목", reg.title, reg_title_msg)){return false;}
function checkReg(id, item, regEx, msg){
	if(!regEx.test(toObject(id).value)){
		alert(item + "패턴에 맞지않는다.\n"+msg+"(으)로 작성하셔야 합니다.");
		toObject(id).focus();
		return false;
	}
	return true;
	
}