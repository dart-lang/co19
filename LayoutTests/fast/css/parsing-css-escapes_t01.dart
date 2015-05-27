/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  // do not indent
  var style = new Element.html(r'''
<style>
/*
  === Warning ===

  This file intentionally contains special newline characters: \n \f \r \r\n
  Keep them when you move the file between different OSes / file-systems
*/

/* Base form of the rule: */
#a { background-color: green; }
#b { b\61 C\06bG\0052o\00075n\000064-col\6Fr: green; }
#c { b\61	c\6b
g\72o\75n\64
-color:green }
#d { background-colo\0000072: green; /* Invalid: too many hex characters. */}
#e { b\61ckground-color: green; /* Invalid: \0b is not a newline character. */}
</style>
''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml(r'''
<p>Test parsing of CSS escapes.</p>

<p>Rules from the stylesheet:</p>

<pre id="result"></pre>

<p>Expected result:</p>

<pre id="expected">#a { background-color: green; }
#b { background-color: green; }
#c { background-color: green; }
#d { }
#e { }
</pre>
''', treeSanitizer: new NullTreeSanitizer());

  runTest()
  {
    var rules = style.sheet.cssRules;
    var text = "";
    for (var i = 0; i < rules.length; i++) {
      text += rules.item(i).cssText;
      text += "\n";
    }

    document.getElementById("result").append(new Text(text));

    shouldBe((document.getElementById("result").firstChild as Text).data,
        (document.getElementById("expected").firstChild as Text).data);
  }

  runTest();
}
