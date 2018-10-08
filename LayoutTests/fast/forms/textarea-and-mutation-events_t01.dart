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
      <style>

          html body { }

      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <p>Tests to see if registering an empty DOMNodeInserted event handler and dirtying the tree just right can cause attach re-entrancy with textarea.
      <p>Passes if doesn't crash.
      <div id="foo">
          <textarea> </textarea>
          <ul><li><li></ul>
          <iframe></iframe>
      </div>
      <div id="bar"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  document.body.addEventListener("DOMNodeInserted", (_) { }, false);
  var foo = document.getElementById("foo");
  var bar = document.getElementById("bar");
  bar.className = " ";
  bar.append(foo);
  // Test complete. If didn't crash at this point, clean up.
  foo.remove();
}
