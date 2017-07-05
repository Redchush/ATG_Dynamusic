package dynamusic;

import atg.dtm.TransactionDemarcation;
import atg.dtm.TransactionDemarcationException;
import atg.repository.*;
import atg.repository.rql.*;


import atg.nucleus.GenericService;

import javax.transaction.SystemException;
import javax.transaction.TransactionManager;
import java.util.Arrays;

public class SongsManager extends GenericService {

    private Repository repository;
    private TransactionManager transactionManager;

    public SongsManager() {}

    public void deleteAlbumsByArtist(String pArtistId) throws RepositoryException {

        if (isLoggingDebug()){
            logDebug("artist " + pArtistId + " processing for delet");
        }

        MutableRepository mutRepos = (MutableRepository)getRepository();

        TransactionDemarcation td = new TransactionDemarcation();
        try {
            td.begin(getTransactionManager(), TransactionDemarcation.REQUIRED);

            Repository repo = getRepository();
            RepositoryView albumView = repo.getView("album");
            Object rqlparams[] = new Object[1];
            rqlparams[0] = pArtistId;

            RqlStatement findAlbumsRQL = RqlStatement.parseRqlStatement("artist.id = ?0");

            RepositoryItem[] albumList = findAlbumsRQL.executeQuery(albumView, rqlparams);

            if (isLoggingDebug()) {
                logDebug("delete albums: " + Arrays.toString(albumList));
            }
            if (albumList != null){
                for (RepositoryItem anAlbumList : albumList) {
                    if (isLoggingDebug()) {
                        logDebug("delete album " + anAlbumList);
                        mutRepos.removeItem(anAlbumList.getRepositoryId(), "album");
                    }
                }
            }
        } catch (TransactionDemarcationException e) {
            if (isLoggingError()){
                logError("Exception during deleting albums by artist", e);
            }
            try {
                getTransactionManager().setRollbackOnly();
            } catch (SystemException e1) {
                if (isLoggingError()){
                    logError("Fail to rollback", e);
                }
            }

        } finally {
            try {
                td.end();
            } catch (TransactionDemarcationException e) {
                if (isLoggingError())
                    logError("creating transaction demarcation failed, no albums deleted", e);
            }
        }
    }

    public Repository getRepository() {
        if (isLoggingDebug()){
            logDebug("get repo");
        }
        return repository;
    }

    public void setRepository(Repository repository) {
        if (isLoggingDebug()){
            logDebug("set repo" + repository);
        }
        this.repository = repository;
    }

    public TransactionManager getTransactionManager() {
        return transactionManager;
    }

    public void setTransactionManager(TransactionManager transactionManager) {
        this.transactionManager = transactionManager;
    }
}
