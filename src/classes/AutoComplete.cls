public class AutoComplete {
 // Instance fields
    public String searchTerm {get; set;}
    public String selectedMovie {get; set;}
    
    // JS Remoting action called when searching for a movie name
    @RemoteAction
    public static List<String> searchMovie(String searchTerm) {
        System.debug('Movie Name is: '+searchTerm );
        List<String> movies = new List<String>();
        movies.add('Kaalia');
        movies.add('ajnabee');
        return movies;
    }
}