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
import "../../../../Utils/expect.dart";

const String htmlEL2 = r'''
<p>
    To test manually, verify that you can select each one of the Thai glyphs
    separately from the other by dragging.
</p>
<p id="result">
</p>
<div id="target" style="font-size: 48px; float: left;">&#3652;&#3614;</div>
''';

void main() {
    document.body.appendHtml(htmlEL2);

    var target = document.getElementById("target");
    var x = target.offsetLeft + target.offsetWidth / 2;
    var y = target.offsetTop + target.offsetHeight / 2;

    window.dispatchEvent(new MouseEvent('moveto', screenX:x.round(), screenY:y.round()));
    window.dispatchEvent(new MouseEvent('mouseDown'));
    window.dispatchEvent(new MouseEvent('mouseUp'));

    var selection = window.getSelection();
    Expect.identical(target.firstChild, selection.baseNode);
    Expecy.equals(1, selection.baseOffset);
}
