/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that template contents are not cloned when the template
 * element is cloned
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <template id="template"><span>Contents</span></template>
    ''', treeSanitizer: new NullTreeSanitizer());

  var template = document.getElementById('template');
  var div = template.append(document.createElement('div'));

  shouldBe(template.content.childNodes.length, 1);
  var clone = template.clone(true);
  shouldBe(clone.content.childNodes.length, 1);
  shouldBe(clone.outerHtml, template.outerHtml);
  shouldNotBe(clone.content.firstChild, template.content.firstChild);
  shouldNotBe(clone.content, template.content);
  shouldBe(clone.firstChild.tagName, "DIV");
  shouldNotBe(clone.firstChild, div);
}

