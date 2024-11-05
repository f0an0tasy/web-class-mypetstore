package org.csu.mypetstore.service;

//import org.csu.mypetstore.domain.Log;
import org.csu.mypetstore.domain.Account;
import org.csu.mypetstore.domain.Log;
import org.csu.mypetstore.persistence.Impl.LogDAOImpl;
import org.csu.mypetstore.persistence.LogDAO;

import java.text.SimpleDateFormat;
import java.util.Date;

public class LogService {
    Log log;
    private LogDAO logDAO;

    public LogService(){
        log = new Log();
        logDAO = new LogDAOImpl();
    }



    public void insertLogInfo(Account acount,String username, String logInfo){
        SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date(System.currentTimeMillis());

        if(acount != null)//如果用户已经登录
            logDAO.insertLog(username, formatter.format(date)+logInfo);
    }
    public void insertLogInfo(String username, String logInfo){
        logDAO.insertLog(username, logInfo);
    }
}
