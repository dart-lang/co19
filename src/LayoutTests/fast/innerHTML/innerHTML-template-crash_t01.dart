/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

main() {
  var body = document.body;

  body.setInnerHtml('<template xmlns="http://test/foo"></template>',
      treeSanitizer: new NullTreeSanitizer());

  document.querySelector('template').innerHtml = "<p>Lorem Ipsum</p>";

  //This test passes if it does not CRASH.
}

