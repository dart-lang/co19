/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests for tooLong flag with <textarea> elements.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  TextAreaElement textarea = document.createElement('textarea') as TextAreaElement;
  document.body.append(textarea);

  debug('No maxlength and no value');
  shouldBeFalse(textarea.validity.tooLong);

  debug('');
  debug('Non-dirty value');
  textarea.defaultValue = 'abcde';
  textarea.maxLength = 3;
  shouldBe(textarea.value.length, 5);
  shouldBeFalse(textarea.validity.tooLong);

  textarea.defaultValue = 'abcdef';
  shouldBe(textarea.value.length, 6);
  shouldBeFalse(textarea.validity.tooLong);

  debug('');
  debug('Dirty value and longer than maxLength');
  textarea = document.createElement('textarea');
  document.body.append(textarea);
  textarea.defaultValue = 'abcde';
  textarea.maxLength = 3;
  textarea.focus();
  textarea.setSelectionRange(5, 5);  // Move the cursor at the end.
  document.execCommand('delete', false, '');
  shouldBe(textarea.value.length, 4);
  shouldBeTrue(textarea.validity.tooLong);
  // Make the value <=maxLength.
  document.execCommand('delete', false, '');
  shouldBeFalse(textarea.validity.tooLong);

  debug('');
  debug('Sets a value via DOM property');
  textarea = document.createElement('textarea');
  document.body.append(textarea);
  textarea.maxLength = 3;
  textarea.value = 'abcde';
  shouldBeFalse(textarea.validity.tooLong);

  debug('');
  debug('Disabled');
  textarea.disabled = true;
  shouldBeFalse(textarea.validity.tooLong);
  textarea.disabled = false;

  debug('');
  debug('Grapheme length is not greater than maxLength though character length is greater');
  // fancyX should be treated as 1 grapheme.
  // U+0305 COMBINING OVERLINE
  // U+0332 COMBINING LOW LINE
  var fancyX = "x\u0305\u0332";
  textarea = document.createElement('textarea');
  document.body.append(textarea);
  textarea.value = fancyX; // 3 characters, 1 grapheme cluster.
  textarea.maxLength = 1;
  shouldBeFalse(textarea.validity.tooLong);

  debug('');
  debug('A value set by resetting a form doesn\'t make tooLong true.');
  // Make a dirty textarea.
  DivElement parent = document.createElement('div') as DivElement;
  document.body.append(parent);
  parent.setInnerHtml('<form><textarea maxlength=2>abcdef</textarea></form>',
      treeSanitizer: new NullTreeSanitizer());
  textarea = parent.firstChild.firstChild;
  textarea.focus();
  textarea.setSelectionRange(6, 6);
  document.execCommand('delete', false, '');
  shouldBeTrue(textarea.validity.tooLong);
  (parent.firstChild as FormElement).reset();
  shouldBe(textarea.value, "abcdef");
  shouldBeFalse(textarea.validity.tooLong);

  debug('');
  debug('A value set by a child node change doesn\'t make tooLong true.');
  parent.setInnerHtml('<textarea maxlength=2>abc</textarea>',
      treeSanitizer: new NullTreeSanitizer());
  textarea = parent.firstChild;
  shouldBeFalse(textarea.validity.tooLong);
  (parent.firstChild as Element).innerHtml = 'abcdef';
  shouldBe(textarea.value, "abcdef");
  shouldBeFalse(textarea.validity.tooLong);
}
