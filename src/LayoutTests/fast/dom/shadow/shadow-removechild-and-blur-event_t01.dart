/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Check focused shadow node dispatchs blur event on removeChild
 * of host.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <span id=test></span>
    <div>PASS</div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var logs = [];
  var test = document.getElementById('test');
  var shadow = test.createShadowRoot();
  var input = document.createElement("input");
  shadow.append(input);
  input.addEventListener('blur', (_) { logs.add('blur'); });
  input.focus();
  logs.add('start-removeChild');
  test.remove();
  logs.add('end-removeChild');
  shouldBeEqualToString(logs.join(','), 'start-removeChild,blur,end-removeChild');
}
