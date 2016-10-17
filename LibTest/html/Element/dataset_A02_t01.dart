/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Map<String, String> dataset
 * The keys for the map must follow these rules:
 *
 * The name must not begin with 'xml'.
 * The name cannot contain a semi-colon (';').
 * The name cannot contain any capital letters.
 * @description Checks disallowed cases.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../testcommon.dart";

main() {
  var x = new Element.html('<p data-xml="0"></p>',
      treeSanitizer: new NullTreeSanitizer());

  Expect.mapEquals({}, x.dataset);

  //...
}
