<#include "header.ftl">
	
	<#include "menu.ftl">

	<div class="page-header">
		<h1>최근 글</h1>
		<p class="lead">${config.site_description}</p>
	</div>
	<#list posts?sort_by("date")?reverse as post>
  		<#if (post.status == "published")>
  			<div class="post-preview">
  				<h2><a href="${post.uri}" class="post-title">${post.title}</a></h2>
  				<p class="post-date">${post.date?string("yyyy년 MM월 dd일")}</p>
  				<div class="post-content">
  					${post.body}
  				</div>
  				<hr>
  			</div>
  		</#if>
  	</#list>
	
	<p>더 많은 글은 <a href="${content.rootpath}${config.archive_file}">아카이브</a>에서 확인하실 수 있습니다.</p>

<#include "footer.ftl">