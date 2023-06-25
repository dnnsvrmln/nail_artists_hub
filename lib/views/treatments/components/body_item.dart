import 'package:flutter/material.dart';
import 'package:nail_artists_hub/views/treatments/components/body_item_trait.dart';

import 'package:transparent_image/transparent_image.dart';

import 'package:nail_artists_hub/models/treatment.dart';
import 'package:nail_artists_hub/assets/images/network_images.dart';

class BodyItem extends StatelessWidget {
  final Treatment treatment;
  final void Function(Treatment treatment) onSelectTreatment;

  const BodyItem({
    super.key,
    required this.treatment,
    required this.onSelectTreatment,
  });

  String _roundedPrice(double price) {
    return price % 1 == 0
        ? '${price.toStringAsFixed(0)},-'
        : price.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          onSelectTreatment(treatment);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: const AssetImage(acrylicNailsImage),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 40),
                child: Column(
                  children: [
                    Text(
                      '${treatment.name} - ${treatment.description}',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BodyItemTrait(
                          icon: Icons.schedule,
                          label: '${treatment.durationInMinutes} min',
                        ),
                        // const Spacer(),
                        BodyItemTrait(
                          icon: Icons.euro_rounded,
                          label: _roundedPrice(treatment.price),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
