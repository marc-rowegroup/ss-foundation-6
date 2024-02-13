<!doctype html>
<html class="no-js" lang="$ContentLocale.ATT" dir="$i18nScriptDirection.ATT">
	<% include DocumentHeader %>
	<body class="$ClassName.ATT">
	$SiteConfig.SiteBodyScripts.RAW	
		<% include Header %>
		<% include Modals %>
		<% include SlideoutMenu %>
		<% include Success %>
		<% include TitleBar %>	
			$Layout
		<% include ReviewsSection %>
		<% include Footer %>
		<% include DocumentFooter %>
	</body>
</html>
