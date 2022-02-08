package com.mycompany.myapp.handler;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.mycompany.myapp.vo.ChatVO;

@Repository
public class ChatRoomRepository {
	private Map<String, ChatRoom> chatRoomMap;

    private void init(){
        chatRoomMap = new LinkedHashMap<>();
    }
    public ChatRoom findRoomById(int id){
        return chatRoomMap.get(id);
    }
    public ChatRoom createChatRoom(String name){
        ChatRoom chatRoom = ChatRoom.create(name);
        chatRoomMap.put(chatRoom.getRoomId(), chatRoom);
        return chatRoom;
    }
}
