/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description DOMSubtreeModified should fire when attributes are added or
 * removed, but not modified
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var div = document.createElement('div');
  document.body.append(div);
  var expected = false;
  var count = 0;

  div.addEventListener('DOMSubtreeModified', (evt) {
    shouldBeTrue(expected);
    if (++count == 2)
      asyncEnd();
  });

  asyncStart();

  expected = true;
  div.setAttribute('foo', 'bar');
  expected = false;
  div.setAttribute('foo', 'baz');
  expected = true;
  div.attributes.remove('foo');
}
