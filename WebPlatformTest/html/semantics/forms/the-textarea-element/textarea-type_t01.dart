/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * Portions of this test are derived from code under the following license:
 *
 * Web-platform-tests are covered by the dual-licensing approach described in:
 * http://www.w3.org/Consortium/Legal/2008/04-testsuite-copyright.html
 */
/**
 * after web-platform-tests/html/semantics/forms/the-textarea-element/textarea-type.html
 * @assertion
 * href="http://www.whatwg.org/html5/#dom-textarea-type
 * @description The type IDL attribute
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
<div id="test">
<textarea></textarea>  
</div>
''';

void main() {
  document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);
  assert_equals(document.getElementById("test")
                        .queryAll("textarea")[0].type,
                "textarea",
                "Textarea's type attribute should return 'textarea'");
}
