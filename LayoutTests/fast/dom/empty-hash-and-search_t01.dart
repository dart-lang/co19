/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Hash and search properties should be non-empty only if they
 * were specified.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <a id="link1" href="http://localhost:3000">link w/o hash</a>
    <a id="link2" href="http://localhost:3000/?#">link with empty hash</a>
    <a id="link3" href="http://localhost:3000/?search#test">link with hash</a>
    <div id="out"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var location = window.location;
  var out = document.getElementById('out');
  AnchorElement link1 = document.getElementById('link1');
  AnchorElement link2 = document.getElementById('link2');
  AnchorElement link3 = document.getElementById('link3');

  asyncStart();

  lastChar (s) => s.substring(s.length-1);

  window.onLoad.listen((_) {

    if (lastChar(window.location.toString()) != "#") {
      if (location.hash != ""
        /*|| location.search != ""*/ // test framework specifies ?
        ) {
        out.innerHtml = "<br>Failure at step 1<br>"
          + "location.hash: " + location.hash + "<br>"
          + "link1.hash: " + link1.hash + "<br>"
          + "link2.hash: " + link2.hash + "<br>"
          + "link3.hash: " + link3.hash + "<br>"
          + "location.search: " + location.search + "<br>"
          + "link1.search: " + link1.search + "<br>"
          + "link2.search: " + link2.search + "<br>"
          + "link3.search: " + link3.search + "<br>";
        testFailed('FAIL');
      } else
        window.location.href += "?#";

    } else { // Added "?#" and reloaded.
      out.innerHtml = "<br>"
        + "location.hash: " + location.hash + "<br>"
        + "link1.hash: " + link1.hash + "<br>"
        + "link2.hash: " + link2.hash + "<br>"
        + "link3.hash: " + link3.hash + "<br>"
        + "location.search: " + location.search + "<br>"
        + "link1.search: " + link1.search + "<br>"
        + "link2.search: " + link2.search + "<br>"
        + "link3.search: " + link3.search + "<br>";

      shouldBe(location.hash, '');
      shouldBe(link1.hash, '');
      shouldBe(link2.hash, '');
      shouldBe(link3.hash, '#test');
      //shouldBe(location.search, ''); // test framework specifies ?
      shouldBe(link1.search, '');
      shouldBe(link2.search, '');
      shouldBe(link3.search, '?search');

      asyncEnd();
    }
  });
}
