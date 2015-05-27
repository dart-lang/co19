/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that DOMSubtreeModified listeners cannot cause inDocument
 * to be incorrect
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id=container>
    </div>
    <span id=el>
    </span>
    ''', treeSanitizer: new NullTreeSanitizer());

  var counter = 0;
  var container = document.getElementById('container');
  var el = document.getElementById('el');
  broken(_) {
    if (++counter > 2) {
      document.removeEventListener('DOMSubtreeModified', broken, true);
      return;
    }
    container.append(el);
  }

  document.addEventListener("DOMSubtreeModified", broken, true);
  broken(null);
  shouldBeTrue(document.contains(document.getElementById('el')));
  el.remove();
  el = null;
  gc();
  shouldBeNull(document.getElementById('el'));
}
