
package schemas.mendeley;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * MendeleyDocument
 * <p>
 * A document that is stored in a Mendeley user's library.
 * 
 */
public class UserDocument {

    /**
     * 
     * 
     */
    @SerializedName("profile_id")
    @Expose
    private String profileId;
    /**
     * 
     * 
     */
    @SerializedName("group_id")
    @Expose
    private String groupId;
    /**
     * 
     * 
     */
    @SerializedName("last_modified")
    @Expose
    private String lastModified;
    /**
     * 
     * 
     */
    @SerializedName("tags")
    @Expose
    private List<String> tags = new ArrayList<String>();
    /**
     * 
     * 
     */
    @SerializedName("read")
    @Expose
    private Boolean read;
    /**
     * 
     * 
     */
    @SerializedName("starred")
    @Expose
    private Boolean starred;
    /**
     * 
     * 
     */
    @SerializedName("authored")
    @Expose
    private Boolean authored;
    /**
     * 
     * 
     */
    @SerializedName("confirmed")
    @Expose
    private Boolean confirmed;
    /**
     * 
     * 
     */
    @SerializedName("hidden")
    @Expose
    private Boolean hidden;
    /**
     * 
     * 
     */
    @SerializedName("citation_key")
    @Expose
    private String citationKey;
    /**
     * 
     * 
     */
    @SerializedName("source_type")
    @Expose
    private String sourceType;
    /**
     * 
     * 
     */
    @SerializedName("language")
    @Expose
    private String language;
    /**
     * 
     * 
     */
    @SerializedName("short_title")
    @Expose
    private String shortTitle;
    /**
     * 
     * 
     */
    @SerializedName("reprint_edition")
    @Expose
    private String reprintEdition;
    /**
     * 
     * 
     */
    @SerializedName("genre")
    @Expose
    private String genre;
    /**
     * 
     * 
     */
    @SerializedName("country")
    @Expose
    private String country;
    /**
     * 
     * 
     */
    @SerializedName("translators")
    @Expose
    private List<Person> translators = new ArrayList<Person>();
    /**
     * 
     * 
     */
    @SerializedName("series_editor")
    @Expose
    private String seriesEditor;
    /**
     * 
     * 
     */
    @SerializedName("code")
    @Expose
    private String code;
    /**
     * 
     * 
     */
    @SerializedName("medium")
    @Expose
    private String medium;
    /**
     * 
     * 
     */
    @SerializedName("user_context")
    @Expose
    private String userContext;
    /**
     * 
     * 
     */
    @SerializedName("patent_owner")
    @Expose
    private String patentOwner;
    /**
     * 
     * 
     */
    @SerializedName("patent_application_number")
    @Expose
    private String patentApplicationNumber;
    /**
     * 
     * 
     */
    @SerializedName("patent_legal_status")
    @Expose
    private String patentLegalStatus;
    /**
     * 
     * 
     */
    @SerializedName("notes")
    @Expose
    private String notes;
    /**
     * 
     * 
     */
    @SerializedName("folder_uuids")
    @Expose
    private List<Uuid> folderUuids = new ArrayList<Uuid>();
    /**
     * 
     * 
     */
    @SerializedName("private_publication")
    @Expose
    private Boolean privatePublication;
    /**
     * 
     * 
     */
    @SerializedName("created")
    @Expose
    private String created;
    /**
     * 
     * 
     */
    @SerializedName("accessed")
    @Expose
    private String accessed;
    /**
     * 
     * 
     */
    @SerializedName("file_attached")
    @Expose
    private Boolean fileAttached;
    /**
     * 
     * 
     */
    @SerializedName("id")
    @Expose
    private String id;
    /**
     * 
     * 
     */
    @SerializedName("month")
    @Expose
    private Integer month;
    /**
     * 
     * 
     */
    @SerializedName("year")
    @Expose
    private Integer year;
    /**
     * 
     * 
     */
    @SerializedName("day")
    @Expose
    private Integer day;
    /**
     * 
     * 
     */
    @SerializedName("abstract")
    @Expose
    private String _abstract;
    /**
     * 
     * 
     */
    @SerializedName("source")
    @Expose
    private String source;
    /**
     * 
     * (Required)
     * 
     */
    @SerializedName("title")
    @Expose
    private String title;
    /**
     * 
     * 
     */
    @SerializedName("revision")
    @Expose
    private String revision;
    /**
     * 
     * 
     */
    @SerializedName("department")
    @Expose
    private String department;
    /**
     * 
     * 
     */
    @SerializedName("authors")
    @Expose
    private List<Person> authors = new ArrayList<Person>();
    /**
     * 
     * 
     */
    @SerializedName("keywords")
    @Expose
    private List<String> keywords = new ArrayList<String>();
    /**
     * 
     * 
     */
    @SerializedName("pages")
    @Expose
    private String pages;
    /**
     * 
     * 
     */
    @SerializedName("volume")
    @Expose
    private String volume;
    /**
     * 
     * 
     */
    @SerializedName("issue")
    @Expose
    private String issue;
    /**
     * 
     * 
     */
    @SerializedName("websites")
    @Expose
    private List<String> websites = new ArrayList<String>();
    /**
     * 
     * 
     */
    @SerializedName("city")
    @Expose
    private String city;
    /**
     * 
     * 
     */
    @SerializedName("edition")
    @Expose
    private String edition;
    /**
     * 
     * 
     */
    @SerializedName("institution")
    @Expose
    private String institution;
    /**
     * 
     * 
     */
    @SerializedName("series")
    @Expose
    private String series;
    /**
     * 
     * 
     */
    @SerializedName("series_number")
    @Expose
    private String seriesNumber;
    /**
     * 
     * 
     */
    @SerializedName("chapter")
    @Expose
    private String chapter;
    /**
     * 
     * 
     */
    @SerializedName("editors")
    @Expose
    private List<Person> editors = new ArrayList<Person>();
    /**
     * 
     * 
     */
    @SerializedName("publisher")
    @Expose
    private String publisher;
    /**
     * 
     * 
     */
    @SerializedName("identifiers")
    @Expose
    private Map<String, String> identifiers = new HashMap<>();
    /**
     * 
     * 
     */
    @SerializedName("type")
    @Expose
    private String type;


