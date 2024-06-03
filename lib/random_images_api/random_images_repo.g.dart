// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'random_images_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$randomImageHash() => r'1bf8e8eae2fbfccb5d42f18182d6399ec5569521';

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
  late final AbstractSimpleParameters params;

  FutureOr<RandomImageModel> build({
    required AbstractSimpleParameters params,
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
    required AbstractSimpleParameters params,
  }) {
    return RandomImageProvider(
      params: params,
    );
  }

  @override
  RandomImageProvider getProviderOverride(
    covariant RandomImageProvider provider,
  ) {
    return call(
      params: provider.params,
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
    required AbstractSimpleParameters params,
  }) : this._internal(
          () => RandomImage()..params = params,
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
        );

  RandomImageProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.params,
  }) : super.internal();

  final AbstractSimpleParameters params;

  @override
  FutureOr<RandomImageModel> runNotifierBuild(
    covariant RandomImage notifier,
  ) {
    return notifier.build(
      params: params,
    );
  }

  @override
  Override overrideWith(RandomImage Function() create) {
    return ProviderOverride(
      origin: this,
      override: RandomImageProvider._internal(
        () => create()..params = params,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        params: params,
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
    return other is RandomImageProvider && other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RandomImageRef on AutoDisposeAsyncNotifierProviderRef<RandomImageModel> {
  /// The parameter `params` of this provider.
  AbstractSimpleParameters get params;
}

class _RandomImageProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<RandomImage,
        RandomImageModel> with RandomImageRef {
  _RandomImageProviderElement(super.provider);

  @override
  AbstractSimpleParameters get params => (origin as RandomImageProvider).params;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
