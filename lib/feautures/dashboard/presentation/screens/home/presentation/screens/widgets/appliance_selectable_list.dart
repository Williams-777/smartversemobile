import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartversemobile/feautures/dashboard/presentation/bloc/appliance_state.dart';
import 'package:smartversemobile/feautures/dashboard/presentation/screens/home/presentation/screens/widgets/appliance_card.dart';
import 'package:smartversemobile/feautures/dashboard/presentation/screens/home/presentation/screens/widgets/appliance_wattage_row.dart';

import '../../../../../../data/models/appliance.dart';

class ApplianceSelectableList extends StatelessWidget {
  const ApplianceSelectableList({
    super.key,
    required this.appliances,
    required this.state,
    required this.onQuantityChanged,
    required this.onEditWattage,
  });

  final List<Appliance> appliances;
  final ApplianceState state;
  final void Function(String id, int qty) onQuantityChanged;
  final void Function(Appliance appliance) onEditWattage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final appliance in appliances) ...[
          ApplianceCard(
            imageUrl: appliance.imageUrl,
            subtitleText: state.subtitleFor(appliance),
            applianceName: appliance.name,
            badges: state.badgesFor(appliance),

            initialQuantity: state.quantityOf(appliance.id),
            onQuantityChanged: (qty) => onQuantityChanged(appliance.id, qty),
            onSubtitleTap: () => onEditWattage(appliance),
          ),
          if (state.quantityOf(appliance.id) > 0)
            ApplianceWattageRow(quantity: state.quantityOf(appliance.id), wattage: state.wattageOf(appliance)),
          SizedBox(height: 12.h),
        ],
      ],
    );
  }
}