    /**
     * 
     * 
     */
    public String getProfileId() {
        return profileId;
    }

    /**
     *
     * 
     */
    public void setProfileId(String profileId) {
        this.profileId = profileId;
    }

    /**
     * 
     * 
     */
    public String getGroupId() {
        return groupId;
    }

    /**
     * 
     * 
     */
    public void setGroupId(String groupId) {
        this.groupId = groupId;
    }

    /**
     * 
     * 
     */
    public String getLastModified() {
        return lastModified;
    }

    /**
     * 
     * 
     */
    public void setLastModified(String lastModified) {
        this.lastModified = lastModified;
    }

    /**
     * 
     * 
     */
    public List<String> getTags() {
        return tags;
    }

    /**
     * 
     * 
     */
    public void setTags(List<String> tags) {
        this.tags = tags;
    }

    /**
     * 
     * 
     */
    public Boolean getRead() {
        return read;
    }

    /**
     * 
     * 
     */
    public void setRead(Boolean read) {
        this.read = read;
    }

    /**
     * 
     * 
     */
    public Boolean getStarred() {
        return starred;
    }

    /**
     * 
     * 
     */
    public void setStarred(Boolean starred) {
        this.starred = starred;
    }

    /**
     * 
     * 
     */
    public Boolean getAuthored() {
        return authored;
    }

    /**
     * 
     * 
     */
    public void setAuthored(Boolean authored) {
        this.authored = authored;
    }

    /**
     * 
     * 
     */
    public Boolean getConfirmed() {
        return confirmed;
    }

    /**
     * 
     * 
     */
    public void setConfirmed(Boolean confirmed) {
        this.confirmed = confirmed;
    }

    /**
     * 
     * 
     */
    public Boolean getHidden() {
        return hidden;
    }

