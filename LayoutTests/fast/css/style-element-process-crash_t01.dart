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
      <object>
      <input autofocus>
      </object>
      <style>
      .abc::first-child { 
              font: 2147483647 small-caps 3507521020px sans-serif;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());

  crash(_) {
    document.body.innerHtml = "<div>PASS</div>. Test didn't crash.";
    asyncEnd();
  }

  document.body.querySelector('input').onFocus.listen(crash);

  asyncStart();
}
