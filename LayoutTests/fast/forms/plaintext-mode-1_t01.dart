/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <input id="textfield" type="text" style="width: 300" value="hello world">
      ''', treeSanitizer: new NullTreeSanitizer());

  _assert(func, arg, expected) {
    var result = func(arg);
    shouldBe(result, expected);
  }

  InputElement e = document.getElementById("textfield") as InputElement;
  e.focus();
  e.setSelectionRange(0, 5);

  _assert(document.queryCommandEnabled, "BackColor", false);
  _assert(document.queryCommandEnabled, "Bold", false);
  _assert(document.queryCommandEnabled, "Copy", true);
  _assert(document.queryCommandEnabled, "CreateLink", false);
  _assert(document.queryCommandEnabled, "Cut", true);
  _assert(document.queryCommandEnabled, "Delete", true);
  _assert(document.queryCommandEnabled, "FontName", true); // Shouldn't this be false?
  _assert(document.queryCommandEnabled, "FontSize", true); // Shouldn't this be false?
  _assert(document.queryCommandEnabled, "FontSizeDelta", true); // Shouldn't this be false?
  _assert(document.queryCommandEnabled, "ForeColor", false);
  _assert(document.queryCommandEnabled, "ForwardDelete", true);
  _assert(document.queryCommandEnabled, "Indent", false);
  _assert(document.queryCommandEnabled, "InsertHTML", true);
  _assert(document.queryCommandEnabled, "InsertImage", false);
  _assert(document.queryCommandEnabled, "InsertLineBreak", true);
  _assert(document.queryCommandEnabled, "InsertParagraph", true);
  _assert(document.queryCommandEnabled, "InsertNewlineInQuotedContent", false);
  _assert(document.queryCommandEnabled, "InsertText", true);
  _assert(document.queryCommandEnabled, "Italic", false);
  _assert(document.queryCommandEnabled, "JustifyCenter", false);
  _assert(document.queryCommandEnabled, "JustifyFull", false);
  _assert(document.queryCommandEnabled, "JustifyLeft", false);
  _assert(document.queryCommandEnabled, "JustifyNone", false);
  _assert(document.queryCommandEnabled, "JustifyRight", false);
  _assert(document.queryCommandEnabled, "Outdent", false);
  _assert(document.queryCommandEnabled, "Paste", true);
  _assert(document.queryCommandEnabled, "PasteAndMatchStyle", true);
  _assert(document.queryCommandEnabled, "SelectAll", true);
  _assert(document.queryCommandEnabled, "Strikethrough", false);
  _assert(document.queryCommandEnabled, "Subscript", false);
  _assert(document.queryCommandEnabled, "Superscript", false);
  _assert(document.queryCommandEnabled, "Underline", false);
  _assert(document.queryCommandEnabled, "Unlink", false);
  _assert(document.queryCommandEnabled, "Unselect", true);

  e.setSelectionRange(3, 3);
  _assert(document.queryCommandEnabled, "Transpose", true);

  e.setSelectionRange(0, 5);
  shouldBeTrue(document.execCommand("Cut", false, ''));
  _assert(document.queryCommandEnabled, "Undo", true);
  shouldBeTrue(document.execCommand("Undo", false, ''));
  _assert(document.queryCommandEnabled, "Redo", true);
}
