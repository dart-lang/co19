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

  body.setInnerHtml('''
    <div id="a" tabindex="1">PASS</div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var a = document.getElementById('a');
  a.attributes.remove('tabindex');
  a.addEventListener('focus', (_) {
    Expect.fail('should not happen');
  }, false);
  a.focus();
}
