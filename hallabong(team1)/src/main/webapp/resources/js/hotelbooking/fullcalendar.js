/**
 * fullcalendar JS
 */


const calendarEl = document.getElementById("calendar"); //캘린더를 넣어줄 html div

let calendar;

calendar_rendering();

function calendar_rendering() {
	 $(function () {
       var request = $.ajax({
                    url: module +"/list.do", // 변경하기
                    method: "GET",
                    dataType: "json"
                });

	
		request.done(function (data) {
	                    console.log(data);
	
	  	calendar = new FullCalendar.Calendar(calendarEl, {
		plugins: [ interactionPlugin, dayGridPlugin ],
	    initialView: "dayGridMonth",
		headerToolbar: {
	         center: 'title',
			locale : 'ko',
	                     },
			selectable : true,
			droppable : true,
			editable : true,
				events: [
		    { 
		      title: 'The Title', // 제목
		      start: '2022-09-01', // 시작일자
		      end: '2022-09-02' // 종료일자
		    }
		  ]

		  });
		
		  calendar.render();
			});//request
			request.fail(function( jqXHR, textStatus ) {
			  alert( "Request failed: " + textStatus );
			});

	});
};