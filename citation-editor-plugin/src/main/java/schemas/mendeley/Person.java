
package schemas.mendeley;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;


/**
 * Person
 * <p>
 * A document that is stored in a Mendeley user's library.
 * 
 */
public class Person {

    /**
     * 
     * 
     */
    @SerializedName("first_name")
    @Expose
    private String firstName;
    /**
     * 
     * 
     */
    @SerializedName("last_name")
    @Expose
    private String lastName;
    /**
     * 
     * 
     */
    @SerializedName("scopus_author_id")
    @Expose
    private String scopusAuthorId;

    /**
     * 
     * 
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * 
     * 
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * 
     * 
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * 
     * 
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    /**
     * 
     * 
     */
    public String getScopusAuthorId() {
        return scopusAuthorId;
    }

    /**
     * 
     * 
     */
    public void setScopusAuthorId(String scopusAuthorId) {
        this.scopusAuthorId = scopusAuthorId;
    }

    @Override
    public String toString() {
        return new StringBuilder().append("firstName: ").append(this.firstName).append("lastName: ")
                .append(this.lastName).append("scopusAuthorId: ").append(this.scopusAuthorId).toString();
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
        if ((other instanceof Person) == false) {
            return false;
        }
        Person rhs = ((Person) other);
        return this.toString().equals(rhs.toString());
    }

}
