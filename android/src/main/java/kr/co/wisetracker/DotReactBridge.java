package kr.co.wisetracker;

import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.sdk.wisetracker.base.model.User;
import com.sdk.wisetracker.dot.open.api.DOT;
import com.sdk.wisetracker.dot.open.model.Click;
import com.sdk.wisetracker.dot.open.model.Conversion;
import com.sdk.wisetracker.dot.open.model.Page;
import com.sdk.wisetracker.dot.open.model.Purchase;
import com.sdk.wisetracker.dox.open.api.DOX;
import com.sdk.wisetracker.dox.open.model.XConversion;
import com.sdk.wisetracker.dox.open.model.XEvent;
import com.sdk.wisetracker.dox.open.model.XIdentify;
import com.sdk.wisetracker.dox.open.model.XProduct;
import com.sdk.wisetracker.dox.open.model.XProperties;
import com.sdk.wisetracker.dox.open.model.XPurchase;

import org.json.JSONArray;
import org.json.JSONObject;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Nonnull;

public class DotReactBridge extends ReactContextBaseJavaModule {

    private final String TAG = "DotReactBridge";

    public BridgeModule(@Nonnull ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @Nonnull
    @Override
    public String getName() {
        return "DotReactBridge";
    }

    @ReactMethod
    public void initialization() {
        try {
            DOT.initialization(getReactApplicationContext());
        } catch (Exception e) {
            Log.e(TAG, "initialization error !!", e);
        }
    }

    @ReactMethod
    public void setPushReceiver(Intent intent) {
        try {
            DOT.setPushReceiver(getReactApplicationContext(), intent);
        } catch (Exception e) {
            Log.e(TAG, "set push receiver error !!", e);
        }
    }

    @ReactMethod
    public void setPushClick(Intent intent) {
        try {
            DOT.setPushClick(getReactApplicationContext(), intent);
        } catch (Exception e) {
            Log.e(TAG, "set push click error !!", e);
        }
    }

    @ReactMethod
    public void setDeepLink(Intent intent) {
        try {
            if (intent == null) {
                return;
            }
            DOT.setDeepLink(getReactApplicationContext(), intent);
        } catch (Exception e) {
            Log.e(TAG, "set deep link error !!", e);
        }
    }

    @ReactMethod
    public void setDeepLink(String url) {
        try {
            DOT.setDeepLink(getReactApplicationContext(), url);
        } catch (Exception e) {
            Log.e(TAG, "set deep link error !!", e);
        }
    }

    @ReactMethod
    public void setInstallReferrer(String url, Long beginTime) {
        try {
            DOT.setInstallReferrer(getReactApplicationContext(), url, beginTime);
        } catch (Exception e) {
            Log.e(TAG, "set install referrer error !!", e);
        }
    }

    @ReactMethod
    public void setFacebookReferrerData(Bundle bundle) {
        try {
            DOT.setFacebookReferrer(getReactApplicationContext(), bundle);
        } catch (Exception e) {
            Log.e(TAG, "set facebook referrer error !!", e);
        }
    }

    @ReactMethod
    public void setPushToken(String pushToken) {
        try {
            DOT.setPushToken(pushToken);
        } catch (Exception e) {
            Log.e(TAG, "set push token error !!", e);
        }
    }

    @ReactMethod
    public void setUser(String json) {
        try {
            if (TextUtils.isEmpty(json)) {
                Log.d(TAG, "user data is null or empty");
                return;
            }
            User user = new Gson().fromJson(json, User.class);
            if (user == null) {
                Log.d(TAG, "user gson converter is null");
                return;
            }
            DOT.setUser(user);
        } catch (Exception e) {
            Log.e(TAG, "set user error !!", e);
        }
    }

    @ReactMethod
    public void setUserLogout() {
        DOT.setUserLogout();
    }

    @ReactMethod
    public void onStartPage() {
        DOT.onStartPage(getReactApplicationContext());
    }

    @ReactMethod
    public void onStopPage() {
        DOT.onStopPage(getReactApplicationContext());
    }

    @ReactMethod
    public void setPage(String json) {
        try {
            if (TextUtils.isEmpty(json)) {
                Log.d(TAG, "page data is null or empty");
                return;
            }
            Page page = new Gson().fromJson(json, Page.class);
            if (page == null) {
                Log.d(TAG, "page gson converter is null");
                return;
            }
            DOT.setPage(page);
        } catch (Exception e) {
            Log.e(TAG, "set page error !!", e);
        }
    }

    @ReactMethod
    public void setPurchase(String json) {
        try {
            if (TextUtils.isEmpty(json)) {
                Log.d(TAG, "purchase data is null or empty");
                return;
            }
            Purchase purchase = new Gson().fromJson(json, Purchase.class);
            if (purchase == null) {
                Log.d(TAG, "purchase gson converter is null");
                return;
            }
            DOT.setPurchase(purchase);
        } catch (Exception e) {
            Log.e(TAG, "set purchase error !!", e);
        }
    }

    @ReactMethod
    public void setConversion(String json) {
        try {
            if (TextUtils.isEmpty(json)) {
                Log.d(TAG, "conversion data is null or empty");
                return;
            }
            Conversion conversion = new Gson().fromJson(json, Conversion.class);
            if (conversion == null) {
                Log.d(TAG, "conversion gson converter is null");
                return;
            }
            DOT.setConversion(conversion);
        } catch (Exception e) {
            Log.e(TAG, "set conversion error !!", e);
        }
    }

    @ReactMethod
    public void setClick(String json) {
        try {
            if (TextUtils.isEmpty(json)) {
                Log.d(TAG, "click data is null or empty");
                return;
            }
            Click click = new Gson().fromJson(json, Click.class);
            if (click == null) {
                Log.d(TAG, "click gson converter is null");
                return;
            }
            DOT.setClick(click);
        } catch (Exception e) {
            Log.e(TAG, "set click error !!", e);
        }
    }

    @ReactMethod
    public void userIdentify(String json) {

        try {

            if (TextUtils.isEmpty(json)) {
                Log.d(TAG, "user identify is null or empty");
                return;
            }

            XIdentify xIdentify = new Gson().fromJson(json, XIdentify.class);
            if (xIdentify == null) {
                Log.d(TAG, "xIdentify is null");
                return;
            }

            Log.d(TAG, "xIdentify data: " + new Gson().toJson(xIdentify));
            DOX.userIdentify(xIdentify);

        } catch (Exception e) {
            Log.e(TAG, "set user identify error !!", e);
        }

    }

    @ReactMethod
    public void groupIdentify(String json) {

        try {

            if (TextUtils.isEmpty(json)) {
                Log.d(TAG, "group identify is null or empty");
                return;
            }

            JSONObject jsonObject = new JSONObject(json);
            if (jsonObject == null) {
                Log.d(TAG, "group identify json object is null or empty");
                return;
            }

            Log.d(TAG, "group identify raw data: " + json);

            String key = null;
            String value = null;
            if (jsonObject.has("groups")) {
                String groups = jsonObject.get("groups").toString();
                Map<String, String> groupsMap = getGroups(groups);
                if (groupsMap != null) {
                    Iterator iterator = groupsMap.keySet().iterator();
                    while (iterator.hasNext()) {
                        key = iterator.next().toString();
                        value = groupsMap.get(key);
                        Log.d(TAG, "key: " + key);
                        Log.d(TAG, "value: " + value);
                    }
                }
            }

            XIdentify xIdentify = null;
            if (jsonObject.has("groupproperties")) {
                String xIdentifyJson = jsonObject.get("groupproperties").toString();
                xIdentify = new Gson().fromJson(xIdentifyJson, XIdentify.class);
                if (xIdentify == null) {
                    Log.d(TAG, "xIdentify is null");
                    return;
                }
                Log.d(TAG, new Gson().toJson(xIdentify));
            }

            DOX.groupIdentify(key, value, xIdentify);

        } catch (Exception e) {
            Log.e(TAG, "set group identify error !!", e);
        }
    }

    @ReactMethod
    public void logEvent(String json) {

        try {

            if (TextUtils.isEmpty(json)) {
                Log.d(TAG, "log event data is null or empty");
                return;
            }

            XEvent xEvent = new Gson().fromJson(json, XEvent.class);
            if (xEvent == null) {
                Log.d(TAG, "xEvent is null");
                return;
            }

            xEvent.setXProperties(getXProperties(json));
            DOX.logEvent(xEvent);
            Log.d(TAG, "xEvent data: " + new Gson().toJson(xEvent));

        } catch (Exception e) {
            Log.e(TAG, "set log event error !!", e);
        }

    }

    @ReactMethod
    public void logConversion(String json) {

        try {

            if (TextUtils.isEmpty(json)) {
                Log.d(TAG, "log conversion data is null or empty");
                return;
            }

            XConversion xConversion = new Gson().fromJson(json, XConversion.class);
            if (xConversion == null) {
                Log.d(TAG, "xConversion is null");
                return;
            }

            xConversion.setXProperties(getXProperties(json));
            DOX.logConversion(xConversion);
            Log.d(TAG, "xConversion data: " + new Gson().toJson(xConversion));

        } catch (Exception e) {
            Log.e(TAG, "set log conversion error !!", e);
        }

    }

    @ReactMethod
    public void logPurchase(String json) {

        try {

            if (TextUtils.isEmpty(json)) {
                Log.d(TAG, "log purchase data is null or empty");
                return;
            }

            XPurchase xPurchase = new Gson().fromJson(json, XPurchase.class);
            if (xPurchase == null) {
                Log.d(TAG, "xPurchase is null");
                return;
            }

            xPurchase.setXProperties(getXProperties(json));
            setProductXProperties(xPurchase, json);
            DOX.logPurchase(xPurchase);
            Log.d(TAG, "xPurchase data: " + new Gson().toJson(xPurchase));

        } catch (Exception e) {
            Log.e(TAG, "set log purchase error !!", e);
        }
    }

    private Map<String, String> getGroups(String groups) {

        try {

            Type type = new TypeToken<Map<String, String>>() {
            }.getType();
            Map<String, String> groupsMap = new Gson().fromJson(groups, type);
            if (groupsMap == null) {
                return null;
            }
            return groupsMap;

        } catch (Exception e) {
            Log.e(TAG, "get groups error !!", e);
        }

        return null;

    }

    private void setProductXProperties(XPurchase xPurchase, String json) {

        try {

            List<XProduct> xProductList = xPurchase.getProductList();
            if (xProductList == null || xProductList.isEmpty()) {
                return;
            }

            List<XProperties> xPropertiesList = new ArrayList<>();
            JSONObject jsonObject = new JSONObject(json);
            if (jsonObject == null) {
                return;
            }

            JSONArray jsonArray = jsonObject.getJSONArray("product");
            if (jsonArray == null || jsonArray.length() == 0) {
                return;
            }

            for (int i = 0; i < jsonArray.length(); i++) {
                JSONObject productObject = jsonArray.getJSONObject(i);
                if (productObject == null) {
                    continue;
                }
                XProperties xProperties = getXProperties((productObject.toString()));
                if (xProperties == null) {
                    continue;
                }
                xPropertiesList.add(xProperties);
            }

            for (int i = 0; i < xProductList.size(); i++) {
                xProductList.get(i).setProperties(xPropertiesList.get(i));
            }

        } catch (Exception e) {
            Log.e(TAG, "get product properties error !!", e);
        }

    }

    private XProperties getXProperties(String json) {
        try {
            JSONObject jsonObject = new JSONObject(json);
            if (jsonObject.has("properties")) {
                String properties = jsonObject.get("properties").toString();
                if (TextUtils.isEmpty(properties)) {
                    return null;
                }
                Type type = new TypeToken<Map<String, Object>>() {
                }.getType();
                Map<String, Object> propertiesMap = new Gson().fromJson(properties, type);
                if (propertiesMap == null) {
                    return null;
                }
                XProperties xProperties = new XProperties(propertiesMap);
                return xProperties;
            }
        } catch (Exception e) {
            Log.e(TAG, "get properties error !!", e);
        }
        return null;
    }

}