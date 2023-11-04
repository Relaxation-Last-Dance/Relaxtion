window.onload = function() {
     // 회원가입 버튼을 눌렀을 때
     document.getElementById("signupButton").addEventListener("click", function() {
         // 모달창 보이기
         document.querySelector(".modal-content").style.display = "block";
 
         // 본문 스크롤 막기
     });
     
     // 닫기 버튼을 눌렀을 때
     document.getElementById("closeButton").addEventListener("click", function() {
         // 모달창 숨기기
         document.querySelector(".modal-content").style.display = "none";
 
         // 본문 스크롤 허용
         document.body.style.overflow = 'auto';
     });
 }



 $('#selectEmail').change(function(){
       $("#selectEmail option:selected").each(function () {
            
            if($(this).val()== '1'){ //직접입력일 경우
                 $("#str_email02").val('');                        //값 초기화
                 $("#str_email02").attr("disabled",false); //활성화
            }else{ //직접입력이 아닐경우
                 $("#str_email02").val($(this).text());      //선택값 입력
                 $("#str_email02").attr("disabled",true); //비활성화
            }
       });
    });

    function closeCheck() {
     document.getElementById('popup').style.display = 'none';
 }
