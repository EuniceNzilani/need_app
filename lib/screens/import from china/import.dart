import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

// --- NAVIGATION TARGETS (using your specified paths) ---
import '../home.dart';
import '../ai/ai_help_centre.dart';
import '../account/my_profile.dart' as account;
import '../account/notifications.dart' as account;
import '../import from china/track_request.dart';

// --- POPUPS & COMPONENTS ---

class CategoryPopupDialog extends StatelessWidget {
  final List<String> categories;
  final Color greenColor;
  final String title;

  const CategoryPopupDialog({
    required this.categories,
    required this.greenColor,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Reddit Sans',
                    fontWeight: FontWeight.w700,
                    fontSize: 19,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, size: 22),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Wrap(
              spacing: 14,
              runSpacing: 12,
              children:
                  categories
                      .map(
                        (cat) => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: greenColor,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 20,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                            textStyle: const TextStyle(
                              fontFamily: 'Reddit Sans',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onPressed: () => Navigator.of(context).pop(cat),
                          child: Text(cat),
                        ),
                      )
                      .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class BrandPopupDialog extends StatelessWidget {
  final List<String> brands;
  final Color greenColor;
  const BrandPopupDialog({
    required this.brands,
    required this.greenColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Select Brand',
                  style: TextStyle(
                    fontFamily: 'Reddit Sans',
                    fontWeight: FontWeight.w700,
                    fontSize: 19,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, size: 22),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Wrap(
              spacing: 14,
              runSpacing: 12,
              children:
                  brands
                      .map(
                        (brand) => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: greenColor,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 20,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                            textStyle: const TextStyle(
                              fontFamily: 'Reddit Sans',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onPressed: () => Navigator.of(context).pop(brand),
                          child: Text(brand),
                        ),
                      )
                      .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class AppleIphoneProductPopup extends StatelessWidget {
  const AppleIphoneProductPopup({super.key});

  Widget productText(BuildContext context, String name) => GestureDetector(
    onTap: () => Navigator.of(context).pop(name),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
      child: Text(
        name,
        style: const TextStyle(
          fontFamily: 'Reddit Sans',
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Apple iPhone Model',
                style: TextStyle(
                  fontFamily: 'Reddit Sans',
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // iPhone 14 Series
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'iPhone 14 Series',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        productText(context, 'iPhone 14'),
                        productText(context, 'iPhone 14 Plus'),
                        productText(context, 'iPhone 14 Pro'),
                        productText(context, 'iPhone 14 Pro Max'),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  // iPhone 13 Series
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'iPhone 13 Series',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        productText(context, 'iPhone 13 Mini'),
                        productText(context, 'iPhone 13'),
                        productText(context, 'iPhone 13 Pro'),
                        productText(context, 'iPhone 13 Pro Max'),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  // iPhone 12 Series
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'iPhone 12 Series',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        productText(context, 'iPhone 12 Mini'),
                        productText(context, 'iPhone 12'),
                        productText(context, 'iPhone 12 Pro'),
                        productText(context, 'iPhone 12 Pro Max'),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Other models as a column
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Older Models',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  productText(context, 'iPhone 11 Pro Max'),
                  productText(context, 'iPhone 11 Pro'),
                  productText(context, 'iPhone 11'),
                  productText(context, 'iPhone XS Max'),
                  productText(context, 'iPhone XS'),
                  productText(context, 'iPhone XR'),
                  productText(context, 'iPhone X'),
                  productText(context, 'iPhone 8 Plus'),
                  productText(context, 'iPhone 8'),
                  productText(context, 'iPhone 7 Plus'),
                  productText(context, 'iPhone 7'),
                  productText(context, 'Other'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ThankYouDialog extends StatelessWidget {
  const ThankYouDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha((0.13 * 255).round()),
              blurRadius: 18,
              spreadRadius: 1.5,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check_circle_rounded,
              color: const Color(0xFF23B09B),
              size: 60,
            ),
            const SizedBox(height: 12),
            const Text(
              'Thank you!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Reddit Sans',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'A NEED Importation agent will contact\nyou shortly for the next steps',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Reddit Sans',
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Dismiss popup
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TrackRequest(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF23B09B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  'Track Request',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Reddit Sans',
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashedRect extends StatelessWidget {
  final Color color;
  final double strokeWidth;
  final double gap;
  final double dashLength;
  final double borderRadius;
  final Widget child;

  const DashedRect({
    super.key,
    required this.color,
    required this.child,
    this.strokeWidth = 1.5,
    this.gap = 6,
    this.dashLength = 8,
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DashedRectPainter(
        color: color,
        strokeWidth: strokeWidth,
        gap: gap,
        dashLength: dashLength,
        borderRadius: borderRadius,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: child,
      ),
    );
  }
}

class _DashedRectPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double gap;
  final double dashLength;
  final double borderRadius;

  _DashedRectPainter({
    required this.color,
    required this.strokeWidth,
    required this.gap,
    required this.dashLength,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(borderRadius));
    final paint =
        Paint()
          ..color = color
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.stroke;

    Path borderPath = Path()..addRRect(rrect);

    double drawn = 0.0;
    for (final metric in borderPath.computeMetrics()) {
      while (drawn < metric.length) {
        final double next = drawn + dashLength;
        canvas.drawPath(
          metric.extractPath(drawn, next.clamp(0, metric.length)),
          paint,
        );
        drawn += dashLength + gap;
      }
      drawn = 0.0;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final double scale;
  final ValueChanged<int>? onTap;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    this.scale = 0.9,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const Color greenColor = Color(0xFF23B09B);

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: greenColor,
      unselectedItemColor: Colors.black,
      currentIndex: currentIndex,
      iconSize: 22 * scale,
      selectedFontSize: 14 * scale,
      unselectedFontSize: 13 * scale,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            currentIndex == 0 ? Icons.home : Icons.home_outlined,
            color: currentIndex == 0 ? greenColor : Colors.black,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            currentIndex == 1
                ? Icons.support_agent
                : Icons.support_agent_outlined,
            color: currentIndex == 1 ? greenColor : Colors.black,
          ),
          label: 'AI Support',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            currentIndex == 2 ? Icons.person : Icons.person_outline,
            color: currentIndex == 2 ? greenColor : Colors.black,
          ),
          label: 'Account',
        ),
      ],
      onTap: onTap,
    );
  }
}

// --- MAIN SCREEN ---

class Import extends StatefulWidget {
  const Import({super.key});

  @override
  State<Import> createState() => _ImportState();
}

class _ImportState extends State<Import> {
  final Color greenColor = const Color(0xFF23B09B);
  final double scale = 0.9;

  String? _selectedCategoryOfItem;
  String? _selectedBrand;
  String? _selectedProduct;
  String? _selectedQuantity;
  File? _selectedImage;
  DateTime? _selectedDate;

  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  final List<String> _categoryOfItems = [
    "Industrial Items",
    "Home Appliances",
    "Mobile Phones",
    "Laptops",
    "Electronics",
    "Shoes",
    "Furniture",
    "Clothes",
  ];

  final Map<String, List<String>> _brandsByCategory = {
    "Mobile Phones": [
      "Apple(iPhones)",
      "Samsung",
      "One plus",
      "Google(pixel)",
      "Vivo",
      "Xiaomi",
      "Motorola",
      "Infinix",
      "Tecno",
      "Itel",
      "Nokia",
      "Oppo",
    ],
    "Laptops": [
      "Apple(MacBook)",
      "Dell",
      "HP",
      "Lenovo",
      "Asus",
      "Acer",
      "Microsoft",
      "MSI",
    ],
  };

  final Map<String, Widget> _productBrandPopups = const {
    "Apple(iPhones)": AppleIphoneProductPopup(),
    // Add more brand popups as needed.
  };

  void _incrementQuantity() {
    setState(() {
      int current = int.tryParse(_selectedQuantity ?? "0") ?? 0;
      _selectedQuantity = (current + 1).toString();
    });
  }

  void _showCategoryOfItemPopup() async {
    String? selectedCategory = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return CategoryPopupDialog(
          categories: _categoryOfItems,
          greenColor: greenColor,
          title: 'Select Category of Item',
        );
      },
    );
    if (!mounted) return;
    if (selectedCategory != null) {
      setState(() {
        _selectedCategoryOfItem = selectedCategory;
        _selectedBrand = null;
        _selectedProduct = null;
      });
    }
  }

  void _showProductCategoryPopup() async {
    if (_selectedCategoryOfItem == null) return;
    List<String> brands = _brandsByCategory[_selectedCategoryOfItem] ?? [];
    if (brands.isEmpty) return;

    String? selectedBrand = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return BrandPopupDialog(brands: brands, greenColor: greenColor);
      },
    );

    if (!mounted) return;
    if (selectedBrand != null) {
      setState(() {
        _selectedBrand = selectedBrand;
        _selectedProduct = null;
      });

      if (_productBrandPopups[selectedBrand] != null) {
        String? selectedProduct = await showDialog<String>(
          context: context,
          builder: (context) => _productBrandPopups[selectedBrand]!,
        );
        if (!mounted) return;
        if (selectedProduct != null) {
          setState(() {
            _selectedProduct = selectedProduct;
          });
        }
      }
    }
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (!mounted) return;

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  Future<void> _pickDate() async {
    final DateTime now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: now.add(const Duration(days: 365)),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: greenColor,
              onPrimary: Colors.white,
              onSurface: Colors.black87,
            ),
            dialogTheme: const DialogTheme(backgroundColor: Colors.white),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: greenColor),
            ),
          ),
          child: child!,
        );
      },
    );
    if (!mounted) return;
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _showThankYouPopup() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const ThankYouDialog(),
    );
  }

  @override
  void dispose() {
    _addressController.dispose();
    _phoneController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _handleBottomNavTap(int index) {
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const Home()),
      );
    } else if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const AiHelpCentreScreen()),
      );
    } else if (index == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const account.MyProfileScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double radius = 14.0 * scale;
    final textStyleLabel = TextStyle(
      fontFamily: 'Reddit Sans',
      fontSize: 15 * scale,
      fontWeight: FontWeight.w500,
      color: Colors.black87,
    );
    final inputDecoration = InputDecoration(
      border: InputBorder.none,
      hintStyle: TextStyle(
        fontFamily: 'Reddit Sans',
        fontSize: 14 * scale,
        color: Colors.grey,
      ),
      contentPadding: EdgeInsets.all(15 * scale),
    );

    BoxDecoration inputBoxDecoration({bool filled = true}) => BoxDecoration(
      color: filled ? Colors.white : Colors.transparent,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withAlpha((0.10 * 255).round()),
          blurRadius: 10 * scale,
          spreadRadius: 1 * scale,
          offset: Offset(0, 2 * scale),
        ),
      ],
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(82),
        child: Material(
          color: Colors.white,
          child: SafeArea(
            bottom: false,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width + 100,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Text(
                          '<',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 32,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        onPressed: () => Navigator.pop(context),
                        padding: const EdgeInsets.only(right: 8, left: 2),
                        splashRadius: 24,
                        alignment: Alignment.center,
                      ),
                      const SizedBox(width: 4),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Ojo Lagos Post...',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Reddit Sans',
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(0, 0),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              alignment: Alignment.centerLeft,
                              textStyle: const TextStyle(
                                decoration: TextDecoration.none,
                              ),
                            ),
                            child: const Text(
                              'Edit Location',
                              style: TextStyle(
                                color: Color(0xFF23B09B),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Reddit Sans',
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      // Notifications (light green circle with black icon)
                      Container(
                        margin: const EdgeInsets.only(top: 0, right: 8),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(
                            0xFFE9F7F5,
                          ), // light green from upload sample
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.notifications_none,
                            color: Colors.black,
                            size: 22,
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (_) => const account.NotificationsScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                      // Settings (light green circle with black icon)
                      Container(
                        margin: const EdgeInsets.only(top: 0, right: 8),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(
                            0xFFE9F7F5,
                          ), // light green from upload sample
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.settings,
                            color: Colors.black,
                            size: 22,
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const account.MyProfileScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Importation from China',
                style: TextStyle(
                  fontFamily: 'Reddit Sans',
                  color: Colors.black,
                  fontSize: 18 * scale,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4 * scale),
              Text(
                'Request for importation of goods and it will be approved or rejected by an agent',
                style: TextStyle(
                  fontFamily: 'Reddit Sans',
                  color: Colors.black87,
                  fontSize: 13 * scale,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 18 * scale),

              // Category of Item
              Text('Category of Item', style: textStyleLabel),
              SizedBox(height: 6 * scale),
              GestureDetector(
                onTap: _showCategoryOfItemPopup,
                child: Container(
                  decoration: inputBoxDecoration(),
                  padding: EdgeInsets.symmetric(
                    vertical: 16 * scale,
                    horizontal: 15 * scale,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          _selectedCategoryOfItem ?? 'select category of item',
                          style: TextStyle(
                            fontFamily: 'Reddit Sans',
                            fontSize: 15 * scale,
                            color:
                                _selectedCategoryOfItem == null
                                    ? Colors.grey
                                    : Colors.black,
                          ),
                        ),
                      ),
                      Icon(Icons.expand_more, color: Colors.black54),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16 * scale),

              // Product Name (multi-popup)
              Text('Product Name', style: textStyleLabel),
              SizedBox(height: 6 * scale),
              GestureDetector(
                onTap: _showProductCategoryPopup,
                child: Container(
                  decoration: inputBoxDecoration(),
                  padding: EdgeInsets.symmetric(
                    vertical: 16 * scale,
                    horizontal: 15 * scale,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          _selectedProduct ??
                              _selectedBrand ??
                              'select product item',
                          style: TextStyle(
                            fontFamily: 'Reddit Sans',
                            fontSize: 15 * scale,
                            color:
                                (_selectedProduct == null &&
                                        _selectedBrand == null)
                                    ? Colors.grey
                                    : Colors.black,
                          ),
                        ),
                      ),
                      Icon(Icons.expand_more, color: Colors.black54),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16 * scale),

              // Quantity (plus only, no dropdown)
              Text('Quantity (approx.)', style: textStyleLabel),
              SizedBox(height: 6 * scale),
              Container(
                decoration: inputBoxDecoration(),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedQuantity ??= "1";
                          });
                        },
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(
                            vertical: 15 * scale,
                            horizontal: 15 * scale,
                          ),
                          child: Text(
                            _selectedQuantity != null
                                ? _selectedQuantity!
                                : 'select quantity',
                            style: TextStyle(
                              fontFamily: 'Reddit Sans',
                              fontSize: 15 * scale,
                              color:
                                  _selectedQuantity == null
                                      ? Colors.grey
                                      : Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.add, color: greenColor),
                      onPressed: _incrementQuantity,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16 * scale),

              // Upload sample image(s)
              Row(
                children: [
                  Text('Upload sample image(s)', style: textStyleLabel),
                  Text(
                    ' (optional)',
                    style: TextStyle(
                      fontFamily: 'Reddit Sans',
                      color: Colors.grey,
                      fontSize: 12 * scale,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 7 * scale),
              GestureDetector(
                onTap: _pickImage,
                child: DashedRect(
                  color: greenColor,
                  borderRadius: radius,
                  strokeWidth: 1.5 * scale,
                  gap: 6 * scale,
                  dashLength: 8 * scale,
                  child: Container(
                    width: double.infinity,
                    height: 110 * scale,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE9F7F5),
                      borderRadius: BorderRadius.circular(radius),
                    ),
                    child:
                        _selectedImage != null
                            ? ClipRRect(
                              borderRadius: BorderRadius.circular(6 * scale),
                              child: Image.file(
                                _selectedImage!,
                                fit: BoxFit.cover,
                              ),
                            )
                            : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.upload_outlined,
                                  size: 38 * scale,
                                  color: greenColor,
                                ),
                                SizedBox(height: 5 * scale),
                                Text(
                                  'Upload your image here (JPEG/PNG)',
                                  style: TextStyle(
                                    fontFamily: 'Reddit Sans',
                                    color: Colors.black54,
                                    fontSize: 12.5 * scale,
                                  ),
                                ),
                                SizedBox(height: 2 * scale),
                                Text(
                                  'Browse',
                                  style: TextStyle(
                                    fontFamily: 'Reddit Sans',
                                    color: greenColor,
                                    fontSize: 14 * scale,
                                  ),
                                ),
                              ],
                            ),
                  ),
                ),
              ),
              SizedBox(height: 16 * scale),

              // Delivery Address
              Text('Delivery Address', style: textStyleLabel),
              SizedBox(height: 6 * scale),
              Container(
                decoration: inputBoxDecoration(),
                child: TextField(
                  controller: _addressController,
                  style: TextStyle(
                    fontFamily: 'Reddit Sans',
                    fontSize: 15 * scale,
                  ),
                  decoration: inputDecoration.copyWith(
                    hintText: 'enter delivery address',
                  ),
                ),
              ),
              SizedBox(height: 16 * scale),

              // Preferred Delivery timeline
              Text('Preferred Delivery timeline', style: textStyleLabel),
              SizedBox(height: 6 * scale),
              GestureDetector(
                onTap: _pickDate,
                child: Container(
                  decoration: inputBoxDecoration(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 15 * scale,
                    vertical: 15 * scale,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          _selectedDate != null
                              ? '${_selectedDate!.day.toString().padLeft(2, '0')}/${_selectedDate!.month.toString().padLeft(2, '0')}/${_selectedDate!.year}'
                              : 'DD/MM/YYYY',
                          style: TextStyle(
                            fontFamily: 'Reddit Sans',
                            color:
                                _selectedDate != null
                                    ? Colors.black87
                                    : Colors.grey,
                            fontSize: 14 * scale,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.black54,
                        size: 18 * scale,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16 * scale),

              // Phone Number/WhatsApp
              Text('Phone Number/WhatsApp', style: textStyleLabel),
              SizedBox(height: 6 * scale),
              Container(
                decoration: inputBoxDecoration(),
                child: TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  style: TextStyle(
                    fontFamily: 'Reddit Sans',
                    fontSize: 15 * scale,
                  ),
                  decoration: inputDecoration.copyWith(
                    hintText: 'NEED phone number',
                  ),
                ),
              ),
              SizedBox(height: 16 * scale),

              // Additional Notes
              Row(
                children: [
                  Text('Additional Notes', style: textStyleLabel),
                  Text(
                    ' (optional)',
                    style: TextStyle(
                      fontFamily: 'Reddit Sans',
                      color: Colors.grey,
                      fontSize: 12 * scale,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 7 * scale),
              Container(
                decoration: inputBoxDecoration(),
                child: TextField(
                  controller: _notesController,
                  maxLines: 3,
                  style: TextStyle(
                    fontFamily: 'Reddit Sans',
                    fontSize: 15 * scale,
                  ),
                  decoration: inputDecoration.copyWith(hintText: ' '),
                ),
              ),
              SizedBox(height: 28 * scale),

              // Post Request Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _showThankYouPopup,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: greenColor,
                    padding: EdgeInsets.symmetric(vertical: 16 * scale),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(radius),
                    ),
                  ),
                  child: Text(
                    'Post Request',
                    style: TextStyle(
                      fontFamily: 'Reddit Sans',
                      color: Colors.white,
                      fontSize: 17 * scale,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12 * scale),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: 0,
        scale: scale,
        onTap: _handleBottomNavTap,
      ),
    );
  }
}
