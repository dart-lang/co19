/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description A variety of Range methods should throw if called on a
 * detached range.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div style="visibility: hidden">
        <div id=a1>a1
            <div id=b1>b1</div>
        </div>
    </div>
    ''', treeSanitizer: new NullTreeSanitizer());

  _shouldThrow(func()) =>
    shouldThrow(func,
        (e) => e is DomException && e.name == DomException.INVALID_STATE);

  var range = document.createRange();
  range.selectNode(document.getElementById("a1"));
  range.detach();

  _shouldThrow(() => range.cloneContents());
  _shouldThrow(() => range.cloneRange());
  _shouldThrow(() => range.collapsed);
  _shouldThrow(() => range.commonAncestorContainer);
  //_shouldThrow(() => range.compareBoundaryPoints(Range.START_TO_END, range));
  _shouldThrow(() => range.comparePoint(document.getElementById('b1'), 1));
  _shouldThrow(() => range.createContextualFragment('p'));
  _shouldThrow(() => range.deleteContents());
  _shouldThrow(() => range.detach());
  _shouldThrow(() => range.endContainer);
  _shouldThrow(() => range.endOffset);
  _shouldThrow(() => range.extractContents());
  _shouldThrow(() => range.insertNode(document.getElementById('b1')));
  //_shouldThrow(() => range.intersectsNode(document.getElementById('b1')));
  _shouldThrow(() => range.isPointInRange(document.getElementById('b1'), 0));
  _shouldThrow(() => range.selectNode(document.getElementById('b1')));
  _shouldThrow(() => range.selectNodeContents(document.getElementById('b1')));
  _shouldThrow(() => range.setEnd(document.getElementById('b1'), 0));
  _shouldThrow(() => range.setStart(document.getElementById('b1'), 0));
  _shouldThrow(() => range.startContainer);
  _shouldThrow(() => range.startOffset);
  _shouldThrow(() => range.surroundContents(document.getElementById('b1')));
  _shouldThrow(() => range.toString());
}
