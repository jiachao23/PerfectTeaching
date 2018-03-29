<#macro paginate currentPage totalPage link>

<#if (totalPage < 2 || currentPage > totalPage)>
	<#return>
</#if>

<#local startPage = currentPage - 3>
<#if (startPage < 1)>
	<#local startPage = 1>
</#if>

<#local endPage = currentPage + 3>
<#if (endPage > totalPage)>
	<#local endPage = totalPage>
</#if>

<ul data-am-widget="pagination" class="am-pagination am-pagination-default">
<#if (currentPage > 1)>
	<li class="am-pagination-prev"><a href="${link}${currentPage - 1}${append}">&lt;</a></li>
</#if>
<#if (currentPage - 3 > 1)>
	<li><a href="${link}1${append}">1</a></li>
</#if>
<#list startPage..endPage as i>
	<#if (currentPage == i)>
		<li class="active"><a href="javascript:void(0);" class="am-active">${i}</a></li>
	<#else>
		<li><a href="${link}${i}${append}">${i}</a></li>
	</#if>
</#list>
<#if (currentPage + 3 < totalPage)>
	<li><a href="${link}${totalPage}${append}">${totalPage}</a></li>
</#if>
<#if (currentPage < totalPage)>
	<li class="am-pagination-next"><a href="${link}${currentPage + 1}${append}">&gt;</a></li>
</#if>
</ul>
</#macro>