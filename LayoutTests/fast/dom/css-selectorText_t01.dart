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
  var style = new Element.html(r'''
    <style>
    * { margin: 2px; }
    div { margin: 2px; }
    div span { margin 2px; }
    div ~ span { margin 2px; }
    div > span { margin 2px; }
    div + span { margin 2px; }
    #temp { margin 2px; }
    div#temp { margin 2px; }
    div.test[title="test"] { margin: 2px; }
    .test[title~="test"] { margin: 2px; }
    div > [title|="test"] { margin: 2px; }
    div.test[title^="test"] { margin: 2px; }
    span#test[title$="test"] { margin: 2px; }
    span[title*="test"]::after { margin: 2px; }
    div[title] { margin: 2px; }
    [title] { margin: 2px; }
    a:link { margin: 2px; }
    div, span > div:hover, a { margin: 2px; }
    div span#foo.test div:hover#bar a { margin: 2px; }
    /* Pseudo-classes */
    :link{ margin: 2px; }
    :visited{ margin: 2px; }
    :hover{ margin: 2px; }
    :active{ margin: 2px; }
    :focus{ margin: 2px; }
    :target{ margin: 2px; }
    :lang(en){ margin: 2px; }
    :not(table){ margin: 2px; }
    :root{ margin: 2px; }
    :foobarSelectorNotToBePrinted{ color: green; }
    :enabled{ margin: 2px; }
    :disabled{ margin: 2px; }
    :checked{ margin: 2px; }
    :indeterminate{ margin: 2px; }
    :nth-child(odd){ margin: 2px; }
    :nth-child(even){ margin: 2px; }
    :nth-child(2n){ margin: 2px; }
    :nth-child(2n+1){ margin: 2px; }
    :nth-child(-n+6){ margin: 2px; }
    :nth-last-child(odd){ margin: 2px; }
    :nth-last-child(even){ margin: 2px; }
    :nth-last-child(2n){ margin: 2px; }
    :nth-last-child(2n+1){ margin: 2px; }
    :nth-last-child(-n+6){ margin: 2px; }
    :nth-of-type(odd){ margin: 2px; }
    :nth-of-type(even){ margin: 2px; }
    :nth-of-type(2n){ margin: 2px; }
    :nth-of-type(2n+1){ margin: 2px; }
    :nth-of-type(-n+6){ margin: 2px; }
    :nth-last-of-type(odd){ margin: 2px; }
    :nth-last-of-type(even){ margin: 2px; }
    :nth-last-of-type(2n){ margin: 2px; }
    :nth-last-of-type(2n+1){ margin: 2px; }
    :nth-last-of-type(-n+6){ margin: 2px; }
    :first-child{ margin: 2px; }
    :last-child{ margin: 2px; }
    :first-of-type{ margin: 2px; }
    :last-of-type{ margin: 2px; }
    :only-child{ margin: 2px; }
    :only-of-type{ margin: 2px; }
    :empty{ margin: 2px; }
    ::first-line{ margin: 0 }
    ::selection{ margin: 2px; }
    ::before{ margin: 2px; }
    ::after{ margin: 2px; }
    </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  var styleSheet = style.sheet;

  var expected = [
    '*',
    'div',
    'div span',
    'div ~ span',
    'div > span',
    'div + span',
    '#temp',
    'div#temp',
    'div.test[title="test"]',
    '.test[title~="test"]',
    'div > [title|="test"]',
    'div.test[title^="test"]',
   r'span#test[title$="test"]',
    'span[title*="test"]::after',
    'div[title]',
    '[title]',
    'a:link',
    'div, span > div:hover, a',
    'div span#foo.test div:hover#bar a',
    ':link',
    ':visited',
    ':hover',
    ':active',
    ':focus',
    ':target',
    ':lang(en)',
    ':not(table)',
    ':root',
    ':enabled',
    ':disabled',
    ':checked',
    ':indeterminate',
    ':nth-child(odd)',
    ':nth-child(even)',
    ':nth-child(2n)',
    ':nth-child(2n+1)',
    ':nth-child(-n+6)',
    ':nth-last-child(odd)',
    ':nth-last-child(even)',
    ':nth-last-child(2n)',
    ':nth-last-child(2n+1)',
    ':nth-last-child(-n+6)',
    ':nth-of-type(odd)',
    ':nth-of-type(even)',
    ':nth-of-type(2n)',
    ':nth-of-type(2n+1)',
    ':nth-of-type(-n+6)',
    ':nth-last-of-type(odd)',
    ':nth-last-of-type(even)',
    ':nth-last-of-type(2n)',
    ':nth-last-of-type(2n+1)',
    ':nth-last-of-type(-n+6)',
    ':first-child',
    ':last-child',
    ':first-of-type',
    ':last-of-type',
    ':only-child',
    ':only-of-type',
    ':empty',
    '::first-line',
    '::selection',
    '::before',
    '::after'
    ];

  for (var i = 0; i < styleSheet.cssRules.length; i++) {
    var rule = styleSheet.cssRules[i];
    shouldBe(rule.selectorText, expected[i]);
  }
}
