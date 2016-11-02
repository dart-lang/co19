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
      <p>There's a upload control below, with no file selected: missing value.</p>
      <input name="victim" type="file" required/>
      ''', treeSanitizer: new NullTreeSanitizer());

  List<Node> v = document.getElementsByName("victim");

  shouldBeTrue((v[0] as InputElement).validity.valueMissing);
}
