<articles>

    <ul>
        <li each={t in tags}>
            <h2>{t}</h2>
            <ol>
                <li each={i in tag_map[t]} ><a href="/{i.filename}.html">{ i.title }</a></li>
            </ol>
        </li>
    </ul>

  <!-- this script tag is optional -->
  <script>
    var self = this;
    this.items = opts.items;
    this.tags = [];
    this.tag_map = {};

    this.get_tag_item = function (tag) {
        return self.tag_map[tag];
    }

    this.on("mount", function () {
        var tags = [];
        self.items.map(function (item) {
            tags = tags.concat(item.tags);
            item.tags.map(function (tag) {
                if (tag in self.tag_map) {
                    self.tag_map[tag].push(item);
                } else {
                    self.tag_map[tag] = [item];
                }
            });
        });
        tags.map(function (tag) {
            if (self.tags.indexOf(tag) == -1) {
                self.tags.push(tag);
             }
        })
        self.tags = self.tags.sort();
        self.update();
    });

  </script>

</articles>

