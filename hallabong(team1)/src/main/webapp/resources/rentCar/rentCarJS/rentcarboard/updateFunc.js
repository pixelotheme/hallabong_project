/**
 * 
 */

//var loginId = "${login.id}";

function checkData(){
	if(!checkEmpty("price", "가격"))return false;
	if(!checkEmpty("modelYears", "연식"))return false;
	if(!checkEmpty("rentAge", "대여가능 나이"))return false;
	if(!checkEmpty("rentExperience", "운전경력"))return false;
	if(!checkEmpty("license", "면허종류"))return false;
	
	return true;
}


	//날짜 js
function inputYMDNumber(obj) {

    // @see DELETE 키버튼이 눌리지 않은 경우에만 실행
    if(event.keyCode != 8) {

        // @see 숫자와 하이픈(-)기호의 값만 존재하는 경우 실행
        if(obj.value.replace(/[0-9 \-]/g, "").length == 0) {

            // @see 하이픈(-)기호를 제거한다.
            let number = obj.value.replace(/[^0-9]/g,"");

            let ymd = "";

            // @see 문자열의 길이에 따라 Year, Month, Day 앞에 하이픈(-)기호를 삽입한다.

            if(number.length < 4) {

                return number;

            }
//              else if(number.length < 6){

//                 ymd += number.substr(0, 4);

//                 ymd += "-";

//                 ymd += number.substr(4);

//             } 
            else {

                ymd += number.substr(0, 4);

                ymd += "-";

                if( number.substr(4, 2) > 12){
					ymd += 12;
                    }
                else{
                ymd += number.substr(4, 2);
                    }
				
//                 ymd += "-";

//                 ymd += number.substr(6);
// 				alert("형식은 yyyy-MM")


            }

            // @see 입력 가능 날짜 제한 기능 - 선택
            // if(ymd.length == 10) {
            //
            //     const birthDay = new Date(number.substr(0,4)+"/"+number.substr(4,2)+"/"+number.substr(6)+" 00:00:00");
            //     const limitDay = new Date("2000/10/04 23:59:59");
            //
            //     if(birthDay > limitDay) {
            //         alert("2000년 10월 04일 이후의 날짜는\n선택할 수 없습니다.");
            //         obj.value = "";
            //         obj.focus();
            //         return false;
            //     }
            // }
            obj.value = ymd;

        } else {

            alert("숫자 이외의 값은 입력하실 수 없습니다.");

            //@see 숫자와 하이픈(-)기호 이외의 모든 값은 삭제한다.

            obj.value = obj.value.replace(/[^0-9 ^\-]/g,"");

            return false;

        }

    } else {

        return false;

    }

}