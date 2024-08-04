import 'dart:io';
import 'package:flutter/material.dart';
import 'package:instagram/Media/mediaRepository/media_repo.dart';
import 'package:instagram/Media/mediaService/media_service.dart';


class MediaRepositoryWork implements MediaRepository {
  MediaRepositoryWork(this.mediaService);

  final MediaService mediaService;
  @override
  Future<FileImage?> uploadImageFromCamera() {
    return mediaService.uploadImageFromCamera();
  }

  @override
  Future<FileImage?> uploadPicture() {
    return mediaService.uploadPicture();
  }

  @override
  Future<File?> uploadVideo() {
    return mediaService.uploadVideo();
  }

  @override
  Future<File?> uploadVideoFromCamera() {
    return mediaService.uploadVideoFromCamera();
  }
}