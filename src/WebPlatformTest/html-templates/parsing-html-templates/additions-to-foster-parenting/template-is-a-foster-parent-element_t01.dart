/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The last template element with either no table element is below 
 * it, or a table element immediately below it, in the stack of open elements
 * is the foster parent element (NOT the template's parent!)
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

main() {
  test(() {
    var doc = newHTMLDocument();
    
    doc.body.innerHtml = '' +
    '<div id="tmplParent">' +
        '<template id="tmpl1">' +
            '<table id="tbl">' +
                '<tr><td>Cell 1</td></tr>' +
            // Misplaced <div>. It should be foster parented
            '<div id="orphanDiv">Orphan div content</div>' +
                '<tr><td>Cell 2</td></tr>' +
            '</table>' +
        '</template>' +
    '</div>';
    
    var template = doc.querySelector('#tmpl1');
    var div = template.content.querySelector('#orphanDiv');
    
    assert_equals(div.parentNode, template.content, 'Wrong foster parent element');
    
  }, 'Template is a foster parent element. Test <table> immediately below <template>');



  test(() {
    var doc = newHTMLDocument();
    
    doc.body.innerHtml = '' +
    '<div id="tmplParent">' +
        '<template id="tmpl1">' +
                '<tr><td>Cell 1</td></tr>' +
            // Misplaced <div>. It should be foster parented
            '<div id="orphanDiv">Orphan div content</div>' +
                '<tr><td>Cell 2</td></tr>' +
        '</template>' +
    '</div>';
    
    var template = doc.querySelector('#tmpl1');
    var div = template.content.querySelector('#orphanDiv');
    
    assert_equals(div.parentNode, template.content, 'Wrong foster parent element');
    
  }, 'Template is a foster parent element. Test <template> element without <table>');
}
