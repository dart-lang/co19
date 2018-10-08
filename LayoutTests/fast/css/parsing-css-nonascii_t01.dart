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

main() {
  // do not indent
  dynamic style = new Element.html(r'''
<style>
/*
  === Warning ===

  This file intentionally contains scpecial characters which
  cannot be displayed by some text editors. Please
  carefully edit the file.
*/

#a127_\7F { color:red; }
#b127_ { color:green; }

#a128_\80 { color:red; }
#b128_ { color:green; }

#a159_\9F { color:red; }
#b159_ { color:green; }

#a160_\A0 { color:red; }
#b160_  { color:green; }

#a384_\180 { color:red; }
#b384_ƀ { color:green; }
</style>
''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml(r'''
<p>Test parsing of CSS escapes.</p>

<p>Rules from the stylesheet:</p>

<pre id="result"></pre>

<p>Expected result:</p>

<pre id="expected">#a127_\7f  { color: red; }
#a128_ { color: red; }
#b128_ { color: green; }
#a159_ { color: red; }
#b159_ { color: green; }
#a160_  { color: red; }
#b160_  { color: green; }
#a384_ƀ { color: red; }
#b384_ƀ { color: green; }
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
