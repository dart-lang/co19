/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The shadow HTML element: fallback content
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

main() {
  test(() {

    var d = document;

    var host = d.createElement('div');
    d.body.append(host);

    //Shadow root to play with
    var s = createSR(host);

    var div = d.createElement('div');
    div.setInnerHtml(
      '<span id="spandex">This is a shadow root content</span>' +
      '<shadow><span id="shadowId">This is a shadow fallback content</span></shadow>',
      treeSanitizer: new NullTreeSanitizer());
    s.append(div);

    assert_true(s.querySelector('#shadowId').offsetTop > 0, 'Fallback content should be rendered');

  }, 'A_10_05_01_T01');
}
