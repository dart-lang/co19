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
.container {
    height: 100px;
    width: 400px;
    -webkit-column-width: 100px;
    -webkit-column-gap: 0px;
    column-width: 100px;
    column-gap: 0px;
    column-fill: auto;
}

.percentLogicalHeight {
    -webkit-writing-mode: vertical-lr;
    height: 100%;
    width: 100%;
    background-color: navy;
}
</style>
''';

const String htmlEL2 = r'''
<p><a href="https://bugs.webkit.org/show_bug.cgi?id=103075">Bug 103075</a>: RenderBox::computePercentageLogicalHeight should use containingBlockLogicalWidthForContent</p>
<p>This test checks that a percent logical height child in an orthogonal writing mode uses the multi-column's containing block column-width when resolving the logical height.</p>
<div class="container">
    <div class="percentLogicalHeight" data-expected-width="100" data-expected-height="100"></div>
</div>
''';

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
    checkLayout('.percentLogicalHeight');
}
