package com.demo.utils;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import io.swagger.models.auth.In;

import javax.net.ssl.SSLException;
import java.io.*;
import java.lang.reflect.Array;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Random;

public class FaceUtils {
    private final static String API_KEY = "pNjNWupWwaxJg_I1VGYworC_tWi9u4H_";
    private final static String API_SECRET = "ijnvN-eRxrPOhs-TSbVyAWTxyVN0ytYb";

    // 键代表 FaceSet 的唯一标识，即outer_id；值代表该 FaceSet 是否存在
    private static HashMap<String, Boolean> facesSets;

    /**
     * 创建一个人脸的集合 FaceSet，用于存储人脸标识 face_token
     * @param elderId 老人的唯一标识ID
     * @param elderName 老人的姓名
     * @return 返回操作是否成功
     */
    public static Boolean createFaceSet(String elderId, String elderName) throws Exception {
        if(facesSets.get("elderId") != null) {
            return false;
            //说明已经存在，
        }
        String url = "https://api-cn.faceplusplus.com/facepp/v3/faceset/create";
        HashMap<String, byte[]> byteMap = new HashMap<>();
        HashMap<String, String> map = new HashMap<>();
        map.put("api_key", API_KEY);
        map.put("api_secret", API_SECRET);
        map.put("outer_id", elderId);
        map.put("display_name", elderName);
        try{
            byte[] bacd = post(url, map, byteMap);
            /*String str = new String(bacd);
            System.out.println(str);*/
        }catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }

    /**
     * 为一个已经创建的 FaceSet 添加人脸标识 face_token
     * @param face_tokens 人脸标识
     * @param elderId 老人的唯一标识，即他所对应的 FaceSet 标识
     * @return 返回操作结束后 FaceSet 中的 face_token 总数量
     */
    public static Integer addFace(String face_tokens, String elderId) throws Exception{
        String url = "https://api-cn.faceplusplus.com/facepp/v3/faceset/addface";
        HashMap<String, byte[]> byteMap = new HashMap<>();
        HashMap<String, String> map = new HashMap<>();
        map.put("api_key", API_KEY);
        map.put("api_secret", API_SECRET);
        map.put("face_tokens", face_tokens);
        map.put("outer_id", elderId);
        Integer res = -1;
        try{
            byte[] bacd = post(url, map, byteMap);
            String str = new String(bacd);
            //System.out.println(str);
            JSONObject jsonObj = JSONObject.parseObject(str);
            res = jsonObj.getInteger("face_count");
        }catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }

    /**
     * 传入图片进行人脸检测和人脸分析，获取该人脸的唯一标识 face_token
     * @return 人脸的标识
     * @throws Exception
     */
    public static String getFaceToken() throws Exception{
        //对应的API
        String url = "https://api-cn.faceplusplus.com/facepp/v3/detect";

        //获取文件对应的字节数组
        File file = new File("你的本地图片路径");
        HashMap<String, byte[]> byteMap = new HashMap<>();
        byteMap.put("image_file", getBytesFromFile(file));

        //请求参数
        HashMap<String, String> map = new HashMap<>();
        map.put("api_key", API_KEY);
        map.put("api_secret", API_SECRET);
        map.put("return_landmark", "1");
        map.put("return_attributes", "gender,age,smiling,headpose,facequality,blur,eyestatus,emotion,ethnicity,beauty,mouthstatus,eyegaze,skinstatus");

        //String res = null;
        String face_token = null;
        try{
            byte[] bacd = post(url, map, byteMap);
            String str = new String(bacd);
            //System.out.println(str);
            JSONArray faces = JSONObject.parseObject(str).getJSONArray("faces");
            face_token = faces.getJSONObject(0).getString("face_token");
        }catch (Exception e) {
            e.printStackTrace();
        }
        return face_token;
    }

    /**
     * 在一个已有的 FaceSet 中找出与目标人脸最相似的一张或多张人脸，返回置信度
     * @param outer_id 用户自定义的 FaceSet 标识
     * @return 比对结果置信度
     * @throws Exception
     */

