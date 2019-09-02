<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <script>
  $( function() {
	$.datepicker.setDefaults($.datepicker.regional['ko']);
    $( "#datepicker" ).datepicker({
        minDate : 0,
        maxDate : '+1y',
        dateFormat : 'yymmdd',
        onClose: function( selectedDate ) {
            $("#datepicker1").datepicker( "option", "minDate", selectedDate );
        }    
    });
    $( "#datepicker1" ).datepicker({
        dateFormat : 'yymmdd'
    }); 
  });
  $( document ).ready( function() {
      $( '.checkAll' ).click( function() {
        $( '.checkAirline' ).prop( 'checked', this.checked );
      } );
    } );
  
	$(document).ready(function(){
		$("#oneWay").click(function() {
			$("#datepicker1").attr('placeholder', "");
				$("#datepicker1").prop('disabled', true);
			});
		$("#towWay").click(function() {
			$("#datepicker1").attr('placeholder', "오는날을 정해주세요");
				$("#datepicker1").prop('disabled', false);
			});
	});
	
	 function checkIt(){
		  var searchForm = eval("document.searchForm");
		  var count = parseInt(searchForm.adt.value) 
		  			+ parseInt(searchForm.chd.value)
		  			+ parseInt(searchForm.inf.value);
		//왕복여부에 따라
		  if(searchForm.nWay.value == "true"){
		  	//날짜선택
		  		if(!searchForm.deptDate.value){
		  	  		alert("떠나실 날짜를 선택하세요.");
		  	  		return false;
		  	  	}
		  	  	if(!searchForm.arrDate.value){
		  	  		alert("돌아오실 날짜를 선택하세요.");
		  	  		return false;
		  	  	}
		  	  if(searchForm.dept.value == searchForm.arr.value){
					alert("출발지와 도착지는 같을 수 없습니다.");
					return false;
				}
		  	}else{
		  		if(!searchForm.deptDate.value){
		  	  		alert("떠나실 날짜를 선택하세요.");
		  	  		return false;
		  	  	}
		  	}
		  if(count > 9){
				alert("한번에 최대 9명까지만 예약 가능합니다." +"\n"
						+"선택하신 인원 수 : 총 "+count+"명");
			  return false;
		  }
		  var chk = 0;
		  for(var i =0; i< searchForm.airlineCode.length; i++){
				if(searchForm.airlineCode[i].checked){
					chk +=1;
				}
			}
			if(chk==0){
				alert("하나 이상의 항공사를 선택해 주세요");
				return false;
			}
	  }
  </script>


