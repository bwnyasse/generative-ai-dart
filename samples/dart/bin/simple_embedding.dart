// Copyright 2024 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'dart:io';

import 'package:google_generative_ai/google_generative_ai.dart';

void main() async {
  final apiKey = Platform.environment['GOOGLE_API_KEY'];
  if (apiKey == null) {
    print('No \$GOOGLE_API_KEY environment variable');
    exit(1);
  }
  final model = GenerativeModel(model: 'embedding-001', apiKey: apiKey);
  final prompt = 'The quick brown fox jumps over the lazy dog.';
  print('Content: $prompt');
  final content = Content.text(prompt);

  final result = await model.embedContent(content);
  print('Embedding:');
  print(result.embedding.values);
}
