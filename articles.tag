<articles>

    <ol>
        <li each={ item, i in items }><a href="/{item.filename}.html">{ item.title }</a></li>
    </ol>

  <!-- this script tag is optional -->
  <script>
    this.items = opts.items

    var self = this;

    this.join_array = function (tags) {
        var tags_str = "";
        tags.map(function (t) {
            tags_str += "#";
            tags_str += t;
            tags_str += ", ";
        });
        tags_str = tags_str.replace(/\s*,\s*$/, "");
        return tags_str;
    }

    this.on("mount", function () {
    })

  </script>

</articles>

