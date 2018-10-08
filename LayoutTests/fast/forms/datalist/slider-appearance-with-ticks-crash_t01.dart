/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <p>No crash means test PASS.</p>
      <input type="text" list="foo" style="-webkit-appearance: slider-vertical">
      <input type="text" list="foo" style="-webkit-appearance: slider-horizontal">
      <datalist id="foo">
          <option>1</option>
      </datalist>
      ''', treeSanitizer: new NullTreeSanitizer());
}
