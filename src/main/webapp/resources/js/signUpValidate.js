function Check(){
    var id= RegExp(/^[a-zA-Z0-9]{4,12}$/)
    var pass= RegExp(/^[a-zA-Z0-9]{4,12}$/)
    var named= RegExp(/^[가-힣]+$/)

    //아이디 공백 확인

    if($("#userId").val() == ""){
     alert("아이디 입력바람");
         $("#userId").focus();
         return false;
    }

    //아이디 유효성검사
     if(!id.test($("#userId").val())){
         alert("형식에 맞게 입력해주세요");
         $("#userId").val("");
         // idCheck.value = "";
         $("#userId").focus();
         return false;
    }
 
 
   //비밀번호 공백 확인
   if($("#userPw").val() == ""){
         alert("패스워드 입력바람");
         $("#userPw").focus();
         return false;
    }


    //아이디 비밀번호 같음 확인
       if($("#userId").val() == $("#userPw").val()){
         alert("아이디와 비밀번호가 같습니다");
         $("#userPw").val("");
         $("#userPw").focus();
          return false;
    }


     //비밀번호 유효성검사
     if(!pass.test($("#userPw").val())){
         alert("형식에 맞게 입력해주세요");
         $("#userPw").val("");
         $("#userPw").focus();
          return false;
    }

    //이름 공백 검사
    if($("#userName").val() == ""){
         alert("이름을 입력해주세요");
         $("#userName").focus();
         return false;
    }


    //이름 유효성 검사
    if(!named.test($("#userName").val())){
         alert("이름형식에 맞게 입력해주세요")
         $("#userName").val("");
         $("#userName").focus();
         return false;
    }

    return true;
}



    
