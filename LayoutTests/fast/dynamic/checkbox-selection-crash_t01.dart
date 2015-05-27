/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
      .gone { display:none }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);
 
  document.body.setInnerHtml('''
      Loading this page should not crash.
      <table>
      <td id=td1>
      .<input id=cb type="checkbox">.
      </table>
      ''', treeSanitizer: new NullTreeSanitizer());

  var sel = window.getSelection();
  var td1 = document.getElementById('td1');
  // having selection triggers Document::updateRendering() from paint()
  sel.setBaseAndExtent(td1, 0, td1, 1000);
  // this causes style recalc and rendering tree tear down (from updateRendering) in middle of painting, which crashes
  document.body.setAttribute('class','gone');
  var cb = document.getElementById('cb');
  // this triggers synchronous paint() 
  cb.click();  
  document.body.setAttribute('class','');
}
