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
import "../../resources/check-layout.dart";

const String htmlEL1 = r'''
<style>
#container {
  font: 20px/1 Ahem;
  border: solid orange;
}
</style>
''';

const String htmlEL2 = r'''
<p>An empty inline should still get a linebox even when it precedes a space at which we start collapsing whitespace.</p>
<div id="container" style="width: 100px" data-expected-client-height=50>
X <span style="font-size: 50px;"></span> X
</div>
<div id="container" style="width: 100px" data-expected-client-height=50>
X<span style="font-size: 50px;"></span> X
</div>
<div id="container" style="width: 100px" data-expected-client-height=50>
X <span style="font-size: 50px;"></span>X
</div>
<div id="container" style="width: 100px" data-expected-client-height=50>
X  <span style="font-size: 50px;"></span> X
</div>
<div id="container" style="width: 100px" data-expected-client-height=50>
X<span style="font-size: 50px;"></span>X
</div>
<div id="container" style="width: 100px" data-expected-client-height=50>
X<span style="font-size: 50px;"></span>  X
</div>
<div id="container" style="width: 100px" data-expected-client-height=50>
X <span style="font-size: 50px;"></span>  X
</div>
''';

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
    checkLayout('#container');
}
