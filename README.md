# a1_homework_board
a1플랫폼 기술과제
간단한 게시판 만들기

실행방법  
1. c://temp파일을 만듭니다.  
      (게시물 내용이 저장될 파일 위치)  
      게시물을 저장하면 board.csf파일이 생성되고 파일에 게시물 내용이 저장됩니다.
  
2. 서버를 실행한 뒤 url을 입력합니다 (/list)  



설명.  
 1. 게시글을 작성할 때 입력한 닉네임이 세션에 저장되어 다음번 게시믈 작성시 자동 입력됩니다.  
 2. 게시물 작성시 중요도 여부를 체크하면 리스트에서 배경색이 다르게 표현됩니다.  
 3. 게시물에 대해 수정, 삭제, 조회가 가능합니다.  
 4. 게시물 리스트 조회시 페이징 기능이 구현되어 있습니다.  
 5. selectbox에서 검색하고 싶은 카테고리를 정하고 키워드를 입력하여 검색이 가능합니다.  
 6. controller의 위치는 https://github.com/sigissu/a1_homework_board/blob/master/src/main/java/controller/BoardController.java 이고    
    model의 위치는 https://github.com/sigissu/a1_homework_board/blob/master/src/main/java/model/BoardDataBean.java 입니다.  
    view의 위치는 https://github.com/sigissu/a1_homework_board/tree/master/src/main/webapp/view/board 입니다.  
    
