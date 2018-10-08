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
      <p>Test that when dir attribute is specified for non html element, it is not considered for dirname attribute value in submission body.</p>
      <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" viewBox="0 0 400 400" dir="rtl">
          <div>
          <form action="#action" method="GET" name="f">
              <input type=text name="nonHtmlAncestor" dirname="nonHtmlAncestor.dir"> 
              <p><button name="mode" type=submit value="add">Post Comment</button></p>
          </form>
          </div>
      </svg>
      ''', treeSanitizer: new NullTreeSanitizer());

  var url = window.location.href;

  if (!url.contains('nonHtmlAncestor')) {
    FormElement f = document.body.querySelector('form');
    f.submit();
  } else {
    shouldBeTrue(window.location.search.contains("nonHtmlAncestor.dir=ltr"));
  }
}
