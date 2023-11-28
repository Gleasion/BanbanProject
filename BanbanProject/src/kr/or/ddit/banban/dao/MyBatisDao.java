package kr.or.ddit.banban.dao;

import java.util.Collections;
import java.util.List;

import javax.management.RuntimeErrorException;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.util.MyBatisUtil;

public class MyBatisDao {

   /**
    * 데이터가 한개인 경우 사용할 메서드
    * @param <T>
    * @param statement 실행할 쿼리 ID
    * @return 실행결과
    */
   public <T> T selectOne(String statement) {

      SqlSession sqlSession = MyBatisUtil.getInstance(true);

      T obj = null;

      try {
         obj = sqlSession.selectOne(statement);

      } catch (PersistenceException ex) {
         throw new RuntimeException("마이바티스에서 데이터 조회 중 예외발생!", ex);
      } finally {
         sqlSession.close(); // 세션 닫기
      }

      return obj;
   }
   /**
    * 데이터가 한개인 경우 사용할 메서드
    * @param <T>
    * @param statement 실행할 쿼리 ID
    * @param parameter 쿼리 실행에 사용할 파라미터
    * @return 실행결과
    */
   public <T> T selectOne(String statement, Object parameter) {

      SqlSession sqlSession = MyBatisUtil.getInstance(true);

      T obj = null;

      try {
         obj = sqlSession.selectOne(statement, parameter);

      } catch (PersistenceException ex) {
         throw new RuntimeException("마이바티스에서 데이터 조회 중 예외발생!", ex);
      } finally {
         sqlSession.close(); // 세션 닫기
      }

      return obj;
   }
/**
 * 목록 조회 메서드
 * @param <T> 
 * @param statement
 * @return
 */
   //<T>는 제네릭 타입 매개변수 
   public <T> List<T> selectList(String statement) {

      SqlSession session = MyBatisUtil.getInstance(true);

      List<T> list = Collections.EMPTY_LIST;

      try {

         list = session.selectList(statement);

      } catch (PersistenceException ex) {
         throw new RuntimeException("마이바티스에서 목록 조회 중 예외 발생!", ex);
      } finally {
         session.close();
      }

      return list;
   }

   public <T> List<T> selectList(String statement, Object parameter) {

      SqlSession session = MyBatisUtil.getInstance(true);

      List<T> list = Collections.EMPTY_LIST;

      try {

         list = session.selectList(statement, parameter);

      } catch (PersistenceException ex) {
         throw new RuntimeException("마이바티스에서 목록 조회 중 예외 발생!", ex);
      } finally {
         session.close();
      }

      return list;
   }
   
   public int insert(String statement, Object parameter) {

      SqlSession session = MyBatisUtil.getInstance();
      
      int cnt = 0;
      
      try {
         
         cnt = session.insert(statement, parameter);
         
         session.commit();
         
      } catch (PersistenceException ex) {
         session.rollback();
         
         throw new RuntimeException("마이바티스에서 데이터 등록 중 예외 발생!", ex);
         
      } finally {
         session.close();
      }
      
      return cnt;
   }
   
   public int update(String statement, Object parameter) {

      SqlSession session = MyBatisUtil.getInstance();
      
      int cnt = 0;
      
      try {

    	 cnt = session.update(statement, parameter);
         
         session.commit();
         
      } catch (PersistenceException ex) {
         session.rollback();
         
         throw new RuntimeException("마이바티스에서 데이터 수정 중 예외 발생!", ex);
         
      } finally {
         session.close();
      }
      
      return cnt;
   }
   
   public int delete(String statement, Object parameter) {

      SqlSession session = MyBatisUtil.getInstance();
      
      int cnt = 0;
      
      try {
         
         cnt = session.delete(statement, parameter);
         
         session.commit();
         
      } catch (PersistenceException ex) {
         session.rollback();
         
         throw new RuntimeException("마이바티스에서 데이터 삭제 중 예외 발생!", ex);
         
      } finally {
         session.close();
      }
      
      return cnt;
   }
}