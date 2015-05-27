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
#a { color: green; }
/*
  Normal multiline comment
*/
#b { color: green; }
/*
#c { color: green; }
*/

/* Single line comment */
/* #d { color: green; } */
#e { color: green; }

/*/ Comment start with slash */
/*/ #f { color: green; } */

/* #g is valid: */
/**/ #g { color: green; } */
#h { color: green; }
/**/#i/**/{/**/color/**/:/**/green/**/;/**/}

/* Unterminated comment. Should not crash.
</style>
''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml(r'''
<p>Test parsing of CSS nth-child tokens.</p>

<p>Rules from the stylesheet:</p>

<pre id="result"></pre>

<p>Expected result:</p>

<pre id="expected">#a { color: green; }
#b { color: green; }
#e { color: green; }
#g { color: green; }
#i { color: green; }
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
