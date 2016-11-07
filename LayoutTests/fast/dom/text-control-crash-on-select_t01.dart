/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests that we don't crash when killing an text input's or
 * textarea's renderer and then calling select.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <textarea id="textarea1">textarea</textarea>
      <textarea id="textarea2">textarea</textarea>
      <textarea id="textarea3">textarea</textarea>
      <textarea id="textarea4">textarea</textarea>
      <input id="input1">
      <input id="input2">
      <input id="input3">
      <input id="input4">
      ''', treeSanitizer: new NullTreeSanitizer());

  $(id) {
    return document.getElementById(id);
  }

  testSettingSelection(tagName) {
    var id = tagName + '1';
    $(id).style.display = "none";
    ($(id) as InputElement).select();

    id = tagName + '2';
    $(id).style.display = "none";
    ($(id) as InputElement).setSelectionRange(1, 2);

    id = tagName + '3';
    $(id).style.display = "none";
    ($(id) as InputElement).selectionStart = 2;

    id = tagName + '4';
    $(id).style.display = "none";
    ($(id) as InputElement).selectionEnd = 1;
  }

  testSettingSelection('textarea');
  testSettingSelection('input');
}
