/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Shadow Content Element Crash
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <p>This test confirms adding a content element into a shadow root does not cause crash.</p>

    <div id='container'>FAIL</div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var div = document.getElementById('container');
  var root = div.createShadowRoot();
  root.innerHtml = "<content select='span'>PASS</content>";
}
