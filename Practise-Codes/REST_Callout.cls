public class AnimalLocator {
    public static string getAnimalNameById(Integer id) {
        string animal_name;
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);        
        if(response.getStatusCode() == 200) {            
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());            
            Map<String,Object> animal_details = (Map<String,Object>) results.get('animal');
            System.debug('The animal is: '+animal_details.get('name')); 
            animal_name=(string)animal_details.get('name');
        }
        return animal_name;
    }

}