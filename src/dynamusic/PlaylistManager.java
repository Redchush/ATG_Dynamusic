package dynamusic;


import atg.dtm.TransactionDemarcation;
import atg.dtm.TransactionDemarcationException;
import atg.nucleus.GenericService;
import atg.repository.*;

import javax.transaction.SystemException;
import javax.transaction.TransactionManager;
import java.util.Collection;

public class PlaylistManager extends GenericService {


    private Repository userRepository;
    private Repository songsRepository;
    private TransactionManager transactionManager;

    private String _addPlaylistMsgTmpl = "adding playlist=%s to user=%s";
    private String _addSongMsgTmpl = "adding song=%s to playlist=%s";

    private static final String PLAYLIST_PROP = "playlists";
    private static final String SONGS_PROP = "songs";

    private static final String USER_TYPE = "user";
    private static final String PLAYLIST_TYPE = "playlist";
    private static final String SONG_TYPE = "song";



    public void addPlaylistToUser(String playlistId, String userId)  {

        if (isLoggingDebug()){
            logDebug(String.format(_addPlaylistMsgTmpl, playlistId, userId));
        }
        MutableRepository userRepo = (MutableRepository) getUserRepository();
        TransactionDemarcation td = new TransactionDemarcation();

        try {
            td.begin(getTransactionManager(), TransactionDemarcation.REQUIRED);

            RepositoryItem playlist = userRepo.getItem(playlistId, PLAYLIST_TYPE);

            MutableRepositoryItem user = userRepo.getItemForUpdate(userId, USER_TYPE);
            Collection userPlaylists = (Collection) user.getPropertyValue(PLAYLIST_PROP);

            userPlaylists.add(playlist);
            user.setPropertyValue(PLAYLIST_PROP, userPlaylists);
            userRepo.updateItem(user);

        } catch (RepositoryException e) {
            _handleExceptionPlaylist(playlistId, userId,e);
        } catch (TransactionDemarcationException e) {
            _handleExceptionPlaylist(playlistId, userId,e);
        } finally {
            _handleFinal(td, "No playlist added");
        }


    }

    public void addSongToPlaylist(String playlistId, String songId)  {
        if (isLoggingDebug()){
            logDebug(String.format(_addSongMsgTmpl, songId, playlistId));
        }

        MutableRepository userRepo = (MutableRepository) getUserRepository();
        TransactionDemarcation td = new TransactionDemarcation();
        try {
            td.begin(getTransactionManager(), TransactionDemarcation.REQUIRED);

            RepositoryItem song = getSongsRepository().getItem(songId, SONG_TYPE);
            MutableRepositoryItem playlist = userRepo.getItemForUpdate(playlistId, PLAYLIST_TYPE);

            Collection playlistSongs = (Collection) playlist.getPropertyValue(SONGS_PROP);

            playlistSongs.add(song);

            playlist.setPropertyValue(SONGS_PROP, playlistSongs);
            userRepo.updateItem(playlist);

        } catch (RepositoryException e) {
           _handleExceptionSong(songId, playlistId, e);
        } catch (TransactionDemarcationException e) {
           _handleExceptionSong(songId, playlistId, e);
        } finally {
           _handleFinal(td, "No songs added");
        }

    }

    private void _handleExceptionPlaylist(String playlistId, String userId, Throwable e){
        if (isLoggingError()){
            logError("Exception during " + String.format(_addPlaylistMsgTmpl, playlistId, userId), e);
        }
        try {
            getTransactionManager().setRollbackOnly();
        } catch (SystemException e1) {
            if (isLoggingError()){
                logError("Fail to rollback after " + String.format(_addPlaylistMsgTmpl, playlistId, userId), e);
            }
        }
    }

    private void _handleExceptionSong(String songId, String playlistId, Throwable e){
        if (isLoggingError()){
            logError("Exception during " + String.format(_addSongMsgTmpl, songId, playlistId), e);
        }
        try {
            getTransactionManager().setRollbackOnly();
        } catch (SystemException e1) {
            if (isLoggingError()){
                logError("Fail to rollback after " + String.format(_addSongMsgTmpl, songId, playlistId), e);
            }
        }
    }

    private void _handleFinal(TransactionDemarcation td, String msg){
        try {
            td.end();
        } catch (TransactionDemarcationException e) {
            if (isLoggingError())
                logError("creating transaction demarcation failed" + msg, e);
        }
    }


    public Repository getUserRepository() {
        return userRepository;
    }

    public void setUserRepository(Repository userRepository) {
        this.userRepository = userRepository;
    }

    public Repository getSongsRepository() {
        return songsRepository;
    }

    public void setSongsRepository(Repository songsRepository) {
        this.songsRepository = songsRepository;
    }

    public TransactionManager getTransactionManager() {
        return transactionManager;
    }

    public void setTransactionManager(TransactionManager transactionManager) {
        this.transactionManager = transactionManager;
    }
}
