<!DOCTYPE html>
<html lang="en" xmlns:wb=“http://open.weibo.com/wb”>

  <head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

    {{ if .IsHome }}
        <title>{{ setting "page/head/title" }}</title>
    {{ else }}
      {{ if .Title }}
        <title>
          {{ .Title }} {{ if setting "page/head/title" }} // {{ setting "page/head/title" }} {{ end }}</title>
      {{ else }}
        <title>{{ setting "page/head/title" }}</title>
      {{ end }}
    {{ end }}

    <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <script type="text/javascript" src="/jquery.js"></script>
    <script type="text/javascript" src="/jquery.foo.js"></script>

    <link rel="stylesheet" href="/normalize.css" />

    <link rel="stylesheet" href="/bootstrap.css" />
    <link rel="stylesheet" href="/bootstrap-responsive.css" />

    <link rel="stylesheet" href="/prettify.css" />
    <script type="text/javascript" src="/prettify.js"></script>

    <link rel="stylesheet" href="/styles.css" />

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script src="http://tjs.sjs.sinajs.cn/open/api/js/wb.js" type="text/javascript" charset="utf-8"></script>

    <script type="text/javascript">
      $(document.body).ready(
        function() {
          // Code (marking code blocks for prettyPrint)
          var code = $('code');

          for (var i = 0; i < code.length; i++) {
            var el = $(code[i])
            var className = el.attr('class');
            if (className) {
              el.addClass('prettyprint');
              el.addClass('lang-'+className);
            }
          };

          // An exception, LaTeX blocks.
          //var code = $('code.latex');

          //for (var i = 0; i < code.length; i++) {
          //  var el = $(code[i])
          //  var img = $('<img>', { 'src': 'http://phibin.com/api/render?snippet='+encodeURIComponent(el.html()) });
          //  img.insertBefore(el);
          //  el.hide();
         // };

          // Starting prettyPrint.
          prettyPrint();

          // Tables without class

          $('table').each(
            function(i, el) {
              if (!$(el).attr('class')) {
                $(el).addClass('table');
              };
            }
          );

          // Navigation
          var links = $('ul.menu li').removeClass('active');

          for (var i = 0; i < links.length; i++) {
            var a = $(links[i]).find('a');
            if (a.attr('href') == document.location.pathname) {
              $(links[i]).addClass('active');
            };
          };

        }
      );
    </script>

    <style type="text/css">
      .navbar .brand {
        margin-left: 0px;
      }
      body {
        padding-top: 50px;
      }
    </style>

  </head>

  <body>

    <div class="container" id="container">
    <div class="navbar navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">

          <a class="brand" href="{{ url "/" }}">{{ setting "page/brand" }}</a>

          <div class="nav-collapse">
            {{ if settings "page/body/menu" }}
              <ul id="nav" class="nav menu">
                {{ range settings "page/body/menu" }}
                  <li>{{ link .url .text }}</li>
                {{ end }}
              </ul>
            {{ end }}
            {{ if settings "page/body/menu_pull" }}
              <ul id="nav" class="nav pull-right menu">
                {{ range settings "page/body/menu_pull" }}
                  <li>{{ link .url .text }}</li>
                {{ end }}
              </ul>
            {{ end }}
          </div>

        </div>
      </div>
    </div>


                                 <div class="hero-unit">

                                   <p>
                                     <h2>‘The Internet is not for sissies.’ </h2>
                                   </p>
                                 </div>

      {{ if .BreadCrumb }}
        <ul class="breadcrumb menu">
          {{ range .BreadCrumb }}
            <li><a href="{{ url .link }}">{{ .text }}</a> <span class="divider">/</span></li>
          {{ end }}
        </ul>
      {{ end }}

      <div class="container-fluid">

        <div class="row">
          {{ if .SideMenu }}
            {{ if .Content }}
              <div class="span4">
                  <ul class="nav nav-list menu">
                    {{ range .SideMenu }}
                      <li>
                        <a href="{{ url .link }}">{{ .text }}</a>
                      </li>
                    {{ end }}
                  </ul>
              </div>
              <div class="span7">
                {{ .ContentHeader }}

                {{ .Content }}
                <hr>
                               <div id="disqus_thread"></div>
                                      <script type="text/javascript">
                                          /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
                                          var disqus_shortname = 'zhengyaotian'; // required: replace example with your forum shortname

                                          /* * * DON'T EDIT BELOW THIS LINE * * */
                                          (function() {
                                              var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
                                              dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js';
                                              (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
                                          })();
                                      </script>
                                      <noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
                                      <a href="http://disqus.com" class="dsq-brlink">comments powered by <span class="logo-disqus">Disqus</span></a>


                {{ .ContentFooter }}
              </div>
            {{ else }}
              <div class="span11">
                {{ if .CurrentPage }}
                  <h1>{{ .CurrentPage.text }}</h1>
                {{ end }}
                <ul class="nav nav-list menu">
                  {{ range .SideMenu }}
                    <li>
                      <a href="{{ url .link }}">{{ .text }}</a>
                    </li>
                  {{ end }}
                </ul>
              </div>
            {{ end }}
          {{ else }}
            <div class="span11">
              {{ .ContentHeader }}

              {{ .Content }}
                      <hr>
                             <div id="disqus_thread"></div>
                                    <script type="text/javascript">
                                        /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
                                        var disqus_shortname = 'zhengyaotian'; // required: replace example with your forum shortname

                                        /* * * DON'T EDIT BELOW THIS LINE * * */
                                        (function() {
                                            var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
                                            dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js';
                                            (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
                                        })();
                                    </script>
                                    <noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
                                    <a href="http://disqus.com" class="dsq-brlink">comments powered by <span class="logo-disqus">Disqus</span></a>


              {{ .ContentFooter }}

            </div>
          {{ end }}
        </div>

      </div>


    {{ if setting "page/body/scripts/footer" }}
      <script type="text/javascript">
        {{ setting "page/body/scripts/footer" | jstext }}
      </script>
    {{ end }}

  </body>
<script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fe1dd58258adc35728a56629def5cbb20' type='text/javascript'%3E%3C/script%3E"));
</script>

</html>
