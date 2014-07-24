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
#a:nth-child(1n+0) { color: green; }
#b:nth-child(n+0)  { color: green; }
#c:nth-child(n)    { color: green; }
#d:nth-child(-n+0) { color: green; }
#e:nth-child(-n)   { color: green; }

#f:nth-child(1N+0) { color: green; }
#g:nth-child(N+0)  { color: green; }
#h:nth-child(N)    { color: green; }
#i:nth-child(-N+0) { color: green; }
#j:nth-child(-N)   { color: green; }

#k:nth-child(+ 1n) { color: green; }
#l:nth-child(-1N
  -
  123  ) { color: green; }
#m:nth-child(  N- 123) { color: green; }
#n:nth-child(  n +12 3) { color: green; }
#o:nth-child( 23n

 +

123  ) { color: green; }
#p:nth-child(  12 n ) { color: green; }
#q:nth-child(+12n-0+1) { color: green; }
#r:nth-child(+12N -- 1) { color: green; }
#s:nth-child(+12 N ) { color: green; }
#t:nth-child(+n+3) { color: green; }
#u:nth-child( +n + 7 ) { color: green; }
#v:nth-child(+ n + 7) { color: green; }
</style>
''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml(r'''
<p>Test parsing of CSS nth-child tokens.</p>

<p>Rules from the stylesheet:</p>

<pre id="result"></pre>

<p>Expected result:</p>

<pre id="expected">#a:nth-child(1n+0) { color: green; }
#b:nth-child(n+0) { color: green; }
#c:nth-child(n) { color: green; }
#d:nth-child(-n+0) { color: green; }
#e:nth-child(-n) { color: green; }
#f:nth-child(1N+0) { color: green; }
#g:nth-child(N+0) { color: green; }
#h:nth-child(N) { color: green; }
#i:nth-child(-N+0) { color: green; }
#j:nth-child(-N) { color: green; }
#l:nth-child(-1N
  -
  123) { color: green; }
#m:nth-child(N- 123) { color: green; }
#o:nth-child(23n

 +

123) { color: green; }
#t:nth-child(+n+3) { color: green; }
#u:nth-child(+n + 7) { color: green; }
</pre>
''', treeSanitizer: new NullTreeSanitizer());

  /** Changes the result text font size. */
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