    public static Double searchFace(String outer_id) throws Exception{
        String url = "https://api-cn.faceplusplus.com/facepp/v3/detect";

        File file = new File("你的本地图片路径");
        HashMap<String, byte[]> byteMap = new HashMap<>();
        byteMap.put("image_file", getBytesFromFile(file));

        HashMap<String, String> map = new HashMap<>();
        map.put("api_key", API_KEY);
        map.put("api_secret", API_SECRET);
        map.put("outer_id", outer_id);

        Double confidence = 0.0;
        try{
            byte[] bacd = post(url, map, byteMap);
            String str = new String(bacd);
            //System.out.println(str);
            JSONArray results = JSONObject.parseObject(str).getJSONArray("results");
            confidence = results.getJSONObject(0).getDouble("confidence");
        }catch (Exception e) {
            e.printStackTrace();
        }
        return confidence;
    }

    private final static int CONNECT_TIME_OUT = 30000;
    private final static int READ_OUT_TIME = 50000;
    private static String boundaryString = getBoundary();
    protected static byte[] post(String url, HashMap<String, String> map, HashMap<String, byte[]> fileMap) throws Exception {
        HttpURLConnection conne;
        URL url1 = new URL(url);
        conne = (HttpURLConnection) url1.openConnection();
        conne.setDoOutput(true);
        conne.setUseCaches(false);
        conne.setRequestMethod("POST");
        conne.setConnectTimeout(CONNECT_TIME_OUT);
        conne.setReadTimeout(READ_OUT_TIME);
        conne.setRequestProperty("accept", "*/*");
        conne.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundaryString);
        conne.setRequestProperty("connection", "Keep-Alive");
        conne.setRequestProperty("user-agent", "Mozilla/4.0 (compatible;MSIE 6.0;Windows NT 5.1;SV1)");
        DataOutputStream obos = new DataOutputStream(conne.getOutputStream());
        Iterator iter = map.entrySet().iterator();
        while(iter.hasNext()){
            Map.Entry<String, String> entry = (Map.Entry) iter.next();
            String key = entry.getKey();
            String value = entry.getValue();
            obos.writeBytes("--" + boundaryString + "\r\n");
            obos.writeBytes("Content-Disposition: form-data; name=\"" + key
                    + "\"\r\n");
            obos.writeBytes("\r\n");
            obos.writeBytes(value + "\r\n");
        }
        if(fileMap != null && fileMap.size() > 0){
            Iterator fileIter = fileMap.entrySet().iterator();
            while(fileIter.hasNext()){
                Map.Entry<String, byte[]> fileEntry = (Map.Entry<String, byte[]>) fileIter.next();
                obos.writeBytes("--" + boundaryString + "\r\n");
                obos.writeBytes("Content-Disposition: form-data; name=\"" + fileEntry.getKey()
                        + "\"; filename=\"" + encode(" ") + "\"\r\n");
                obos.writeBytes("\r\n");
                obos.write(fileEntry.getValue());
                obos.writeBytes("\r\n");
            }
        }
        obos.writeBytes("--" + boundaryString + "--" + "\r\n");
        obos.writeBytes("\r\n");
        obos.flush();
        obos.close();
        InputStream ins = null;
        int code = conne.getResponseCode();
        try{
            if(code == 200){
                ins = conne.getInputStream();
            }else{
                ins = conne.getErrorStream();
            }
        }catch (SSLException e){
            e.printStackTrace();
            return new byte[0];
        }
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        byte[] buff = new byte[4096];
        int len;
        while((len = ins.read(buff)) != -1){
            baos.write(buff, 0, len);
        }
        byte[] bytes = baos.toByteArray();
        ins.close();
        return bytes;
    }
    private static String getBoundary() {
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        for(int i = 0; i < 32; ++i) {
            sb.append("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_-".charAt(random.nextInt("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_".length())));
        }
        return sb.toString();
    }
    private static String encode(String value) throws Exception{
        return URLEncoder.encode(value, "UTF-8");
    }
    public static byte[] getBytesFromFile(File f) {
        if (f == null) {
            return null;
        }
        try {
            FileInputStream stream = new FileInputStream(f);
            ByteArrayOutputStream out = new ByteArrayOutputStream(1000);
            byte[] b = new byte[1000];
            int n;
            while ((n = stream.read(b)) != -1) {
                out.write(b, 0, n);
            }
            stream.close();
            out.close();
            return out.toByteArray();
        } catch (IOException e) {
        }
        return null;
    }

}
