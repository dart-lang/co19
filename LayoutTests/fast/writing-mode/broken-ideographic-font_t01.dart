/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description Broken Ideographic Font
 */
import "dart:html";
import "../../testcommon.dart";

const String htmlEL1 = '''
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  
<style type="text/css">
@font-face {
    src: url($testSuiteRoot/fast/writing-mode/resources/MakibaFont13.ttf);
    font-family: MakibaFace;
}

body {
  margin: 50px;
  font-size: 20px;
  font-family: MakibaFace;
}

.lrblock {
  writing-mode: tb-lr;  /* IE */
  -webkit-writing-mode: vertical-lr;
  height: 275px;
  margin-bottom: 50px;
  padding: 1px;
  background-color: #eee;
}

.basic {
  width: 275px;
  margin: 0;
  padding: 1px;
  writing-mode: lr-tb;  /* IE */
  -webkit-writing-mode: horizontal-tb;
}

div.d0 {
  background-color: #fee;
}

div.d1 {
  background-color: #ffe;
}
p {
  margin: 10% 5% 10% 5%;
  background-color: #faa;
  border-left: 20px solid #f88;
  border-right: 20px solid #f88;
  line-height: 1em;
  padding: 1px;
}

.vert {
  writing-mode: tb-rl;  /* IE */
  -webkit-writing-mode: vertical-rl;
}

</style>
''';

const String htmlEL2 = r'''
<div class="lrblock">
<div class="basic d0"><p>第一段落 paragraph 1</p><p>第二段落 paragraph 2</p></div>
<div class="basic d1 vert"><p>第一段落 paragraph 1</p><p>第二段落 paragraph 2</p></div>
</div>
''';

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());

    document.body.offsetTop;
    var image = new ImageElement();
    image.addEventListener("error", (e) {
       asyncEnd();
    });
    asyncStart();
    image.src = "$testSuiteRoot/fast/writing-mode/resources/MakibaFont13.ttf";
}