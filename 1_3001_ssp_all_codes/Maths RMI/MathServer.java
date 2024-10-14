import java.rmi.*;
import java.rmi.registry.*;
public class MathServer
{
	public static void main(String args[])
	{
		try
		{
			Maths obj = new MathsOper();
			LocateRegistry.createRegistry(1900);
			Naming.rebind("rmi://localhost:1900"+"/jnec",obj);
		}
		catch(Exception ae)
		{
			System.out.println(ae);
		}
	}
}