<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
<head>
<% base_tag %>
<!--[if !mso]><!-- -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!--<![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!--[if !mso]><!-->
<style type="text/css">
@media only screen and (max-width:480px) {
    @-ms-viewport {
        width: 320px;
    }

    @viewport {
        width: 320px;
    }
}
</style>
<!--<![endif]-->
</head>

<body style="background-color:#e0e0e0;">
	<table align="center" style="background-color:#fff; width:600px; margin:0 auto;" border="0" cellpadding="0" cellspacing="0" role="presentation">
		<tr <% if $SiteConfig.GlobalMfgColor %>style="background-color: #$SiteConfig.GlobalMfgColor;"<% else %>style="background-color: #2c2c2c;"<% end_if %>>
			<td style="padding:15px; color:#fff;">
				<h1>Contact Form</h1>
				<h2>$Name is submitting a question or comment from the locations pages.</h2>
			</td>
		</tr>
		<tr style="background-color:#fff;">
			<td style="padding:15px;">
				<p><strong>Full Name:</strong> $Name</p>
				<p><strong>Email:</strong> $Email</p>
				<p><strong>Phone:</strong> $Phone</p>
				<p><strong>Question or Comment:</strong> <br/>$Question</p>
				<hr/>
				<p><strong>Visit the page this came from:</strong> <br/>$PageUrl</p>
			</td>
		</tr>
	</table>
</body>
</html>