<title>룰루날라</title>
<body>
<!-- Header -->
<header class="w3-display-container w3-content" style="max-width:2200px;">
  <img class="w3-image w3-wide" src="${pageContext.request.contextPath}/image/jeju.jpg" width="2200" style="height:500px"> 
  <div class="w3-display-middle" style="width:65%; margin-top:30px">
      <button class="w3-button w3-round-large w3-border-left w3-border-right w3-border-top w3-border-black w3-indigo w3-hover-indigo" 
      style="background-color: rgba( 18, 69, 171, 0.7 );">
      <i class="fa fa-plane w3-margin-right"></i>항공권</button>
    <!-- 예약 폼 -->
    <div class="w3-container w3-padding-16 w3-round-large w3-text-white w3-border w3-border-black" style="background-color: rgba( 18, 69, 171, 0.7 )">
     <form method="post" action="<%=request.getContextPath() %>/main/search" id="searchForm" name="searchForm" onSubmit="return checkIt()">
      <input type="radio" name="nWay" value="false" id="oneWay" style="margin-left:15px;margin-top:10px"> 편도
      <input type="radio" name="nWay" value="true" id="towWay" style="margin-left:30px" checked> 왕복
      <div class="w3-row-padding" style="margin:20px -0px;">
        <div class="w3-third">
        	<div class="w3-half">
         	 <label>출발지</label>
         	 <div class="w3-border w3-white" style="padding-top:8px;padding-bottom:8px;">
		 	 <select class="w3-border-white" name="dept" id="where" style="width:99%">
		      <optgroup label="경인">
		        <option value="GMP">김포(GMP)</option>
		        <option value="ICN">인천(ICN)</option>
		      </optgroup>
		      <optgroup label="충청-강원">
		        <option value="CJJ">청주(CJJ)</option>
		        <option value="WJU">원주(WJU)</option>
		        <option value="YNY">양양(YNY)</option>
		      </optgroup>
		      <optgroup label="경상">
		        <option value="TAE">대구(TAE)</option>
		        <option value="PUS">부산[김해](PUS)</option>
		        <option value="RSU">여수(RSU)</option>
		        <option value="USN">울산(USN)</option>
		        <option value="HIN">진주[사천](HIN)</option>
		        <option value="KPO">포항(KPO)</option>
		      </optgroup>
		      <optgroup label="전라">
		        <option value="KWJ">광주(KWJ)</option>
		        <option value="KUV">군산(KUV)</option>
		        <option value="MWX">무안(MWX)</option>
		      </optgroup>
		      <optgroup label="제주">
		        <option value="CJU">제주(CJU)</option>
		      </optgroup>
		    </select>	
		   </div>
        	</div>
        	<div class="w3-half">
      		 <label>도착지</label>
          	 <div class="w3-border w3-white" style="padding-top:8px;padding-bottom:8px;">
		 	 <select class="w3-border-white" name="arr" id="where" style="width:99%;">
		      <optgroup label="경인">
		        <option value="GMP">김포(GMP)</option>
		        <option value="ICN">인천(ICN)</option>
		      </optgroup>
		      <optgroup label="충청-강원">
		        <option value="CJJ">청주(CJJ)</option>
		        <option value="WJU">원주(WJU)</option>
		        <option value="YNY">양양(YNY)</option>
		      </optgroup>
		      <optgroup label="경상">
		        <option value="TAE">대구(TAE)</option>
		        <option value="PUS">부산[김해](PUS)</option>
		        <option value="USN">울산(USN)</option>
		        <option value="HIN">진주[사천](HIN)</option>
		        <option value="KPO">포항(KPO)</option>
		      </optgroup>
		      <optgroup label="전라">
		        <option value="KWJ">광주(KWJ)</option>
		        <option value="KUV">군산(KUV)</option>
		        <option value="MWX">무안(MWX)</option>
		        <option value="RSU">여수(RSU)</option>
		      </optgroup>
		      <optgroup label="제주">
		        <option value="CJU" selected>제주(CJU)</option>
		      </optgroup>
		    </select>	 
		   </div>
        	</div>
        </div>
        <div class="w3-third" style="padding-left:30px;padding-right:30px">
        	<div class="w3-half">
         	 <label>가는날<i class="fa fa-calendar w3-margin-left"></i></label>
         	 <input class="w3-input w3-border" name="deptDate" type="text" placeholder="가는날을 설정하세요" id="datepicker" >
        	</div>
        	<div class="w3-half">
      		 <label>오는날<i class="fa fa-calendar w3-margin-left"></i></label>
          	 <input class="w3-input w3-border" name="arrDate" type="text" placeholder="오는날을 정해주세요" id="datepicker1">
        	</div>
        </div>
        <label>&nbsp 승객</label>
        <div class="w3-third">
        	<div class="w3-third">
         	 <div class="w3-border w3-white" style="padding-top:8px;padding-bottom:8px;">
          	<select class="w3-border-white" name="adt" id="where" style="width:99%;">
		        <option value="1">성인 1명</option>
		        <option value="2">성인 2명</option>
		        <option value="3">성인 3명</option>
		        <option value="4">성인 4명</option>
		        <option value="5">성인 5명</option>
		        <option value="6">성인 6명</option>
		        <option value="7">성인 7명</option>
		        <option value="8">성인 8명</option>
		        <option value="9">성인 9명</option>
		    </select>
		    </div>
        	</div>
        	<div class="w3-third">
        	 <div class="w3-border w3-white" style="padding-top:8px;padding-bottom:8px;">
          	<select class="w3-border-white" name="chd" id="where" style="width:99%;">
		      <option value="0">소아 0명</option>
		        <option value="1">소아 1명</option>
		        <option value="2">소아 2명</option>
		        <option value="3">소아 3명</option>
		        <option value="4">소아 4명</option>
		        <option value="5">소아 5명</option>
		        <option value="6">소아 6명</option>
		        <option value="7">소아 7명</option>
		        <option value="8">소아 8명</option>
		        <option value="9">소아 9명</option>
		    </select>
		    </div>
        	</div>
        	<div class="w3-third">
        	 <div class="w3-border w3-white" style="padding-top:8px;padding-bottom:8px;">
          	<select class="w3-border-white" name="inf" id="where" style="width:99%;">
		      <option value="0">유아 0명</option>
		        <option value="1">유아 1명</option>
		        <option value="2">유아 2명</option>
		        <option value="3">유아 3명</option>
		        <option value="4">유아 4명</option>
		        <option value="5">유아 5명</option>
		        <option value="6">유아 6명</option>
		        <option value="7">유아 7명</option>
		        <option value="8">유아 8명</option>
		        <option value="9">유아 9명</option>
		    </select>
		    </div>
        	</div>
        </div>
      </div>
      <div style="margin-left:12px;">
	<label>항공사</label>
    <fieldset class=""style="width:43%;background-color:rgba(255,255,255,0.5)">
    <input type="checkbox" class="checkAll" value="KE" style="margin-left:8px;" checked>
    <label for="checkbox-1" class="w3-text-black">모두</label>
    <input type="checkbox" name="airlineCode" class="checkAirline" value="KE" id="checkbox-1" style="margin-left:8px;"checked>
    <label for="checkbox-1"><img src="${pageContext.request.contextPath}/image/KE.png" style="width:30px;"></label>
    <input type="checkbox" name="airlineCode" class="checkAirline" value="OZ" id="checkbox-2" style="margin-left:8px;" checked>
    <label for="checkbox-2"><img src="${pageContext.request.contextPath}/image/OZ.png" style="width:30px;"></label>
    <input type="checkbox" name="airlineCode" class="checkAirline" value="7C" id="checkbox-3" style="margin-left:8px;" checked>
    <label for="checkbox-3"><img src="${pageContext.request.contextPath}/image/7C.png" style="width:30px;"></label>
    <input type="checkbox" name="airlineCode" class="checkAirline" value="LJ" id="checkbox-4" style="margin-left:8px;" checked>
    <label for="checkbox-4"><img src="${pageContext.request.contextPath}/image/LJ.png" style="width:30px;"></label>
    <input type="checkbox" name="airlineCode" class="checkAirline" value="ZE" id="checkbox-5" style="margin-left:8px;" checked>
    <label for="checkbox-5"><img src="${pageContext.request.contextPath}/image/ZE.png" style="width:30px;"></label>
    <input type="checkbox" name="airlineCode" class="checkAirline" value="TW" id="checkbox-6" style="margin-left:8px;" checked>
    <label for="checkbox-6"><img src="${pageContext.request.contextPath}/image/TW.png" style="width:30px;"></label>
    <input type="checkbox" name="airlineCode" class="checkAirline" value="BX" id="checkbox-7" style="margin-left:8px;" checked>
    <label for="checkbox-7"><img class="w3-border" src="${pageContext.request.contextPath}/image/BX.png" style="width:30px;"></label>
  </fieldset>
	</div>      
      <button class="w3-button w3-xlarge w3-blue w3-border w3-border-black w3-round-large w3-right w3-hover-light-blue"
       type="submit" style="margin:15;margin-top:-50px;width:20%">항공권 검색</button>
    </form></div>
  </div>
