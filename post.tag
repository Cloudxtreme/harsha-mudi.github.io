<post>

    <h2>{title}</h2>
    <article id="contents"></article>

    <h2><a href="https://github.com/harsha-mudi/lexical.foobar.systems/issues"><b>issues?</b></a></h2>

    <script>
        this.title = opts.article.title;

        this.on("mount", function () {
            $("#contents").html(opts.article.html.trim());
        });
    </script>

</post>

