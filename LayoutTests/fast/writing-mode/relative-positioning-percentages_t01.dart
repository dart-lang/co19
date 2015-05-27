/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description This is a test that relative position percentages are computed with respect to physical dimensions.
 */
import "dart:html";
import "../../../Utils/expect.dart";

const String htmlEL1 = r'''
<style>
.lr { -webkit-writing-mode:vertical-lr; background-color:green; width:100px; height:100px; position:relative; top:50%; }
</style>
''';

const String htmlEL2 = r'''
This is a test that relative position percentages are computed with respect to physical dimensions.
<div style="width:300px; height:100px;border:2px solid black">
<div class="lr" id="test"></div>
</div>
''';

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
    
    var test = document.getElementById("test");
    var rect = test.getBoundingClientRect();
    var parentRect = test.parentNode.getBoundingClientRect();
    Expect.equals(52, rect.top - parentRect.top);
    print("test passed");
}