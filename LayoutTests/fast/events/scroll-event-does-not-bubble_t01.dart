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
      <div>
          This tests that the scroll event does not bubble.
      </div>
      <div id="container" style="width:100px; height:200px;overflow:scroll">
          Quisque rhoncus, nibh quis condimentum malesuada, tortor dolor consequat turpis, sit amet lacinia lacus massa et nulla. In volutpat, metus sed interdum tempus, diam mi scelerisque ante, a imperdiet nunc purus sit amet sapien. Nam ac nisl non ipsum hendrerit ornare. Mauris vestibulum. Etiam ut sapien. Nunc in neque. Maecenas dictum cursus ipsum. Fusce elit est, feugiat in, accumsan aliquet, gravida eu, turpis. Curabitur sit amet turpis vitae erat facilisis hendrerit. Fusce quam mauris, ornare non, ultrices ut, sodales a, pede. Nunc blandit tempus pede. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Sed arcu pede, tincidunt ut, lacinia id, iaculis pellentesque, lectus. Fusce sapien nisl, dapibus ac, venenatis at, accumsan eu, mi. Duis vehicula tincidunt quam. Nullam eleifend. Donec nec diam. Etiam sapien mauris, bibendum non, porttitor eu, varius interdum, tellus.
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var windowWasScrolled = false;

  windowScrolled(_) {
    windowWasScrolled = true;
    testFailed('window.onscroll was called.');
    asyncEnd();
  }

  divScrolled(_) {
    shouldBeFalse(windowWasScrolled);
    asyncEnd();
  }

  runTest() {
    asyncStart();

    DivElement div = document.getElementById('container');

    div.onScroll.listen(divScrolled);
    window.onScroll.listen(windowScrolled);
    div.scrollTo(1,1);
  }

  runTest();
}
