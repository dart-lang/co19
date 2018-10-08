/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test passes if it does not crash.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <input id="x" type="image" src="" />
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  InputElement input = document.getElementById('x') as InputElement;
  input.onError.listen((_) {
    input.type = '';
    asyncEnd();
  });
}
