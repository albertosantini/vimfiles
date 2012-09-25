/*jslint node:true, evil: true, sloppy:true */
/*global JSLINT */
/*properties
    HOME, argv, data, errors, exit, env, indent, length, line, log, maxerr,
    name, passfail, readFile, reason, unused
*/

var fs = require("fs");

var lintFileName = process.env.HOME + "/vimfiles/bundle/JSLint/jslint.js";

fs.readFile(lintFileName, "utf-8", function (err, jslint) {
    var inputFileName;

    if (err) {
        console.log("lint could not load " + lintFileName);
        process.exit(1);
    }
    eval(jslint);

    inputFileName = process.argv[2];
    if (!inputFileName) {
        console.log("usage: node lint.js file.js.");
        process.exit(1);
    }

    fs.readFile(inputFileName, "utf-8", function (err, input) {
        var data, e, i;

        if (err) {
            console.log("lint could not open file '" + inputFileName + "'.");
            process.exit(1);
        }

        JSLINT(input, {
            maxerr: 50,
            indent: 4,
            passfail: false
        });

        for (i = 0; i < JSLINT.errors.length; i += 1) {
            e = JSLINT.errors[i];
            if (e) {
                console.log(inputFileName + ':' + e.line + ': ' + e.reason);
            }
        }

        data = JSLINT.data();
        if (data.unused) {
            for (i = 0; i < data.unused.length; i += 1) {
                console.log(inputFileName + ':' + data.unused[i].line + ': ' +
                    'Unused variable \'' + data.unused[i].name + '\'.');
            }
        }
    });
});
