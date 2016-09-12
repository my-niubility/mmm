
public class TestAnd {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		if(false||getBoolean()){
			System.out.println("--main--true");
		}else{
			System.out.println("--main--false");
		}
		
		
	}

	public static boolean getBoolean(){
		System.out.println("--excute--");
		
		return true;
	}
}
