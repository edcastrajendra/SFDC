public class MyClass2 {
    
    Integer myInteger = 10;
    public void myMethod (Integer multiplier) {
        Integer multiplicationResult;
        multiplicationResult=multiplier*myInteger;
        System.debug('Multiplication is '+multiplicationResult);
    }
    
    public static void main(String[] args){
        MyClass2 my = new MyClass2();
        my.myMethod(10);
    }

}