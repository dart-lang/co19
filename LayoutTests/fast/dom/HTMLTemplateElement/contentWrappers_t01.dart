/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test HTMLTemplateElement content node wrappers have the correct
 * lifetime.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <template id="template"><span></span></template>
    ''', treeSanitizer: new NullTreeSanitizer());

  var template = document.getElementById('template');
  var span = template.content.firstChild;
  shouldBe(span.tagName, "SPAN");

  span = null;

  span = template.content.firstChild;
  shouldBe(span.tagName, "SPAN");
}
