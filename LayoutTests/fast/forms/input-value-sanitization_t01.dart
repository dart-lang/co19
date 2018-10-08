/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests for value sanitization algorithm.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var input;

  debug('');
  debug('Email with multiple:');
  input = document.createElement('input');
  input.multiple = true;
  input.type = 'email';
  input.setAttribute('value', ' tkent@chromium.org, tkent@example.!!!  ');
  shouldBe(input.value, "tkent@chromium.org,tkent@example.!!!");
  debug('Email without multiple:');
  input = document.createElement('input');
  input.multiple = false;
  input.type = 'email';
  input.setAttribute('value', ' tkent@chromium.org, tkent@example.***  \r\n');
  shouldBe(input.value, "tkent@chromium.org, tkent@example.***");

  debug('');
  debug('Number:');
  input = document.createElement('input');
  input.setAttribute('value', '65536');
  input.type = 'number';
  shouldBe(input.value, "65536");
  input.value = "256";
  shouldBe(input.value, "256");
  input.value = "";
  shouldBe(input.value, "");


  debug('');
  debug('Range:');
  input = document.createElement('input');
  input.type = 'text';
  input.value = ':)';
  input.type = 'range';
  shouldBe(input.value, "50");

  debug('');
  debug('Text:');
  var container = document.createElement('div');
  document.body.append(container);
  container.innerHtml = '<input type="text" id="text" value="\n\r foo bar \n\r\n">';
  input = document.getElementById('text');
  shouldBe(input.value, " foo bar ");
  input.focus();
  document.execCommand('SelectAll', false, '');
  //shouldBe(window.getSelection().toString(), " foo bar "); //FIXME

  input.value = new String.fromCharCode(0xD800);
  shouldBe(input.value, new String.fromCharCode(0xD800));

  input.value = 'foo\0bar';
  shouldBeEqualToString(input.value, "foo\0bar");

  input.value = 'foo\bbar';
  shouldBeEqualToString(input.value, "foo\bbar");

  input.value = 'foo\tbar';
  shouldBeEqualToString(input.value, "foo\tbar");

  input.value = "foo\vbar";
  shouldBeEqualToString(input.value, "foo\vbar");

  input.value = "foo\fbar";
  shouldBeEqualToString(input.value, "foo\fbar");

  // FIXME: Add more sanitization tests.
  // https://bugs.webkit.org/show_bug.cgi?id=37024
}
