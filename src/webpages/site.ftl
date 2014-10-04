[#import "toc.ftl" as toc]
[#set poweredbyImage = "poweredby_ffffff.png" in .globals]
[#set menuBgColor = "#E0E0E0" in .globals] 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="Keywords" content="FreeMarker, template, templates, HTML, HTML template, page template, text, macro, macros, preprocessor, MVC, view, servlet, Java, free, open source, JSP, taglib, Velocity, WebMacro">
    <meta name="Description" content="Template engine for generating text (HTML, source code, e-mails, config files, etc.) that depends on changing data. MVC, highly configurable, macros, Free.">
    <meta name="verify-v1" content="OU7KNU7q+wGizVoaX/MNUo/tZ5o5RC06VfCjQIRRJu4=">
    <link rel="STYLESHEET" type="text/css" href="site.css">
    <title>FreeMarker Java Template Engine - ${.node.page.@title?html}</title>
  </head>
  <body>
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
      <tr>
        <td align="left" valign="top" width="20%">
          [#visit project_node using [toc]]
        </td>
        <td align="left" valign="top" width="5%">
          &nbsp;
        </td>
        <td align="left" valign="top" width="72%">
          <table border="0" cellspacing="0" cellpadding="0" width="100%">
            [#-- span instead of h1 for Netscape 4.x compatibility... --]
            <tr><td align="right"><span class="pageTitle">${.node.page.@title?html}</span></td></tr>
            <tr bgcolor="#000000"><td><img src="images/none.gif" width=1 height=1 hspace="0" vspace="0" border="0" alt=""></td></tr>
          </table>
          [#recurse  using "content.ftl"]
        </td>
        <td align="left" valign="top" width="3%" rowspan=3>
          &nbsp;
        </td>
      </tr>
    </table>

    <p>&nbsp;
    
    [@hr color="#C0C0C0"/]
    <table border=0 cellspacing=0 cellpadding=0 width="100%">
      <tr>
      <td align=left valign=top class="footnote"><font size="1">&nbsp;<br></font>
        <b>Found broken link or other problem with this site?</b><br>
        Report to: <a href="mailto:ddekanyREMOVEME@freemail.hu">ddekanyREMOVEME@freemail.hu</a><br>
        (remove the "REMOVEME" from the address)<br>
      </td>
      <td align=right valign=top class="footnote"><font size="1">&nbsp;<br></font>
        Page last generated: ${properties.timeStamp}<br>
        All content on this page is copyrighted by the FreeMarker project.<br>
        &nbsp;
      </td>
    </table>

    <table border=0 cellspacing=0 cellpadding=0 width="100%">
      <tr>
        <td width="100%">&nbsp;</td>
        <td valign="middle" align="right">
          [#if !properties["site.offline"]??]
            <a href="http://sourceforge.net"><img src="http://sourceforge.net/sflogo.php?group_id=794&amp;type=1" border="0" alt="SourceForge Logo"></a>
          [#else]
            <a href="http://sourceforge.net"><img src="images/sflogo.png" border="0" alt="SourceForge Logo"></a>
          [/#if]
        </td>
        <td>
          &nbsp;&nbsp;
        </td>
        <td valign="middle" align="right">
          <a href="${project_node.site.@deployUrl?html}"><img src="images/${poweredbyImage}" alt="Powered by FreeMarker" border="0"></a>
        </td>
    </table>
    [#if !properties["site.offline"]??]
      <script>
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

        ga('create', 'UA-55420501-1', 'auto');
        ga('send', 'pageview');
      </script>
    [/#if]
  </body>
</html>


[#-- Draws a 100% width horizontal line with the given color. Do not use inside another table (IE 5)... --]
[#macro hr color]
    <table border=0 cellspacing=0 cellpadding=0 width="100%">
      <tr><td height=1 bgcolor="${color}"><img src="images/none.gif" width=1 height=1 alt=""></td></tr>
    </table>
[/#macro]

