/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool spellcheck
 * Controls spell-checking (present on all HTML elements)
 * @description Checks expected attribute values.
 * @needsreview what's the default?
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  IFrameElement x = new Element.html('<iframe class="y">Content Text</iframe>');
  Expect.isTrue(x.spellcheck, 'default');

  x = new Element.html('<iframe spellcheck="false"></iframe>');
  Expect.isFalse(x.spellcheck, 'explicit false');

  x = new Element.html('<iframe spellcheck="true"></iframe>');
  Expect.isTrue(x.spellcheck, 'explicit true');
}
