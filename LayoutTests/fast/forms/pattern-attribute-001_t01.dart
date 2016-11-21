/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Pattern attribute presence test
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <p>There an input element with the pattern attribute set.</p>
      <input name="victim" pattern="something" />
      ''', treeSanitizer: new NullTreeSanitizer());

  List<Node> v = document.getElementsByName("victim");
  shouldBe((v[0] as InputElement).pattern, "something");
}
