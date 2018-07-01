<h1>系统状态</h1>
<div class="row">
    <div class="col-md-6">
        <table id='instances' class="table table-condensed table-striped table-hover">
            <tr>
                <td>Environment</td>
                <td>${environment!}</td>
            </tr>
            <tr>
                <td>Data center</td>
                <td>${datacenter!}</td>
            </tr>
            <tr>
                <td>Renews threshold</td>
                <td>${registry.numOfRenewsPerMinThreshold}</td>
            </tr>
            <tr>
                <td>Renews (last min)</td>
                <td>${registry.numOfRenewsInLastMin}</td>
            </tr>
        </table>
    </div>
    <div class="col-md-6">
        <table id='instances' class="table table-condensed table-striped table-hover">
            <tr>
                <td>Current time</td>
                <td>${currentTime}</td>
            </tr>
            <tr>
                <td>Uptime</td>
                <td>${upTime}</td>
            </tr>
            <tr>
                <td>Lease expiration enabled</td>
                <td>${registry.leaseExpirationEnabled?c}</td>
            </tr>
        </table>
    </div>
</div>

<#if isBelowRenewThresold>
    <#if !registry.selfPreservationModeEnabled>
        <h4 id="uptime"><font size="+1" color="red"><b>续期比门槛低。自保模式被撤销。这可能无法保护网络/其他问题的情况下失效。</b></font></h4>
    <#else>
        <h4 id="uptime"><font size="+1" color="red"><b>紧急情况！<strong>服务注册</strong>可能不正确地声称，当他们不在时，情况就上升了。更新比阈值小，因此，为了安全起见，实例不会过期。</b></font>
        </h4>
    </#if>
<#elseif !registry.selfPreservationModeEnabled>
    <h4 id="uptime"><font size="+1" color="red"><b>自保模式被撤销。这可能无法保护网络/其他问题的情况下失效。</b></font></h4>
</#if>

<h1>DS 集群</h1>
<ul class="list-group">
  <#list replicas as replica>
      <li class="list-group-item"><a href="${replica.value}">${replica.key}</a></li>
  </#list>
</ul>

