/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests a letter with :first-letter applied is present in
 * text.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
    <style>
    .first:first-letter {
      font-weight: bold;
      visibility: visible;
    }
    .visible {
      visiblity: visible;
    }
    .invisible {
      visibility: hidden;
    }
    .preLine {
      white-space: pre-line;
    }
    .preWrap {
      white-space: pre-wrap;
    }
    .left {
      float: left;
    }
    .left:first-letter {
      text-transform: capitalize;
    }
    </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
    <div id="tests">
    <div id="divFirst" class="first">div</div>
    <div id="divNormal">div</div>
    <pre id="pFirst" class="first">pre</pre>
    <pre id="pNormal">pre</pre>
    <div id="collapsedSpaceFirst"><span> </span><div class="first">abc</div></div>
    <div id="collapsedSpaceNormal"><span> </span><div>abc</div></div>
    <div id="collapsedSpacePreFirst"><span> </span><pre class="first">abc</pre></div>
    <div id="collapsedSpacePreNormal"><span> </span><pre>abc</pre></div>
    <div id="preSpaceFirst"><span>test</span><pre class="first">  abc</pre></div>
    <div id="preSpaceNormal"><span>test</span><pre>  abc</pre></div>
    <div id="divSpaceFirst"><span>test</span><div class="first">  abc</div></div>
    <div id="divSpaceNormal"><span>test</span><div>  abc</div></div>
    <div id="preLineFirst" class="first preLine">test</div>
    <div id="preLineNormal" class="preLine">test</div>
    <div id="preWrapFirst" class="first preWrap">
    test</div>
    <div id="preWrapNormal" class="preWrap">
    test</div>
    <div id="collapsedSpaceDivFirst"><span>foo</span><span> </span><div class="first">abc</div></div>
    <div id="collapsedSpaceDivNormal"><span>foo</span><span> </span><div>abc</div></div>
    <div id="firstCollapsedDivFirst"><div class="first">abc  </div><span>def</span></div>
    <div id="firstCollapsedDivNormal"><div>abc  </div><span>def</span></div>
    <div id="collapsedSpaceCollapsedDivFirst"><span>foo</span><span> </span><div class="first">  abc</div></div>
    <div id="collapsedSpaceCollapsedDivNormal"><span>foo</span><span> </span><div>  abc</div></div>
    <div id="collapsedSpacePunctDivFirst"><span>foo</span><span> </span><div class="first">|  
    abc</div></div>
    <div id="collapsedSpacePunctDivNormal"><span>foo</span><span> </span><div>|  
    abc</div></div>
    <div id="divSpanFirst" class="first"><span id="f1">1</span><span id="f2">2</span></div>
    <div id="divSpanNormal"><span id="n1">1</span><span id="n2">2</span></div>
    <div id="invisiblePre"><pre class="invisible">test</pre></div>
    <div id="invisiblePreFirst"><pre class="invisible first">test</pre></div>
    <div id="invisible">
    <div class="invisible"><input value="an input" type="text"/> </div><pre>test</pre>
    </div>

    <pre>
    Results
    </pre>
    <div id="floatDt"><dl><dt class=left> ab<dt class=left> cd<dt class=left> e</dl></div>
    </div>
    ''', treeSanitizer: new NullTreeSanitizer());

  // commented some tests as dart's .text (.textContent) is not a
  // replacement for .innerText
  // see https://developer.mozilla.org/en-US/docs/Web/API/Node.textContent

  shouldBe(document.getElementById('divFirst').text, document.getElementById('divNormal').text);
  shouldBe(document.getElementById('pFirst').text, document.getElementById('pNormal').text);
  shouldBe(document.getElementById('collapsedSpaceFirst').text, document.getElementById('collapsedSpaceNormal').text);
  shouldBe(document.getElementById('collapsedSpacePreFirst').text, document.getElementById('collapsedSpacePreNormal').text);
  shouldBe(document.getElementById('preLineFirst').text, document.getElementById('preLineNormal').text);
  shouldBe(document.getElementById('preWrapFirst').text, document.getElementById('preWrapNormal').text);
  shouldBe(document.getElementById('preSpaceFirst').text, document.getElementById('preSpaceNormal').text);
  shouldBe(document.getElementById('collapsedSpaceDivFirst').text, document.getElementById('collapsedSpaceDivNormal').text);
  shouldBe(document.getElementById('firstCollapsedDivFirst').text, document.getElementById('firstCollapsedDivNormal').text);
  shouldBe(document.getElementById('collapsedSpaceCollapsedDivFirst').text, document.getElementById('collapsedSpaceCollapsedDivNormal').text);
  //shouldBe(document.getElementById('collapsedSpaceCollapsedDivFirst').text, 'foo\nabc\n');
  shouldBe(document.getElementById('collapsedSpacePunctDivFirst').text, document.getElementById('collapsedSpacePunctDivNormal').text);
  //shouldBe(document.getElementById('collapsedSpacePunctDivFirst').text, 'foo\n| abc\n');
  shouldBe(document.getElementById('divSpanFirst').text, document.getElementById('divSpanNormal').text);
  //shouldBe(document.getElementById('invisiblePre').text, ''); 
  //shouldBe(document.getElementById('invisiblePreFirst').text, 't\n');
  //shouldBe(document.getElementById('invisible').text, 'test\n');
  //shouldBe(document.getElementById('floatDt').text, 'Ab Cd E');
}
