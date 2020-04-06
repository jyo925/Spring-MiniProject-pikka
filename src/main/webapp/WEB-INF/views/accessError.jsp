<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<h2><c:out value="${SPRING_SECURITY_403_EXCEPTION.getMessage()}"></c:out> </h2>
<h2><c:out value="${msg}"></c:out></h2>



2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80
81
82
83
84
85
86
87
88
89
90
91
92
93
94
95
96
97
98
99
100
101
102
103
104
105
106
107
108
109
110
111
112
113
114
115
116
117
118
119
120
121
122
123
124
125
126
127
128
129
130
131
132
133
134
135
136
137
138
139
140
141
142
143
144
145
146
147
148
149
150
151
152
153
154
155
156
157
158
159
160
161
162
163
164
165
166
167
168
169
170
171
172
173
174
175
176
177
178
179
180
181
182
183
184
185
186
187
188
189
190
191
192
193
194
195
196
197
198
199
200
201
202
203
204
205
206
207
208
209
210
211
212
213
214
215
216
217
218
219
220
221
222
223
224
225
226
227
228
229
230
231
232
233
234
235
236
237
238
239
240
241
242
243
244
245
246
247
248
249
250
251
252
253
254
255
256
257
258
259
260
261
262
263
264
265
266
267
268
269
270
271
272
273
274
275
276
277
<!DOCTYPE html>
<html>
  <head>
      <meta charset="utf-8">
     <title>회원가입</title>
