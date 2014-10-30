/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description 
 */
import "dart:html";
import "../../testharness.dart";

const String htmlEL2 = r'''
<div id="hidden"  style="visibility: hidden">
<script id="script">/*&quot;&apos;&amp;&lt;&gt;&nbsp;&#34;&#39;&#38;&#60;&#62;&#160;"'&<> */</script>
<style id="style">/*&quot;&apos;&amp;&lt;&gt;&nbsp;&#34;&#39;&#38;&#60;&#62;&#160;"'&<> */</style>
<textarea id="textarea">/*&quot;&apos;&amp;&lt;&gt;&nbsp;&#34;&#39;&#38;&#60;&#62;&#160;"'&<> */</textarea>
<xmp id="xmp">/*&quot;&apos;&amp;&lt;&gt;&nbsp;&#34;&#39;&#38;&#60;&#62;&#160;"'&<> */</xmp>
</div>
''';

var innerTests =
[ ["script", r"""/*&quot;&apos;&amp;&lt;&gt;&nbsp;&#34;&#39;&#38;&#60;&#62;&#160;"'&<> */"""],
  ["style", r"""/*&quot;&apos;&amp;&lt;&gt;&nbsp;&#34;&#39;&#38;&#60;&#62;&#160;"'&<> */"""],
  ["textarea", r"""/*"'&amp;&lt;&gt;&nbsp;"'&amp;&lt;&gt;&nbsp;"'&amp;&lt;&gt; */"""],
  ["xmp", r"""/*&quot;&apos;&amp;&lt;&gt;&nbsp;&#34;&#39;&#38;&#60;&#62;&#160;"'&<> */"""],
];

var outerTests = 
[ ["script", r"""<script id="script">/*&quot;&apos;&amp;&lt;&gt;&nbsp;&#34;&#39;&#38;&#60;&#62;&#160;"'&<> */</script>"""],
  ["style", r"""<style id="style">/*&quot;&apos;&amp;&lt;&gt;&nbsp;&#34;&#39;&#38;&#60;&#62;&#160;"'&<> */</style>"""],
  ["textarea", r"""<textarea id="textarea">/*"'&amp;&lt;&gt;&nbsp;"'&amp;&lt;&gt;&nbsp;"'&amp;&lt;&gt; */</textarea>"""],
  ["xmp", r"""<xmp id="xmp">/*&quot;&apos;&amp;&lt;&gt;&nbsp;&#34;&#39;&#38;&#60;&#62;&#160;"'&<> */</xmp>"""],
];

String innerHTML(textnode) {
    return document.getElementById(textnode).innerHtml;
}

String outerHTML(textnode) {
    return document.getElementById(textnode).outerHtml;
}

void main() {
    description("Tests that accessing the innerHTML property of a text node encodes harmful entities which can result in cross site scripting.");
    document.body.appendHtml(htmlEL2);
    for (List tdata in innerTests) {
        shouldBe(innerHTML(tdata[0]), tdata[1]);
    }
    for (List tdata in outerTests) {
        shouldBe(outerHTML(tdata[0]), tdata[1]);
    }
    checkTestFailures();
}
