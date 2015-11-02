<post>

    <h2 class="sans" style="font-size: 1.5rem; text-align: center">{title}</h2>
    <h2 class="sans" style="font-size: 1.5rem; text-align: left"><a href="https://github.com/harsha-mudi/lexical.foobar.systems/issues"><b>issues?</b></a></h2>

    <article id="contents"></article>

    <style>
        article {
            white-space: pre-wrap;
        }
    </style>

    <script>
        this.title = opts.article.title;

        this.on("mount", function () {
            $("#contents").html(opts.article.html);
        });
    </script>

</post>