<script>
    function changeColor()
    {
        var color = ["#FF0000", "#00FF00", "#0000FF","#000FFF","#00F0FF","#0F00FF","#F000FF"];
        var title = document.getElementById("body");
        var i = 0;
 
        setInterval(function(){
        title.style.color = color[i]; //title의 색상을 바꿈
        i = (i+1) % color.length;
    },50);
    }
    </script>
     <script language="javascript" src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
         <script>
          function Check(){
               var id= RegExp(/^[a-zA-Z0-9]{4,12}$/)
               var pass= RegExp(/^[a-zA-Z0-9]{4,12}$/)
               var named= RegExp(/^[가-힣]+$/)
 
               //아이디 공백 확인
 
               if($("#ID").val() == ""){
                alert("아이디 입력바람");
                    $("#ID").focus();
                    return false;
               }
           
               //아이디 유효성검사
                if(!id.test($("#ID").val())){
                    alert("형식에 맞게 입력해주세요");
                    $("#ID").val("");
                    // idCheck.value = "";
                    $("#ID").focus();
                    return false;
               }
            
            
              //비밀번호 공백 확인
              if($("#pass").val() == ""){
                    alert("패스워드 입력바람");
                    $("#pass").focus();
                    return false;
               }
           
 
               //아이디 비밀번호 같음 확인
                  if($("#ID").val() == $("#pass").val()){
                    alert("아이디와 비밀번호가 같습니다");
                    $("#pass").val("");
                    $("#pass").focus();
                     return false;
               }
           
 
                //비밀번호 유효성검사
                if(!pass.test($("#pass").val())){
                    alert("형식에 맞게 입력해주세요");
                    $("#pass").val("");
                    $("#pass").focus();
                     return false;
               }
          
 
               //비밀번호 확인란 공백 확인
                if($("#passch").val() == ""){
                    alert("패스워드 확인란을 입력해주세요");
                    $("#passch").focus();
                    return false;
               }
           
 
               //이름 공백 검사
               if($("#names").val() == ""){
                    alert("이름을 입력해주세요");
                    $("#names").focus();
                    return false;
               }
 
 
               //이름 유효성 검사
               if(!named.test($("#names").val())){
                    alert("이름형식에 맞게 입력해주세요")
                    $("#names").val("");
                    $("#names").focus();
                    return false;
               }
           
               return true;
          }
 
          function aaa(){
             
               var jumins3 = $("#jumin1").val() + $("#jumin2").val();
               //주민등록번호 생년월일 전달
          
               var fmt = RegExp(/^\d{6}[1234]\d{6}$/)  //포멧 설정
               var buf = new Array(13);
 
          
               //주민번호 유효성 검사
               if (!fmt.test(jumins3)) {
                     alert("주민등록번호 형식에 맞게 입력해주세요");
                     $("#jumin1").focus();
                     return false;
                 }
 
                 //주민번호 존재 검사
                  for (var i = 0; i < buf.length; i++){
                    buf[i] = parseInt(jumins3.charAt(i));
               }
                    var multipliers = [2,3,4,5,6,7,8,9,2,3,4,5];// 밑에 더해주는 12자리 숫자들 
                    var sum = 0;
 
                     for (var i = 0; i < 12; i++){
                         sum += (buf[i] *= multipliers[i]);// 배열끼리12번 돌면서 
                    }
                      if ((11 - (sum % 11)) % 10 != buf[12]) {
                         alert("잘못된 주민등록번호 입니다.");
                         $("#jumin1").focus();
                           return false;
                           }
 
               var birthYear = (jumins3.charAt(6) <= "2") ? "19" : "20";
               birthYear += $("#jumin1").val().substr(0, 2);
               var birthMonth = $("#jumin1").val().substr(2, 2);
               var birthDate = $("#jumin1").val().substr(4, 2);
               var birth = new Date(birthYear, birthMonth, birthDate);
                              
             
                $("#years").val(birthYear);
                $("#months").val(birthMonth);
                $("#dates").val(birthDate);
               
           }
     </script>
  </head>
   <center>
 
 
  <body onload="changeColor()"" id = "body">
      <!-- <meta charset="utf-8"> -->
       <form   onsubmit="return Check()" method="post" action="MAILTO:snoopingh@naver.com" enctype="text/plain" >
     <table name="ta" border="1">
         <tr>
             <td colspan="2" align="center" bgcolor="9cceff"><font size="5"><b>
                 회원 기본 정보</b></font>
             </td>
         </tr>
         <tr>
             <td align="center" bgcolor="cde6ff" ><font size="4"><b>아이디</b></font></td>
             <td><input type="text" AUTOCOMPLETE="off" name = "Id" id="ID" size="20"><B> *4~12자의 영문 대소문자와 숫자로만 입력</B></td>
         </tr>
         <tr>
             <td align="center" bgcolor="cde6ff"><font size="4"><b>비밀번호</b></font></td>
             <td><input type="password" AUTOCOMPLETE="off" name ="password" id="pass"  size="21"><B> *4~12자의 영문 대소문자와 숫자로만 입력</B></td>
         </tr>
         <tr>
             <td align="center" bgcolor="cde6ff"><font size="4"><b>비밀번호확인</b></font></td>
             <td><input type="password" AUTOCOMPLETE="off" name ="passwordCheck" id="passch"  size="21"></td>
         </tr>
         <tr>
             <td align="center" bgcolor="cde6ff"><font size="4"><b>메일주소</b></font></td>
             <td><input type="text" AUTOCOMPLETE="off" name ="Email" id="email" size="40" ><b> 예)id@domain.com</b></td>
         </tr>
         <tr>
             <td align="center" bgcolor="cde6ff"><font size="4"><b>이름</b></font></td>
             <td><input type="text" AUTOCOMPLETE="off" name ="UserName" id="names" size="40" ></td>
         </tr>
         <tr>
             <td colspan="2" align="center" bgcolor="9cceff"><font size="5"><b>개인 신상 정보</b></font></td>
         </tr>
         <tr>
             <td align="center" bgcolor="cde6ff"><font size="4"><b>주민등록번호</b></font></td>
             <td><input type="text" AUTOCOMPLETE="off" name="jumin1" id="jumin1" size="10" maxlength="6"> - <input type="password" name="jumin2" id="jumin2" size="15" maxlength="7" onblur="aaa()"></td>
         </tr>
         <tr>
             <td align="center" bgcolor="cde6ff"><font size="4" ><b>생일</b></font></td>
             <td><input type="text" AUTOCOMPLETE="off" name ="UserBirthYear" id="years" size="4" readonly  disabled><b>년</b>
                 <input type="text" AUTOCOMPLETE="off" name = "UserBirthMonth" id="months" style="width: 20px;" readonly  disabled><b>월</b>    
                 <input type="text" AUTOCOMPLETE="off" name = "UserBirthDate" id="dates" style="width: 20px;"" readonly  disabled><b>일</b>
               </td>
         </tr>
          <tr>
             <td align="center" bgcolor="cde6ff"><font size="4"><b>관심분야</b></font></td>
               <td><input type="checkbox" name ="hobby[]" value="컴퓨터">컴퓨터
                  <input type="checkbox" name ="hobby[]" value="인터넷">인터넷
                  <input type="checkbox" name ="hobby[]" value="여행">여행
                  <input type="checkbox" name ="hobby[]" value="영화감상">영화감상
                  <input type="checkbox" name ="hobby[]" vlaue="음악감상">음악감상</td>
          </tr>
          <tr>
             <td align="center" bgcolor="cde6ff"><font size="4"><b>자기소개</b></font></td>
              <td><textarea name = "Introduce" id="context" cols="80" rows="9"></textarea></td>
          </tr>
          </table>
<!-- <marquee behavior="alternate" scrollamount="300"> --><input type="submit" value="회원 가입">
<input type="reset" value="다시 입력"><!-- </marquee> -->
</form>
  </body>
 
 
 
 </center>
</html>

</body>
</html>