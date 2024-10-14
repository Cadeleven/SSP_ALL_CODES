import java.rmi.*;
public interface Maths extends Remote
{
	public int add(int n1,int n2) throws RemoteException;
}