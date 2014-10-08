/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test if changing disabled updates checkValidity.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <input id="input" disabled required />
      ''', treeSanitizer: new NullTreeSanitizer());

  var input = document.getElementById('input');
  input.value = "";
  input.disabled = false;
  shouldBeFalse(input.checkValidity());
}