    /**
     * 
     * 
     */
    public void setHidden(Boolean hidden) {
        this.hidden = hidden;
    }

    /**
     * 
     * 
     */
    public String getCitationKey() {
        return citationKey;
    }

    /**
     * 
     * 
     */
    public void setCitationKey(String citationKey) {
        this.citationKey = citationKey;
    }

    /**
     * 
     * 
     */
    public String getSourceType() {
        return sourceType;
    }

    /**
     * 
     * 
     */
    public void setSourceType(String sourceType) {
        this.sourceType = sourceType;
    }

    /**
     * 
     * 
     */
    public String getLanguage() {
        return language;
    }

    /**
     * 
     * 
     */
    public void setLanguage(String language) {
        this.language = language;
    }

    /**
     * 
     * 
     */
    public String getShortTitle() {
        return shortTitle;
    }

    /**
     * 
     * 
     */
    public void setShortTitle(String shortTitle) {
        this.shortTitle = shortTitle;
    }

    /**
     * 
     * 
     */
    public String getReprintEdition() {
        return reprintEdition;
    }

    /**
     * 
     * 
     */
    public void setReprintEdition(String reprintEdition) {
        this.reprintEdition = reprintEdition;
    }

    /**
     * 
     * 
     */
    public String getGenre() {
        return genre;
    }

    /**
     * 
     * 
     */
    public void setGenre(String genre) {
        this.genre = genre;
    }

    /**
     * 
     * 
     */
    public String getCountry() {
        return country;
    }

    /**
     * 
     * 
     */
    public void setCountry(String country) {
        this.country = country;
    }

    /**
     * 
     * 
     */
    public List<Person> getTranslators() {
        return translators;
    }

    /**
     * 
     * 
     */
    public void setTranslators(List<Person> translators) {
        this.translators = translators;
    }

    /**
     * 
     * 
     */
    public String getSeriesEditor() {
        return seriesEditor;
    }

    /**
     * 
     * 
     */
    public void setSeriesEditor(String seriesEditor) {
        this.seriesEditor = seriesEditor;
    }

    /**
     * 
     * 
     */
    public String getCode() {
        return code;
    }

    /**
     * 
     * 
     */
    public void setCode(String code) {
        this.code = code;
    }

    /**
     * 
     * 
     */
    public String getMedium() {
        return medium;
    }

    /**
     * 
     * 
     */
    public void setMedium(String medium) {
        this.medium = medium;
    }

    /**
     * 
     * 
     */
    public String getUserContext() {
        return userContext;
    }

    /**
     * 
     * 
     */
    public void setUserContext(String userContext) {
        this.userContext = userContext;
    }

    /**
     * 
     * 
     */
    public String getPatentOwner() {
        return patentOwner;
    }

    /**
     * 
     * 
     */
    public void setPatentOwner(String patentOwner) {
        this.patentOwner = patentOwner;
    }

    /**
     * 
     * 
     */
    public String getPatentApplicationNumber() {
        return patentApplicationNumber;
    }

    /**
     * 
     * 
     */
    public void setPatentApplicationNumber(String patentApplicationNumber) {
        this.patentApplicationNumber = patentApplicationNumber;
    }

    /**
     * 
     * 
     */
    public String getPatentLegalStatus() {
        return patentLegalStatus;
    }

    /**
     * 
     * 
     */
    public void setPatentLegalStatus(String patentLegalStatus) {
        this.patentLegalStatus = patentLegalStatus;
    }

    /**
     * 
     * 
     */
    public String getNotes() {
        return notes;
    }

    /**
     * 
     * 
     */
    public void setNotes(String notes) {
        this.notes = notes;
    }

    /**
     * 
     * 
     */
    public List<Uuid> getFolderUuids() {
        return folderUuids;
    }

    /**
     * 
     * 
     */
    public void setFolderUuids(List<Uuid> folderUuids) {
        this.folderUuids = folderUuids;
    }

