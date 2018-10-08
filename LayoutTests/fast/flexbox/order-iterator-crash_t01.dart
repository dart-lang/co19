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
      <div>This test has passed if it doesn't crash under ASAN.</div>
      <style>
      * { display: flex; }
      </style>
      <table><td id="crashy"></td></table>
      ''', treeSanitizer: new NullTreeSanitizer());

  var crashy = document.getElementById('crashy');
  crashy.offsetLeft;
  crashy.remove();
}
