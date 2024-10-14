import java.rmi.*;
public class MathClient
{
	public static void main(String args[])
	{
		int a=10,b=20,ans;
		try
		{
			Maths m1 = (Maths)Naming.lookup("rmi://localhost:1900"+"/jnec");
			ans = m1.add(a,b);
			System.out.println("Addition is"+" "+ans);
		}
		catch(Exception ae)
		{
			System.out.println(ae);
		}
	}
}