package ${packageName}.module.${activityPackage};

import java.io.IOException;

<#if useApi>
import ${packageName}.network.ApiClient;
import site.sahabatdeveloper.sahabatlibrary.helper.SahabatHelper;
import ${packageName}.model.${activityPackage}.${activityClass}Response;
<#if method == 'post' || method == 'put'>
import ${packageName}.model.${activityPackage}.${activityClass}Request;
</#if>
import okhttp3.ResponseBody;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
</#if>

public class ${activityClass}Presenter {
    ${activityClass}View mView;

    public ${activityClass}Presenter(${activityClass}View mView) {
        this.mView = mView;
    }

    <#if useApi>
    public void do${activityClass}(<#if method == 'get'><#if auth != 'no'>String auth</#if></#if><#if method == 'delete'><#if auth != 'no'>String auth,</#if>int id</#if><#if method == 'post' || method == 'put'><#if auth != 'no'>String auth,</#if><#if method == 'put'>int id,</#if>${activityClass}Request request</#if>) {
        mView.onShowProgressDialog();
        ApiClient.getClient().<#if method == 'get'>GET(<#if auth != 'no'>auth,</#if>"${pathApi}")</#if><#if method == 'post'>POST(<#if auth != 'no'>auth,</#if>request, "${pathApi}")</#if><#if method == 'put'>PUT(<#if auth != 'no'>auth,</#if>request, "${pathApi}", id)</#if><#if method == 'delete'><#if auth != 'no'>auth,</#if>DELETE("${pathApi}",id)</#if>.enqueue(new Callback<ResponseBody>() {
            @Override
            public void onResponse(Call<ResponseBody> call, Response<ResponseBody> response) {
                mView.onHideProgressDialog();
                if (response.isSuccessful()) {
                    try {
                        ${activityClass}Response respon = new SahabatHelper<${activityClass}Response>().convertJsonToModel(response.body().string());
                        mView.onSuccess${activityClass}(respon);
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                } else {
                    try {
                        mView.onMessage(response.errorBody().string());
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }

            @Override
            public void onFailure(Call<ResponseBody> call, Throwable t) {
                mView.onHideProgressDialog();
                mView.onMessage(t.getLocalizedMessage());
            }
        });
    }
    </#if>

}