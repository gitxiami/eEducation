package io.agora.education.service;

import io.agora.education.service.bean.ResponseBody;
import io.agora.education.service.bean.request.RoomEntryReq;
import io.agora.education.service.bean.request.UserReq;
import io.agora.education.service.bean.response.RoomEntryRes;
import io.agora.education.service.bean.response.RoomRes;
import retrofit2.Call;
import retrofit2.http.Body;
import retrofit2.http.GET;
import retrofit2.http.POST;
import retrofit2.http.Path;

public interface RoomService {

    @POST("/edu/v1/apps/{appId}/room/entry")
    Call<ResponseBody<RoomEntryRes>> roomEntry(
            @Path("appId") String appId,
            @Body RoomEntryReq body
    );

    @POST("/edu/v1/apps/{appId}/room/{roomId}/user/{userId}")
    Call<ResponseBody<Boolean>> user(
            @Path("appId") String appId,
            @Path("roomId") String roomId,
            @Path("userId") String userId,
            @Body UserReq body
    );

    @GET("/edu/v1/apps/{appId}/room/{roomId}")
    Call<ResponseBody<RoomRes>> room(
            @Path("appId") String appId,
            @Path("roomId") String roomId
    );

}