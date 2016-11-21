/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests for HTMLTextAreaElement.maxLength behaviors.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  TextAreaElement textArea = document.createElement('textarea') as TextAreaElement;
  document.body.append(textArea);

  // No maxlength attribute
  shouldBe(textArea.maxLength, -1);

  // Invalid maxlength attributes
  textArea.setAttribute('maxlength', '-3');
  shouldBe(textArea.maxLength, -1);
  textArea.setAttribute('maxlength', 'xyz');
  shouldBe(textArea.maxLength, -1);

  // Valid maxlength attributes
  textArea.setAttribute('maxlength', '1');
  shouldBe(textArea.maxLength, 1);
  textArea.setAttribute('maxlength', '256');
  shouldBe(textArea.maxLength, 256);

  // Set values to .maxLength
  textArea.maxLength = 13;
  shouldBe(textArea.getAttribute("maxlength"), "13");

  shouldThrow(() => textArea.maxLength = -1,
      (e) => e is DomException && e.name == DomException.INDEX_SIZE);
  shouldBe(textArea.getAttribute("maxlength"), "13");  // Not changed

  /*textArea.maxLength = null;
  shouldBe(textArea.maxLength, 0);
  shouldBe(textArea.getAttribute("maxlength"), "0");*/

  // maxLength doesn't truncate the default value.
  textArea = document.createElement('textarea');
  textArea.setAttribute('maxlength', '3');
  textArea.innerHtml = 'abcd';
  document.body.append(textArea);
  shouldBe(textArea.value, "abcd");

  // maxLength doesn't truncate .value
  textArea.maxLength = 3;
  textArea.value = 'abcde';
  shouldBe(textArea.value, "abcde");

  // Set up for user-input tests
  createFocusedTextAreaWithMaxLength(maxLength) {
    if (textArea != null)
      textArea.remove();
    textArea = document.createElement('textarea');
    //textArea.setAttribute('maxlength', maxLength);
    textArea.setAttribute('maxlength', maxLength.toString());
    document.body.append(textArea);
    textArea.focus();
  }

  // Insert text of which length is maxLength.
  createFocusedTextAreaWithMaxLength(3);
  document.execCommand('insertText', false, 'abc');
  shouldBe(textArea.value, "abc");

  // Try to add characters to maxLength characters.
  createFocusedTextAreaWithMaxLength(3);
  textArea.value = 'abc';
  document.execCommand('insertText', false, 'def');
  shouldBe(textArea.value, "abc");

  // Replace text
  createFocusedTextAreaWithMaxLength(3);
  textArea.value = 'abc';
  document.execCommand('selectAll', false, '');
  document.execCommand('insertText', false, 'def');
  shouldBe(textArea.value, "def");

  // Existing value is longer than maxLength.  We can't add text.
  createFocusedTextAreaWithMaxLength(3);
  textArea.value = 'abcdef';
  document.execCommand('insertText', false, 'ghi');
  shouldBe(textArea.value, "abcdef");

  // We can delete a character in the longer value.
  createFocusedTextAreaWithMaxLength(3);
  textArea.value = 'abcdef';
  document.execCommand('delete', false, '');
  shouldBe(textArea.value, "abcde");

  // A linebreak is 1 character.
  createFocusedTextAreaWithMaxLength(4);
  document.execCommand('insertText', false, 'A');
  document.execCommand('insertLineBreak', false, '');
  document.execCommand('insertText', false, 'B');
  shouldBe(textArea.value, "A\nB");

  // Confirms correct count for close linebreaks inputs.
  createFocusedTextAreaWithMaxLength(3);
  textArea.innerHtml = 'a\n\n';
  document.execCommand('insertLineBreak', false, '');
  shouldBe(textArea.value, "a\n\n");

  // Confirms correct count for open consecutive linebreaks inputs.
  createFocusedTextAreaWithMaxLength(6);
  document.execCommand('insertLineBreak', false, '');
  document.execCommand('insertLineBreak', false, '');
  document.execCommand('insertLineBreak', false, '');
  document.execCommand('insertLineBreak', false, '');
  shouldBe(textArea.value, "\n\n\n");

  // According to the HTML5 specification, maxLength is code-point length.
  // Blink follows it though WebKit handles it as grapheme length.

  // fancyX should be treated as 1 grapheme.
  var fancyX = "x\u0305\u0332";// + String.fromCharCode(0x305) + String.fromCharCode(0x332);
  // u10000 is one character consisted of a surrogate pair.
  //var u10000 = "\ud800\udc00"; // valid in js, invalid in dart
  var u10000 = "\u{10000}";

  debug('Inserts 2 normal characters + a combining letter with 3 code points into a maxlength=3 element.');
  createFocusedTextAreaWithMaxLength(3);
  document.execCommand('insertText', false, 'AB' + fancyX);
  shouldBeEqualToString(textArea.value, "ABx");
  shouldBe(textArea.value.length, 3);

  createFocusedTextAreaWithMaxLength(3);
  textArea.value = 'AB' + fancyX;
  textArea.setSelectionRange(2, 5);  // Select fancyX
  document.execCommand('insertText', false, 'CDE');
  shouldBe(textArea.value, "ABC");

  debug('Inserts 2 normal characters + one surrogate pair into a maxlength=3 element');
  createFocusedTextAreaWithMaxLength(3);
  document.execCommand('insertText', false, 'AB' + u10000);
  shouldBeEqualToString(textArea.value, "AB");
  shouldBe(textArea.value.length, 2);

  createFocusedTextAreaWithMaxLength(3);
  textArea.value = 'AB' + u10000;
  textArea.setSelectionRange(2, 4);  // Select u10000
  document.execCommand('insertText', false, 'CDE');
  shouldBe(textArea.value, "ABC");

  // In the case maxlength=0
  createFocusedTextAreaWithMaxLength(0);
  textArea.value = '';
  document.execCommand('insertText', false, 'ABC');
  shouldBe(textArea.value, "");

  // In the case maxlength=''
  createFocusedTextAreaWithMaxLength('');
  textArea.value = '';
  document.execCommand('insertText', false, 'ABC');
  shouldBe(textArea.value, "ABC");

  // In the case maxlength='invalid'
  createFocusedTextAreaWithMaxLength('invalid');
  textArea.value = '';
  document.execCommand('insertText', false, 'ABC');
  shouldBe(textArea.value, "ABC");
}
