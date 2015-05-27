/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Loading this page should not cause a crash.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <button disabled>PASS</button>
      ''', treeSanitizer: new NullTreeSanitizer());

  document.getElementsByTagName('button')[0].disabled = false;
}
