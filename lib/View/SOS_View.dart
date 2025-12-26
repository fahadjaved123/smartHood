import 'package:flutter/material.dart';
import 'package:smart_neighbourhood/res/Components/Drawer_menu_widget.dart';
import 'package:smart_neighbourhood/res/Constants/App_colors.dart';
import 'package:smart_neighbourhood/res/Constants/App_textStyle.dart';

class SosView extends StatefulWidget {
  final VoidCallback opendrawer;
  final bool isopen;
  const SosView({super.key, required this.isopen, required this.opendrawer});

  @override
  State<SosView> createState() => _SosViewState();
}

class _SosViewState extends State<SosView> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // AnimationController
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // 1 second ka cycle
    )..repeat(reverse: true); // repeat karega forward aur reverse mein

    // Scaling Animation (0.8 se 1.2 tak)
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App Bar bilkul image jaisa
      appBar: AppBar(
        backgroundColor: Appcolors.primaryColor,
        title:  Text(
          'SOS',
          style: AppTextStyle.heading(25, fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        leading: DrawerMenuWidget(
          isdraweropen: widget.isopen,
          onPressed: widget.opendrawer,
        ),
      ),
      // Body mein puri screen ke liye padding (optional)
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // SOS Button aur Pulsing/Ripple Effect
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  // Outer ripple/pulse effect
                  return Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          // Laal rang ka shadow, jo badlega
                          color: Appcolors.backgroundColor_black
                              .withOpacity(0.5 * _animationController.value),
                          blurRadius: 70.0 * _scaleAnimation.value,
                          spreadRadius: 20.0 * _scaleAnimation.value,
                        ),
                      ],
                    ),
                    child: ScaleTransition(
                      scale: _scaleAnimation,
                      child: GestureDetector(
                        onTap: () {
                          // TODO: SOS Button Dabane par hone wala action yahan likhein (e.g., call emergency services)
                          print('SOS Button Pressed!');
                        },
                        child: Container(
                          width: 180,
                          height: 180,
                          decoration: BoxDecoration(
                            color: Appcolors.backgroundColor_red,
                            border: Border.all(
                                width: 2, color: Colors.grey.shade300),
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Text(
                              'SOS',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 100), // Spacing

              // Description Text bilkul image jaisa
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                child: Text(
                  "After pressing the SOS button, we will contact the nearest hospital, police station to your current location",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87, // Thoda dark text
                    height: 1.5, // Line spacing
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
