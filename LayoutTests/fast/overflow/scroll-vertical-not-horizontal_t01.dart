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
<div style="padding-left: 100px;">
<p>Thisisareallywidelinethatshereatthestartsowehaveahorizontalscrollbar.Thisisareallywidelinethatshereatthestartsowehaveahorizontalscrollbar.Thisisareallywidelinethatshereatthestartsowehaveahorizontalscrollbar.</p>
<p><a name="anchor">Anchor</a> is here, and should cause a vertical scroll only, not a horizontal scroll.</p>
<p>So, if the test succeeds, the text below should say that we're at the left but not at the top.</p>
<p id="console"></p>
<p style="height: 1000px">This is very tall line that's here at the end so we have a vertical scroll bar.</p>
</div>
''';

void startTest(e) {
    window.location.href = '#anchor';
    runLater(finishTest, 0);
}

int count = 0;

void finishTest() {
print("finishTest");
    if (window.location.toString().indexOf("#") == -1) {
        if (count++ < 100) {
            runLater(finishTest, 10);
         } else {
            testFailed("location must contain '#'");
        }
        return;
    }
    var message = """Scroll position is ${window.scrollX == 0 ? '' : 'not '} at left and 
${window.scrollY == 0 ? '' : 'not '} at top.""";
    debug(message);
    shouldBe(window.scrollX, 0);
    shouldBeFalse(window.scrollY == 0);
    asyncEnd();
}

void main() {
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    window.onLoad.listen(startTest);
    asyncStart();
}
