# a1_homework_board
a1플랫폼 기술과제
간단한 게시판 만들기

실행방법  
1. C:\temp 파일을 만듭니다.  
      (게시물 내용이 저장될 파일 위치)  
      게시물을 저장하면 board.csf파일이 생성되고 파일에 게시물 내용이 저장됩니다.
  
2. 서버를 실행한 뒤 url을 입력합니다 (/list)  



설명.  
 1. 게시글을 작성할 때 입력한 닉네임이 세션에 저장되어 다음번 게시믈 작성시 자동 입력됩니다.  
 2. 게시물 작성시 중요도 여부를 체크하면 리스트에서 배경색이 다르게 표현됩니다.  
 3. 게시물에 대해 수정, 삭제, 조회가 가능합니다.  
 4. 게시물 리스트 조회시 페이징 기능이 구현되어 있습니다.  
 5. selectbox에서 검색하고 싶은 카테고리를 정하고 키워드를 입력하여 검색이 가능합니다.  
 6. controller의 위치는   https://github.com/sigissu/a1_homework_board/blob/master/src/main/java/controller/BoardController.java 이고    
    model의 위치는   https://github.com/sigissu/a1_homework_board/blob/master/src/main/java/model/BoardDataBean.java 입니다.  
    view의 위치는   https://github.com/sigissu/a1_homework_board/tree/master/src/main/webapp/view/board 입니다.  
    
    
배운 것들.  
   1. ObjectInputStream의 스트림헤더 설정  
      
      ObjectInputStream생성자가 ObjectOutputStream으로부터 스트림헤더를 받아야함  
      그렇지않으면 블로킹상태로 무한대기  
        
      이미 연결된 클라이언트 서버간 입출력스트림에 새로운 ObjectOutputStream을 연결하면  
      ObjectInputStream.readObject()에서 [invalid type code] 오류 발생  
        
      이미 연결된 입출력 스트림에 새로운 ObjectInputStream을 연결하면  
      ObjectInputStream생성자에서 [invalid stream header]오류 발생  
        
      ->ObjectInputStream 오류 해결 : 스트림을 새로생성하거나 스트림 헤더를 재사용  
        
   2. 직렬화  
     
      직렬화 하기위한 객체는 Serializable를 상속받아야함  
      기본형타입 외의 객체들은 직렬화할때 크기가 천차만별 -> objectIn-OutputStream으로 컨트롤  
  
      클래스 버전번호 =serialVersionUID 클래스 정의가 바뀌면 id도 바뀜  
        
   3. @ModelAttribute  
      @RequestMapping보다 먼저호출됨.  
      view에 생성된 객체가 전달됨.     
        
   4. entrySet(), keySet(), values()  
      entrySet()는 key와 value를 모두 갖는다.      
      
 에러 해결.
      게시물 write시에 객체를 map에 저장할 때 key값을 map.size() + 1 로 했었는데  
      이러면 삭제 후 빈 번호가 생겨서 객체가 저장이 안됨.  
      -> 저장시 key값을 Collections.max(map.keySet());으로 변경함.  
	-> 파일이 아직 생서되기 전에 max값을 가져올 수 없음  
      -> if(map.size() > 0)일때 max값에 1을더해서 해결  
        
      