    /**
     * 
     * 
     */
    public Boolean getPrivatePublication() {
        return privatePublication;
    }

    /**
     * 
     * 
     */
    public void setPrivatePublication(Boolean privatePublication) {
        this.privatePublication = privatePublication;
    }

    /**
     * 
     * 
     */
    public String getCreated() {
        return created;
    }

    /**
     * 
     * 
     */
    public void setCreated(String created) {
        this.created = created;
    }

    /**
     * 
     * 
     */
    public String getAccessed() {
        return accessed;
    }

    /**
     * 
     * 
     */
    public void setAccessed(String accessed) {
        this.accessed = accessed;
    }

    /**
     * 
     * 
     */
    public Boolean getFileAttached() {
        return fileAttached;
    }

    /**
     * 
     * 
     */
    public void setFileAttached(Boolean fileAttached) {
        this.fileAttached = fileAttached;
    }

    /**
     * 
     * 
     */
    public String getId() {
        return id;
    }

    /**
     * 
     * 
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * 
     * 
     */
    public Integer getMonth() {
        return month;
    }

    /**
     * 
     * 
     */
    public void setMonth(Integer month) {
        this.month = month;
    }

    /**
     * 
     * 
     */
    public Integer getYear() {
        return year;
    }

    /**
     * 
     * 
     */
    public void setYear(Integer year) {
        this.year = year;
    }

    /**
     * 
     * 
     */
    public Integer getDay() {
        return day;
    }

    /**
     * 
     * 
     */
    public void setDay(Integer day) {
        this.day = day;
    }

    /**
     * 
     * 
     */
    public String getAbstract() {
        return _abstract;
    }

    /**
     * 
     * 
     */
    public void setAbstract(String _abstract) {
        this._abstract = _abstract;
    }

    /**
     * 
     * 
     */
    public String getSource() {
        return source;
    }

    /**
     * 
     * 
     */
    public void setSource(String source) {
        this.source = source;
    }

    /**
     * 
     * (Required)
     * 
     */
    public String getTitle() {
        return title;
    }

    /**
     * 
     * (Required)
     * 
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * 
     * 
     */
    public String getRevision() {
        return revision;
    }

    /**
     * 
     * 
     */
    public void setRevision(String revision) {
        this.revision = revision;
    }

    /**
     * 
     * 
     */
    public String getDepartment() {
        return department;
    }

    /**
     * 
     * 
     */
    public void setDepartment(String department) {
        this.department = department;
    }

    /**
     * 
     * 
     */
    public List<Person> getAuthors() {
        return authors;
    }

    /**
     * 
     * 
     */
    public void setAuthors(List<Person> authors) {
        this.authors = authors;
    }

    /**
     * 
     * 
     */
    public List<String> getKeywords() {
        return keywords;
    }

    /**
     * 
     * 
     */
    public void setKeywords(List<String> keywords) {
        this.keywords = keywords;
    }

    /**
     * 
     * 
     */
    public String getPages() {
        return pages;
    }

    /**
     * 
     * 
     */
    public void setPages(String pages) {
        this.pages = pages;
    }

    /**
     * 
     * 
     */
    public String getVolume() {
        return volume;
    }

    /**
     * 
     * 
     */
    public void setVolume(String volume) {
        this.volume = volume;
    }

    /**
     * 
     * 
     */
    public String getIssue() {
        return issue;
    }

    /**
     * 
     * 
     */
    public void setIssue(String issue) {
        this.issue = issue;
    }

    /**
     * 
     * 
     */
    public List<String> getWebsites() {
        return websites;
    }

    /**
     * 
     * 
     */
    public void setWebsites(List<String> websites) {
        this.websites = websites;
    }

    /**
     * 
     * 
     */
    public String getCity() {
        return city;
    }

    /**
     * 
     * 
     */
    public void setCity(String city) {
        this.city = city;
    }

    /**
     * 
     * 
     */
    public String getEdition() {
        return edition;
    }

    /**
     * 
     * 
     */
    public void setEdition(String edition) {
        this.edition = edition;
    }

