 /*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests how setting href attributes affects setting a new base for the URL.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  var base = document.createElement('base');
  document.head.append(base);

  var a = document.createElement('a');
  document.body.append(a);

  base.href = 'http://old_base/';
  a.href = 'foo?query';
  shouldBeEqualToString(a.href, 'http://old_base/foo?query');
  base.href = 'http://new_base/';
  shouldBeEqualToString(document.querySelector('a').href, 'http://new_base/foo?query');
}
