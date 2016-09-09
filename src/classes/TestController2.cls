public class TestController2 {
    public TestDto dto;
    public String accesstoken{set;get;}
    public String token{set;get;}
    public TestController2(){
        dto = new TestDto();
        accesstoken = dto.getaccesstoken();
    }
}