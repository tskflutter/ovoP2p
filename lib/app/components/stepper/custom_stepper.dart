import 'package:flutter/material.dart';
import 'package:ovolutter/app/components/card/custom_app_card.dart';
import 'package:ovolutter/app/components/divider/custom_divider.dart';
import 'package:ovolutter/core/utils/my_color.dart';

class CustomStep {
  final String title;
  final Widget content;
  final bool isActive;

  CustomStep({
    required this.title,
    required this.content,
    this.isActive = false,
  });
}

class CustomStepperWidget extends StatelessWidget {
  final int currentStep;
  final List<CustomStep> steps;
  final Function(int) onStepChanged;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final bool hasThreeSteps;

  const CustomStepperWidget({
    super.key,
    required this.currentStep,
    required this.steps,
    required this.onStepChanged,
    this.margin,
    this.padding,
    this.hasThreeSteps = false,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      margin: margin ?? EdgeInsets.zero,
      padding: padding ?? EdgeInsets.zero,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildStepCircle(0, theme),
              _buildStepDivider(0, theme),
              _buildStepCircle(1, theme),
              if (hasThreeSteps) ...[
                _buildStepDivider(1, theme),
                _buildStepCircle(2, theme),
              ],
            ],
          ),
          Expanded(child: steps[currentStep].content),

          const SizedBox(height: 20), // Add spacing before stepper
        ],
      ),
    );
  }

  Widget _buildStepCircle(int step, ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(stops: [0.04, 0.4], begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [MyColor.lightSecondaryButton, MyColor.lightSecondary]),
      ),
      child: CircleAvatar(
        maxRadius: 16,
        backgroundColor: currentStep == step ? MyColor.getTransparentColor() : MyColor.white,
        child: Text(
          '${step + 1}',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w700,
            color: currentStep == step ? MyColor.white : MyColor.getBodyTextColor(),
          ),
        ),
      ),
    );
  }

  Widget _buildStepDivider(int step, ThemeData theme) {
    return Expanded(
      child: CustomDivider(
        height: 5,
        color: currentStep > step ? theme.primaryColor : MyColor.getBorderColor(),
      ),
    );
  }
}
