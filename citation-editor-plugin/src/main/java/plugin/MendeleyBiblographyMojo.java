package com.github.aks8m.plugin;

import com.github.aks8m.plugin.client.BibliographyUtility;
import org.apache.maven.plugin.AbstractMojo;
import org.apache.maven.plugin.MojoExecutionException;
import org.apache.maven.plugin.MojoFailureException;
import org.apache.maven.plugins.annotations.Mojo;
import org.apache.maven.plugins.annotations.Parameter;

@Mojo( name = "generatebibliography")
public class MendeleyBiblographyMojo extends AbstractMojo {

    @Parameter(property = "generatebibliography.directoryPath")
    private String directoryPath;

    @Parameter(property = "generatebibliography.groupId")
    private String groupId;

    @Parameter(property = "generatebibliography.tagName")
    private String tagName;

    @Parameter(property = "generatebibliography.secret")
    private String secret;

    @Parameter(property = "generatebibliography.username")
    private String username;

    @Parameter(property = "generatebibliography.password")
    private String password;

    @Parameter(property = "generatebibliography.client_id")
    private String client_id;

    @Parameter(property = "generatebibliography.redirect_uri")
    private String redirect_uri;

    @Override
    public void execute() throws MojoExecutionException, MojoFailureException {
        BibliographyUtility bibliographyUtility = new BibliographyUtility(this.directoryPath, this.groupId, this.tagName, this.secret, this.client_id, this.username, this.password, this.redirect_uri);
        bibliographyUtility.writeBibliography();
    }
}
