/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests for assigning the value attribute to output elements.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var output;
  var childNode;

  debug('- Sets the defaultValue attribute with the value mode flag is in mode "defalut".');
  output = document.createElement('output');
  output.defaultValue = "defaultValue";
  shouldBeEqualToString(output.defaultValue, 'defaultValue');
  shouldBeEqualToString(output.value, 'defaultValue');
  shouldBeEqualToString(output.text, 'defaultValue');
  shouldBeEqualToString(output.innerHtml, 'defaultValue');

  debug('- Sets the value attribute. This will change the value mode flag from "default" to "value".');

  output.value = 'aValue';
  shouldBeEqualToString(output.defaultValue, 'defaultValue');
  shouldBeEqualToString(output.value, 'aValue');
  shouldBeEqualToString(output.text, 'aValue');
  shouldBeEqualToString(output.innerHtml, 'aValue');

  debug('- Sets the defaultValue attribute with the value mode flag is in mode "value".');
  output.defaultValue = 'another defaultValue';
  shouldBeEqualToString(output.defaultValue, 'another defaultValue');
  shouldBeEqualToString(output.value, 'aValue');
  shouldBeEqualToString(output.text, 'aValue');
  shouldBeEqualToString(output.innerHtml, 'aValue');

  debug('- Ensures that setting text to the value attribute works as setTextContent().');
  output.value =
    '<strong>A <span style=\"color: red;\">strong</span> text</strong>';
  shouldBe(output.value,
      '<strong>A <span style="color: red;">strong</span> text</strong>');
  shouldBe(output.text,
      '<strong>A <span style="color: red;">strong</span> text</strong>');
  shouldBe(output.innerHtml,
      '&lt;strong&gt;A &lt;span style="color: red;"&gt;strong&lt;/span&gt; text&lt;/strong&gt;');

  debug('- Sets the text attribute with the value mode flag is in mode "default".');
  output = document.createElement('output');
  output.text = 'text';
  shouldBeEqualToString(output.defaultValue, 'text');
  shouldBeEqualToString(output.value, 'text');
  shouldBeEqualToString(output.text, 'text');
  shouldBeEqualToString(output.innerHtml, 'text');

  output.text = '<strong>strong</strong> text';
  shouldBeEqualToString(output.defaultValue, '<strong>strong</strong> text');
  shouldBeEqualToString(output.value, '<strong>strong</strong> text');
  shouldBeEqualToString(output.text, '<strong>strong</strong> text');
  shouldBeEqualToString(output.innerHtml,
      '&lt;strong&gt;strong&lt;/strong&gt; text');

  debug('- Sets the text attribute with the value mode flag is in mode "value".');
  output = document.createElement('output');
  output.value = 'aValue';
  output.defaultValue = 'defaultValue';
  output.text = 'text';
  shouldBeEqualToString(output.defaultValue, 'defaultValue');
  shouldBeEqualToString(output.value, 'text');
  shouldBeEqualToString(output.text, 'text');
  shouldBeEqualToString(output.innerHtml, 'text');

  debug('- Sets the innerHtml attribute with the value mode flag is in mode "default".');
  output = document.createElement('output');
  output.innerHtml = 'text';
  shouldBeEqualToString(output.defaultValue, 'text');
  shouldBeEqualToString(output.value, 'text');
  shouldBeEqualToString(output.text, 'text');
  shouldBeEqualToString(output.innerHtml, 'text');

  output.innerHtml = '<strong>strong</strong> text';
  shouldBeEqualToString(output.defaultValue, 'strong text');
  shouldBeEqualToString(output.value, 'strong text');
  shouldBeEqualToString(output.text, 'strong text');
  shouldBeEqualToString(output.innerHtml, '<strong>strong</strong> text');

  debug('- Sets the innerHtml attribute with the value mode flag is in mode "value".');
  output = document.createElement('output');
  output.value = 'aValue';
  output.defaultValue = 'defaultValue';
  output.innerHtml = 'text';
  shouldBeEqualToString(output.defaultValue, 'defaultValue');
  shouldBeEqualToString(output.value, 'text');
  shouldBeEqualToString(output.text, 'text');
  shouldBeEqualToString(output.innerHtml, 'text');

  output.innerHtml = '<strong>strong</strong> text';
  shouldBeEqualToString(output.defaultValue, 'defaultValue');
  shouldBeEqualToString(output.value, 'strong text');
  shouldBeEqualToString(output.text, 'strong text');
  shouldBeEqualToString(output.innerHtml, '<strong>strong</strong> text');

  debug('- Appends a child node to the output element with the value mode flag is in mode "default".');
  output = document.createElement('output');
  childNode = document.createElement('span');
  childNode.text = 'childText';
  output.append(childNode);
  shouldBeEqualToString(output.defaultValue, 'childText');
  shouldBeEqualToString(output.value, 'childText');
  shouldBeEqualToString(output.text, 'childText');
  shouldBeEqualToString(output.innerHtml, '<span>childText</span>');
  debug('- Then removes the child node from the output element with the value mode flag is in mode "default".');
  childNode.remove();
  shouldBeEqualToString(output.defaultValue, '');
  shouldBeEqualToString(output.value, '');
  shouldBeEqualToString(output.text, '');
  shouldBeEqualToString(output.innerHtml, '');

  debug('- Appends a child node to the output element with the value mode flag is in mode "value".');
  output = document.createElement('output');
  output.value = 'aValue';
  output.defaultValue = 'defaultValue';
  childNode = document.createElement('span');
  childNode.text = ' and childText';
  output.append(childNode);
  shouldBeEqualToString(output.defaultValue, 'defaultValue');
  shouldBeEqualToString(output.value, 'aValue and childText');
  shouldBeEqualToString(output.text, 'aValue and childText');
  shouldBeEqualToString(output.innerHtml, 'aValue<span> and childText</span>');
  debug('- Then removes the child node from the output element with the value mode flag is in mode "default".');
  childNode.remove();
  shouldBeEqualToString(output.defaultValue, 'defaultValue');
  shouldBeEqualToString(output.value, 'aValue');
  shouldBeEqualToString(output.text, 'aValue');
  shouldBeEqualToString(output.innerHtml, 'aValue');
}
