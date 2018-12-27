package ${packageName}.module.${activityPackage};

import ${packageName}.R;
import android.os.Bundle;
import site.sahabatdeveloper.sahabatlibrary.base.BaseActivity;

<#if useApi>
import android.util.Log;
import site.sahabatdeveloper.sahabatlibrary.helper.SahabatHelper;
import ${packageName}.model.${activityPackage}.${activityClass}Response;
<#if method == 'post' || method == 'put'>
import ${packageName}.model.${activityPackage}.${activityClass}Request;
</#if>
</#if>

public class ${activityClass}Activity extends BaseActivity implements ${activityClass}View{

    ${activityClass}Presenter mPresenter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.${layoutName});

        mPresenter = new ${activityClass}Presenter(this);

        <#if useApi>
        mPresenter.do${activityClass}(<#if method == 'delete'>1</#if><#if method == 'post'><#if method == 'put'>1</#if>new ${activityClass}Request()</#if>);  //TODO Call Presenter to Request API
        </#if>

    }

    @Override
    public void onSuccess${activityClass}(${activityClass}Response response) {
        Log.d("RESPONSE", new SahabatHelper<${activityClass}Response>().convertModelToJson(response));
    }

    @Override
    public void onMessage(String s) {
        toastMessage(s);
    }

    @Override
    public void onShowProgressDialog() {
        showProgressDialog();
    }

    @Override
    public void onHideProgressDialog() {
        hideProgressDialog();
    }

}
