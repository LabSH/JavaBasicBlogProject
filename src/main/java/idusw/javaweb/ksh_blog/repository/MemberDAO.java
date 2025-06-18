package idusw.javaweb.ksh_blog.repository;

import idusw.javaweb.ksh_blog.model.Member;

import java.util.List;

public interface MemberDAO {
    int create(Member member);
    Member read(Member member); // read one object / record
    List<Member> readList();    // read objects / records
    int update(Member member);
    int delete(Member member);
}