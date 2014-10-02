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
import "../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <p>This test checks for the autofocus attribute. Autofocus is set on the first
      and on the third input. Success on "YES NO YES".</p>
      <input autofocus id="one"/>
      <input/>
      <input autofocus/>
      ''', treeSanitizer: new NullTreeSanitizer());
      
  var a = document.queryAll("input");

  shouldBeTrue(a[0].autofocus);
  shouldBeFalse(a[1].autofocus);
  shouldBeTrue(a[2].autofocus);
}
