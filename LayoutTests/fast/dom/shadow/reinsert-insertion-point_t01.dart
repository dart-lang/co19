/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="inside">Should be visible</div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var inside = document.getElementById('inside');
  var insideRoot = inside.createShadowRoot();

  var content = insideRoot.append(document.createElement('content'));

  shouldBeTrue(inside.offsetHeight > 0);

  content.remove();
  insideRoot.append(content);

  shouldBeTrue(inside.offsetHeight > 0);
}
