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
import "../../../Utils/expect.dart";

const String htmlEL1 = r'''
<style>
  #rotated {
    width: 100px;
    height: 100px;
    background: red;
    margin: 10px;
    padding: 10px;
    -webkit-transform: rotate(180deg);
  }
</style>
''';

const String htmlEL2 = r'''
<div id="rotated">180 degree rotation</div>
''';

void runTest(e) {
    document.body.offsetWidth;
    var elt = document.elementFromPoint(50, 50);
    Expect. equals(document.getElementById('rotated'), elt);
}

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.insertAdjacentHtml('afterBegin', htmlEL2);
    window.onLoad.listen(runTest);
}
