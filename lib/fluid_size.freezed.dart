// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fluid_size.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FluidSize {
  double get min => throw _privateConstructorUsedError;
  double get max => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FluidSizeCopyWith<FluidSize> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FluidSizeCopyWith<$Res> {
  factory $FluidSizeCopyWith(FluidSize value, $Res Function(FluidSize) then) =
      _$FluidSizeCopyWithImpl<$Res, FluidSize>;
  @useResult
  $Res call({double min, double max});
}

/// @nodoc
class _$FluidSizeCopyWithImpl<$Res, $Val extends FluidSize>
    implements $FluidSizeCopyWith<$Res> {
  _$FluidSizeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min = null,
    Object? max = null,
  }) {
    return _then(_value.copyWith(
      min: null == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as double,
      max: null == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FluidSizeCopyWith<$Res> implements $FluidSizeCopyWith<$Res> {
  factory _$$_FluidSizeCopyWith(
          _$_FluidSize value, $Res Function(_$_FluidSize) then) =
      __$$_FluidSizeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double min, double max});
}

/// @nodoc
class __$$_FluidSizeCopyWithImpl<$Res>
    extends _$FluidSizeCopyWithImpl<$Res, _$_FluidSize>
    implements _$$_FluidSizeCopyWith<$Res> {
  __$$_FluidSizeCopyWithImpl(
      _$_FluidSize _value, $Res Function(_$_FluidSize) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min = null,
    Object? max = null,
  }) {
    return _then(_$_FluidSize(
      min: null == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as double,
      max: null == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_FluidSize extends _FluidSize {
  const _$_FluidSize({required this.min, required this.max}) : super._();

  @override
  final double min;
  @override
  final double max;

  @override
  String toString() {
    return 'FluidSize(min: $min, max: $max)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FluidSize &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max));
  }

  @override
  int get hashCode => Object.hash(runtimeType, min, max);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FluidSizeCopyWith<_$_FluidSize> get copyWith =>
      __$$_FluidSizeCopyWithImpl<_$_FluidSize>(this, _$identity);
}

abstract class _FluidSize extends FluidSize {
  const factory _FluidSize(
      {required final double min, required final double max}) = _$_FluidSize;
  const _FluidSize._() : super._();

  @override
  double get min;
  @override
  double get max;
  @override
  @JsonKey(ignore: true)
  _$$_FluidSizeCopyWith<_$_FluidSize> get copyWith =>
      throw _privateConstructorUsedError;
}
