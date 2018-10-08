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
      <form method=POST></form>
      ''', treeSanitizer: new NullTreeSanitizer());

  FormElement form = document.body.querySelector('form');

  form.onReset.listen((event) {
    event.preventDefault();
    shouldBeTrue(event.defaultPrevented);
    asyncEnd();
  });

  asyncStart();
  form.reset();
}
