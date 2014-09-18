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
import "../../../Utils/async_utils.dart";
import "../../testharness.dart";

const String htmlEL1 = r'''
    <style>
      #el0 {
        border-collapse: collapse;
        width: 1;
        height: 1;
      }
      #el1 {
        width: 1;
        float: left;
        display: table;
      }
      #el2 {
        content: counter(c);
        display: table-footer-group;
      }
    </style>
''';

void crash(e) {
    Element el0 = document.createElement('div');
    el0.setAttribute('id', 'el0');
    document.body.append(el0);
    var el1 = document.createElement('div');
    el1.setAttribute('id', 'el1');
    el0.append(el1);
    var el2 = document.createElement('div');
    el2.setAttribute('id', 'el2');
    el1.append(el2);
    runLater(() {
        document.body.offsetTop;
        document.body.style.zoom*=1.1;
//        document.designMode='on';
        document.execCommand("selectall", false, null);
        document.execCommand("italic", false, null);

        document.body.innerHtml = "Bug 74026: Crash in RenderTable::outerBorderAfter<br>This test has PASSED!";
    }, 0);
}

void main() {
    document.head.appendHtml(htmlEL1);
    window.onLoad.listen(crash);

}
