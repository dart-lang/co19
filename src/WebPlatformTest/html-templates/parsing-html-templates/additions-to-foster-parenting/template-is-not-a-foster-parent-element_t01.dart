/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion When template element shouldn't be a foster parent then regular 
 * rules of foster parenting should be applied
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

main () {
  test(() {
    var doc = newHTMLDocument();
    
    doc.body.innerHtml = '' +
    '<div id="tmplParent">' +
        '<template id="tmpl1">' +
            '<div id="fosterParent">' +
                '<table id="tbl">' +
                    '<tr><td>Cell 1</td></tr>' +
                // Misplaced <div>. It should be foster parented
                '<div id="orphanDiv">Orphan div content</div>' +
                    '<tr><td>Cell 2</td></tr>' +
                '</table>' +
            '</div>' +
        '</template>' +
    '</div>';
    
    var template = doc.querySelector('#tmpl1');
    var fosterParent = template.content.querySelector('#fosterParent');
    var div = template.content.querySelector('#orphanDiv');
    
    assert_equals(div.parentNode, fosterParent, 'Wrong foster parent element');
    
  }, 'Template is not a foster parent element. '
      + 'Test the case when <template> is higher in stack of open elements');



  test(() {
    var doc = newHTMLDocument();
    
    doc.body.innerHtml = '' +
            '<div id="fosterParent">' +
                '<table id="tbl">' +
                    '<tr><td><template id="tmpl1">Template content</template></td></tr>' +
                // Misplaced <div>. It should be foster parented
                '<div id="orphanDiv">Orphan div content</div>' +
                    '<tr><td>Cell 2</td></tr>' +
                '</table>' +
            '</div>' +
    '</div>';
    
    var t = doc.querySelector('#tmpl1');
    var fosterParent = doc.querySelector('#fosterParent');
    var div = doc.querySelector('#orphanDiv');
    
    assert_equals(div.parentNode, fosterParent, 'Wrong foster parent element');
    
  }, 'Template is not a foster parent element. '
      + 'Test the case when <template> is lower in stack of open elements');
}