</header>
<!-- 최근 검색기록 -->
<div class="w3-content w3-center" style="max-width:1200px;margin-top:50px;">
<c:if test="${recordNone.equals('none')}">
	<h4 class="w3-border-bottom w3-border-blue w3-padding-16">최근 검색기록</h4>
	<div class="w3-third w3-sand">&nbsp<br>&nbsp<br>&nbsp</div>
	<div class="w3-third w3-pale-blue">&nbsp<br>검색 기록이 없습니다.<br>&nbsp</div>
	<div class="w3-third w3-light-blue">&nbsp<br>&nbsp<br>&nbsp</div>
</c:if>
<c:if test="${!recordNone.equals('none')}">
  <h4 class="w3-border-bottom w3-border-blue w3-padding-16 w3-center">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp최근 검색기록
  <input class="w3-right w3-button w3-border w3-border-blue" style="font-size: 15px;" type="button" value="기록 삭제" onclick="location.href='${pageContext.request.contextPath}/main/home?deleteCookie=1'" /></h4>
  <form method="post" action="<%=request.getContextPath() %>/main/search" id="searchForm1" name="searchForm1" style="display: inline;">
  <div class="w3-third w3-sand w3-hover-opacity" onClick="document.forms['searchForm1'].submit();">${record1.deptName} - ${record1.arrName} 
  <c:if test="${record1.nWay == false }"> <br>
  ${record1.deptDate.substring(0,4)}.${record1.deptDate.substring(4,6)}.${record1.deptDate.substring(6)} (편도)<br></c:if>
  <c:if test="${record1.nWay == true }"> <br>
  ${record1.deptDate.substring(0,4)}.${record1.deptDate.substring(4,6)}.${record1.deptDate.substring(6)} ~ ${record1.arrDate.substring(0,4)}.${record1.arrDate.substring(4,6)}.${record1.arrDate.substring(6)}<br></c:if>
        성인${record1.adt} 
      <input type="hidden" name="nWay" value="${record1.nWay}">
      <input type="hidden" name="dept" value="${record1.dept }">
      <input type="hidden" name="arr" value="${record1.arr }">
      <input type="hidden" name="deptDate" value="${record1.deptDate }">
      <input type="hidden" name="arrDate" value="${record1.arrDate }">
      <input type="hidden" name="adt" value="${record1.adt }">
      <input type="hidden" name="chd" value="${record1.chd }">
      <input type="hidden" name="inf" value="${record1.inf }">
      <c:forEach var="flightCode" items="${record1.airlineCode}">
      <input type="hidden" name="airlineCode" value="${flightCode}">
      </c:forEach>
  </div>
  </form>
  <c:if test="${record2 != null}">
  <form method="post" action="<%=request.getContextPath() %>/main/search" id="searchForm2" name="searchForm2" style="display: inline;">
      <div class="w3-third w3-pale-blue w3-hover-opacity" onClick="document.forms['searchForm2'].submit();">${record2.deptName} - ${record2.arrName} 
      <c:if test="${record2.nWay == false }"> <br>
      ${record2.deptDate.substring(0,4)}.${record2.deptDate.substring(4,6)}.${record2.deptDate.substring(6)} (편도)<br></c:if>
      <c:if test="${record2.nWay == true }"> <br>
      ${record2.deptDate.substring(0,4)}.${record2.deptDate.substring(4,6)}.${record2.deptDate.substring(6)} ~ ${record2.arrDate.substring(0,4)}.${record2.arrDate.substring(4,6)}.${record2.arrDate.substring(6)}<br></c:if>
         성인${record2.adt} 
      <input type="hidden" name="nWay" value="${record2.nWay}">
      <input type="hidden" name="dept" value="${record2.dept }">
      <input type="hidden" name="arr" value="${record2.arr }">
      <input type="hidden" name="deptDate" value="${record2.deptDate }">
      <input type="hidden" name="arrDate" value="${record2.arrDate }">
      <input type="hidden" name="adt" value="${record2.adt }">
      <input type="hidden" name="chd" value="${record2.chd }">
      <input type="hidden" name="inf" value="${record2.inf }">
      <c:forEach var="flightCode" items="${record2.airlineCode}">
      <input type="hidden" name="airlineCode" value="${flightCode}">
      </c:forEach>
  </div>
  </form>
  </c:if> 
  <c:if test="${record2 == null}">
  <div class="w3-third w3-pale-blue w3-hover-opacity">&nbsp<br> - <br>&nbsp</div></c:if>
  <c:if test="${record3 != null}">
  <form method="post" action="<%=request.getContextPath() %>/main/search" id="searchForm3" name="searchForm3" style="display: inline;">
  <div class="w3-third w3-light-blue w3-hover-opacity" onClick="document.forms['searchForm3'].submit();">${record3.deptName} - ${record3.arrName} 
      <c:if test="${record3.nWay == false }"> <br>
      ${record3.deptDate.substring(0,4)}.${record3.deptDate.substring(4,6)}.${record3.deptDate.substring(6)} (편도)<br></c:if>
      <c:if test="${record3.nWay == true }"> <br>
      ${record3.deptDate.substring(0,4)}.${record3.deptDate.substring(4,6)}.${record3.deptDate.substring(6)} ~ ${record3.arrDate.substring(0,4)}.${record3.arrDate.substring(4,6)}.${record3.arrDate.substring(6)}<br></c:if>
         성인${record3.adt}
      <input type="hidden" name="nWay" value="${record3.nWay}">
      <input type="hidden" name="dept" value="${record3.dept }">
      <input type="hidden" name="arr" value="${record3.arr }">
      <input type="hidden" name="deptDate" value="${record3.deptDate }">
      <input type="hidden" name="arrDate" value="${record3.arrDate }">
      <input type="hidden" name="adt" value="${record3.adt }">
      <input type="hidden" name="chd" value="${record3.chd }">
      <input type="hidden" name="inf" value="${record3.inf }">
      <c:forEach var="flightCode" items="${record3.airlineCode}">
      <input type="hidden" name="airlineCode" value="${flightCode}">
      </c:forEach>
  </div>
  </form>
  </c:if>
  <c:if test="${record3 == null}">
  <div class="w3-third w3-light-blue w3-hover-opacity">&nbsp<br> - <br>&nbsp</div></c:if>
