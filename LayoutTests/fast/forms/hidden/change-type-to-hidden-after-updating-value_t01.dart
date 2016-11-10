/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description PASS unless crashed.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <input type="text" id="input1">
      ''', treeSanitizer: new NullTreeSanitizer());

  InputElement input = document.getElementById('input1') as InputElement;

  input.value = 'value';
  input.type = 'hidden';
}
