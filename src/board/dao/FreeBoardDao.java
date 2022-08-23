package board.dao;

import java.util.List; 
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import board.vo.FreeBoard;
import mybatis.SqlSessionBean;

public class FreeBoardDao {
	private static FreeBoardDao dao = new FreeBoardDao();
	private FreeBoardDao() {};
	public static FreeBoardDao getInstance() {
		return dao;
	}
	
	SqlSessionFactory factory = SqlSessionBean.getSessionFactory();
	
	public int getCount() {
		SqlSession mapper = factory.openSession();
		int count = mapper.selectOne("getCount");
		mapper.close();
		return count;
	}
	
	public List<FreeBoard> getPageList(Map<String, Integer> map){
		SqlSession mapper = factory.openSession();
		List<FreeBoard> list = mapper.selectList("getPageList",map);
		mapper.close();
		return list;
	}
	
	public void insert(FreeBoard vo) {
		SqlSession mapper = factory.openSession();
		mapper.insert("freeboard.insert", vo);
		mapper.commit();
		mapper.close();
	}
	
	public FreeBoard getDetail(int idx){
		SqlSession mapper = factory.openSession();
		FreeBoard vo = mapper.selectOne("freeboard.detail",idx);
		mapper.close();
		return vo;
	}
	
	public void readcountUP(int idx) {
		SqlSession mapper = factory.openSession();
		mapper.update("readcountUp",idx);
		mapper.commit();
		mapper.close();
	}
	
	public int delete (Map<String, Object> map) {
		SqlSession mapper = factory.openSession();
		int result = mapper.delete("freeboard.delete", map);
		mapper.commit();
		mapper.close();
		return result;
	}
	
	public void update(FreeBoard vo) {
		SqlSession mapper = factory.openSession();
		mapper.update("freeboard.update",vo);
		mapper.commit();
		mapper.close();
	}
	
}