</c:if>
</div>
<!-- 여행지 추천 -->
<div class="w3-container w3-hide-small"style="display:block; width:1232px;margin:0 auto;margin-top:100px">
	<h4 class="w3-border-bottom w3-border-blue w3-padding-16 w3-center">추천 여행지</h4>
	<div class="w3-display-container">
	<div class="w3-flat-belize-hole"style="width:300px;height:300px;position:relative;float:left;margin-right:2px;">
	<div class="w3-display-topleft w3-container " style="margin:30px;">
		<h3 class="w3-text-white">여행하기 좋은 곳</h3>
		<h1 class="w3-text-white w3-bold">Top</h1>
		</div>
		<p class="w3-text-white w3-bold w3-jumbo" style="margin-top:60px;margin-left:120px">5</p>
	</div>
	</div>
	<div class="w3-display-container"style="position:relative;float:left;height:300px">
    <c:set var="goDay" value="<%=new java.util.Date(new java.util.Date().getTime() + 1000 * 60 * 60 * 24 * 7)%>" />
    <c:set var="backDay" value="<%=new java.util.Date(new java.util.Date().getTime() + 1000 * 60 * 60 * 24 * 10)%>" />
    <c:set var="goDate"><fmt:formatDate value="${goDay}" pattern="yyyyMMdd" /></c:set> 
    <c:set var="backDate"><fmt:formatDate value="${backDay}" pattern="yyyyMMdd" /></c:set> 
    <form method="post" action="<%=request.getContextPath() %>/main/search">
      <input type="hidden" name="nWay" value="true">
      <input type="hidden" name="dept" value="GMP">
      <input type="hidden" name="arr" value="CJU">
      <input type="hidden" name="deptDate" value="${goDate}">
      <input type="hidden" name="arrDate" value="${backDate}">
      <input type="hidden" name="adt" value="1">
      <input type="hidden" name="chd" value="0">
      <input type="hidden" name="inf" value="0">
      <input type="hidden" name="airlineCode" value="KE">
      <input type="hidden" name="airlineCode" value="OZ">
      <input type="hidden" name="airlineCode" value="7C">
      <input type="hidden" name="airlineCode" value="LJ">
      <input type="hidden" name="airlineCode" value="ZE">
      <input type="hidden" name="airlineCode" value="TW">
      <input type="hidden" name="airlineCode" value="BX">
	<input type="image" name="submit" value="submit" class="w3-image w3-hover-opacity" src="${pageContext.request.contextPath}/image/jeju01.jpg"></input>
    </form>
	<div class="w3-display-topleft w3-container">
	<h2 class="w3-text-white w3-bold">제주,</h2>
	</div>
	<div class="w3-display-topleft w3-container">
	<h4 class="w3-text-white w3-bold" style="margin-left:80px;margin-top:20px;">성산일출봉</h4>
	</div>
	</div>
	<div class="w3-display-container" style="position:relative;float:right; height:300px; width:300px;">
   <form method="post" action="<%=request.getContextPath() %>/main/search">
      <input type="hidden" name="nWay" value="true">
      <input type="hidden" name="dept" value="GMP">
      <input type="hidden" name="arr" value="YNY">
      <input type="hidden" name="deptDate" value="${goDate}">
      <input type="hidden" name="arrDate" value="${backDate}">
      <input type="hidden" name="adt" value="1">
      <input type="hidden" name="chd" value="0">
      <input type="hidden" name="inf" value="0">
      <input type="hidden" name="airlineCode" value="KE">
      <input type="hidden" name="airlineCode" value="OZ">
      <input type="hidden" name="airlineCode" value="BX">
	<input type="image" name="submit" class="w3-image w3-hover-opacity" src="${pageContext.request.contextPath}/image/yangyang.jpg"></input>
  </form>
	<div class="w3-display-topleft w3-container">
	<h2 class="w3-text-white w3-bold">양양,</h2>
	</div>
	<div class="w3-display-topleft w3-container">
	<h4 class="w3-text-white w3-bold" style="margin-left:80px;margin-top:20px">낙산사</h4>
	</div>
	</div>
	<div class="w3-display-container" style="position:relative;float:left;margin-top:2px;margin-right:2px">
   <form method="post" action="<%=request.getContextPath() %>/main/search">
      <input type="hidden" name="nWay" value="true">
      <input type="hidden" name="dept" value="GMP">
      <input type="hidden" name="arr" value="USN">
      <input type="hidden" name="deptDate" value="${goDate}">
      <input type="hidden" name="arrDate" value="${backDate}">
      <input type="hidden" name="adt" value="1">
      <input type="hidden" name="chd" value="0">
      <input type="hidden" name="inf" value="0">
      <input type="hidden" name="airlineCode" value="KE">
      <input type="hidden" name="airlineCode" value="OZ">
      <input type="hidden" name="airlineCode" value="BX">
	<input type="image" name="submit" value="submit" class="w3-image w3-hover-opacity" src="${pageContext.request.contextPath}/image/ulsan1.jpg"></input>
  </form>
	<div class="w3-display-topright w3-container">
	<h2 class="w3-text-white w3-bold"style="margin-right:75px;">울산,</h2>
	</div>
	<div class="w3-display-topright w3-container">
	<h4 class="w3-text-white w3-bold" style="margin-top:20px">태화강</h4>
	</div>
	</div>
	<div class="w3-display-container" style="position:relative;float:left;margin-top:2px">
     <form method="post" action="<%=request.getContextPath() %>/main/search">
      <input type="hidden" name="nWay" value="true">
      <input type="hidden" name="dept" value="GMP">
      <input type="hidden" name="arr" value="MWX">
      <input type="hidden" name="deptDate" value="${goDate}">
      <input type="hidden" name="arrDate" value="${backDate}">
      <input type="hidden" name="adt" value="1">
      <input type="hidden" name="chd" value="0">
      <input type="hidden" name="inf" value="0">
      <input type="hidden" name="airlineCode" value="KE">
      <input type="hidden" name="airlineCode" value="OZ">
      <input type="hidden" name="airlineCode" value="BX">
	<input type="image" name="submit" value="submit" class="w3-image w3-hover-opacity" src="${pageContext.request.contextPath}/image/mooan.JPG"></input>
  </form>
	<div class="w3-display-topright w3-container">
	<h2 class="w3-text-white w3-bold"style="margin-right:75px;">무안,</h2>
	</div>
	<div class="w3-display-topright w3-container">
	<h4 class="w3-text-white w3-bold" style="margin-top:20px">백련지</h4>
	</div>
	</div>
	<div class="w3-display-container" style="position:relative;float:right;margin-top:2px">
