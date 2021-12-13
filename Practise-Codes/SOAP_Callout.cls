public class ParkLocator {
    public static string[] country(string country_name){

        //First generate the ParkService class from the ParkService wsdl
        
        ParkService.ParksImplPort pk=new ParkService.ParksImplPort();
        return(pk.byCountry(country_name));        
    }

}