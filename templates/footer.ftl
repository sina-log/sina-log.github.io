		</div>
		<div id="push"></div>
    </div>
    
    <div id="footer">
      <div class="container">
        <p class="muted credit">${config.site_copyright} | <a href="http://jbake.org">JBake</a>로 제작</p>
      </div>
    </div>
    
    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="<#if (content.rootpath)??>${content.rootpath}<#else></#if>js/jquery-1.11.1.min.js"></script>
    <script src="<#if (content.rootpath)??>${content.rootpath}<#else></#if>js/bootstrap.min.js"></script>
    <script src="<#if (content.rootpath)??>${content.rootpath}<#else></#if>js/prettify.js"></script>
    
  </body>
</html>