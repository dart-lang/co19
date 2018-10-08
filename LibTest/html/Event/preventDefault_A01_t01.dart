/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void preventDefault()
 * Cancels the event (if it is cancelable).
 * @description Checks that default action is canceled (following the link).
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var a = new AnchorElement(href: 'missing url');
  document.body.append(a);

  a.onClick.listen((e) {
    e.preventDefault();
  });

  var res = a.dispatchEvent(new Event('click'));

  Expect.isFalse(res);
}
