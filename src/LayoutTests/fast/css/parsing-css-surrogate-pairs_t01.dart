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

  This file intentionally contains scpecial characters which
  cannot be displayed by some text editors. Please
  carefully edit the file.
*/

/* basic */
#a61_a { color: red; }
#b61_\61 { color: green; }

#a65530_￺ { color: red; }
#b65530_\fffa { color: green; }

#a65532_￼ { color: red; }
#b65532_\fffc { color: green; }

#a65533_� { color: red; }
#b65533_\fffd { color: green; }

/* above the 0xffff */
#a65536_𐀀 { color: red; }
#b65536_\10000 { color: green; }

#a119558_𝌆 { color: red; }
#b119558_\01d306 { color: green; }
</style>
''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml(r'''
<p>Test parsing of CSS surrogate pairs.</p>

<p>Rules from the stylesheet:</p>

<pre id="result"></pre>

<p>Expected result:</p>

<pre id="expected">#a61_a { color: red; }
#b61_a { color: green; }
#a65530_￺ { color: red; }
#b65530_￺ { color: green; }
#a65532_￼ { color: red; }
#b65532_￼ { color: green; }
#a65533_� { color: red; }
#b65533_� { color: green; }
#a65536_𐀀 { color: red; }
#b65536_𐀀 { color: green; }
#a119558_𝌆 { color: red; }
#b119558_𝌆 { color: green; }
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

    shouldBe(document.getElementById("result").firstChild.data,
        document.getElementById("expected").firstChild.data);
  }

  runTest();
}
