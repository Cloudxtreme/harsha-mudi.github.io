<articles>

  <div class="freewall">
    <div class="item sans" style="background-color: {set_bg_color()}" each={ items }>
        <a href="/{filename}.html">{ title }</a>
        <div class="tags">
            <span>{join_array(tags)} </span>
        </div>
    </div>
  </div>

  <style> 
        .item {
            width: 320px;
            height: 240px;
            font-size: 1.2rem;
            padding: 1rem;
            overflow: hidden;
            color: white;
        }

        .item a {
            color: white;
        }
        .item a:hover {text-decoration: none; color: black;}

        .item .tags {
            padding-top: 3rem;
        }

  </style>

  <!-- this script tag is optional -->
  <script>
    this.items = opts.items
    this.colors = ["#6ed3cf",  "#f2b632", "#9068be",  "#e62739" ] 

    var self = this;

    this.set_bg_color = function () {
        return this.colors[Math.floor(Math.random() * this.colors.length)];
    }

    this.join_array = function (tags) {
        var tags_str = "";
        tags.map(function (t) {
            tags_str += "#";
            tags_str += t;
            tags_str += ", ";
        });
        tags_str = tags_str.replace(/\s+,$/,"");
        return tags_str;
    }


    this.on("mount", function () {
        var wall = new freewall(".freewall");
        wall.reset({
                selector: '.item',
                animate: false,
                cellW: 80,
                cellH: 80,
                delay: 5,
                onResize: function() {
                    wall.fitWidth();
                }
            });
        wall.fitWidth();
    })

  </script>

</articles>

