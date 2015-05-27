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

#a:after { content:"65:A 9:	"; }
#b:after { content:"128: 159:"; }
#c:after { content:"1:"; }
#d:after { content:"8:"; }
#e:after { content:"9:	"; }
#f:after { content:"10:
"; } /* Newline. Invalid string */
#g:after { content:"11:"; }
#h:after { content:"12:"; } /* Newline. Invalid string */
#i:after { content:"13:"; } /* Newline. Invalid string */
#j:after { content:"14:"; }
#k:after { content:"20:"; }
#l:after { content:"30:"; }
#m:after { content:"31:"; }
#n:after { content:"127:" }
#o:after { content:"384:ƀ" }
</style>
''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml(r'''
<p>Test parsing of CSS escapes.</p>

<p>Rules from the stylesheet:</p>

<pre id="result"></pre>

<p>Expected result:</p>

<pre id="expected">#a::after { content: '65:A 9:\9'; }
#b::after { content: '128: 159:'; }
#c::after { content: '1:\1'; }
#d::after { content: '8:\8'; }
#e::after { content: '9:\9'; }
#f::after { }
#g::after { content: '11:\b'; }
#h::after { }
#i::after { }
#j::after { content: '14:\e'; }
#k::after { content: '20:\14'; }
#l::after { content: '30:\1e'; }
#m::after { content: '31:\1f'; }
#n::after { content: '127:\7f'; }
#o::after { content: '384:ƀ'; }
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
