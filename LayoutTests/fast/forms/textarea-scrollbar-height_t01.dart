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
  var f = new DocumentFragment.html('''
      <style type="text/css">
      body {font:13px/1.22 arial;}
      li {overflow:auto;}
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <p> <b> Vertical scrollbar should not be created when there is no overflow. </b> </p>
      <p> This test passes if the list item below, bordered in blue, has no vertical scrollbar. </p>
       <ul >
         <li id="list_item" style="border:1px solid blue;">
           list item
         </li>
       </ul>
      ''', treeSanitizer: new NullTreeSanitizer());

  checkForVerticalScrollbar(_) {
    var actual_height = document.getElementById('list_item').clientHeight;
    var scroll_height =  document.getElementById('list_item').scrollHeight;
    shouldBe(actual_height, scroll_height);
    asyncEnd();
  }

  asyncStart();
  window.onLoad.listen(checkForVerticalScrollbar);
}
