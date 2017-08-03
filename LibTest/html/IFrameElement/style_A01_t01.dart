/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final style
 * @description Checks that CSS properties are accessible via style field.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../testcommon.dart";

main() {
  document.body.setInnerHtml('''<div>
         <iframe  style="color: red; direction: rtl"
                  class="ief">
         </iframe>
         </div>''', treeSanitizer: new NullTreeSanitizer());
  Element x = document.body.getElementsByClassName('ief')[0];

  Expect.equals('red', x.style.color, 'color');
  Expect.equals('rtl', x.style.direction, 'direction');
}
