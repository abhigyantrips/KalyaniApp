import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_state.freezed.dart';

@freezed
class UploadState with _$UploadState {
  const factory UploadState({
    String? selectedImagePath,
    @Default(false) bool isProcessing,
    String? errorMessage,
  }) = _UploadState;
}
