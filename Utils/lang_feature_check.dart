part of Expect;

typedef F<X> = void Function<Y extends X>();

typedef expected_target = Function<X>();

// Functions for correct type comparison in language feature tests
F<X>? toF<X>(X x) => null;
Type typeOf<X>() => X;

// Function to check nnbd_top_merge feature
class CHECK_TOP_MERGE<T> {
  T Function(T) get f => (x) => x;
}

// Functions to check least and greatest closures
// See https://github.com/dart-lang/co19/issues/575#issuecomment-613542349
Type? _capturedTypeArgument;

X captureTypeArgument<X>() {
  _capturedTypeArgument = X;
  throw "Error";
}

Type? get capturedTypeArgument {
  var result = _capturedTypeArgument;
  _capturedTypeArgument = null;
  return result;
}

// Weak/strong mode flags
bool get isWeakMode => const <Null>[] is List<Object>;
bool get isStrongMode => !isWeakMode;
