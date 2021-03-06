<#import "/spring.ftl" as spring />
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
  <head>
    <base href="<@spring.url basePath/>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>服务注册中心</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width">

    <link rel="stylesheet" href="eureka/css/wro.css">

  </head>

  <body id="one">
    <#include "header.ftl">
    <div class="container-fluid xd-container">
      <#include "navbar.ftl">
      <h1>当前注册的应用实例</h1>
      <table id='instances' class="table table-striped table-hover">
        <thead>
          <tr><th>应用(APP)</th><th>可用区域(AMIs)</th><th>节点</th><th>状态</th><th>API</th></tr>
        </thead>
        <tbody>
          <#if apps?has_content>
            <#list apps as app>
              <tr>
                <td><b>${app.name}</b></td>
                <td>
                  <#list app.amiCounts as amiCount>
                    <b>${amiCount.key}</b> (${amiCount.value})<#if amiCount_has_next>,</#if>
                  </#list>
                </td>
                <td>
                  <#list app.zoneCounts as zoneCount>
                    <b>${zoneCount.key}</b> (${zoneCount.value})<#if zoneCount_has_next>,</#if>
                  </#list>
                </td>
                  <td>
                  <#list app.instanceInfos as instanceInfo>
                    <#if instanceInfo.isNotUp>
                      <font color=red size=+1><b>
                    </#if>
                      <b>${instanceInfo.status}</b> (${instanceInfo.instances?size})<br/>
                    <#if instanceInfo.isNotUp>
                      </font>
                    </#if>
                    <#list instanceInfo.instances as instance>
                        <#if instance.isHref>
                            <a href="${instance.url}" target="_blank">${instance.id}</a>
                        <#else>
                            ${instance.id}
                        </#if>
                        <#if instance_has_next><br/></#if>
                    </#list>
                  </#list>
                  </td>
                  <td>
                  <#list app.instanceInfos as instanceInfo>
                    <#list instanceInfo.instances as instance>
                        <#if instance.isHref>
                            <a href="${instance.url?replace('info','swagger-ui.html')}" target="_blank">Restful API</a>
                        <#else>
                            Swagger
                        </#if>
                        <#if instance_has_next><br/></#if>
                    </#list>
                  </#list>
                  </td>
              </tr>
            </#list>
          <#else>
            <tr><td colspan="5">暂无应用注册</td></tr>
          </#if>

        </tbody>
      </table>

      <h1>一般信息</h1>

      <table id='generalInfo' class="table table-striped table-hover">
        <thead>
          <tr><th>名称</th><th>值</th></tr>
        </thead>
        <tbody>
          <#list statusInfo.generalStats?keys as stat>
            <tr>
              <td>${stat}</td><td>${statusInfo.generalStats[stat]!""}</td>
            </tr>
          </#list>
          <#list statusInfo.applicationStats?keys as stat>
            <tr>
              <td>${stat}</td><td>${statusInfo.applicationStats[stat]!""}</td>
            </tr>
          </#list>
        </tbody>
      </table>

      <h1>实例信息</h1>

      <table id='instanceInfo' class="table table-striped table-hover">
        <thead>
          <tr><th>名称</th><th>值</th></tr>
        <thead>
        <tbody>
          <#list instanceInfo?keys as key>
            <tr>
              <td>${key}</td><td>${instanceInfo[key]!""}</td>
            </tr>
          </#list>
        </tbody>
      </table>
    </div>
    <script type="text/javascript" src="eureka/js/wro.js" ></script>
    <script type="text/javascript">
       $(document).ready(function() {
         $('table.stripeable tr:odd').addClass('odd');
         $('table.stripeable tr:even').addClass('even');
       });
    </script>
  </body>
</html>
