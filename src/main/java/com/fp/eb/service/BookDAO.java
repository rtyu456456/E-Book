package com.fp.eb.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.eb.mapper.BookMapper;
import com.fp.eb.model.BookDTO;

@Service
public class BookDAO {
	
	@Autowired
	private BookMapper bMapper;

	public void getBookData(BookDTO bDTO, HttpServletRequest req) {

		// 데이터를 다운로드 받는 부분
		String json = null;
		try {
			// 검색할 도서이름 입력
			String book = bDTO.getB_title();

			// book을 한글로 입력할 수 도 있으므로 인코딩
			book = URLEncoder.encode(book, "utf-8");
			JSONParser jp = new JSONParser();
			// 다운로드 받을 URL생성
			URL url = new URL(
					"https://dapi.kakao.com/v3/search/book?size=50&sort=latest&target=title&query=" + book);
			// 연결 객체 생성
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			// 옵션 설정
			con.setConnectTimeout(20000);
			con.setUseCaches(false);
			// 헤더 설정 (rest api 키)
			con.addRequestProperty("Authorization", "KakaoAK 90df0af6692a4a239023055150c78f1d");

			BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
			StringBuilder sb = new StringBuilder();
			while (true) {
				String line = br.readLine();
				if (line == null) {
					break;
				}
				sb.append(line + "\n");
			}
			json = sb.toString();

			br.close();
			con.disconnect();

			// System.out.println(json);

		} catch (Exception e) {
			System.out.println("다운로드 예외:" + e.getMessage());
			e.printStackTrace();
		}

		// 데이터를 파싱하는 부분
		if (json == null) {
			System.out.println("읽어온 데이터가 없습니다.");
		} else {
			// 전체 문자열을 JSON 객체로 변환
			JSONParser parser = new JSONParser();
			try {
				JSONObject root = (JSONObject) parser.parse(json);
				// System.out.println(root);

				// documents 키의 내용을 JSONArray로 가져오기
				JSONArray documents = (JSONArray) root.get("documents");

				ArrayList<BookDTO> books = new ArrayList<BookDTO>();

				// 배열의 데이터 개수 찾아오기
				int len = documents.size();
				for (int i = 0; i < len; i = i + 1) {
					JSONObject document = (JSONObject) documents.get(i);

//	                    System.out.println(document);
					try {
						BookDTO book = new BookDTO();
						book.setB_title((String) document.get("title"));
						book.setB_price(Integer.parseInt(document.get("price").toString()));
						book.setB_url((String) document.get("url"));
						
						String isbn = document.get("isbn").toString();

						if (isbn.length() == 10) {
							if (Integer.parseInt(isbn.substring(0, 2)) == 89) {
								book.setB_isbn((String) document.get("isbn"));
							} else {
								continue;
							}
						} else if (isbn.length() == 13) {
							if (Integer.parseInt(isbn.substring(3, 5)) == 89) {
								book.setB_isbn((String) document.get("isbn"));
							} else {
								continue;
							}
						} else {
							if (Integer.parseInt(isbn.substring(11, 14)) == 978
									|| Integer.parseInt(isbn.substring(11, 14)) == 979) {
								book.setB_isbn((String) document.get("isbn"));
							} else {
								continue;
							}
						}
						String contents = (String) document.get("contents");
						
						book.setB_contents(contents.replace(". ", ".<br>"));
						book.setB_publisher((String) document.get("publisher"));
						book.setB_thumbnail((String) document.get("thumbnail"));

						JSONArray authors = (JSONArray) document.get("authors");
						String author = "";
						
						for (int j = 0; j < authors.size(); j++) {
							if(j != authors.size() - 1) {
								author += authors.get(j) + ", ";
							} else {
								author += authors.get(j);
							}
						}
						
						book.setB_authors(author);
						String url = (String) document.get("url");
						book.setB_url(URLDecoder.decode(url, "utf-8"));
						// 인코딩은 문자열을 메모리에 저장되는 코드로 변환하는 것이고
						// 디코딩은 메모리에 저장된 코드를 원래의 문자열로 복원하는 것입니다.

						books.add(book);
					} catch (Exception e) {
					}
				}

				req.setAttribute("books", books);
				System.out.println(books);
				System.out.println("담기성공");
			} catch (Exception e) {
				System.out.println("파싱 예외:" + e.getMessage());
				e.printStackTrace();
			}
		}
	}

	public void showDetail(BookDTO bDTO, HttpServletRequest req) {
		String url = bDTO.getB_url();
		System.out.println(url);

		try {
			// Jsoup로 크롤링한 페이지 전체 
			
			Document doc = Jsoup.connect(url).get();
			
			// 페이지 크롤링해서 담기
			
			Element page = doc.select(".cont").get(2);
			
			String[] pages = page.text().toString().split(" | ");
			
			bDTO.setB_page(Integer.parseInt(pages[0]));
			
			System.out.println(bDTO.getB_page());
			
			// 책 줄거리가 없을 경우 처리
			
			if (bDTO.getB_contents().equals("")) {
				bDTO.setB_contents("책 줄거리가 없습니다.");
			}
			
			// 책 줄거리가 중간에 끊겨서 . ? ! " > 등으로 나오지 않았을 때 
			
			String lastContents = bDTO.getB_contents().substring(bDTO.getB_contents().length() - 1);
			
			if (!lastContents.equals(".") && !lastContents.equals("!") && !lastContents.equals("?") && !lastContents.equals("\"") && !lastContents.equals(">")) {
				String ellipsis = "...";
				bDTO.setB_contents(bDTO.getB_contents() + ellipsis);
			}
			
			// 책 설명 크롤링해서 담기 (성인인증 못피해서 폐기)
			
			/*
			 * Element desc = doc.select(".desc").get(0);
			 * 
			 * bDTO.setB_contents(desc.html());
			 * 
			 * System.out.println(bDTO.getB_contents());
			 */
			
			// 띄어쓰기 + ,(", ㄴ") 로 구분한 authors !로 구분해서 다시 넣어주기
			
			String authors = bDTO.getB_authors().replace(", ", "!");
			
			bDTO.setB_authors(authors);
			
			// ISBN으로 검사 뒤 있으면 그 정보 꺼내오기, 없으면 등록
			
			if(bMapper.getBookByISBN(bDTO) == null) {
				
				if (bMapper.regBook(bDTO) == 1) {
					System.out.println("등록성공");
				} else {
					System.out.println("등록실패");
				}
			}
			
			req.setAttribute("book", bMapper.getBookByISBN(bDTO));

			System.out.println("여기까지 무사히 옴 (showDetail 함수 끝)");

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void getBookTest() {
		
		
	}

}
