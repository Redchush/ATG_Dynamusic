package dynamusic;


import atg.repository.servlet.RepositoryFormHandler;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;

import javax.servlet.ServletException;
import java.io.IOException;

public class PlaylistFormHandler extends RepositoryFormHandler {

    private String songId;
    private String userId;
    private String addSongSuccessURL;
    private String addSongErrorURL;
    private PlaylistManager playlistManager;

    @Override
    protected void postCreateItem(DynamoHttpServletRequest pRequest, DynamoHttpServletResponse pResponse)
            throws ServletException, IOException {
        if (isLoggingDebug()){
            logDebug("postCreateItem called, item created: " + getRepositoryItem());
        }
        if (getPlaylistManager() != null){
            getPlaylistManager().addPlaylistToUser(getRepositoryId(), getUserId());
        } else {
            if (isLoggingWarning()){
                logWarning("PlaylistManager not set");
            }
        }
    }

    public boolean handleAddSong (DynamoHttpServletRequest request,
                                  DynamoHttpServletResponse response)
            throws java.io.IOException
    {
        if (isLoggingDebug())
            logDebug("handleAddSong called");

        if (getFormError()) {
            if (getAddSongErrorURL() != null) {
                if (isLoggingDebug()){
                    logDebug("redirecting to " + getAddSongErrorURL());
                }
                response.sendLocalRedirect(getAddSongErrorURL(),request);
                return false;
            }
            else return true;
        }

        PlaylistManager pm = getPlaylistManager();
        pm.addSongToPlaylist(getRepositoryId(),getSongId());

        if (getAddSongSuccessURL() != null) {
            if (isLoggingDebug()) {
                logDebug("redirecting to " + getAddSongSuccessURL());
            }
            response.sendLocalRedirect(getAddSongSuccessURL(), request);
            return false;
        }
        return true;

    }


    public String getSongId() {
        return songId;
    }

    public void setSongId(String songId) {
        this.songId = songId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getAddSongSuccessURL() {
        return addSongSuccessURL;
    }

    public void setAddSongSuccessURL(String addSongSuccessURL) {
        this.addSongSuccessURL = addSongSuccessURL;
    }

    public String getAddSongErrorURL() {
        return addSongErrorURL;
    }

    public void setAddSongErrorURL(String addSongErrorURL) {
        this.addSongErrorURL = addSongErrorURL;
    }

    public PlaylistManager getPlaylistManager() {
        return playlistManager;
    }

    public void setPlaylistManager(PlaylistManager playlistManager) {
        this.playlistManager = playlistManager;
    }
}
