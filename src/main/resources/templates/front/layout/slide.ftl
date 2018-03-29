<#macro slide title>
    <div class="blog-module shadow">
        <div class="blog-module-title">${(title)!}</div>
        <ul class="fa-ul blog-module-ul">
           <#nested >
        </ul>
    </div>
</#macro>