/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that destroying a checked radio button that does
 * not have a form correctly removes the radio button element from the checked
 * radio buttons map. This test should ideally be run with GuardMalloc or a
 * similar memory checker.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div>SUCCESS - Didn't crash!</div>
    <div id="container"><input name="a" type="radio" checked></div>
    <input name="a" id="radio" type="radio">
    ''', treeSanitizer: new NullTreeSanitizer());

  document.getElementById('container').innerHtml = '';
  (document.getElementById('radio') as RadioButtonInputElement).checked = true;
}
