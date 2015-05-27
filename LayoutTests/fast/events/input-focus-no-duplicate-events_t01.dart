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
      <p>Focusing on the bottom input should not trigger duplicate focus events for both inputs.</p>
      <input type="text" id="x"><br>
      <input type="text" id="y">
      <pre id="log">
      Expected:
      Bottom Input: Focus Event #1
      Top Input: Focus Event #1

      Actual:
      </pre>
      ''', treeSanitizer: new NullTreeSanitizer());

  var actual = [];

  log(s) {
    document.getElementById('log').append(new Text(s+"\n"));
    actual.add(s);
  }

  var topInput = document.getElementById('x');
  var topCounter = 0;
  var bottomInput = document.getElementById('y');
  var bottomCounter = 0;

  topInput.addEventListener('focus', (_) {
    ++topCounter;
    log("Top Input: Focus Event #$topCounter");
  }, false);

  bottomInput.addEventListener('focus', (_) {
    ++bottomCounter;
    log("Bottom Input: Focus Event #$bottomCounter");
    topInput.focus();
  }, false);

  bottomInput.focus();

  shouldBeList(actual,  ['Bottom Input: Focus Event #1', 'Top Input: Focus Event #1']);
}
