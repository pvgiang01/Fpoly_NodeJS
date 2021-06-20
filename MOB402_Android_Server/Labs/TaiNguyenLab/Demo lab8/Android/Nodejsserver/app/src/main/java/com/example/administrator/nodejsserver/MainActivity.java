package com.example.administrator.nodejsserver;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
//Import SocketIO
import com.github.nkzawa.socketio.client.IO;
import com.github.nkzawa.socketio.client.Socket;

import java.net.URISyntaxException;

public class MainActivity extends AppCompatActivity {

    private Socket mSocket;
    {
        try {
            //Gọi port từ IP Lan hoặc Wifi
            //Lưu ý đây là port Wifi do máy mình phát ra
            mSocket = IO.socket("http://192.168.210.1:3000");
        } catch (URISyntaxException e) {}
    }
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        //Kết nối tới SocketIO
        mSocket.connect();
    }
}


