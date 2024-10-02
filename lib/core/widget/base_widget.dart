import 'package:chopper_network/core/cubit/base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseWidget<C extends BaseCubit<S>, S extends BaseState>
    extends StatefulWidget {
  const BaseWidget({super.key});

  Widget build(BuildContext context, C cubit, S state);

  @override
  State<BaseWidget> createState() => _BaseWidgetState<C, S>();
}

class _BaseWidgetState<C extends BaseCubit<S>, S extends BaseState>
    extends State<BaseWidget> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<C>();
    return BlocBuilder<C, S>(
      builder: (context, state) {
        return widget.build(context, cubit, state);
      },
    );
  }
}
