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
      <form></form>
      ''', treeSanitizer: new NullTreeSanitizer());

  eventHandlerOne(event) {
    event.stopImmediatePropagation();
  }

  eventHandlerTwo(event) {
    testFailed('should not happen');
  }

  var form = document.body.querySelector('form');
  form.addEventListener("reset", eventHandlerOne, true);
  form.addEventListener("reset", eventHandlerTwo, true);
  form.reset();
}
