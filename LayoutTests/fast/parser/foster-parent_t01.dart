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

const String htmlEL2 = r'''
<div id="div">
  <table id="table">
    <script>
      var table = document.getElementById('table');
      table.parentNode.removeChild(table);
      var docFragment = document.createDocumentFragment();
      docFragment.appendChild(table);
    </script>
    <h1 id="h1">Otherwise, if there is a table element in the stack of open elements, but the last table element in the stack of open elements has no parent, or its parent node is not an element, then the foster parent element is the element before the last table element in the stack of open elements.</h1>
  </table>
</div>
''';

void main() {
    document.body.appendHtml(htmlEL2);
    var div = document.getElementById('div');
    var h1 = document.getElementById('h1');
    var firstElementChild=div.childNodes.firstWhere((x) => x is Element);
    Expect.equals(h1, firstElementChild);
}
