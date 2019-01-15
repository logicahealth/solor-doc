import plugin.client.BibliographyUtility;

public class App {

    public static void main(String[] args) {
        boolean enabled = false;
        if (enabled) {
            BibliographyUtility bibliographyUtility = new BibliographyUtility("C:\\Users\\kmaulden\\Documents\\code\\komet1\\bibliography-db\\src\\docbkx\\bibliography.xml", "groupId", "tagName", "secret", "client_id", "username", "password", "redirect_uri");
            bibliographyUtility.writeBibliography();
        } else {
            BibliographyUtility bibliographyUtility = new BibliographyUtility("C:\\Users\\kmaulden\\Documents\\code\\komet1\\bibliography-db\\src\\docbkx\\bibliography.xml");
            bibliographyUtility.writeEmptyBibliography();
        }
    }

}
