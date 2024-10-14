package maven_project.MavenProject;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
public class MavenJDBC {
	public static void main(String[] args) throws Exception{
		// TODO Auto-generated method stub
		Connection con;
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/customer","root","jneccse");
		Statement stmt=con.createStatement();
		String sql="Select * from customer";
		ResultSet rs=stmt.executeQuery(sql);
		int cnt=1;
		while(rs.next()){
			int cid=rs.getInt("id");
			String cname=rs.getString("name");
			String caddress=rs.getString("address");
			System.out.println("\n"+cid+"\t"+cname+"\t"+caddress);
		}
	}
}
