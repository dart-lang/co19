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
 * after web-platform-tests/html/semantics/scripting-1/the-script-element/script-text.xhtml
 * @assertion
 * http://whatwg.org/html/#dom-script-text
 * @description HTMLScriptElement.text: Getter with CDATA section
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL = r'''
<script name="script">
<x>7;</x>
<![CDATA[
  var x = "y";
]]>
</script>
''';

void main() {
  document.body.appendHtml(htmlEL);
//  var script = document.body.getElementsByTagName("script")[0];
  var script = document.getElementsByName("script")[0];
  assert_equals(script.text, '\n\n\n  var x = "y";\n\n');
}
