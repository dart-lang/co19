/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description
 */
import "dart:html";
import "../../testharness.dart";
import "../../resources/check-layout.dart";

const String htmlEL2 = r'''
    <p>
        Test for <i><a href="https://bugs.webkit.org/show_bug.cgi?id=19519">https://bugs.webkit.org/show_bug.cgi?id=19519</a> DOM modification causes stack exhaustion (BUTTON OBJECT COLGROUP)</i>.
    </p>
''';

var tableParts = [
    "table-cell",
    "table-row",
    "table-row-group",
    "table-column-group",
    "table-caption"
];

var childTypes = [
    "block",
    "inline",
    "table-cell",
    "table-row",
    "table-row-group",
    "table-column-group",
    "table-caption"
];

void main() {
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    for (var i = 0; i < tableParts.length; ++i) {
        for (var j = 0; j < childTypes.length; ++j) {
            document.body.append(document.createElement("pre")).append(new Text("Prepending ${childTypes[j]} to ${tableParts[i]}:"));
            var container = document.createElement("div");
            var tablePart = document.createElement("div");
            tablePart.style.display = tableParts[i];
            container.append(tablePart);
            document.body.append(container);
            document.body.offsetTop;
            var newChild = document.createElement("div");
            newChild.style.display = childTypes[j];
            container.insertBefore(newChild, tablePart);
            document.body.offsetTop;
            // The above should have the same render tree as you get when
            // you do it all at once, like this:
            document.body.append(container.clone(true));
            document.body.offsetTop;
        }
    }
}