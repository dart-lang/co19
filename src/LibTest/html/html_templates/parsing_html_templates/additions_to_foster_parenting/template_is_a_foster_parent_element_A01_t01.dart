/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The last template element with either no table element is below
 * it, or a table element immediately below it, in the stack of open elements
 * is the foster parent element (NOT the template's parent!).
 */

import 'dart:html';
import "../../../../../Utils/expect.dart";
import '../../testcommon.dart';

class NoCheck implements NodeTreeSanitizer {
  void sanitizeTree(Node node) {} // does nothing
}

main() {
  test('Test <table> immediately below <template>', () {
    var doc = newHtmlDocument();
    
    doc.body.setInnerHtml('''
    <div id="tmplParent">
        <template id="tmpl1">
            <table id="tbl">
                <tr><td>Cell 1</td></tr>
            <!-- Misplaced <div>. It should be foster parented -->
            <div id="orphanDiv">Orphan div content</div>
                <tr><td>Cell 2</td></tr>
            </table>
        </template>
    </div>''',
        treeSanitizer: new NoCheck());
    
    var template = doc.querySelector('#tmpl1');
    var div = template.content.querySelector('#orphanDiv');
    
    Expect.equals(template.content, div.parentNode);
    
  });

  test('Test <template> element without <table>', () {
    var doc = newHtmlDocument();
    
    doc.body.setInnerHtml('''
      <div id="tmplParent">
      <template id="tmpl1">
      <tr><td>Cell 1</td></tr>
      <!-- Misplaced <div>. It should be foster parented -->
      <div id="orphanDiv">Orphan div content</div>
      <tr><td>Cell 2</td></tr>
      </template>
      </div>''',
        treeSanitizer: new NoCheck());
    
    var template = doc.querySelector('#tmpl1');
    var div = template.content.querySelector('#orphanDiv');

    Expect.equals(template.content, div.parentNode);
  });
}