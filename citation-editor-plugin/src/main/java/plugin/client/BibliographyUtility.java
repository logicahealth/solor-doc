package com.github.aks8m.plugin.client;

import com.github.aks8m.schemas.docbook.*;
import com.github.aks8m.schemas.mendeley.Person;
import com.github.aks8m.schemas.mendeley.UserDocument;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class BibliographyUtility {

    private final MendeleyClient mendeleyClient;
    private final String bibliographyFilePath;
    private final String tagName;


    public BibliographyUtility(String bibliographyFilePath, String groupId, String tagName, String secret, String client_id, String username, String password, String redirect_uri) {
        this.bibliographyFilePath = bibliographyFilePath;
        this.mendeleyClient = new MendeleyClient(groupId, secret, client_id, username, password, redirect_uri);
        this.tagName = tagName;
    }

    public void writeBibliography(){

        Bibliography bibliography = createBibliography(mendeleyClient.generateDocbookBibliography());
        marshallBibliography(bibliography, bibliographyFilePath);
    }

    private void marshallBibliography(Bibliography bibliography, String bibliographyFilePath){

        try{

            File file = new File(bibliographyFilePath);
            JAXBContext jaxbContext = JAXBContext.newInstance(Bibliography.class);
            Marshaller jaxbMarshaller = jaxbContext.createMarshaller();

            jaxbMarshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);

            jaxbMarshaller.marshal(bibliography, file);

        }catch (JAXBException jaxE){
            jaxE.printStackTrace();
        }


    }

    private Bibliography createBibliography(ArrayList<UserDocument> userDocuments){
        final Bibliography bibliography = new Bibliography();
        final Bibliodiv bibliodiv = new Bibliodiv();

        Title bibliographyTitle = new Title();
        Title bibliodivTitle = new Title();

        bibliographyTitle.getContent().add("Auto Generated SOLOR Bibliography");
        bibliodivTitle.getContent().add("Mendeley Library Artifacts");

        bibliography.getTitlesAndTitleabbrevsAndSubtitles().add(bibliographyTitle);
        bibliodiv.getTitlesAndTitleabbrevsAndSubtitles().add(bibliodivTitle);

        userDocuments.stream()
                .forEach(userDocument -> bibliodiv.getBiblioentriesAndBibliomixeds()
                        .add(createBiblioentry(userDocument)));


        bibliography.getBibliodivs().add(bibliodiv);
        return bibliography;
    }

    private String getTagUUID(UserDocument userDocument) {
        return userDocument.getTags().stream().filter(s -> s.toString().startsWith(tagName)).findFirst().get().replace(tagName + "=", "");
    }

    private Biblioentry createBiblioentry(UserDocument userDocument){
        final Biblioentry biblioentry = new Biblioentry();
        final Title biblioentryTitle = new Title();

        biblioentry.getAbstractsAndAddressesAndArtpagenums()
                .add(createAbbrev(getTagUUID(userDocument)));

        biblioentry.setId(getTagUUID(userDocument));

        biblioentry.getAbstractsAndAddressesAndArtpagenums()
                .add(createAuthorgroup(userDocument.getAuthors()));

        biblioentry.getAbstractsAndAddressesAndArtpagenums()
                .add(createCopyright(String.valueOf(userDocument.getYear())));

        createBiblioids(userDocument.getIdentifiers()).stream()
                .forEach(biblioid -> biblioentry.getAbstractsAndAddressesAndArtpagenums().add(biblioid));

        biblioentry.getAbstractsAndAddressesAndArtpagenums()
                .add(createPublisher(userDocument.getSource()));

        biblioentryTitle.getContent().add(userDocument.getTitle());
        biblioentry.getAbstractsAndAddressesAndArtpagenums().add(biblioentryTitle);

        return biblioentry;
    }

    private Authorgroup createAuthorgroup(List<Person> authors){
        final Authorgroup authorgroup = new Authorgroup();

        authors.stream()
                .forEach(person -> {
                    Author author = new Author();
                    Personname personname = new Personname();
                    Firstname firstname = new Firstname();
                    Surname surname = new Surname();

                    firstname.getContent().add(person.getFirstName());
                    surname.getContent().add(person.getLastName());

                    personname.getContent().add(firstname);
                    personname.getContent().add(surname);
                    author.setPersonname(personname);
                    authorgroup.getAuthorsAndEditorsAndOthercredits().add(author);
                });

        return authorgroup;
    }

    private Copyright createCopyright(String yearString){
        final Copyright copyright = new Copyright();
        final Year year = new Year();

        year.getContent().add(yearString);
        copyright.getYears().add(year);

        return copyright;
    }

    private Abbrev createAbbrev(String abbrevString) {
        final Abbrev abbrev = new Abbrev();

        abbrev.getContent().add(abbrevString);

        return abbrev;
    }

    private ArrayList<Biblioid> createBiblioids(Map<String, String> identifiers){
        final ArrayList<Biblioid> biblioids = new ArrayList<>();

        identifiers.entrySet().stream()
                .forEach(stringStringEntry -> {
                    final Biblioid biblioid = new Biblioid();
                    biblioid.setClazz(stringStringEntry.getKey());
                    biblioid.getContent().add(stringStringEntry.getValue());
                    biblioids.add(biblioid);
                });

        return biblioids;
    }

    private Publisher createPublisher(String publisherNameString){
        final Publishername publishername = new Publishername();
        final Publisher publisher = new Publisher();

        publishername.getContent().add(publisherNameString);
        publisher.setPublishername(publishername);

        return publisher;
    }

}
