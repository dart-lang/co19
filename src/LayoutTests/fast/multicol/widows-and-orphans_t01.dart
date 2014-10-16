/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Testing Widows and Orphans
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testharness.dart";

const String htmlEL1 = r'''
<style>
body.hide-containers .container {
    display: none;
}

.container {
    width: 600px;
    height: 200px;
    -webkit-columns: 3;
    columns: 3;
    column-fill: auto;
    line-height: 20px; /* 10 lines per page */
    font-size: 16px;
    margin: 0 0 20px 0;
    padding: 0;
    overflow: hidden;
}

.block {
    margin: 0 0 15px 0;
    padding: 0;
}

.top {
    color: red;
}

.bottom {
    color: green;
}
</style>
''';

const String htmlEL2 = r'''
    <p>
        Testing widows and orphans. Any green lines
        should be at the bottom of pages/columns, and any red lines
        should be at the top of pages/columns.
    </p>
''';


Element createTestContainer(id, description, blocks) {
    var label = document.createElement("h3");
    label.text = "$id-$description";
    document.body.append(label);
    var element = document.createElement("div");
    element.className = "container";
    element.id = id;

    for (var i = 1; i <= blocks.length; i++) {
        var block = document.createElement("div");
        block.className = "block";
        var numLines = blocks[i-1];
        for (var j = 1; j <= numLines; j++) {
            var line = document.createElement("span");
            line.id = "$id-block-$i-line-$j";
            line.text = "Block $i Line $j";
            block.append(line);
            block.append(document.createElement("br"));
        }
        element.append(block);
    }
    document.body.append(element);
    return element;
}

void markTopLine(containerId, blockNumber, lineNumber) {
    var element = document.getElementById("$containerId-block-$blockNumber-line-$lineNumber");
    element.className = "top";
}

void markBottomLine(containerId, blockNumber, lineNumber) {
    var element = document.getElementById("$containerId-block-$blockNumber-line-$lineNumber");
    element.className = "bottom";
}

void testIsFirstInColumn(containerId, blockNumber, lineNumber) {
    // Get the upper bounds of the container and line.
    var topOfContainer = document.getElementById(containerId).getBoundingClientRect().top;
    var topOfLine = document.getElementById("$containerId-block-$blockNumber-line-$lineNumber").getBoundingClientRect().top;

    shouldBeTrue((topOfContainer - topOfLine) < 5, // Give 5 pixels to account for subpixel layout.
        "$containerId Block $blockNumber Line $lineNumber");
}

void runTest(e) {
    var container;
    createTestContainer("test1", "Normal breaking", [5, 6, 5, 5]);

    markTopLine("test1", 1, 1);
    markBottomLine("test1", 2, 4);
    markTopLine("test1", 2, 5);
    markBottomLine("test1", 4, 1);
    markTopLine("test1", 4, 2);

    testIsFirstInColumn("test1", 1, 1);
    testIsFirstInColumn("test1", 2, 5);
    testIsFirstInColumn("test1", 4, 2);

    container = createTestContainer("test2", "Basic Orphan", [8, 6]);
    container.style.orphans = "2";

    markTopLine("test2", 1, 1);
    markBottomLine("test2", 1, 8); // Orphan break happens here.
    markTopLine("test2", 2, 1);

    testIsFirstInColumn("test2", 1, 1);
    testIsFirstInColumn("test2", 2, 1);

    container = createTestContainer("test3", "Basic Widow", [4, 6, 3]);
    container.style.widows = "2";

    markTopLine("test3", 1, 1);
    markBottomLine("test3", 2, 4); // Widow break happens here.
    markTopLine("test3", 2, 5);

    testIsFirstInColumn("test3", 1, 1);
    testIsFirstInColumn("test3", 2, 5);

    container = createTestContainer("test4", "Orphans causing Widows", [8, 6, 4, 4]);
    container.style.orphans = "2";
    container.style.widows = "2";

    markTopLine("test4", 1, 1);
    markBottomLine("test4", 1, 8); // Orphan break happens here.
    markTopLine("test4", 2, 1);
    markBottomLine("test4", 3, 2); // And that creates a widow forcing a break here.
    markTopLine("test4", 3, 3);

    testIsFirstInColumn("test4", 1, 1);
    testIsFirstInColumn("test4", 2, 1);
    testIsFirstInColumn("test4", 3, 3);

    container = createTestContainer("test5", "Widows blocked by Orphan rule", [7, 3, 4]);
    container.style.orphans = "2";
    container.style.widows = "2";
    

    markTopLine("test5", 1, 1);
    markBottomLine("test5", 2, 2); // This line should not move - protected by orphaning.
    markTopLine("test5", 2, 3); // This line won't be un-widowed - blocked by orphaning.

    testIsFirstInColumn("test5", 1, 1);
    testIsFirstInColumn("test5", 2, 3);

    container = createTestContainer("test6", "Ridiculous values", [7, 7, 7, 7]);
    container.style.orphans = "100";
    container.style.widows = "100";

    markTopLine("test6", 1, 1);
    markBottomLine("test6", 1, 7); // Orphan break happens here.
    markTopLine("test6", 2, 1); // Adopted.
    markBottomLine("test6", 2, 7); // Orphan break.
    markTopLine("test6", 3, 1); // Adopted.

    testIsFirstInColumn("test6", 1, 1);
    testIsFirstInColumn("test6", 2, 1);
    testIsFirstInColumn("test6", 3, 1);

    // Hide all the containers and leave just the test results for text output.
    document.body.className = "hide-containers";

    checkTestFailures();
}

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
    window.addEventListener("load", runTest, false);
}
