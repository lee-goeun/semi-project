package com.mycompany.myapp.handler;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Repository;

import com.mycompany.myapp.vo.ChatVO;

@Repository
public class ChatRoomRepository {
	private static Map<String, ChatRoom> chatRoomMap;
	
	@PostConstruct
    private void init(){
        chatRoomMap = new LinkedHashMap<>();    
    }
    
    public static ChatRoom findRoomById(String id){
        return chatRoomMap.get(id);
    }
    
    public static void checkRoom(String id) {
    	if(chatRoomMap.get(id) == null) {
    		createChatRoom(id);
    	}else {
    		findRoomById(id);
    	}
    }
    
    public static ChatRoom createChatRoom(String postId){
        ChatRoom chatRoom = ChatRoom.create(postId);
        chatRoomMap.put(postId, chatRoom);
        return chatRoom;
    }
}
