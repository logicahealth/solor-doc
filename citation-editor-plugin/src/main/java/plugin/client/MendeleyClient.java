package plugin.client;

import schemas.mendeley.UserDocument;
import com.google.gson.Gson;
import org.apache.http.auth.AuthenticationException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Arrays;

class MendeleyClient {

    private final MendeleyOAuth2 mendeleyOAuth2;
    private final String groupId;

    public MendeleyClient(String groupId, String secret, String client_id, String username, String password, String redirect_uri) {
        this.mendeleyOAuth2 = new MendeleyOAuth2(client_id, redirect_uri, username, password, secret);
        this.groupId = groupId;

        authenticate();
    }


    private void authenticate() {
        try {
            this.mendeleyOAuth2.runAuthenticate();
        } catch (IOException | URISyntaxException | AuthenticationException exception){
            exception.printStackTrace();
        }
    }

    public ArrayList<UserDocument> generateDocbookBibliography(){

        ArrayList<UserDocument> userDocuments = new ArrayList<>();

        try {
            CloseableHttpClient client = HttpClients.createDefault();
            URI uri = new URIBuilder()
                    .setScheme("https")
                    .setHost("api.mendeley.com")
                    .setPath("/documents")
                    .setParameter("view", "all")
                    .setParameter("group_id", groupId)
                    .setParameter("limit", "500")
                    .build();
            HttpGet httpGet = new HttpGet(uri);
            httpGet.setHeader("Authorization", "Bearer " + this.mendeleyOAuth2.getAccess_token());

            CloseableHttpResponse response = client.execute(httpGet);

            String json = EntityUtils.toString(response.getEntity(), Charset.forName("UTF-8"));
            userDocuments.addAll(Arrays.asList(new Gson().fromJson(json, UserDocument[].class)));

            client.close();

        }catch (IOException | URISyntaxException  exception){
            exception.printStackTrace();
        }

        return userDocuments;
    }

}
