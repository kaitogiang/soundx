// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widgetbook/widgetbook.dart' as _i1;
import 'package:widgetbook_workspace/widgetbook_use_cases.dart' as _i2;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'features',
    children: [
      _i1.WidgetbookFolder(
        name: 'shared',
        children: [
          _i1.WidgetbookFolder(
            name: 'presentation',
            children: [
              _i1.WidgetbookFolder(
                name: 'widget',
                children: [
                  _i1.WidgetbookLeafComponent(
                    name: 'AppButton',
                    useCase: _i1.WidgetbookUseCase(
                      name: 'Default AppButton',
                      builder: _i2.defaultAppButton,
                    ),
                  ),
                  _i1.WidgetbookLeafComponent(
                    name: 'AppTextField',
                    useCase: _i1.WidgetbookUseCase(
                      name: 'Default AppTextField',
                      builder: _i2.defaultAppTextField,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  ),
];
