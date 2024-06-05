// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'random_images_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$randomImageHash() => r'f6bcd9212ec01b109b55f8fd4da2fe53d1d1aefb';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$RandomImage
    extends BuildlessAutoDisposeAsyncNotifier<RandomImageModel> {
  late final SimpleParameters params;
  late final String urlPart;

  FutureOr<RandomImageModel> build({
    required SimpleParameters params,
    required String urlPart,
  });
}

/// See also [RandomImage].
@ProviderFor(RandomImage)
const randomImageProvider = RandomImageFamily();

/// See also [RandomImage].
class RandomImageFamily extends Family<AsyncValue<RandomImageModel>> {
  /// See also [RandomImage].
  const RandomImageFamily();

  /// See also [RandomImage].
  RandomImageProvider call({
    required SimpleParameters params,
    required String urlPart,
  }) {
    return RandomImageProvider(
      params: params,
      urlPart: urlPart,
    );
  }

  @override
  RandomImageProvider getProviderOverride(
    covariant RandomImageProvider provider,
  ) {
    return call(
      params: provider.params,
      urlPart: provider.urlPart,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'randomImageProvider';
}

/// See also [RandomImage].
class RandomImageProvider extends AutoDisposeAsyncNotifierProviderImpl<
    RandomImage, RandomImageModel> {
  /// See also [RandomImage].
  RandomImageProvider({
    required SimpleParameters params,
    required String urlPart,
  }) : this._internal(
          () => RandomImage()
            ..params = params
            ..urlPart = urlPart,
          from: randomImageProvider,
          name: r'randomImageProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$randomImageHash,
          dependencies: RandomImageFamily._dependencies,
          allTransitiveDependencies:
              RandomImageFamily._allTransitiveDependencies,
          params: params,
          urlPart: urlPart,
        );

  RandomImageProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.params,
    required this.urlPart,
  }) : super.internal();

  final SimpleParameters params;
  final String urlPart;

  @override
  FutureOr<RandomImageModel> runNotifierBuild(
    covariant RandomImage notifier,
  ) {
    return notifier.build(
      params: params,
      urlPart: urlPart,
    );
  }

  @override
  Override overrideWith(RandomImage Function() create) {
    return ProviderOverride(
      origin: this,
      override: RandomImageProvider._internal(
        () => create()
          ..params = params
          ..urlPart = urlPart,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        params: params,
        urlPart: urlPart,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<RandomImage, RandomImageModel>
      createElement() {
    return _RandomImageProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RandomImageProvider &&
        other.params == params &&
        other.urlPart == urlPart;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);
    hash = _SystemHash.combine(hash, urlPart.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RandomImageRef on AutoDisposeAsyncNotifierProviderRef<RandomImageModel> {
  /// The parameter `params` of this provider.
  SimpleParameters get params;

  /// The parameter `urlPart` of this provider.
  String get urlPart;
}

class _RandomImageProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<RandomImage,
        RandomImageModel> with RandomImageRef {
  _RandomImageProviderElement(super.provider);

  @override
  SimpleParameters get params => (origin as RandomImageProvider).params;
  @override
  String get urlPart => (origin as RandomImageProvider).urlPart;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
