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
import "../../../Utils/expect.dart";

const String htmlEL2 = r'''
  <body>
      <p>This tests that when nodes are foster-parented after being adopted into another document,
          they are adopted back into the ownerDocument of their foster parent. </p>
      <table>
          <tr>
''';
const String htmlEL3 = r'''
              <div id=fosterChild></div>
          </tr>
      </table>
''';

void main() {
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL3, treeSanitizer: new NullTreeSanitizer());
    var doc = document.implementation.createHtmlDocument("");
    var div = document.createElement('div');
    doc.adoptNode(div);
    var t=document.querySelector('table');
    div.append(t);
    var fosterChild = div.querySelector('#fosterChild');
    Expect.isNotNull(fosterChild);
    Expect.equals(fosterChild.ownerDocument, fosterChild.parentNode.ownerDocument);
}
