/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This tests that new Event.eventType is hooked up for all Event interfaces
 * (and alternatives) and creates the right instance.
 */
import "dart:html";
import "dart:svg" as svg;
import "dart:web_audio" as audio;
import "dart:web_gl" as webgl;
import "../../testcommon.dart";

main() {
  // AnimationEvent
  shouldBeTrue(new Event.eventType('AnimationEvent', '') is AnimationEvent);
  shouldBeTrue(new Event.eventType('AnimationEvent', '') is Event);

  // Event
  shouldBeTrue(new Event.eventType('Event', '') is Event);

  // Events (Event alternative)
  shouldBeTrue(new Event.eventType('Events', '') is Event);

  // HTMLEvents (Event alternative)
  shouldBeTrue(new Event.eventType('HTMLEvents', '') is Event);

  // CompositionEvent
  shouldBeTrue(new Event.eventType('CompositionEvent', '') is CompositionEvent);
  shouldBeTrue(new Event.eventType('CompositionEvent', '') is Event);

  // CustomEvent
  shouldBeTrue(new Event.eventType('CustomEvent', '') is CustomEvent);
  shouldBeTrue(new Event.eventType('CustomEvent', '') is Event);

  // ErrorEvent
  shouldBeTrue(new Event.eventType('ErrorEvent', '') is ErrorEvent);
  shouldBeTrue(new Event.eventType('ErrorEvent', '') is Event);

  // HashChangeEvent
  shouldBeTrue(new Event.eventType('HashChangeEvent', '') is HashChangeEvent);
  shouldBeTrue(new Event.eventType('HashChangeEvent', '') is Event);

  // KeyboardEvent
  shouldBeTrue(new Event.eventType('KeyboardEvent', '') is KeyboardEvent);
  shouldBeTrue(new Event.eventType('KeyboardEvent', '') is UIEvent);
  shouldBeTrue(new Event.eventType('KeyboardEvent', '') is Event);

  // KeyboardEvents (KeyboardEvent alternative)
  shouldBeTrue(new Event.eventType('KeyboardEvents', '') is KeyboardEvent);
  shouldBeTrue(new Event.eventType('KeyboardEvents', '') is UIEvent);
  shouldBeTrue(new Event.eventType('KeyboardEvents', '') is Event);

  // MessageEvent
  shouldBeTrue(new Event.eventType('MessageEvent', '') is MessageEvent);
  shouldBeTrue(new Event.eventType('MessageEvent', '') is Event);

  // MouseEvent
  shouldBeTrue(new Event.eventType('MouseEvent', '') is MouseEvent);
  shouldBeTrue(new Event.eventType('MouseEvent', '') is UIEvent);
  shouldBeTrue(new Event.eventType('MouseEvent', '') is Event);

  // MouseEvents (MouseEvent alternative)
  shouldBeTrue(new Event.eventType('MouseEvents', '') is MouseEvent);
  shouldBeTrue(new Event.eventType('MouseEvents', '') is UIEvent);
  shouldBeTrue(new Event.eventType('MouseEvents', '') is Event);

  // MutationEvent
  //shouldBeTrue(new Event.eventType('MutationEvent', '') is MutationEvent);
  //shouldBeTrue(new Event.eventType('MutationEvent', '') is Event);

  // MutationEvents (MutationEvent alternative)
  //shouldBeTrue(new Event.eventType('MutationEvents', '') is MutationEvent);
  //shouldBeTrue(new Event.eventType('MutationEvents', '') is Event);

  // OverflowEvent
  //shouldBeTrue(new Event.eventType('OverflowEvent', '') is OverflowEvent);
  //shouldBeTrue(new Event.eventType('OverflowEvent', '') is Event);

  // PageTransitionEvent
  shouldBeTrue(new Event.eventType('PageTransitionEvent', '') is PageTransitionEvent);
  shouldBeTrue(new Event.eventType('PageTransitionEvent', '') is Event);

  // PopStateEvent
  shouldBeTrue(new Event.eventType('PopStateEvent', '') is PopStateEvent);
  shouldBeTrue(new Event.eventType('PopStateEvent', '') is Event);

  // ProgressEvent
  shouldBeTrue(new Event.eventType('ProgressEvent', '') is ProgressEvent);
  shouldBeTrue(new Event.eventType('ProgressEvent', '') is Event);

  // TextEvent
  shouldBeTrue(new Event.eventType('TextEvent', '') is TextEvent);
  shouldBeTrue(new Event.eventType('TextEvent', '') is UIEvent);
  shouldBeTrue(new Event.eventType('TextEvent', '') is Event);

  // UIEvent
  shouldBeTrue(new Event.eventType('UIEvent', '') is UIEvent);
  shouldBeTrue(new Event.eventType('UIEvent', '') is Event);

  // UIEvents (UIEvent alternative)
  shouldBeTrue(new Event.eventType('UIEvents', '') is UIEvent);
  shouldBeTrue(new Event.eventType('UIEvents', '') is Event);

  // TransitionEvent
  shouldBeTrue(new Event.eventType('TransitionEvent', '') is TransitionEvent);
  shouldBeTrue(new Event.eventType('TransitionEvent', '') is Event);

  // WebKitAnimationEvent
  //shouldBeTrue(new Event.eventType('WebKitAnimationEvent', '') is WebKitAnimationEvent);
  //shouldBeTrue(new Event.eventType('WebKitAnimationEvent', '') is Event);

  // WebKitTransitionEvent
  //shouldBeTrue(new Event.eventType('WebKitTransitionEvent', '') is WebKitTransitionEvent);
  //shouldBeTrue(new Event.eventType('WebKitTransitionEvent', '') is Event);

  // WheelEvent
  shouldBeTrue(new Event.eventType('WheelEvent', '') is WheelEvent);
  shouldBeTrue(new Event.eventType('WheelEvent', '') is MouseEvent);
  shouldBeTrue(new Event.eventType('WheelEvent', '') is UIEvent);
  shouldBeTrue(new Event.eventType('WheelEvent', '') is Event);

  // XMLHttpRequestProgressEvent
  //shouldBeTrue(new Event.eventType('XMLHttpRequestProgressEvent', '') is XMLHttpRequestProgressEvent);
  shouldBeTrue(new Event.eventType('XMLHttpRequestProgressEvent', '') is ProgressEvent);
  shouldBeTrue(new Event.eventType('XMLHttpRequestProgressEvent', '') is Event);

  // StorageEvent
  shouldBeTrue(new Event.eventType('StorageEvent', '') is StorageEvent);
  shouldBeTrue(new Event.eventType('StorageEvent', '') is Event);

  // SVGEvents (Event alternative)
  shouldBeTrue(new Event.eventType('SVGEvents', '') is Event);

  // CloseEvent
  shouldBeTrue(new Event.eventType('CloseEvent', '') is CloseEvent);
  shouldBeTrue(new Event.eventType('CloseEvent', '') is Event);

  // The following are here for completeness, but won't until there is more widespread support for them.

  // #if ENABLE(WEB_AUDIO)
  // AudioProcessingEvent
  shouldBeTrue(new Event.eventType('AudioProcessingEvent', '') is audio.AudioProcessingEvent);
  shouldBeTrue(new Event.eventType('AudioProcessingEvent', '') is Event);

  // #if ENABLE(WEB_AUDIO)
  // OfflineAudioCompletionEvent
  shouldBeTrue(new Event.eventType('OfflineAudioCompletionEvent', '') is audio.OfflineAudioCompletionEvent);
  shouldBeTrue(new Event.eventType('OfflineAudioCompletionEvent', '') is Event);

  // #if ENABLE(INPUT_SPEECH)
  // MediaStreamEvent
  shouldBeTrue(new Event.eventType('MediaStreamEvent', '') is MediaStreamEvent);
  shouldBeTrue(new Event.eventType('MediaStreamEvent', '') is Event);

  // #if ENABLE(INPUT_SPEECH)
  // SpeechInputEvent
  //shouldBeTrue(new Event.eventType('SpeechInputEvent', '') is SpeechInputEvent);
  //shouldBeTrue(new Event.eventType('SpeechInputEvent', '') is Event);

  // #if ENABLE(WEBGL)
  // WebGLContextEvent
  shouldBeTrue(new Event.eventType('WebGLContextEvent', '') is webgl.ContextEvent);
  shouldBeTrue(new Event.eventType('WebGLContextEvent', '') is Event);

  // TouchEvent
  shouldBeTrue(new Event.eventType('TouchEvent', '') is TouchEvent);
  shouldBeTrue(new Event.eventType('TouchEvent', '') is Event);

  // DeviceMotionEvent
  // shouldBeTrue(new Event.eventType('DeviceMotionEvent', '') is DeviceMotionEvent);
  // shouldBeTrue(new Event.eventType('DeviceMotionEvent', '') is Event);

  // DeviceOrientationEvent
  // shouldBeTrue(new Event.eventType('DeviceOrientationEvent', '') is DeviceOrientationEvent);
  // shouldBeTrue(new Event.eventType('DeviceOrientationEvent', '') is Event);

  // OrientationEvent (Event alternative)
  // shouldBeTrue(new Event.eventType('OrientationEvent', '') is Event);
}
