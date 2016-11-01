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
      <p>There's a list of form control elements below, required attribute applies to them but they're empty:
      validity.valueMissing should be true.</p>
      <input name="victim" type="text" required />
      <input name="victim" type="search" required />
      <input name="victim" type="url" required />
      <input name="victim" type="telephone" required />
      <input name="victim" type="email" required />
      <input name="victim" type="password" required />
      <input name="victim" type="number" required />
      ''', treeSanitizer: new NullTreeSanitizer());

  List<Node> v = document.getElementsByName("victim");

  for (var i = 0; i < v.length; i++)
    shouldBeTrue((v[i] as InputElement).validity.valueMissing);
}
