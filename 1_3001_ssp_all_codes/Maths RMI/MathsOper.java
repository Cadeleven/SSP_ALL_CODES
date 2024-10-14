import java.rmi.*;
import java.rmi.server.*;
public class MathsOper extends UnicastRemoteObject implements Maths
{
	MathsOper() throws RemoteException
	{
		super();
	}
	public int add(int a,int b)
	{
		return (a+b);
	}
}