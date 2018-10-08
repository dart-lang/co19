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
  document.body.setInnerHtml('''
      <p>Test that when dirname attribute is specified then it is added in submission body.</p>

      <div dir="auto">
          <form action="#action" method="GET" name="f">
              <div dir="rtl"> 
                  <input type=text name="comment" dirname="rtlAncestor.dir" required>
              </div>
              <input type=text name="autoAncestor" dirname="autoAncestor.dir" value="שלום">
              <p><button name="mode" type=submit value="add">Post Comment</button></p>
          </form>
      Hello
      </div>

      <div id="console"></div>
      <div id="action">
      ''', treeSanitizer: new NullTreeSanitizer());

  var url = window.location.href;

  if (!url.contains('rtlAncestor')) {
    FormElement f = document.body.querySelector('form');
    f.submit();
  } else {
    shouldBeTrue(window.location.search.contains("rtlAncestor.dir=rtl"));
    shouldBeTrue(window.location.search.contains("autoAncestor.dir=ltr"));
  }
}
