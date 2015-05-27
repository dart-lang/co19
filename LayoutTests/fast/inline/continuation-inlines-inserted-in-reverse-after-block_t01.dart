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
import "../../../Utils/expect.dart";
import "../../testharness.dart";

const String htmlEL2 = r'''
<div id="console"></div>

<span id="container"></span>
<span id="reference"><div></div><span>1,</span><span>2,</span><span>3,</span><div></div></span>
''';


void main() {
    description('You should see two lines, both with 1,2,3.');
    document.body.appendHtml(htmlEL2);

    var container = document.getElementById('container');
    var div = container.append(document.createElement('div'));
    Element last;
    
    Element insert(tagName, [id])
    {
        last = container.insertBefore(document.createElement(tagName), last);
        if (id!=null)
            last.id = id.toString();
        last.getComputedStyle().color; // attach.
        return last;
    }

    div.getComputedStyle().color; // attach.

    // This inserts the elements in the reverse order they appear in the DOM
    // calling layout()
    insert('div');
    insert('span', 3).text = '3,';
    insert('span', 2).text = '2,';
    insert('span', 1).text = '1,';
    shouldBeTrue(document.getElementById('3').offsetLeft >= document.getElementById('2').offsetLeft, "3,2");
    shouldBeTrue(document.getElementById('2').offsetLeft >= document.getElementById('1').offsetLeft, "2,1");
    checkTestFailures();
}
