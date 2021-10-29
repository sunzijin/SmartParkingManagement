package com.smart.module.car.util;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;
import java.util.Map;

public class JSONUtil {

    /**
     * map转json对象
     * @param map
     * @return
     * @throws JsonProcessingException
     */

    public static String map2json(Map map) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();

        String jsonStr = "";
        jsonStr = mapper.writeValueAsString(map);

        return jsonStr;
    }

    /*
     * json转换成对象
     * @param:传入对象，json字符串
     * @return:Object
     */
    public static Object jsonToObj(Object obj, String jsonStr) throws JsonParseException, JsonMappingException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        return obj = mapper.readValue(jsonStr, obj.getClass());
    }

    /*
     * 对象转换成json
     * @param:传入对象
     * @return:json字符串
     */
    public static String objToJson(Object obj) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        return mapper.writeValueAsString(obj);
    }
}
