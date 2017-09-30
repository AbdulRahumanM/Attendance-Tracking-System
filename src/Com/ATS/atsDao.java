/**
 * 
 */
package Com.ATS;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * This class is used to access the Db
 * @author I326481
 *
 */
public class atsDao {
public static int loginDao(int userName, String password){
	int r=0;
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:xe","system",
				"pwd");
		Statement st = conn.createStatement();
            String sql = "SELECT * FROM ATS_USERS where USERNAME='"+ userName +"' and PASSWORD='"+ password +"'";
            ResultSet res = st.executeQuery(sql);
            if(res.next())
            {
            	conn.close();
            	r=1;
            }
		
	}
	catch(Exception e){
		e.printStackTrace();
	}
	return r;
}
public static void addEmployeeDao(String name, String number){
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:xe","system",
				"pwd");
		Statement st = conn.createStatement();
		st.executeUpdate("INSERT INTO ATS_USERS (username,empname,password,mob) values (seq_id.nextval,'"+ name +"','"+name+"123','"+ number +"')");
        conn.close();
	}
	catch(Exception e){
		e.printStackTrace();
	}
}
public static void deleteEmployeeDao(int userName){
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:xe","system",
				"pwd");
		Statement st = conn.createStatement();
		st.executeUpdate("delete from ATS_USERS where username = "+ userName +"");
        conn.close();
	}
	catch(Exception e){
		e.printStackTrace();
	}
}
public static void updateEmployeeDao(int userName, double number){
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:xe","system",
				"pwd");
		Statement st = conn.createStatement();
		st.executeUpdate("update ATS_USERS set mob="+ number +" where username = "+ userName +"");
        conn.close();
	}
	catch(Exception e){
		e.printStackTrace();
	}
}
public static void insertLoginDao(int userName){
	try{
		Date dNow = new Date( );
	    SimpleDateFormat date = new SimpleDateFormat ("dd.MM.yyyy");
	    SimpleDateFormat time = new SimpleDateFormat ("HH:mm");
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:xe","system",
				"pwd");
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery("select * from ats_track where username ="+ userName +" and logdate=TO_DATE('"+ date.format(dNow) +"', 'dd/mm/yyyy')");
		if(rs.next())
		{
			st.close();
			Statement stUpdate = conn.createStatement();
			stUpdate.executeUpdate("update ats_track set outtime='"+ time.format(dNow) +"' where username ="+ userName +" and logdate = TO_DATE('"+ date.format(dNow) +"','dd/mm/yyyy')");
			stUpdate.close();
		}
		else
		{
			st.close();
			Statement stInsert = conn.createStatement();
			stInsert.executeUpdate("insert into ats_track (username,logdate,intime) values("+ userName +",TO_DATE('"+ date.format(dNow) +"', 'dd/mm/yyyy'),'"+ time.format(dNow) +"')");
			stInsert.close();
		}
        conn.close();
	}
	catch(Exception e){
		e.printStackTrace();
	}
}
public static void insertLogoutDao(int userName){
	try{
		Date dNow = new Date( );
	    SimpleDateFormat date = new SimpleDateFormat ("dd.MM.yyyy");
	    SimpleDateFormat time = new SimpleDateFormat ("HH:mm");
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:xe","system",
				"pwd");
		Statement st = conn.createStatement();
		st.executeUpdate("update ats_track set outtime='"+ time.format(dNow) +"' where username ="+ userName +" and logdate = TO_DATE('"+ date.format(dNow) +"','dd/mm/yyyy')");
		conn.close();
	}
	catch(Exception e){
		e.printStackTrace();
	}
}
}
