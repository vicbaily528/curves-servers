<#import "/spring.ftl" as spring />
<nav class="navbar navbar-default" role="navigation">
  <div class="container">
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav navbar-right">
        <li>
          <a href="<@spring.url dashboardPath/>">主页</a>
        </li>
        <li>
          <a href="<@spring.url dashboardPath/>/lastn">最后100条记录</a>
        </li>
      </ul>
    </div>
  </div>
</nav>


