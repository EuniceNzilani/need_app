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

class SpecificProductPopup extends StatelessWidget {
  final String brand;
  final List<String> products;
  final Color greenColor;

  const SpecificProductPopup({
    required this.brand,
    required this.products,
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
                Text(
                  'Select $brand Model',
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
            Container(
              constraints: const BoxConstraints(maxHeight: 400),
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 14,
                  runSpacing: 12,
                  children:
                      products
                          .map(
                            (product) => ElevatedButton(
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
                              onPressed:
                                  () => Navigator.of(context).pop(product),
                              child: Text(product),
                            ),
                          )
                          .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductSuggestionsWidget extends StatefulWidget {
  final String? selectedCategory;
  final String? selectedBrand;
  final String? selectedProduct;
  final Color greenColor;
  final double scale;
  final Function(String?) onBrandSelected;
  final Function(String?) onProductSelected;

  const ProductSuggestionsWidget({
    required this.selectedCategory,
    required this.selectedBrand,
    required this.selectedProduct,
    required this.greenColor,
    required this.scale,
    required this.onBrandSelected,
    required this.onProductSelected,
    super.key,
  });

  @override
  State<ProductSuggestionsWidget> createState() =>
      _ProductSuggestionsWidgetState();
}

class _ProductSuggestionsWidgetState extends State<ProductSuggestionsWidget> {
  bool _showBrandSuggestions = false;
  List<String> _filteredBrands = [];

  final Map<String, List<String>> _brandsByCategory = {
    "Mobile Phones": [
      "Apple",
      "Samsung",
      "Xiaomi",
      "OnePlus",
      "Google Pixel",
      "Vivo",
      "Oppo",
      "Huawei",
      "Motorola",
      "Infinix",
      "Tecno",
      "Itel",
      "Nokia",
      "Realme",
    ],
    "Laptops": [
      "Apple MacBook",
      "Dell",
      "HP",
      "Lenovo",
      "Asus",
      "Acer",
      "Microsoft Surface",
      "MSI",
      "Razer",
      "Alienware",
    ],
    "Electronics": [
      "Sony",
      "LG",
      "Panasonic",
      "Philips",
      "JBL",
      "Bose",
      "Canon",
      "Nikon",
    ],
  };

  final Map<String, List<String>> _productsByBrand = {
    "Apple": [
      "iPhone 15 Pro Max",
      "iPhone 15 Pro",
      "iPhone 15 Plus",
      "iPhone 15",
      "iPhone 14 Pro Max",
      "iPhone 14 Pro",
      "iPhone 14 Plus",
      "iPhone 14",
      "iPhone 13 Pro Max",
      "iPhone 13 Pro",
      "iPhone 13",
      "iPhone 13 Mini",
      "iPhone 12 Pro Max",
      "iPhone 12 Pro",
      "iPhone 12",
      "iPhone 12 Mini",
      "iPhone 11 Pro Max",
      "iPhone 11 Pro",
      "iPhone 11",
      "iPhone SE (3rd Gen)",
    ],
    "Samsung": [
      "Galaxy S24 Ultra",
      "Galaxy S24+",
      "Galaxy S24",
      "Galaxy S23 Ultra",
      "Galaxy S23+",
      "Galaxy S23",
      "Galaxy Note 20 Ultra",
      "Galaxy Note 20",
      "Galaxy A54 5G",
      "Galaxy A34 5G",
      "Galaxy Z Fold 5",
      "Galaxy Z Flip 5",
    ],
    "Xiaomi": [
      "Xiaomi 14 Ultra",
      "Xiaomi 14",
      "Xiaomi 13T Pro",
      "Xiaomi 13T",
      "Redmi Note 13 Pro",
      "Redmi Note 13",
      "Redmi Note 12 Pro",
      "Redmi Note 12",
      "Redmi 12",
      "Redmi 11",
      "Redmi 10",
      "POCO X6 Pro",
      "POCO X6",
      "POCO F5 Pro",
      "POCO F5",
    ],
    "OnePlus": [
      "OnePlus 12",
      "OnePlus 11",
      "OnePlus 10T",
      "OnePlus 10 Pro",
      "OnePlus 9 Pro",
      "OnePlus 9",
      "OnePlus Nord 3",
      "OnePlus Nord CE 3",
    ],
    "Google Pixel": [
      "Pixel 8 Pro",
      "Pixel 8",
      "Pixel 7a",
      "Pixel 7 Pro",
      "Pixel 7",
      "Pixel 6a",
      "Pixel 6 Pro",
      "Pixel 6",
    ],
    "Apple MacBook": [
      "MacBook Air M3 13-inch",
      "MacBook Air M3 15-inch",
      "MacBook Air M2 13-inch",
      "MacBook Air M2 15-inch",
      "MacBook Pro M3 14-inch",
      "MacBook Pro M3 16-inch",
      "MacBook Pro M2 13-inch",
      "MacBook Pro M2 14-inch",
      "MacBook Pro M2 16-inch",
    ],
  };

  void _showBrandDropdown() {
    if (widget.selectedCategory == null) return;
    final brands = _brandsByCategory[widget.selectedCategory] ?? [];
    if (brands.isEmpty) return;

    setState(() {
      _filteredBrands = brands;
      _showBrandSuggestions = !_showBrandSuggestions;
    });
  }

  void _selectBrand(String brand) async {
    setState(() {
      _showBrandSuggestions = false;
    });

    widget.onBrandSelected(brand);

    // Show specific product popup if brand has products
    final products = _productsByBrand[brand];
    if (products != null && products.isNotEmpty) {
      final selectedProduct = await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return SpecificProductPopup(
            brand: brand,
            products: products,
            greenColor: widget.greenColor,
          );
        },
      );

      if (selectedProduct != null) {
        widget.onProductSelected(selectedProduct);
      }
    }
  }

  String _getDisplayText() {
    if (widget.selectedProduct != null) {
      return widget.selectedProduct!;
    } else if (widget.selectedBrand != null) {
      return widget.selectedBrand!;
    } else {
      return 'select product item';
    }
  }

  Color _getTextColor() {
    if (widget.selectedProduct != null || widget.selectedBrand != null) {
      return Colors.black;
    } else {
      return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: _showBrandDropdown,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14.0 * widget.scale),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha((0.10 * 255).round()),
                  blurRadius: 10 * widget.scale,
                  spreadRadius: 1 * widget.scale,
                  offset: Offset(0, 2 * widget.scale),
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(
              vertical: 16 * widget.scale,
              horizontal: 15 * widget.scale,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _getDisplayText(),
                    style: TextStyle(
                      fontFamily: 'Reddit Sans',
                      fontSize: 15 * widget.scale,
                      color: _getTextColor(),
                    ),
                  ),
                ),
                Icon(Icons.expand_more, color: Colors.black54),
              ],
            ),
          ),
        ),
        if (_showBrandSuggestions) ...[
          SizedBox(height: 8 * widget.scale),
          Container(
            constraints: BoxConstraints(maxHeight: 200 * widget.scale),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0 * widget.scale),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha((0.10 * 255).round()),
                  blurRadius: 8 * widget.scale,
                  spreadRadius: 1 * widget.scale,
                  offset: Offset(0, 2 * widget.scale),
                ),
              ],
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _filteredBrands.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    _filteredBrands[index],
                    style: TextStyle(
                      fontFamily: 'Reddit Sans',
                      fontSize: 14 * widget.scale,
                    ),
                  ),
                  onTap: () => _selectBrand(_filteredBrands[index]),
                  dense: true,
                );
              },
            ),
          ),
        ],
      ],
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
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
      currentIndex: currentIndex,
      iconSize: 22 * scale,
      selectedFontSize: 14 * scale,
      unselectedFontSize: 13 * scale,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined, color: Colors.black),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.support_agent_outlined, color: Colors.black),
          label: 'AI Support',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline, color: Colors.black),
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
  final ScrollController _scrollController = ScrollController();

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

  void _onBrandSelected(String? brand) {
    setState(() {
      _selectedBrand = brand;
      _selectedProduct = null; // Reset product when brand changes
    });
  }

  void _onProductSelected(String? product) {
    setState(() {
      _selectedProduct = product;
    });
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
    _scrollController.dispose();
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
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 72.0, // reduced from 82.0
              floating: true,
              pinned: false,
              snap: true,
              backgroundColor: Colors.white,
              elevation: 0,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                background: SafeArea(
                  bottom: false,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ), // reduced vertical padding
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.chevron_left,
                            color: Colors.black,
                            size: 32,
                          ),
                          onPressed: () => Navigator.pop(context),
                          padding: const EdgeInsets.only(right: 8, left: 2),
                          splashRadius: 24,
                          alignment: Alignment.center,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Column(
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
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
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
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 4),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFE9F7F5),
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
                                      (_) =>
                                          const account.NotificationsScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 8),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFE9F7F5),
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
                                  builder:
                                      (_) => const account.MyProfileScreen(),
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
          ];
        },
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            30,
            10,
            30,
            30,
          ), // reduced top padding
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
              SizedBox(height: 8 * scale), // reduced from 18 * scale
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

              // Product Name with suggestions
              Text('Product Name', style: textStyleLabel),
              SizedBox(height: 6 * scale),
              ProductSuggestionsWidget(
                selectedCategory: _selectedCategoryOfItem,
                selectedBrand: _selectedBrand,
                selectedProduct: _selectedProduct,
                greenColor: greenColor,
                scale: scale,
                onBrandSelected: _onBrandSelected,
                onProductSelected: _onProductSelected,
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
