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
      <p>This tests that when nodes are foster-parented after being adopted into another document,
          they are adopted back into the ownerDocument of their foster parent. </p>
      <table>
          <tr>
''';
const String htmlEL3 = r'''
              <div></div>
          </tr>
      </table>
''';

void main() {
    document.body.appendHtml(htmlEL2);
    document.body.appendHtml(htmlEL3);
    var tr = document.querySelector('tr');
    var doc = document.implementation.createHtmlDocument("");
    doc.adoptNode(tr);
    var div = document.querySelector('div');
    Expect.equals(div.ownerDocument, div.parentNode.ownerDocument);
}
