
package schemas.mendeley;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;


/**
 * UUID
 * <p>
 * A document that is stored in a Mendeley user's library.
 * 
 */
public class Uuid {

    /**
     * 
     * 
     */
    @SerializedName("leastSignificantBits")
    @Expose
    private Integer leastSignificantBits;
    /**
     * 
     * 
     */
    @SerializedName("mostSignificantBits")
    @Expose
    private Integer mostSignificantBits;

    /**
     * 
     * 
     */
    public Integer getLeastSignificantBits() {
        return leastSignificantBits;
    }

    /**
     * 
     * 
     */
    public void setLeastSignificantBits(Integer leastSignificantBits) {
        this.leastSignificantBits = leastSignificantBits;
    }

    /**
     * 
     * 
     */
    public Integer getMostSignificantBits() {
        return mostSignificantBits;
    }

    /**
     * 
     * 
     */
    public void setMostSignificantBits(Integer mostSignificantBits) {
        this.mostSignificantBits = mostSignificantBits;
    }

    @Override
    public String toString() {
        return new StringBuilder().append("leastSignificantBits: ").append(this.leastSignificantBits)
                .append("mostSignificantBits: ").append(this.mostSignificantBits).toString();
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
        if ((other instanceof Uuid) == false) {
            return false;
        }
        Uuid rhs = ((Uuid) other);
        return this.toString().equals(rhs.toString());
    }

}
