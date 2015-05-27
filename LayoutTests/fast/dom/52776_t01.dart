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
  document.body.setInnerHtml('''
<div dir=rtl>
<p>Right To Left

<p>Well-formed pair of unicode bidi control characters.
<div>&#x202b;b!&#x202c;</div>
<div>&#x202a;b!&#x202c;</div>

<p>Unpaired unicode bidi control characters.
<div>&#x202b;b!</div>
<div>&#x202a;b!</div>

<p>Empty content inside unicode bidi control characters.
<div>&#x202c;&#x202c;</div>
<div>&#x202a;&#x202a;</div>
<div>&#x202b;&#x202b;</div>

<p>String inside unicode bidi control characters.
<div contenteditable id="test">&#x202c;abc&#x202c;</div>
<div>&#x202a;abc&#x202a;</div>
<div>&#x202b;abc&#x202b;</div>

<p>String around unicode bidi control characters.
<div>def&#x202c;abc&#x202c;</div>
<div>&#x202c;abc&#x202c;def</div>
<div>xyz&#x202c;abc&#x202c;def</div>

<p>Nested unicode bidi control characters.
<div>&#x202a;&#x202a;b!&#x202c;</div>
<div>&#x202b;&#x202b;b!&#x202c;</div>
<div>&#x202c;&#x202c;b!&#x202c;</div>
<div>&#x202c;1&#x202b;c!&#x202c;</div>

<p>Start with different directionality characters.
<div>12&#x202c;&#x202a;1&#x202c;&#x202b</div>
<div>12&#x202c;&#x202a;</div>
<div>&#x660;&#x661;&#x202c;&#x202a;</div>
<div>&#x683;&#x684;&#x202c;&#x202a;</div>
<div>&#x1;&#x202c;&#x202a;</div>
<div>abc&#x202c;&#x202a;</div>
<div>&#x5d0;&#x5d1;&#x202c;&#x202a;</div>
</div>

<div>
<p>Left To Right

<p>Well-formed pair of unicode bidi control characters.
<div>&#x202b;b!&#x202c;</div>
<div>&#x202a;b!&#x202c;</div>

<p>Unpaired unicode bidi control characters.
<div>&#x202b;b!</div>
<div>&#x202a;b!</div>

<p>Empty content inside unicode bidi control characters.
<div>&#x202c;&#x202c;</div>
<div>&#x202a;&#x202a;</div>
<div>&#x202b;&#x202b;</div>

<p>String inside unicode bidi control characters.
<div>&#x202c;abc&#x202c;</div>
<div>&#x202a;abc&#x202a;</div>
<div>&#x202b;abc&#x202b;</div>

<p>String around unicode bidi control characters.
<div>def&#x202c;abc&#x202c;</div>
<div>&#x202c;abc&#x202c;def</div>
<div>xyz&#x202c;abc&#x202c;def</div>

<p>Nested unicode bidi control characters.
<div>&#x202a;&#x202a;b!&#x202c;</div>
<div>&#x202b;&#x202b;b!&#x202c;</div>
<div>&#x202c;&#x202c;b!&#x202c;</div>
<div>&#x202c;1&#x202b;c!&#x202c;</div>

<p>Start with different directionality characters.
<div>12&#x202c;&#x202a;1&#x202c;&#x202b</div>
<div>12&#x202c;&#x202a;</div>
<div>&#x660;&#x661;&#x202c;&#x202a;</div>
<div>&#x683;&#x684;&#x202c;&#x202a;</div>
<div>&#x1;&#x202c;&#x202a;</div>
<div>abc&#x202c;&#x202a;</div>
<div>&#x5d0;&#x5d1;&#x202c;&#x202a;</div>
</div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var test = document.getElementById('test');
  var sel = window.getSelection();
  sel.setPosition(test,0);
  sel.modify("move", "right", "lineBoundary");
  sel.modify("move", "left", "character");
  sel.modify("extend", "left", "character");
  debug("test id=test: the right-most character of rendering result of <PDF>abc<PDF> in RTL block should be c");
  shouldBe(sel.toString(), 'c');
}