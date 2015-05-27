/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test to make sure shadow nodes are not exposed.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var container = document.createElement("p");
  document.body.append(container);

  container.append(new Text("Some text: "));

  shouldBe(window.getSelection().anchorNode, null);
  shouldBe(window.getSelection().anchorOffset, 0);
  shouldBe(window.getSelection().focusNode, null);
  shouldBe(window.getSelection().focusOffset, 0);
  shouldBe(window.getSelection().isCollapsed, true);
  shouldBe(window.getSelection().rangeCount, 0);

  shouldBe(window.getSelection().baseNode, null);
  shouldBe(window.getSelection().baseOffset, 0);
  shouldBe(window.getSelection().extentNode, null);
  shouldBe(window.getSelection().extentOffset, 0);
  shouldBe(window.getSelection().type, 'None');

  debug("\nAdd an input element.\n");

  var input = document.createElement("input");
  container.append(input);
  input.value = "text";
  input.focus();
  input.select();

  shouldBe(window.getSelection().anchorNode, container);
  shouldBe(window.getSelection().anchorOffset, 1);
  shouldBe(window.getSelection().focusNode, container);
  shouldBe(window.getSelection().focusOffset, 1);
  shouldBe(window.getSelection().isCollapsed, true);
  shouldBe(window.getSelection().rangeCount, 1);
  shouldBe(window.getSelection().getRangeAt(0).startContainer, container);
  shouldBe(window.getSelection().getRangeAt(0).startOffset, 1);
  shouldBe(window.getSelection().getRangeAt(0).endContainer, container);
  shouldBe(window.getSelection().getRangeAt(0).endOffset, 1);

  shouldBe(window.getSelection().baseNode, container);
  shouldBe(window.getSelection().baseOffset, 1);
  shouldBe(window.getSelection().extentNode, container);
  shouldBe(window.getSelection().extentOffset, 1);
  shouldBe(window.getSelection().type, 'Range');

  debug("\nAdd a textarea element.\n");

  var textarea = document.createElement("textarea");
  container.append(textarea);
  textarea.value = "text";
  textarea.focus();
  textarea.select();

  shouldBe(window.getSelection().anchorNode, container);
  shouldBe(window.getSelection().anchorOffset, 2);
  shouldBe(window.getSelection().focusNode, container);
  shouldBe(window.getSelection().focusOffset, 2);
  shouldBe(window.getSelection().isCollapsed, true);
  shouldBe(window.getSelection().rangeCount, 1);
  shouldBe(window.getSelection().getRangeAt(0).startContainer, container);
  shouldBe(window.getSelection().getRangeAt(0).startOffset, 2);
  shouldBe(window.getSelection().getRangeAt(0).endContainer, container);
  shouldBe(window.getSelection().getRangeAt(0).endOffset, 2);

  shouldBe(window.getSelection().baseNode, container);
  shouldBe(window.getSelection().baseOffset, 2);
  shouldBe(window.getSelection().extentNode, container);
  shouldBe(window.getSelection().extentOffset, 2);
  shouldBe(window.getSelection().type, 'Range');
}
