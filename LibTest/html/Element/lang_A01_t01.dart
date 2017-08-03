/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String lang
 * Gets/sets the language of an element's attributes, text, and element
 * contents.
 * @description Checks expected attribute settings
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../testcommon.dart";

main() {
  var x = new Element.html('<p></p>', treeSanitizer: new NullTreeSanitizer());
  Expect.equals('', x.lang);

  x = new Element.html('<p lang="fr">voilà</p>',
      treeSanitizer: new NullTreeSanitizer());
  Expect.equals('fr', x.lang);
}
