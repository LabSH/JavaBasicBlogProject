package idusw.javaweb.ksh_blog.controller;

import java.io.IOException;

import idusw.javaweb.ksh_blog.model.Member;
import idusw.javaweb.ksh_blog.repository.MemberDAO;
import idusw.javaweb.ksh_blog.repository.MemberDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

// 여기는 받는 종류임 어떤 jsp 파일에서 서밋을 하면 그 액션과 여기 urlPatterns에 맞는 정보를 매칭시켜 기능을 선택하는것
@WebServlet(name = "memberController",
        urlPatterns = {"/members/login-form.do", "/members/login.do", "/members/post-form.do", "/members/post.do", "/members/detail.do", "/members/logout.do",
        "/members/update.do", "/members/list.do", "/members/delete.do"})
public class MemberController extends HttpServlet {


    public void init() { }
    public void doProcess(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String uri = request.getRequestURI();
        String action = uri.substring(uri.lastIndexOf('/') + 1); // action = post, get, get-list


        MemberDAO dao = new MemberDAOImpl();
        Member member = null;

        if(action.equals("login-form.do")) {
            request.getRequestDispatcher("./member-login-form.jsp").forward(request, response);
        }else if(action.equals("login.do")){
            member = new Member();
            member.setEmail(request.getParameter("email"));
            member.setPw(request.getParameter("pw"));
            Member retMembr = dao.read(member);

            if(retMembr != null){

                    if (retMembr.getAdmin() == 1){
                        session.setAttribute("admin", retMembr);
                        session.setAttribute("logined", retMembr);
                    }else {
                        session.setAttribute("logined", retMembr);
                    }


                request.getRequestDispatcher("../main/index.jsp").forward(request, response);
            }else{
                request.getRequestDispatcher("../status/error.jsp").forward(request, response);
            }

        }else if(action.equals("logout.do")) {
            session.invalidate(); // session 무효화
            request.getRequestDispatcher("../main/index.jsp").forward(request, response);
        }else if(action.equals("post-form.do")){
            request.getRequestDispatcher("./member-post-form.jsp").forward(request, response);
        }else if(action.equals("post.do")){
            member = new Member();
            member.setEmail(request.getParameter("email"));
            member.setPw(request.getParameter("pw"));
            member.setUsername(request.getParameter("username"));
            member.setPhone(request.getParameter("phone"));
            member.setAddress(request.getParameter("address"));
            if(dao.create(member) > 0 ) {
                request.getRequestDispatcher("../status/message.jsp").forward(request, response);
            }else{
                request.getRequestDispatcher("../status/error.jsp").forward(request, response);
            }
        }else if(action.equals("detail.do")){
            // 위에서 이미 정보들을 가지고있음
            member = (Member) session.getAttribute("logined");
            Member retMembr = dao.read(member);

            if(retMembr != null){
                // session.setAttribute("logined", retMembr);
                request.setAttribute("member", retMembr);
                request.getRequestDispatcher("../members/member-update-form.jsp").forward(request, response);
            }else{
                request.getRequestDispatcher("../status/error.jsp").forward(request, response);
            }

        }else if(action.equals("update.do")) {
            member = (Member) session.getAttribute("logined"); // 로그인된 사용자 정보 가져오기
            if (member == null) {
                request.getRequestDispatcher("../status/error.jsp").forward(request, response);
                return;
            }

            // 사용자가 입력한 새 정보를 설정
            member.setEmail(request.getParameter("email")); // 이메일 변경 가능
            member.setPw(request.getParameter("pw")); // 비밀번호 변경 가능
            member.setUsername(request.getParameter("username")); // 사용자 이름 변경 가능
            member.setPhone(request.getParameter("phone")); // 전화번호 변경 가능
            member.setAddress(request.getParameter("address")); // 주소 변경 가능

            // DAO를 통해 업데이트 실행
            if (dao.update(member) > 0) {
                session.setAttribute("logined", member); // 세션 정보 업데이트
                request.setAttribute("message", "회원 정보가 성공적으로 수정되었습니다.");
                request.getRequestDispatcher("../status/message.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "회원 정보 수정에 실패했습니다.");
                request.getRequestDispatcher("../status/error.jsp").forward(request, response);
            }
        }else if(action.equals("list.do")) {
            List<Member> memberList = dao.readList(); // 모든 회원 조회
            if (memberList != null) {
                request.setAttribute("memberList", memberList); // 요청 속성에 리스트 추가
                request.getRequestDispatcher("../members/member-list-view.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("../status/error.jsp").forward(request, response); // 에러 처리
            }
        }else if(action.equals("delete.do")) {
            String memberSeq = request.getParameter("id");

            // 회원 삭제를 위한 Member 객체 생성
            Member memberToDelete = new Member();
            memberToDelete.setSeq(Integer.parseInt(memberSeq)); // 삭제할 회원의 id를 설정

            // DAO를 통해 회원 삭제
            dao.delete(memberToDelete);

            response.sendRedirect("../members/list.do?pn=1");
        }

    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doProcess(request, response);
    }public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        doProcess(request, response);

    }

    public void destroy() {
    }
}
