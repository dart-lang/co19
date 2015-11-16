/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Test for a bug where computing the text offset for a position at the
 * beginning of a glyph cluster at the beginning of a Core Text run resulted
 * in an attempt to read past the end of a vector. 
 * The test passes if an assertion failure does not occur and the selection is
 * before the first Thai character.
 */
import "../../testharness.dart";

const String htmlEL2 = '''
<div id="target" style="font-size: 36px;">
    ไพ
</div>
''';

void main() {
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    var target = document.getElementById("target");
    var x = target.offsetLeft + 1;
    var y = target.offsetTop + target.offsetHeight ~/ 2;
    window.dispatchEvent(new MouseEvent('moveto', screenX:x, screenY:y));
    window.dispatchEvent(new MouseEvent('mousedown'));
    window.dispatchEvent(new MouseEvent('mouseup'));
//    window.onSelect.listen((e) {
       var selection = window.getSelection();
       Expect.identical(target.firstChild, selection.baseNode);
      Expect.equals(5, selection.baseOffset);
//    });    
}