    /**
     * 
     * 
     */
    public String getInstitution() {
        return institution;
    }

    /**
     * 
     * 
     */
    public void setInstitution(String institution) {
        this.institution = institution;
    }

    /**
     * 
     * 
     */
    public String getSeries() {
        return series;
    }

    /**
     * 
     * 
     */
    public void setSeries(String series) {
        this.series = series;
    }

    /**
     * 
     * 
     */
    public String getSeriesNumber() {
        return seriesNumber;
    }

    /**
     * 
     * 
     */
    public void setSeriesNumber(String seriesNumber) {
        this.seriesNumber = seriesNumber;
    }

    /**
     * 
     * 
     */
    public String getChapter() {
        return chapter;
    }

    /**
     * 
     * 
     */
    public void setChapter(String chapter) {
        this.chapter = chapter;
    }

    /**
     * 
     * 
     */
    public List<Person> getEditors() {
        return editors;
    }

    /**
     * 
     * 
     */
    public void setEditors(List<Person> editors) {
        this.editors = editors;
    }

    /**
     * 
     * 
     */
    public String getPublisher() {
        return publisher;
    }

    /**
     * 
     * 
     */
    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    /**
     * 
     * 
     */
    public Map<String, String> getIdentifiers() {
        return identifiers;
    }

    /**
     * 
     * 
     */
    public void setIdentifiers(Map<String, String> identifiers) {
        this.identifiers = identifiers;
    }

    /**
     * 
     * 
     */
    public String getType() {
        return type;
    }

    /**
     * 
     * 
     */
    public void setType(String type) {
        this.type = type;
    }


    @Override
    public String toString() {
        return new StringBuilder().append("profileId: ").append(this.profileId).append("groupId: ").append(this.groupId)
                .append("lastModified").append(this.lastModified).append("tags").append(this.tags)
                .append("read").append(this.read).append("starred").append(this.starred).append("authored").append(this.authored)
                .append("confirmed").append(this.confirmed).append("hidden").append(this.hidden).append("citationKey").append(this.citationKey)
                .append("sourceType").append(this.sourceType).append("language").append(this.language).append("shortTitle").append(this.shortTitle)
                .append("reprintEdition").append(this.reprintEdition).append("genre").append(this.genre).append("country").append(this.country)
                .append("translators").append(this.translators).append("seriesEditor").append(this.seriesEditor).append("code").append(this.code)
                .append("medium").append(this.medium).append("userContext").append(this.userContext).append("patentOwner").append(this.patentOwner)
                .append("patentApplicationNumber").append(this.patentApplicationNumber).append("patentLegalStatus").append(this.patentLegalStatus)
                .append("notes").append(this.notes).append("folderUuids").append(this.folderUuids).append("privatePublication").append(this.privatePublication)
                .append("created").append(this.created).append("accessed").append(this.accessed).append("fileAttached")
                .append(this.fileAttached).append("id").append(this.id).append("month").append(this.month).append("year")
                .append(this.year).append("day").append(this.day).append("_abstract").append(this._abstract)
                .append("source").append(this.source).append("title").append(this.title).append("revision")
                .append(this.revision).append("department").append(this.department).append("authors").append(this.authors)
                .append("keywords").append(this.keywords).append("pages").append(this.pages).append("volume").append(this.volume)
                .append("issue").append(this.issue).append("websites").append(this.websites).append("city")
                .append(this.city).append("edition").append(this.edition).append("institution").append(this.institution)
                .append("series").append(this.series).append("seriesNumber").append(this.seriesNumber)
                .append("chapter").append(this.chapter).append("editors").append(this.editors).append("publisher")
                .append(this.publisher).append("identifiers").append(this.identifiers).append("type").append(this.type).toString();
    }

    @Override
    public int hashCode() {
        return this.toString().hashCode();
    }

    @Override
    public boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if ((other instanceof UserDocument) == false) {
            return false;
        }
        UserDocument rhs = ((UserDocument) other);
        return this.toString().equals(rhs.toString());
    }

}
