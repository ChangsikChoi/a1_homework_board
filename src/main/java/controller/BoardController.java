package controller;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.stream.Collectors;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import model.BoardDataBean;

@Controller
public class BoardController {
	
	String path = "c:/temp/";
	int pageNum;
	ModelAndView mv = new ModelAndView();
	
	@ModelAttribute
	public void setAttr(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String sessionId = (String) session.getAttribute("sessionId");
		if(sessionId != null) {
			session.setAttribute("sessionId", sessionId);
		}
        try {
            pageNum = Integer.parseInt(request.getParameter("pageNum"));
        } catch (Exception e) {
            pageNum = 1;
        }
	}
	
	@RequestMapping("/list")
	public ModelAndView boardlist() {
		mv.clear();
		
		Map<Integer, BoardDataBean> map = readFile("board.csf");
		Set<Entry<Integer, BoardDataBean>> set = map.entrySet();
		Iterator<Entry<Integer, BoardDataBean>> it = set.iterator();
		
		List<BoardDataBean> boardList = new ArrayList<BoardDataBean>();
		while(it.hasNext()) {
			Entry<Integer, BoardDataBean> entry = 
					(Entry<Integer, BoardDataBean>) it.next();
			boardList.add((BoardDataBean) entry.getValue());
		}
		
	   Collections.sort(boardList, new Comparator<BoardDataBean>() {
			@Override
			public int compare(BoardDataBean o1, BoardDataBean o2) {
				// TODO Auto-generated method stub
				return o2.getNum()-o1.getNum();
			}
		});
	   
       int pageSize=4;
       int currentPage = pageNum;
       int count = boardList.size();
       int startRow = (currentPage - 1) * pageSize;
       int endRow = currentPage * pageSize;
       if (count<endRow)  endRow=count;
       
	   boardList =  boardList.subList(startRow, endRow);
	   
       int bottomLine = 3;
       int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
       int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
       int endPage = startPage + bottomLine - 1;
       if (endPage > pageCount)  {
    	   	endPage = pageCount;
       }
		mv.addObject("boardList", boardList);
		mv.addObject("totalCount", count);
		mv.addObject("count", count - pageSize*(currentPage-1));
	    mv.addObject("pageNum", pageNum);
        mv.addObject("startPage", startPage);
        mv.addObject("bottomLine", bottomLine);
        mv.addObject("endPage", endPage);
        mv.addObject("pageCount", pageCount);
		mv.setViewName("/board/list");
		return mv;
	}
	
	@RequestMapping("/search")
	public ModelAndView search(String condition, String keyword) {
		mv.clear();
		Comparator<BoardDataBean> comp =
				(b1, b2) -> Integer.compare(b1.getNum(), b2.getNum());
		Map<Integer, BoardDataBean> map = readFile("board.csf");
		List<BoardDataBean> searchList = new ArrayList<BoardDataBean>();
				
		if(condition.equals("nickname")) {
			searchList = map.values().stream()
		 			 .filter( x -> x.getNickname().contains(keyword))
		 			 .sorted(comp.reversed())
		 			 .collect(Collectors.toList());
		}
		else if(condition.equals("title")){
			searchList = map.values().stream()
		 			 .filter( x -> x.getTitle().contains(keyword))
		 			 .sorted(comp.reversed())
		 			 .collect(Collectors.toList());
		}

		mv.addObject("searchList", searchList);
		mv.setViewName("/board/searchResult");
		return mv;
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public ModelAndView writeGet() {
		mv.clear();
		mv.setViewName("/board/writeForm");
		return mv;
	}
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public ModelAndView writePost(BoardDataBean article,
								  HttpServletRequest request) {
		mv.clear();
		int maxNum = 0;
		
		article.setReg_date(new Date());
		Map<Integer, BoardDataBean> map = readFile("board.csf");
		if(map.size() > 0) {
			maxNum = Collections.max(map.keySet());
		}
		article.setNum(maxNum+1);
		System.out.println("입력 : " + article);
		map.put(article.getNum(), article);
		writeFile("board.csf", map);

		HttpSession session = request.getSession();
		session.setAttribute("sessionId", article.getNickname());
		
		mv.setViewName("redirect:list");
		return mv;
	}
	
	@RequestMapping("/readContent")
	public ModelAndView readContent(int num) {
		mv.clear();
		Map<Integer, BoardDataBean> map = readFile("board.csf");
		BoardDataBean article = (BoardDataBean)map.get(num);
		mv.addObject("article", article);
		mv.setViewName("/board/readContent");
		return mv;
	}

	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public ModelAndView updateGet(int num) {
		mv.clear();
		Map<Integer, BoardDataBean> map = readFile("board.csf");
		BoardDataBean article = (BoardDataBean)map.get(num);
		mv.addObject("article", article);
		mv.setViewName("/board/updateForm");
		return mv;
	}
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ModelAndView updatePost(BoardDataBean newArticle) {
		mv.clear();
		Map<Integer, BoardDataBean> map = readFile("board.csf");
		BoardDataBean oldArticle = (BoardDataBean)map.get(newArticle.getNum());
		
		oldArticle.setTitle(newArticle.getTitle());
		oldArticle.setContent(newArticle.getContent());
		oldArticle.setImportant(newArticle.isImportant());
		oldArticle.setReg_date(new Date());
		map.put(newArticle.getNum(), oldArticle);
		
		writeFile("board.csf", map);
		mv.setViewName("redirect:list");
		return mv;
	}
	
	@RequestMapping("/delete")
	public ModelAndView delete(int num) {
		mv.clear();
		Map<Integer, BoardDataBean> map = readFile("board.csf");
		map.remove(num);
		writeFile("board.csf", map);		
		mv.setViewName("redirect:list");
		return mv;
	}
	
	
	public synchronized void writeFile(String filename, Map<Integer, BoardDataBean> map) {

		try {
			FileOutputStream fos = 
					new FileOutputStream(path + filename);
			AppendingObjectOutputStream oos = 
					new AppendingObjectOutputStream(fos);
			oos.writeObject(map);
			oos.flush();
			oos.writeStreamHeader();
			oos.close();
			fos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public Map<Integer, BoardDataBean> readFile(String filename) {
		
		FileInputStream fis;
		AppendingObjectInputStream ois;
		try {
			fis = new FileInputStream(path + filename);
			ois = new AppendingObjectInputStream(fis);
			Map<Integer, BoardDataBean> map = 
					(Map<Integer, BoardDataBean>) ois.readObject();
			ois.close();
			fis.close();
			System.out.println(path + filename + " read됨.");
			return map;
		} catch (Exception e) {
			return new HashMap<Integer, BoardDataBean>();
		}

	}
}

class AppendingObjectOutputStream extends ObjectOutputStream {

	public AppendingObjectOutputStream(OutputStream out) throws IOException {
		super(out);
	}

	@Override
	protected void writeStreamHeader() throws IOException {
		// do not write a header, but reset:
		// this line added after another question
		// showed a problem with the original

		reset();
	}

}

class AppendingObjectInputStream extends ObjectInputStream {

	public AppendingObjectInputStream(InputStream out) throws IOException {
		super(out);
	}

	@Override
	protected void readStreamHeader() throws IOException {
		// do not write a header, but reset:
		// this line added after another question
		// showed a problem with the original

	}

}
