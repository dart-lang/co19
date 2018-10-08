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
      <p><input type="text" name="test" id="test" readonly autofocus></p>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  document.getElementById('test').onFocus.listen((_) => asyncEnd());
}
