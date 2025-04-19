import 'package:meubel/core/extensions/build_context_ext.dart';
import 'package:flutter/material.dart';

import '../../../core/components/spaces.dart';
import '../../../core/constants/colors.dart';

class PaymentTransferDialog extends StatelessWidget {
  const PaymentTransferDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      contentPadding: const EdgeInsets.all(0),
      backgroundColor: const Color.fromARGB(255, 32, 167, 133),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              'Pembayaran TRANSFER',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
          const SpaceHeight(6.0),
          Container(
            width: context.deviceWidth,
            padding: const EdgeInsets.all(14.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: AppColors.white,
            ),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // SizedBox(
                //   width: 256.0,
                //   height: 256.0,
                //   child: QrImageView(
                //     data: 's.id/batch11',
                //     version: QrVersions.auto,
                //   ),
                // ),
                SpaceHeight(5.0),
                Text(
                  'Belum Ada Pembayaran (Midtrans)',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
