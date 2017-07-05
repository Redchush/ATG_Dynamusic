package dynamusic;


import atg.droplet.DropletException;
import atg.repository.RepositoryException;
import atg.repository.servlet.RepositoryFormHandler;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;

import javax.servlet.ServletException;
import java.io.IOException;

public class ArtistFormHandler extends RepositoryFormHandler{

    private SongsManager songsManager;

    @Override
    protected void preDeleteItem(DynamoHttpServletRequest pRequest, DynamoHttpServletResponse pResponse)
            throws ServletException, IOException {

        if (isLoggingDebug()){
            logDebug("preDeleteItem called");
        }

        SongsManager manager = getSongsManager();
//        String userId = getByUserId();
        String userId = getRepositoryItem().getRepositoryId();

        if (manager != null){
            try {
                manager.deleteAlbumsByArtist(userId);
            } catch (RepositoryException e) {
                if (isLoggingError()){
                    logError("Error during delete albums by artist : id = " + userId, e);
                }
                addFormException(new DropletException("Cannot delete albums by artist"));
            }
        }

    }

    public SongsManager getSongsManager() {
        return songsManager;
    }

    public void setSongsManager(SongsManager songsManager) {
        if (isLoggingDebug()){
            logDebug("Was set songsManager " + songsManager );
        }
        this.songsManager = songsManager;
    }


}
