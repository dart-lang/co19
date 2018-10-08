/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that collapseToStart() and collapseToEnd() throw 
 * INVALID_STATE_ERR if no selection is made.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  _shouldThrow(func()) =>
    shouldThrow(func,
        (e) => e is DomException && e.name == DomException.INVALID_STATE);

  var sel = window.getSelection();
  var textNode = new Text("abcdef");
  document.body.append(textNode);

  _shouldThrow(() => sel.collapseToStart());
  _shouldThrow(() => sel.collapseToEnd());

  sel.selectAllChildren(textNode);

  sel.collapseToStart();
  sel.collapseToEnd();

  textNode.remove();
}

