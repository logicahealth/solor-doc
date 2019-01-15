package plugin.client;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import org.apache.http.NameValuePair;
import org.apache.http.auth.AuthenticationException;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.client.utils.URLEncodedUtils;
import org.apache.http.impl.auth.BasicScheme;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * 11/20/18
 * author: aks8m
 *
 * Implementing oAuth2 approach : https://dev.mendeley.com/reference/topics/authorization_auth_code.html
 *
 * Using Apache HTTPComponents
 *
 */

class MendeleyOAuth2 {

    private String stateNumber;
    private final String client_id;
    private final String redirect_uri;
    private final String username;
    private final String password;
    private final String secret;
    private String authCode;
    private JsonObject accessTokenJsonObject;
    private String access_token;
    private String expires_in;
    private String refresh_token;
    private String token_type;


    public MendeleyOAuth2(String client_id, String redirect_uri, String username, String password, String secret) {
        this.client_id = client_id;
        this.redirect_uri = redirect_uri;
        this.username = username;
        this.password = password;
        this.secret = secret;
    }

    public String getAccess_token() {
        return access_token;
    }

    public String getExpires_in() {
        return expires_in;
    }

    public String getRefresh_token() {
        return refresh_token;
    }

    public String getToken_type() {
        return token_type;
    }

    public void runAuthenticate()throws IOException, URISyntaxException, AuthenticationException{
            captureAuthorizationCode();
            exchangeAuthorizationCode();
            extractAccessToken();
    }

    private String generateNewState(){
        return String.valueOf(new Random().nextDouble());
    }

    private void captureAuthorizationCode() throws IOException, URISyntaxException {

        generateNewState();

        URI uri = new URIBuilder()
                .setScheme("https")
                .setHost("api.mendeley.com")
                .setPath("/oauth/authorize")
                .setParameter("client_id", this.client_id)
                .setParameter("redirect_uri", this.redirect_uri)
                .setParameter("response_type", "code")
                .setParameter("scope", "all")
                .setParameter("state", String.valueOf(stateNumber))
                .build();

        CloseableHttpClient client = HttpClients.createDefault();
        HttpPost httpPost = new HttpPost(uri);

        List<NameValuePair> params = new ArrayList<>();
        params.add(new BasicNameValuePair("username", this.username));
        params.add(new BasicNameValuePair("password", this.password));
        httpPost.setEntity(new UrlEncodedFormEntity(params));

        try {

            CloseableHttpResponse response = client.execute(httpPost);
            this.authCode = URLEncodedUtils.parse(response.getFirstHeader("Location").getValue(),
                    Charset.forName("UTF-8")).get(0).getValue();

        }finally {
            client.close();
        }
    }

    private void exchangeAuthorizationCode() throws IOException, AuthenticationException {

        CloseableHttpClient client = HttpClients.createDefault();
        HttpPost httpPost = new HttpPost("https://api.mendeley.com/oauth/token");

        UsernamePasswordCredentials creds
                = new UsernamePasswordCredentials(this.client_id, this.secret);
        httpPost.addHeader(new BasicScheme().authenticate(creds, httpPost, null));

        List<NameValuePair> params = new ArrayList<>();
        params.add(new BasicNameValuePair("grant_type", "authorization_code"));
        params.add(new BasicNameValuePair("code", this.authCode));
        params.add(new BasicNameValuePair("redirect_uri", this.redirect_uri));
        httpPost.setEntity(new UrlEncodedFormEntity(params));

        try {
            CloseableHttpResponse response = client.execute(httpPost);
            JsonElement jsonResponse = new JsonParser()
                    .parse(EntityUtils.toString(response.getEntity()));
            if(jsonResponse.isJsonObject())
                this.accessTokenJsonObject = jsonResponse.getAsJsonObject();

        }finally {
            client.close();
        }
    }

    private void extractAccessToken(){

        this.access_token = this.accessTokenJsonObject.get("access_token").getAsString();
        this.expires_in = this.accessTokenJsonObject.get("expires_in").getAsString();
        this.refresh_token = this.accessTokenJsonObject.get("refresh_token").getAsString();
        this.token_type = this.accessTokenJsonObject.get("token_type").getAsString();

    }
}
