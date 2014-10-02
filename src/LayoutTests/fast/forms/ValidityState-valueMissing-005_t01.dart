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
      <p>There's a list of form control elements below, required attribute does not apply to them:
      validity.valueMissing should be false.</p>
      <input name="victim" type="hidden" required />
      <input name="victim" type="range" required />
      <input name="victim" type="image" required />
      <input name="victim" type="reset" required />
      <input name="victim" type="button" required />
      <input name="victim" type="submit" required />
      ''', treeSanitizer: new NullTreeSanitizer());

  var v = document.getElementsByName("victim");

  for (var i = 0; i < v.length; i++)
    shouldBeFalse(v[i].validity.valueMissing);
}
