/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that cycle detection traverses over both templates and
 * shadow roots
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id=container>
      <template><div></div></template>
    </div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var outerDiv = document.getElementById('container');
  var template = document.querySelector('template');
  var div = template.content.firstChild;
  var shadowRoot = div.createShadowRoot();
  var shadowDiv = shadowRoot.append(document.createElement('div'));
  shouldThrow(() => shadowDiv.append(outerDiv));
}