<form method="post" action="<%=request.getContextPath() %>/main/search">
      <input type="hidden" name="nWay" value="true">
      <input type="hidden" name="dept" value="GMP">
      <input type="hidden" name="arr" value="PUS">
      <input type="hidden" name="deptDate" value="${goDate}">
      <input type="hidden" name="arrDate" value="${backDate}">
      <input type="hidden" name="adt" value="1">
      <input type="hidden" name="chd" value="0">
      <input type="hidden" name="inf" value="0">
      <input type="hidden" name="airlineCode" value="KE">
      <input type="hidden" name="airlineCode" value="OZ">
      <input type="hidden" name="airlineCode" value="7C">
      <input type="hidden" name="airlineCode" value="BX">
	<input type="image" name="submit" class="w3-image w3-hover-opacity" src="${pageContext.request.contextPath}/image/busan.jpg"></input>
  </form>
	<div class="w3-display-topright w3-container">
	<h2 class="w3-text-white w3-bold"style="margin-right:95px;">부산,</h2>
	</div>
	<div class="w3-display-topright w3-container">
	<h4 class="w3-text-white w3-bold" style="margin-top:20px">광안대교</h4>
	</div>
	</div>
</div>

<!-- 공지사항 & QnA  -->
<div class="w3-content w3-center" style="max-width:1200px;margin-top:50px;margin-bottom:100px;">
<h4 class="w3-border-bottom w3-border-blue w3-padding-16">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp공지사항 & QnA
<input class="w3-right w3-button w3-border w3-border-blue w3-small" style="font-size: 15px;" type="button" value="더 보기" onclick="location.href='${pageContext.request.contextPath}/board/page?noticePage=1&&qNaPage=1'" /></h4>
<div style="width:700px;margin-right:50px;float:left" >
<table class="w3-table w3-striped" style="table-layout:fixed">
  <tr><th width="120">작성일자</th>
      <th width="500" class="w3-center">글 제목</th>
      <th width="80" class="w3-center">조회수</th>
  </tr>
  <c:forEach var="i" begin="0" end="3">
  <c:if test="${i < notice.size()}">
    <tr>
    <td width="120"><fmt:formatDate value="${notice.get(i).reg_date}" pattern="yyyy-MM-dd"/></td>
    <td width="500" class="w3-center" style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">
    <a href="<%=request.getContextPath()%>/board/read?board_no=1&&article_no=${notice.get(i).article_no}">
    ${notice.get(i).article_name}
    </a></td>
    <td width="80" class="w3-center">${notice.get(i).readcount}</td>
   </tr>
   </c:if>
  </c:forEach>
</table>
</div>
<div style="width:450px;float:left" >
<table class="w3-table w3-striped" style="table-layout:fixed">
  <tr><th width="100px">작성자</th>
      <th width="300px" class="w3-center">글 제목</th>
      <th width="70px" class="w3-center">조회수</th>
  </tr>
  <c:forEach var="i" begin="0" end="3">
  <c:if test="${i < QnA.size()}">
    <tr>
    <td>000000</td>
    <td class="w3-center" style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">
    <a href="<%=request.getContextPath()%>/board/read?board_no=2&&article_no=${QnA.get(i).article_no}">
    ${QnA.get(i).article_name}
    </a></td>
    <td class="w3-center">${QnA.get(i).readcount}</td>
   </tr> 
   </c:if>
  </c:forEach>
</table>
</div>
</div>
<div style="height:100px;width:100px"></div>
</body>