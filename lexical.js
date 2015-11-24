#!/usr/bin/env node

var squareboy = require("squareboy");

var base_dir = ".";
var content_dir = base_dir + "/contents";
var css_dir = base_dir + "/styles";
var less_file = base_dir + "/css/styles.less";
var css_file = base_dir + "/css/styles.less.min.css";
var images_folder = base_dir + "/images";


npm("gulp-less");
npm("gulp-rename");
npm("gulp-minify-css");
npm("gulp-size");
npm("gulp-clean");
npm("gulp-imagemin");

$.task("css", function () {
    exists(less_file);

    from(images_folder + "/*")
        .pipe($if($args.min, $imagemin()))
        .pipe(to(images_folder))

    from(less_file)
        .pipe(__())
        .pipe($less())
        .pipe($if($args.min, $minify_css()))
        .pipe($rename({ suffix: '.min' }))
        .pipe($if($args.min, $size()))
        .pipe(to(css_dir))
});

bower({
    directory: "vendor",
    cwd: base_dir,
    packages: [
      "sanitize-css",
      "restyle",
      "jquery",
      "freewall",
      "visionmedia/page.js"
    ]
});

$.task('clean', function () {
   from([css_file])
    .pipe(print())
    .pipe($clean({force: true}))

});


$.task('serve', function () {
    port = $args.port || "8081"
    server({dir: base_dir,port: port})
    $server.io.emit("change", {type: "start"})
    $server.app.post("/gulp", function (req,res) {
    // control gulp from the browser
    });
});

$.task('compile', function () {
    var site_data = siteData({folder: content_dir});
    writeFile(base_dir + "/content.json", toStr(site_data));
});

$.task('watch', function () {
    watchers = [
        ($.watch(base_dir + "/css/*", ['css']))
        , ($.watch(base_dir + "/contents/*", ["default"]))
    ]

    watchers.map(function (w) {
        w.on('change', function (e) {
            log("file " + e.path + " was " + e.type)
            $server.io.emit("change", e);
        });
    });
});

$.task('default', ["compile", "css"]);

$.start('serve')
$.start('watch')
prePress()
