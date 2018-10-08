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
      <div> This test checks that non-form-control elements connect onfocus
      and onblur to the focus and blur events, which do not bubble, not
      DOMFocusIn and DOMFocusOut, which do bubble. focus and blur should
      show up once each below.

      <div id="console">
      </div>
      <div id="container" tabindex="-1" contentEditable="true">
      Text
      <input id="input" type="text">
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var messages = [];

  log(str) {
    document.getElementById("console").innerHtml += str + '<br>';
    messages.add(str);
  }

  var container = document.getElementById('container');
  container.onFocus.listen((_) => log('focus'));
  container.onBlur.listen((_) => log('blur'));

  document.getElementById("input").focus();
  document.getElementById("input").blur();
  document.getElementById("container").focus();
  document.getElementById("container").blur();

  shouldBeList(messages, ['focus', 'blur']);
}
