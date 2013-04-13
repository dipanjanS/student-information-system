package com.studentzone.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySqlConnection {
        String driverClassName = RuntimeSettings.driverClass;
        String connectionUrl = "jdbc:mysql://" + RuntimeSettings.SERVER_IP + "/" +
        		RuntimeSettings.databaseName;
        String dbUser = RuntimeSettings.dbUserID;
        String dbPwd = RuntimeSettings.dbPassword;

        private static MySqlConnection connectionFactory = null;

        public MySqlConnection() {
                try {
                        Class.forName(driverClassName);
                } catch (ClassNotFoundException e) {
                        e.printStackTrace();
                }
        }

        public Connection getConnection() throws SQLException {
                Connection conn = null;
                conn = DriverManager.getConnection(connectionUrl, dbUser,dbPwd);
                return conn;
        }

        public static MySqlConnection getInstance() {
                if (connectionFactory == null) {
                        connectionFactory = new MySqlConnection();
                }
                return connectionFactory;
        }
}